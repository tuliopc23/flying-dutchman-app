import SwiftUI
import SwiftData
import Shared
import FlyingDutchmanNetworking
import FlyingDutchmanContainers

@main
struct FlyingDutchmanApp: App {
    var body: some Scene {
        WindowGroup {
            RootContainerView()
        }
        .modelContainer(for: UIState.self)
    }
}

struct RootContainerView: View {
    @Environment(\.modelContext) private var modelContext

    @State private var engineStatus: StatusViewModel = .init()
    @State private var sidebarModel: SidebarViewModel = .init()
    @State private var commandRegistry: CommandRegistry = .init()
    @State private var showPalette: Bool = false
    @State private var appearanceOverride: ColorScheme?
    @State private var containersViewModel: ContainerListViewModel = .init()
    @State private var imagesViewModel: ImageListViewModel = .init()
    @State private var volumesViewModel: VolumeListViewModel = .init()
    @State private var networksViewModel: NetworkListViewModel = .init()
    @State private var eventsViewModel: EventsViewModel = .init()
    @State private var logsViewModel: LogsViewModel = .init()
    @State private var platformStatus: RuntimeChecks.PlatformStatus?
    @State private var containerizationStatus: RuntimeChecks.ToolCheck?
    @State private var selectedSection: AppSection = .containers
    @State private var uiState: UIState?

    var body: some View {
        MainWindow(
            statusViewModel: engineStatus,
            sidebarViewModel: sidebarModel,
            containersViewModel: containersViewModel,
            imagesViewModel: imagesViewModel,
            volumesViewModel: volumesViewModel,
            networksViewModel: networksViewModel,
            eventsViewModel: eventsViewModel,
            logsViewModel: logsViewModel,
            commandRegistry: commandRegistry,
            showPalette: $showPalette,
            platformStatus: platformStatus,
            containerizationStatus: containerizationStatus,
            selectedSection: $selectedSection,
            appearanceOverride: $appearanceOverride
        )
        .frame(minWidth: 960, minHeight: 600)
        .task { await engineStatus.refresh() }
        .task { await containersViewModel.load() }
        .task { await imagesViewModel.load() }
        .task { await volumesViewModel.load() }
        .task { await networksViewModel.load() }
        .task { await eventsViewModel.load() }
        .task { await logsViewModel.load(containers: containersViewModel.containers) }
        .task {
            platformStatus = RuntimeChecks.platformSupport()
            containerizationStatus = RuntimeChecks.containerizationFramework()
        }
        .task { loadUIState() }
        .onChange(of: selectedSection) { _, newValue in
            persistUIState(section: newValue)
        }
        .onChange(of: appearanceOverride) { _, newValue in
            persistAppearance(override: newValue)
        }
        .onAppear { seedCommands() }
        .preferredColorScheme(appearanceOverride)
    }

    private func loadUIState() {
        if let existing = try? modelContext.fetch(FetchDescriptor<UIState>()).first {
            uiState = existing
            selectedSection = AppSection(rawValue: existing.selectedSection) ?? .containers
            if let appearance = existing.appearanceOverride {
                switch appearance {
                case "light": appearanceOverride = .light
                case "dark": appearanceOverride = .dark
                default: appearanceOverride = nil
                }
            }
        } else {
            let state = UIState()
            modelContext.insert(state)
            uiState = state
            try? modelContext.save()
        }
    }

    private func persistUIState(section: AppSection) {
        guard let uiState else { return }
        uiState.selectedSection = section.rawValue
        uiState.lastUpdated = Date()
        try? modelContext.save()
    }

    private func persistAppearance(override: ColorScheme?) {
        guard let uiState else { return }
        uiState.appearanceOverride = override.map { $0 == .dark ? "dark" : "light" }
        uiState.lastUpdated = Date()
        try? modelContext.save()
    }

    private func seedCommands() {
        commandRegistry.actions = [
            CommandAction(title: "Refresh Engine Status", subtitle: nil, icon: "arrow.clockwise") {
                await engineStatus.refresh()
            },
            CommandAction(title: "Focus Sidebar", subtitle: "Reveal projects list", icon: "sidebar.leading") {
                await MainActor.run { sidebarModel.requestFocus() }
            },
            CommandAction(title: "Refresh Containers", subtitle: "Pull latest container list", icon: "shippingbox.circle") {
                await containersViewModel.load()
            },
            CommandAction(title: "Refresh Images", subtitle: "Pull latest image list", icon: "shippingbox.fill") {
                await imagesViewModel.load()
            },
            CommandAction(title: "Refresh Volumes", subtitle: "Pull latest volume list", icon: "internaldrive") {
                await volumesViewModel.load()
            },
            CommandAction(title: "Refresh Networks", subtitle: "Pull latest networks", icon: "network") {
                await networksViewModel.load()
            },
            CommandAction(title: "Refresh Events", subtitle: "Reload recent engine events", icon: "waveform.path") {
                await eventsViewModel.load()
            },
            CommandAction(title: "Switch to Light Appearance", subtitle: "Overrides system setting", icon: "sun.max") {
                await MainActor.run { appearanceOverride = .light }
            },
            CommandAction(title: "Switch to Dark Appearance", subtitle: "Overrides system setting", icon: "moon") {
                await MainActor.run { appearanceOverride = .dark }
            },
            CommandAction(title: "Reset Appearance to System", subtitle: "Follow macOS mode", icon: "circle.lefthalf.filled") {
                await MainActor.run { appearanceOverride = nil }
            },
            CommandAction(title: "Go to Containers", subtitle: "Primary list", icon: AppSection.containers.systemImage) {
                await MainActor.run { selectedSection = .containers }
            },
            CommandAction(title: "Go to Images", subtitle: "View images", icon: AppSection.images.systemImage) {
                await MainActor.run { selectedSection = .images }
            },
            CommandAction(title: "Go to Volumes", subtitle: "Storage", icon: AppSection.volumes.systemImage) {
                await MainActor.run { selectedSection = .volumes }
            },
            CommandAction(title: "Go to Networks", subtitle: "Connectivity", icon: AppSection.networks.systemImage) {
                await MainActor.run { selectedSection = .networks }
            },
            CommandAction(title: "Go to Logs", subtitle: "Container logs", icon: AppSection.logs.systemImage) {
                await MainActor.run { selectedSection = .logs }
            },
            CommandAction(title: "Go to Events", subtitle: "Runtime events", icon: AppSection.events.systemImage) {
                await MainActor.run { selectedSection = .events }
            }
        ]
    }
}

@Observable
final class StatusViewModel {
    var statusText: String = "Checking…"
    var workerStatuses: [String: String] = [:]
    var primaryStatus: String = "unknown"
    var mode: String?

    func refresh() async {
        async let httpStatus: EngineStatus? = try? EngineClient.fetchHealth()
        async let detail: EngineStatusDetail? = try? EngineClient.fetchStatus()
        async let xpc: EngineXPCStatus? = try? EngineXPCClient.fetchStatus()

        var pieces: [String] = []
        if let httpStatus = await httpStatus {
            pieces.append("HTTP: \(httpStatus.status)")
            primaryStatus = httpStatus.status
        }
        if let detail = await detail {
            workerStatuses = detail.workers
            pieces.append("Engine: \(detail.engine)")
            primaryStatus = detail.engine
            mode = detail.mode
        }
        if let xpc = await xpc {
            workerStatuses["xpc"] = xpc.workers["xpc"] ?? "unknown"
        }

        if pieces.isEmpty {
            statusText = "Engine unreachable"
            workerStatuses = [:]
        } else {
            statusText = pieces.joined(separator: " · ")
        }
    }
}
