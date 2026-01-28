import XCTest
@testable import FlyingDutchmanContainers

final class NetworkingStabilizationTests: XCTestCase {
    
    func testComponentsInstantiate() async throws {
        // Ensure we can create the network manager
        let networkManager = NetworkManager()
        XCTAssertNotNil(networkManager)
        
        // Ensure we can create the port forward manager
        let portForwardManager = PortForwardManager()
        XCTAssertNotNil(portForwardManager)
        
        // Ensure IPAllocator handles renamed error correctly
        var allocator = try IPAllocator(subnet: "172.16.0.0/16")
        do {
            _ = try allocator.allocateNext()
        } catch {
            // Should not throw on first allocation
            XCTFail("Allocation failed: \(error)")
        }
        
        // Verify we can catch the correct error type
        do {
            // Force an invalid subnet error
            _ = try IPAllocator(subnet: "invalid")
            XCTFail("Should have thrown invalid subnet error")
        } catch let error as ContainerNetworkError {
            if case .invalidSubnet = error {
                // Success
            } else {
                XCTFail("Wrong error type: \(error)")
            }
        } catch {
            XCTFail("Wrong error type: \(error)")
        }
    }
}
