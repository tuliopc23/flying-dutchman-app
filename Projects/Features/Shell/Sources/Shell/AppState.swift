import SwiftUI
import Observation
import Shared
import FlyingDutchmanNetworking

/// Central state coordinator for the Flying Dutchman app (macOS 26+ Tahoe)
@MainActor
@Observable
public final class AppState {
    // MARK: - Navigation State
    
    /// Current selected section in the sidebar
    var selectedSection: AppSection = .containers
    
    /// Navigation path for detail drill-downs
    var navigationPath = NavigationPath()
    
    /// Whether the command palette is visible
    var showPalette: Bool = false
    
    
    // MARK: - Engine & Lifecycle State
    
    /// Global engine health status
    var engineStatus: String = "Connecting..."
    var isEngineHealthy: Bool = false
    var primaryStatus: String = "unknown"
    var workerStatuses: [String: String] = [:]
    var engineMode: String?
    
    // MARK: - Feature Registry
    
    public let features: ShellFeatureRegistry
    
    // MARK: - Sidebar / Menu Bar State
    
    let sidebar = SidebarViewModel()
    var containers: [ContainerSummary] = []
    
    // MARK: - Diagnostics
    
    var platformStatus: RuntimeChecks.PlatformStatus?
    var containerizationStatus: RuntimeChecks.ToolCheck?
    
    // MARK: - Initialization & Bootstrap
    
    public init(features: ShellFeatureRegistry) {
        self.features = features
        // Initial setup
        self.platformStatus = RuntimeChecks.platformSupport()
        self.containerizationStatus = RuntimeChecks.containerizationFramework()
    }
    
    /// Perform parallel bootstrap of all app systems
    public func bootstrap() async {
        await withTaskGroup(of: Void.self) { group in
            group.addTask { await self.refreshEngineStatus() }
            group.addTask { await self.refreshContainers() }
            group.addTask { await self.sidebar.load() }
        }
    }
    
    // MARK: - Global Actions
    
    func refreshEngineStatus() async {
        do {
            async let httpStatus: EngineStatus? = try? EngineClient.fetchHealth()
            async let detail: EngineStatusDetail? = try? EngineClient.fetchStatus()
            async let xpc: EngineXPCStatus? = try? EngineXPCClient.fetchStatus()

            var pieces: [String] = []
            if let httpStatus = await httpStatus {
                pieces.append("HTTP: \(httpStatus.status)")
                self.primaryStatus = httpStatus.status
            }
            
            if let detail = await detail {
                self.workerStatuses = detail.workers
                pieces.append("Engine: \(detail.engine)")
                self.primaryStatus = detail.engine
                self.engineMode = detail.mode
            }
            
            if let xpc = await xpc {
                // Merge XPC worker status
                let xpcStatus = xpc.workers["xpc"] ?? "unknown"
                self.workerStatuses["xpc"] = xpcStatus
            }

            if pieces.isEmpty {
                self.engineStatus = "Engine unreachable"
                self.isEngineHealthy = false
            } else {
                self.engineStatus = pieces.joined(separator: " · ")
                self.isEngineHealthy = true
            }
        }
    }
    
    func refreshContainers() async {
        if let containers = try? await EngineClient.listContainers() {
            self.containers = containers
        } else {
            self.containers = []
        }
    }

    func refreshCurrentSection() async {
        switch selectedSection {
        case .logs:
            await refreshContainers()
        case .events:
            break
        case .containers, .images, .volumes, .networks, .stacks:
            await refreshContainers()
        }
    }
}
