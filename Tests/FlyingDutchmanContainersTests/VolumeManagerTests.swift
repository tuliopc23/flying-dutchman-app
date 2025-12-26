import XCTest
@testable import FlyingDutchmanContainers
@testable import FlyingDutchmanPersistence
@testable import Shared

final class VolumeManagerTests: XCTestCase {
    var volumeManager: VolumeManager!
    var volumeStore: VolumeStore!
    var tempDir: String!

    override func setUp() async throws {
        try await super.setUp()

        // Create temp directory for testing
        tempDir = FileManager.default.temporaryDirectory.path + "/volumetests_\(UUID().uuidString)"
        try FileManager.default.createDirectory(atPath: tempDir, withIntermediateDirectories: true)

        // Create isolated volume store
        let dbQueue = try DatabaseQueue()
        try DatabaseContainer.migrator.migrate(dbQueue)
        volumeStore = VolumeStore(dbQueue: dbQueue)

        // Create volume manager with custom volume directory
        volumeManager = VolumeManager(volumeStore: volumeStore)
    }

    override func tearDown() async throws {
        // Cleanup temp directory
        if let tempDir = tempDir {
            try? FileManager.default.removeItem(atPath: tempDir)
        }
        try await super.tearDown()
    }

    // MARK: - Create Volume

    func testCreateVolumeSucceeds() async throws {
        let volume = try volumeManager.createVolume(name: "test-volume")

        XCTAssertEqual(volume.name, "test-volume")
        XCTAssertNotNil(volume.id)
        XCTAssertTrue(volume.mountPath.contains("test-volume") || volume.mountPath.contains("flyingdutchman"))
    }

    func testCreateVolumeWithDriver() async throws {
        let volume = try volumeManager.createVolume(name: "custom-driver", driver: "nfs")

        // Verify volume was created (driver is stored in path or metadata)
        XCTAssertNotNil(volume.id)
    }

    func testCreateVolumeIdempotent() async throws {
        let volume1 = try volumeManager.createVolume(name: "idempotent")
        let volume2 = try volumeManager.createVolume(name: "idempotent")

        XCTAssertEqual(volume1.id, volume2.id)
        XCTAssertEqual(volume1.name, volume2.name)
    }

    func testListVolumes() async throws {
        try volumeManager.createVolume(name: "volume1")
        try volumeManager.createVolume(name: "volume2")

        let volumes = volumeManager.listVolumes()

        XCTAssertTrue(volumes.count >= 2)
        XCTAssertTrue(volumes.contains { $0.name == "volume1" })
        XCTAssertTrue(volumes.contains { $0.name == "volume2" })
    }

    // MARK: - Remove Volume

    func testRemoveVolumeSucceeds() async throws {
        let volume = try volumeManager.createVolume(name: "to-remove")

        try volumeManager.removeVolume(name: volume.name)

        let volumes = volumeManager.listVolumes()
        XCTAssertFalse(volumes.contains { $0.name == volume.name })
    }

    func testRemoveNonExistentVolumeThrows() async {
        do {
            try volumeManager.removeVolume(name: "does-not-exist")
            XCTFail("Expected error was not thrown")
        } catch {
            XCTAssertTrue(error is VolumeError)
        }
    }

    // MARK: - Prune Volumes

    func testPruneVolumesRemovesNonDefault() async throws {
        try volumeManager.createVolume(name: "volume-to-prune")

        let removedCount = try volumeManager.pruneVolumes()

        XCTAssertGreaterThanOrEqual(removedCount, 1)
    }

    // MARK: - Inspect Volume

    func testInspectVolume() async throws {
        let volume = try volumeManager.createVolume(name: "inspect-me")

        let inspection = try volumeManager.inspectVolume(name: volume.name)

        XCTAssertEqual(inspection.name, volume.name)
        XCTAssertEqual(inspection.driver, "local")
        XCTAssertEqual(inspection.status, .available)
        XCTAssertGreaterThanOrEqual(inspection.sizeBytes, 0)
    }

    func testInspectNonExistentVolumeThrows() async {
        do {
            _ = try volumeManager.inspectVolume(name: "does-not-exist")
            XCTFail("Expected error was not thrown")
        } catch {
            XCTAssertTrue(error is VolumeError)
        }
    }

