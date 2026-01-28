import SwiftUI
import Observation
import Shared
import FlyingDutchmanNetworking
import FlyingDutchmanContainers

/// Central state coordinator for the Flying Dutchman app (macOS 26+ Tahoe)
@MainActor
@Observable
final class AppState {
    // MARK: - Navigation State
    
    /// Current selected section in the sidebar
    var selectedSection: AppSection = .containers
    
    /// Navigation path for detail drill-downs
    var navigationPath = NavigationPath()
    
    /// Whether the command palette is visible
    var showPalette: Bool = false
    
    /// User appearance override (Light/Dark)
    var appearanceOverride: ColorScheme?
    
    // MARK: - Engine & Lifecycle State
    
    /// Global engine health status
    var engineStatus: String = "Connecting..."
    var isEngineHealthy: Bool = false
    var primaryStatus: String = "unknown"
    var workerStatuses: [String: String] = [:]
    var engineMode: String?
    
    // MARK: - Feature ViewModels (Lazily loaded)
    
    let containers = ContainerListViewModel()
    let images = ImageListViewModel()
    let volumes = VolumeListViewModel()
    let networks = NetworkListViewModel()
    let events = EventsViewModel()
    let logs = LogsViewModel()
    let stacks = StacksViewModel()
    let sidebar = SidebarViewModel()
    
    // MARK: - Diagnostics
    
    var platformStatus: RuntimeChecks.PlatformStatus?
    var containerizationStatus: RuntimeChecks.ToolCheck?
    
    // MARK: - Initialization & Bootstrap
    
    init() {
        // Initial setup
        self.platformStatus = RuntimeChecks.platformSupport()
        self.containerizationStatus = RuntimeChecks.containerizationFramework()
    }
    
    /// Perform parallel bootstrap of all app systems
    func bootstrap() async {
        await withTaskGroup(of: Void.self) { group in
            group.addTask { await self.refreshEngineStatus() }
            // ViewModels now use manual loading again
            group.addTask { await self.containers.load() }
            group.addTask { await self.images.load() }
            group.addTask { await self.volumes.load() }
            group.addTask { await self.networks.load() }
            group.addTask { await self.stacks.load() }
            group.addTask { await self.events.startStreaming() }
            group.addTask { await self.sidebar.load() }
        }
        
        events.startStreaming()
        await logs.load(containers: containers.containers)
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
    
    func refreshCurrentSection() async {
        switch selectedSection {
        case .containers: break 
        case .images: break
        case .volumes: break
        case .networks: break
        case .logs: await logs.load(containers: containers.containers)
        case .events: events.startStreaming()
        case .stacks: break
        }
    }
}
