import Foundation
import GRDB
import Logging
import Shared

/// Manages OCI image layer caching with deduplication and eviction policies
public actor ImageCacheManager {
    private let logger = Loggers.make(category: .containers)
    private let dbQueue: DatabaseQueue

    /// Storage paths
    private let blobsDir: FilePath
    private let cacheMetadataPath: FilePath

    /// Cache eviction settings
    private let maxCacheSizeBytes: Int64
    private let maxLayerAge: TimeInterval = 30 * 24 * 60 * 60  // 30 days

    /// Cache statistics
    private var stats: CacheStats

    public init(
        maxCacheSizeBytes: Int64 = 10 * 1024 * 1024 * 1024,  // 10 GB default
        dbQueue: DatabaseQueue = DatabaseContainer.shared.dbQueue
    ) {
        self.maxCacheSizeBytes = maxCacheSizeBytes
        self.dbQueue = dbQueue
        self.blobsDir = blobsPath()
        self.cacheMetadataPath = cacheMetadataPath()
        self.stats = CacheStats()

        // Create cache directory
        try? FileManager.default.createDirectory(
            atPath: blobsDir.string,
            withIntermediateDirectories: true
        )

        // Load stats from disk
        loadStats()
    }

    /// Store a blob in the cache
    /// - Parameters:
    ///   - digest: Content digest (SHA256 hash)
    ///   - data: Blob data to store
    /// - Throws: CacheError if storage fails
    public func storeBlob(digest: String, data: Data) async throws {
        logger.debug("Storing blob \(digest) (\(data.count) bytes)")

        let blobPath = blobsDir.appending(digest)

        // Check if already exists (deduplication)
        if FileManager.default.fileExists(atPath: blobPath.string) {
            logger.debug("Blob \(digest) already exists (deduplication)")
            try await updateBlobAccessTime(digest: digest)
            return
        }

        // Write blob to disk
        try data.write(to: URL(fileURLWithPath: blobPath.string))

        // Update metadata
        try await storeBlobMetadata(
            digest: digest,
            size: Int64(data.count),
            accessTime: Date()
        )

        // Update stats
        stats.totalBlobs += 1
        stats.totalBytes += Int64(data.count)
        stats.writeOperations += 1

        // Check if eviction is needed
        try await evictIfNeeded()

        saveStats()

        logger.info("Stored blob \(digest) (\(data.count) bytes)")
    }

    /// Retrieve a blob from the cache
    /// - Parameter digest: Content digest to retrieve
    /// - Returns: Blob data
    /// - Throws: CacheError if not found
    public func retrieveBlob(digest: String) async throws -> Data {
        let blobPath = blobsDir.appending(digest)

        guard FileManager.default.fileExists(atPath: blobPath.string) else {
            stats.cacheMisses += 1
            throw CacheError.notFound(digest)
        }

        // Read blob
        let data = try Data(contentsOf: URL(fileURLWithPath: blobPath.string))

        // Update access time
        try await updateBlobAccessTime(digest: digest)

        stats.cacheHits += 1
        stats.readOperations += 1

        logger.debug("Retrieved blob \(digest) (\(data.count) bytes)")
        return data
    }

    /// Check if a blob exists in cache
    /// - Parameter digest: Content digest to check
    /// - Returns: true if exists, false otherwise
    public func hasBlob(digest: String) -> Bool {
        let blobPath = blobsDir.appending(digest)
        return FileManager.default.fileExists(atPath: blobPath.string)
    }

    /// Delete a blob from cache
    /// - Parameter digest: Content digest to delete
    /// - Throws: CacheError if deletion fails
    public func deleteBlob(digest: String) throws {
        let blobPath = blobsDir.appending(digest)

        guard FileManager.default.fileExists(atPath: blobPath.string) else {
            throw CacheError.notFound(digest)
        }

        let attributes = try FileManager.default.attributesOfItem(atPath: blobPath.string)
        let size = (attributes[.size] as? Int64) ?? 0

        try FileManager.default.removeItem(atPath: blobPath.string)

        // Update metadata
        try dbQueue.write { db in
            try BlobMetadataRecord
                .filter(Column("digest") == digest)
                .deleteAll(db)
        }

        stats.totalBlobs -= 1
        stats.totalBytes -= size
        stats.deletionOperations += 1

        logger.info("Deleted blob \(digest) (\(size) bytes)")
    }

    /// Clear all cached blobs
    /// - Throws: CacheError if clearing fails
    public func clearCache() throws {
        logger.info("Clearing entire image cache")

        let blobs = try dbQueue.read { db in
            try BlobMetadataRecord.fetchAll(db)
        }

        for blob in blobs {
            try deleteBlob(digest: blob.digest)
        }

        saveStats()

        logger.info("Cleared \(blobs.count) blobs from cache")
    }

    /// Get cache statistics
    /// - Returns: Current cache statistics
    public func getStats() -> CacheStats {
        return stats
    }

    /// List all cached blobs
    /// - Returns: Array of blob metadata
    public func listBlobs() -> [BlobMetadata] {
        (try? dbQueue.read { db in
            try BlobMetadataRecord
                .order(Column("lastAccessed").desc)
                .fetchAll(db)
                .map { $0.toBlobMetadata() }
        }) ?? []
    }

    /// Get total cache size in bytes
    /// - Returns: Total size of all cached blobs
    public func getCacheSize() async throws -> Int64 {
        let size = try dbQueue.read { db in
            try Int64.fetchAll(db, sql: "SELECT COALESCE(SUM(size), 0) FROM blobMetadata")
        }
        return size[0]
    }

    // MARK: - Eviction Policies

    /// Evict blobs if cache exceeds size limit or age limit
    private func evictIfNeeded() async throws {
        let currentSize = try await getCacheSize()

        // Check size limit
        if currentSize > maxCacheSizeBytes {
            logger.info("Cache size \(currentSize) exceeds limit \(maxCacheSizeBytes), evicting...")
            try await evictByLRU(targetSize: maxCacheSizeBytes * 80 / 100)  // Evict to 80% of limit
        }

        // Check age limit
        try await evictByAge()
    }

    /// Evict least recently used blobs
    /// - Parameter targetSize: Target cache size in bytes
    /// - Throws: CacheError if eviction fails
    private func evictByLRU(targetSize: Int64) async throws {
        while try await getCacheSize() > targetSize {
            let oldest = try dbQueue.read { db in
                try BlobMetadataRecord
                    .order(Column("lastAccessed").asc)
                    .limit(1)
                    .fetchAll(db)
                    .first
            }

            guard let blob = oldest else {
                break
            }

            logger.debug("Evicting LRU blob \(blob.digest) (last accessed: \(blob.lastAccessed))")
            try deleteBlob(digest: blob.digest)
        }
    }

    /// Evict blobs older than max age
    /// - Throws: CacheError if eviction fails
    private func evictByAge() async throws {
        let cutoffDate = Date().addingTimeInterval(-maxLayerAge)

        let oldBlobs = try dbQueue.read { db in
            try BlobMetadataRecord
                .filter(Column("lastAccessed") < cutoffDate)
                .order(Column("lastAccessed").asc)
                .fetchAll(db)
        }

        for blob in oldBlobs {
            logger.debug("Evicting old blob \(blob.digest) (age: \(maxLayerAge / 86400) days)")
            try deleteBlob(digest: blob.digest)
        }
    }

    // MARK: - Private Helpers

    private func storeBlobMetadata(digest: String, size: Int64, accessTime: Date) async throws {
        try dbQueue.write { db in
            let record = BlobMetadataRecord(
                digest: digest,
                size: size,
                lastAccessed: accessTime
            )
            try record.insert(db)
        }
    }

    private func updateBlobAccessTime(digest: String) async throws {
        try dbQueue.write { db in
            try BlobMetadataRecord
                .filter(Column("digest") == digest)
                .updateAll(db, Column("lastAccessed").set(to: Date()))
        }
    }

    private func loadStats() {
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: cacheMetadataPath.string)),
              let loadedStats = try? JSONDecoder().decode(CacheStats.self, from: data) else {
            return
        }

        stats = loadedStats
    }

    private func saveStats() {
        guard let data = try? JSONEncoder().encode(stats) else {
            return
        }
        try? data.write(to: URL(fileURLWithPath: cacheMetadataPath.string))
    }

    private static func blobsPath() -> FilePath {
        let supportDir = FileManager.default.urls(
            for: .applicationSupportDirectory,
            in: .userDomainMask
        ).first!

        let path = supportDir
            .appendingPathComponent("flyingdutchman")
            .appendingPathComponent("cache")
            .appendingPathComponent("blobs")

        return FilePath(path.path)
    }

    private static func cacheMetadataPath() -> FilePath {
        let supportDir = FileManager.default.urls(
            for: .applicationSupportDirectory,
            in: .userDomainMask
        ).first!

        let path = supportDir
            .appendingPathComponent("flyingdutchman")
            .appendingPathComponent("cache")
            .appendingPathComponent("cache_stats.json")

        return FilePath(path.path)
    }
}

