import XCTest
@testable import FlyingDutchmanContainers
@testable import FlyingDutchmanPersistence
@testable import GRDB

final class ImageCacheManagerTests: XCTestCase {
    var cacheManager: ImageCacheManager!
    var dbQueue: DatabaseQueue!
    var tempDir: String!

    override func setUp() async throws {
        try await super.setUp()

        // Create temp directory for testing
        tempDir = FileManager.default.temporaryDirectory.path + "/cachetests_\(UUID().uuidString)"
        try FileManager.default.createDirectory(atPath: tempDir, withIntermediateDirectories: true)

        // Create isolated database
        dbQueue = try DatabaseQueue()
        try DatabaseContainer.migrator.migrate(dbQueue)

        // Create cache manager with small size limit for testing
        cacheManager = ImageCacheManager(
            maxCacheSizeBytes: 1024 * 1024,  // 1 MB
            dbQueue: dbQueue
        )
    }

    override func tearDown() async throws {
        // Cleanup temp directory
        if let tempDir = tempDir {
            try? FileManager.default.removeItem(atPath: tempDir)
        }
        try await super.tearDown()
    }

    // MARK: - Store Blob

    func testStoreBlob() async throws {
        let digest = "sha256:abcdef123"
        let data = Data("test data".utf8)

        try await cacheManager.storeBlob(digest: digest, data: data)

        let retrieved = try await cacheManager.retrieveBlob(digest: digest)
        XCTAssertEqual(retrieved, data)
    }

    func testStoreBlobWithLargeData() async throws {
        let digest = "sha256:large"
        let data = Data(repeating: 0xFF, count: 100_000)  // 100 KB

        try await cacheManager.storeBlob(digest: digest, data: data)

        let retrieved = try await cacheManager.retrieveBlob(digest: digest)
        XCTAssertEqual(retrieved.count, 100_000)
    }

    func testStoreBlobDeduplicates() async throws {
        let digest = "sha256:dedup"
        let data1 = Data("original".utf8)
        let data2 = Data("different".utf8)

        // Store same digest twice
        try await cacheManager.storeBlob(digest: digest, data: data1)
        try await cacheManager.storeBlob(digest: digest, data: data2)

        // Should still have original data
        let retrieved = try await cacheManager.retrieveBlob(digest: digest)
        XCTAssertEqual(retrieved, data1)
    }

    // MARK: - Retrieve Blob

    func testRetrieveBlob() async throws {
        let digest = "sha256:retrieve"
        let data = Data("retrieval test".utf8)

        try await cacheManager.storeBlob(digest: digest, data: data)
        let retrieved = try await cacheManager.retrieveBlob(digest: digest)

        XCTAssertEqual(retrieved, data)
    }

    func testRetrieveNonExistentBlobThrows() async throws {
        do {
            _ = try await cacheManager.retrieveBlob(digest: "sha256:nonexistent")
            XCTFail("Expected error was not thrown")
        } catch {
            XCTAssertTrue(error is CacheError)
        }
    }

    // MARK: - Has Blob

    func testHasBlobReturnsTrueForExisting() async throws {
        let digest = "sha256:exists"
        let data = Data("test".utf8)

        try await cacheManager.storeBlob(digest: digest, data: data)

        XCTAssertTrue(cacheManager.hasBlob(digest: digest))
    }

    func testHasBlobReturnsFalseForNonExisting() {
        XCTAssertFalse(cacheManager.hasBlob(digest: "sha256:nonexistent"))
    }

    // MARK: - Delete Blob

    func testDeleteBlob() async throws {
        let digest = "sha256:delete"
        let data = Data("delete test".utf8)

        try await cacheManager.storeBlob(digest: digest, data: data)
        try cacheManager.deleteBlob(digest: digest)

        XCTAssertFalse(cacheManager.hasBlob(digest: digest))
    }

    func testDeleteNonExistentBlobThrows() async {
        do {
            try cacheManager.deleteBlob(digest: "sha256:nonexistent")
            XCTFail("Expected error was not thrown")
        } catch {
            XCTAssertTrue(error is CacheError)
        }
    }

    // MARK: - Cache Statistics

    func testCacheStatsInitiallyEmpty() {
        let stats = cacheManager.getStats()

        XCTAssertEqual(stats.totalBlobs, 0)
        XCTAssertEqual(stats.totalBytes, 0)
        XCTAssertEqual(stats.cacheHits, 0)
        XCTAssertEqual(stats.cacheMisses, 0)
    }

    func testCacheStatsUpdateOnOperations() async throws {
        let digest = "sha256:stats"
        let data = Data("stats test".utf8)

        // Store blob
        try await cacheManager.storeBlob(digest: digest, data: data)

        var stats = cacheManager.getStats()
        XCTAssertEqual(stats.totalBlobs, 1)
        XCTAssertEqual(stats.totalBytes, Int64(data.count))
        XCTAssertEqual(stats.writeOperations, 1)

        // Retrieve blob (hit)
        _ = try await cacheManager.retrieveBlob(digest: digest)
        stats = cacheManager.getStats()
        XCTAssertEqual(stats.cacheHits, 1)
        XCTAssertEqual(stats.readOperations, 1)

        // Retrieve non-existent (miss)
        do {
            _ = try await cacheManager.retrieveBlob(digest: "sha256:nonexistent")
        } catch {
            // Expected
        }

        stats = cacheManager.getStats()
        XCTAssertEqual(stats.cacheMisses, 1)
    }