    // MARK: - Validate Mount

    func testValidateBindMount() async throws {
        // Create a temp file to mount
        let tempFile = tempDir + "/testfile.txt"
        try "test content".write(to: URL(fileURLWithPath: tempFile), atomically: true, encoding: .utf8)

        let mount = try volumeManager.validateMount("\(tempFile):/container/path")

        XCTAssertEqual(mount.source, tempFile)
        XCTAssertEqual(mount.destination, "/container/path")
        XCTAssertEqual(mount.mode, "rw")
        XCTAssertEqual(mount.type, .bind)
    }

    func testValidateNamedVolume() async throws {
        let mount = try volumeManager.validateMount("my-volume:/data")

        XCTAssertEqual(mount.source, "my-volume")
        XCTAssertEqual(mount.destination, "/data")
        XCTAssertEqual(mount.type, .volume)
    }

    func testValidateMountWithReadOnlyMode() async throws {
        let mount = try volumeManager.validateMount("/host:/container:ro")

        XCTAssertEqual(mount.mode, "ro")
    }

    func testValidateMountInvalidFormatThrows() async {
        do {
            _ = try volumeManager.validateMount("invalid-format")
            XCTFail("Expected error was not thrown")
        } catch {
            XCTAssertTrue(error is VolumeError)
        }
    }

    func testValidateMountNonExistentPathThrows() async throws {
        do {
            _ = try volumeManager.validateMount("/non/existent/path:/container")
            XCTFail("Expected error was not thrown")
        } catch {
            XCTAssertTrue(error is VolumeError)
        }
    }

    func testValidateMountInvalidModeThrows() async throws {
        let tempFile = tempDir + "/testfile.txt"
        try "test".write(to: URL(fileURLWithPath: tempFile), atomically: true, encoding: .utf8)

        do {
            _ = try volumeManager.validateMount("\(tempFile):/container:invalid-mode")
            XCTFail("Expected error was not thrown")
        } catch {
            XCTAssertTrue(error is VolumeError)
        }
    }

    // MARK: - Setup Volume

    func testSetupNamedVolume() async throws {
        let volumeName = "setup-test"
        let mount = Mount(source: volumeName, destination: "/data", mode: "rw", type: .volume)

        let hostPath = try volumeManager.setupVolume(mount: mount)

        // Should create volume if it doesn't exist
        let volume = try volumeStore.fetch(name: volumeName)
        XCTAssertNotNil(volume)
        XCTAssertEqual(hostPath, volume?.mountPath)
    }

    func testSetupBindMount() async throws {
        let tempFile = tempDir + "/mount-test.txt"
        try "test".write(to: URL(fileURLWithPath: tempFile), atomically: true, encoding: .utf8)

        let mount = Mount(source: tempFile, destination: "/container/file", mode: "rw", type: .bind)

        let hostPath = try volumeManager.setupVolume(mount: mount)

        // Bind mounts should return the expanded path
        XCTAssertTrue(hostPath.contains(tempFile))
    }

    // MARK: - Get or Create

    func testGetOrCreateReturnsExisting() async throws {
        let volume1 = try volumeManager.createVolume(name: "get-or-create")

        let volume2 = try volumeManager.getOrCreateVolume(name: "get-or-create")

        XCTAssertEqual(volume1.id, volume2.id)
        XCTAssertEqual(volume1.name, volume2.name)
    }

    func testGetOrCreateCreatesNew() async throws {
        let volume = try volumeManager.getOrCreateVolume(name: "new-volume")

        XCTAssertNotNil(volume.id)
        XCTAssertEqual(volume.name, "new-volume")
    }

    // MARK: - Mount Type Expansion

    func testVolumeMountType() async throws {
        // Mount without slash is a named volume
        let mount1 = try volumeManager.validateMount("my-volume:/data")
        XCTAssertEqual(mount1.type, .volume)

        // Mount with slash is a bind mount
        let tempFile = tempDir + "/test.txt"
        try "test".write(to: URL(fileURLWithPath: tempFile), atomically: true, encoding: .utf8)
        let mount2 = try volumeManager.validateMount("\(tempFile):/data")
        XCTAssertEqual(mount2.type, .bind)
    }
}