// MARK: - Supporting Types

public struct CacheStats: Codable, Sendable {
    public var totalBlobs: Int
    public var totalBytes: Int64
    public var cacheHits: Int
    public var cacheMisses: Int
    public var readOperations: Int
    public var writeOperations: Int
    public var deletionOperations: Int

    public init(
        totalBlobs: Int = 0,
        totalBytes: Int64 = 0,
        cacheHits: Int = 0,
        cacheMisses: Int = 0,
        readOperations: Int = 0,
        writeOperations: Int = 0,
        deletionOperations: Int = 0
    ) {
        self.totalBlobs = totalBlobs
        self.totalBytes = totalBytes
        self.cacheHits = cacheHits
        self.cacheMisses = cacheMisses
        self.readOperations = readOperations
        self.writeOperations = writeOperations
        self.deletionOperations = deletionOperations
    }

    public var hitRate: Double {
        let total = cacheHits + cacheMisses
        return total > 0 ? Double(cacheHits) / Double(total) : 0
    }

    public var hitRatePercentage: String {
        String(format: "%.1f%%", hitRate * 100)
    }
}

public struct BlobMetadata: Identifiable, Sendable {
    public let id: String
    public let digest: String
    public let size: Int64
    public let lastAccessed: Date

    public init(digest: String, size: Int64, lastAccessed: Date) {
        self.id = digest
        self.digest = digest
        self.size = size
        self.lastAccessed = lastAccessed
    }
}

