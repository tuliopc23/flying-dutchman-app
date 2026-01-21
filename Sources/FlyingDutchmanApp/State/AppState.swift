import SwiftUI
import Observation
import Shared
import FlyingDutchmanNetworking
import FlyingDutchmanContainers

/// Central state coordinator for the Flying Dutchman app (macOS 26+ Tahoe)
@MainActor
@Observable
public final class AppState {
    // MARK: - Navigation State
    
    /// Current selected section in the sidebar
    public var selectedSection: AppSection = .containers
    
    /// Navigation path for detail drill-downs
    public var navigationPath = NavigationPath()
    
    /// Whether the command palette is visible
    public var showPalette: Bool = false
    
    /// User appearance override (Light/Dark)
    public var appearanceOverride: ColorScheme?
    
    // MARK: - Engine & Lifecycle State
    
    /// Global engine health status
    public var engineStatus: String = "Connecting..."
    public var isEngineHealthy: Bool = false
    public var primaryStatus: String = "unknown"
    public var workerStatuses: [String: String] = [:]
    public var engineMode: String?
    
    // MARK: - Feature ViewModels (Lazily loaded)
    
    public let containers = ContainerListViewModel()
    public let images = ImageListViewModel()
    public let volumes = VolumeListViewModel()
    public let networks = NetworkListViewModel()
    public let events = EventsViewModel()
    public let logs = LogsViewModel()
    public let stacks = StacksViewModel()
    public let sidebar = SidebarViewModel()
    
    // MARK: - Diagnostics
    
    public var platformStatus: RuntimeChecks.PlatformStatus?
    public var containerizationStatus: RuntimeChecks.ToolCheck?
    
    // MARK: - Initialization & Bootstrap
    
    public init() {
        // Initial setup
        self.platformStatus = RuntimeChecks.platformSupport()
        self.containerizationStatus = RuntimeChecks.containerizationFramework()
    }
    
    /// Perform parallel bootstrap of all app systems
    public func bootstrap() async {
        await withTaskGroup(of: Void.self) { group in
            group.addTask { await self.refreshEngineStatus() }
            // ViewModels now use @FetchAll, so manual loading is removed
            // group.addTask { await self.containers.load() }
            // group.addTask { await self.images.load() }
            // group.addTask { await self.volumes.load() }
            // group.addTask { await self.networks.load() }
            // group.addTask { await self.stacks.load() }
            group.addTask { await self.sidebar.load() }
        }
        
        events.startStreaming()
        await logs.load(containers: containers.containers)
    }
    
    // MARK: - Global Actions
    
    public func refreshEngineStatus() async {
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
    
    public func refreshCurrentSection() async {
        switch selectedSection {
        // No need to manually load lists anymore (@FetchAll handles it)
        case .containers: break 
        case .images: break
        case .volumes: break
        case .networks: break
        case .logs: await logs.load(containers: containers.containers)
        case .events: await events.load()
        case .stacks: break
        }
    }
}