    func testCacheHitRate() async throws {
        let digest = "sha256:hitrate"
        let data = Data("hit rate test".utf8)

        try await cacheManager.storeBlob(digest: digest, data: data)

        // 3 hits
        _ = try await cacheManager.retrieveBlob(digest: digest)
        _ = try await cacheManager.retrieveBlob(digest: digest)
        _ = try await cacheManager.retrieveBlob(digest: digest)

        // 1 miss
        do {
            _ = try await cacheManager.retrieveBlob(digest: "sha256:miss")
        } catch {
            // Expected
        }

        let stats = cacheManager.getStats()
        XCTAssertEqual(stats.cacheHits, 3)
        XCTAssertEqual(stats.cacheMisses, 1)
        XCTAssertEqual(stats.hitRate, 0.75, accuracy: 0.01)
        XCTAssertEqual(stats.hitRatePercentage, "75.0%")
    }

    // MARK: - List Blobs

    func testListBlobsReturnsAll() async throws {
        let digest1 = "sha256:list1"
        let digest2 = "sha256:list2"

        try await cacheManager.storeBlob(digest: digest1, data: Data("blob1".utf8))
        try await cacheManager.storeBlob(digest: digest2, data: Data("blob2".utf8))

        let blobs = cacheManager.listBlobs()

        XCTAssertTrue(blobs.contains { $0.digest == digest1 })
        XCTAssertTrue(blobs.contains { $0.digest == digest2 })
    }

    func testListBlobsEmptyInitially() {
        let blobs = cacheManager.listBlobs()
        XCTAssertTrue(blobs.isEmpty)
    }

    // MARK: - Clear Cache

    func testClearCacheRemovesAllBlobs() async throws {
        let digest1 = "sha256:clear1"
        let digest2 = "sha256:clear2"

        try await cacheManager.storeBlob(digest: digest1, data: Data("blob1".utf8))
        try await cacheManager.storeBlob(digest: digest2, data: Data("blob2".utf8))

        try cacheManager.clearCache()

        let blobs = cacheManager.listBlobs()
        XCTAssertTrue(blobs.isEmpty)

        let stats = cacheManager.getStats()
        XCTAssertEqual(stats.totalBlobs, 0)
        XCTAssertEqual(stats.totalBytes, 0)
    }

    // MARK: - Cache Eviction

    func testCacheEvictsWhenSizeLimitExceeded() async throws {
        // Create blobs totaling more than 1 MB (our limit)
        let digest1 = "sha256:evict1"
        let digest2 = "sha256:evict2"

        let data1 = Data(repeating: 0x01, count: 600_000)  // ~600 KB
        let data2 = Data(repeating: 0x02, count: 600_000)  // ~600 KB

        try await cacheManager.storeBlob(digest: digest1, data: data1)
        try await cacheManager.storeBlob(digest: digest2, data: data2)

        // First blob should be evicted (LRU)
        let blobs = cacheManager.listBlobs()
        XCTAssertEqual(blobs.count, 1)
        XCTAssertEqual(blobs.first?.digest, digest2)
    }

    func testCacheEvictsLeastRecentlyUsed() async throws {
        let digest1 = "sha256:lru1"
        let digest2 = "sha256:lru2"
        let digest3 = "sha256:lru3"

        let data = Data(repeating: 0x01, count: 400_000)  // ~400 KB each

        // Store all three
        try await cacheManager.storeBlob(digest: digest1, data: data)
        try await cacheManager.storeBlob(digest: digest2, data: data)
        try await cacheManager.storeBlob(digest: digest3, data: data)

        // Access digest1 to make it most recently used
        _ = try await cacheManager.retrieveBlob(digest: digest1)

        // Store another blob to trigger eviction
        let digest4 = "sha256:lru4"
        try await cacheManager.storeBlob(digest: digest4, data: data)

        let blobs = cacheManager.listBlobs()

        // Should have 3 blobs: digest1 (accessed), digest3, digest4
        // digest2 (least recently used) should be evicted
        XCTAssertTrue(blobs.contains { $0.digest == digest1 })
        XCTAssertFalse(blobs.contains { $0.digest == digest2 })
    }

    // MARK: - Get Cache Size

    func testGetCacheSize() async throws {
        let digest1 = "sha256:size1"
        let digest2 = "sha256:size2"

        let data1 = Data(repeating: 0x01, count: 10_000)
        let data2 = Data(repeating: 0x02, count: 20_000)

        try await cacheManager.storeBlob(digest: digest1, data: data1)
        try await cacheManager.storeBlob(digest: digest2, data: data2)

        let size = try await cacheManager.getCacheSize()

        XCTAssertEqual(size, Int64(data1.count + data2.count))
    }

    func testGetCacheSizeEmptyInitially() async throws {
        let size = try await cacheManager.getCacheSize()
        XCTAssertEqual(size, 0)
    }
}
