import FlyingDutchmanNetworking
import Observation
import Shared
import SwiftUI

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

    /// Command palette registry
    var commandRegistry = CommandRegistry()

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
    var machines: [Machine] = []

    // MARK: - Diagnostics

    var platformStatus: RuntimeChecks.PlatformStatus?
    var containerizationStatus: RuntimeChecks.ToolCheck?

    // MARK: - Initialization & Bootstrap

    public init(features: ShellFeatureRegistry) {
        self.features = features
        // Initial setup
        self.platformStatus = RuntimeChecks.platformSupport()
        self.containerizationStatus = RuntimeChecks.containerizationFramework()
        rebuildCommandRegistry()
    }

    /// Perform parallel bootstrap of all app systems
    public func bootstrap() async {
        await withTaskGroup(of: Void.self) { group in
            group.addTask { await self.refreshEngineStatus() }
            group.addTask { await self.refreshContainers() }
            group.addTask { await self.refreshMachines() }
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
        rebuildCommandRegistry()
    }

    func refreshMachines() async {
        if let machines = try? await EngineClient.listMachines() {
            self.machines = machines
        } else {
            self.machines = []
        }
        rebuildCommandRegistry()
    }

    func refreshCurrentSection() async {
        switch selectedSection {
        case .logs:
            await refreshContainers()
        case .events:
            break
        case .machines, .kubernetes:
            await refreshMachines()
        case .containers, .images, .volumes, .networks, .stacks, .debugShell:
            await refreshContainers()
        }
    }

    private func rebuildCommandRegistry() {
        var actions: [CommandAction] = []

        actions.append(contentsOf: AppSection.allCases.map { section in
            CommandAction(
                title: "Go to \(section.title)",
                subtitle: "Navigation",
                icon: section.systemImage,
                perform: { [weak self] in
                    await MainActor.run { self?.selectedSection = section }
                }
            )
        })

        for container in containers {
            switch container.status {
            case .running:
                actions.append(CommandAction(
                    title: "Stop \(container.name)",
                    subtitle: "Container",
                    icon: "stop.fill",
                    perform: {
                        _ = try? await EngineClient.stopContainer(id: container.id)
                    }
                ))
            case .stopped, .created:
                actions.append(CommandAction(
                    title: "Start \(container.name)",
                    subtitle: "Container",
                    icon: "play.fill",
                    perform: {
                        _ = try? await EngineClient.startContainer(id: container.id)
                    }
                ))
            case .starting, .stopping, .removing, .removed:
                break
            }
        }

        for machine in machines {
            switch machine.status {
            case .running:
                actions.append(CommandAction(
                    title: "Stop \(machine.name)",
                    subtitle: "Machine",
                    icon: "stop.fill",
                    perform: {
                        _ = try? await EngineClient.stopMachine(nameOrID: machine.id)
                    }
                ))
            case .stopped, .creating, .starting, .stopping, .error:
                actions.append(CommandAction(
                    title: "Start \(machine.name)",
                    subtitle: "Machine",
                    icon: "play.fill",
                    perform: {
                        _ = try? await EngineClient.startMachine(nameOrID: machine.id)
                    }
                ))
            }
        }

        commandRegistry.actions = actions
    }
}