// MARK: - Database Record

private struct BlobMetadataRecord: Codable, FetchableRecord, PersistableRecord {
    var id: Int64?
    var digest: String
    var size: Int64
    var lastAccessed: Date

    static let databaseTableName = "blobMetadata"

    func toBlobMetadata() -> BlobMetadata {
        BlobMetadata(digest: digest, size: size, lastAccessed: lastAccessed)
    }
}

// MARK: - Database Migration

extension DatabaseMigrator {
    static func registerBlobMetadataMigration(_ migrator: DatabaseMigrator) {
        migrator.registerMigration("v7_blob_metadata") { db in
            if try !db.tableExists("blobMetadata") {
                try db.create(table: "blobMetadata") { t in
                    t.autoIncrementedPrimaryKey("id")
                    t.column("digest", .text).notNull().unique()
                    t.column("size", .integer).notNull()
                    t.column("lastAccessed", .datetime).notNull()
                    t.index("lastAccessed")
                }
            }
        }
    }
}

// MARK: - Errors

public enum CacheError: LocalizedError {
    case notFound(String)
    case storageFailed(String)
    case retrievalFailed(String)

    public var errorDescription: String? {
        switch self {
        case let .notFound(digest):
            return "Blob not found in cache: \(digest)"
        case let .storageFailed(reason):
            return "Failed to store blob: \(reason)"
        case let .retrievalFailed(reason):
            return "Failed to retrieve blob: \(reason)"
        }
    }
}
