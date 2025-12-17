import SwiftUI
import SwiftData
import Shared
import FlyingDutchmanNetworking
import FlyingDutchmanContainers

@main
struct FlyingDutchmanApp: App {
    @State private var appModel: AppModel = .init()

    var body: some Scene {
        WindowGroup {
            RootContainerView()
                .environment(appModel)
        }
        .modelContainer(for: UIState.self)
        .commands {
            AppCommands()
        }

        Settings {
            SettingsView()
        }
    }
}

struct RootContainerView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(AppModel.self) private var appModel

    @State private var engineStatus: StatusViewModel = .init()
    @State private var sidebarModel: SidebarViewModel = .init()
    @State private var commandRegistry: CommandRegistry = .init()
    @State private var containersViewModel: ContainerListViewModel = .init()
    @State private var imagesViewModel: ImageListViewModel = .init()
    @State private var volumesViewModel: VolumeListViewModel = .init()
    @State private var networksViewModel: NetworkListViewModel = .init()
    @State private var eventsViewModel: EventsViewModel = .init()
    @State private var logsViewModel: LogsViewModel = .init()
    @State private var stacksViewModel: StacksViewModel = .init()
    @State private var platformStatus: RuntimeChecks.PlatformStatus?
    @State private var containerizationStatus: RuntimeChecks.ToolCheck?
    @State private var uiState: UIState?

    var body: some View {
        @Bindable var appModel = appModel
        MainWindow(
            statusViewModel: engineStatus,
            sidebarViewModel: sidebarModel,
            containersViewModel: containersViewModel,
            imagesViewModel: imagesViewModel,
            volumesViewModel: volumesViewModel,
            networksViewModel: networksViewModel,
            eventsViewModel: eventsViewModel,
            logsViewModel: logsViewModel,
            stacksViewModel: stacksViewModel,
            commandRegistry: commandRegistry,
            showPalette: $appModel.showPalette,
            platformStatus: platformStatus,
            containerizationStatus: containerizationStatus,
            selectedSection: $appModel.selectedSection,
            appearanceOverride: $appModel.appearanceOverride
        )
        .frame(minWidth: 960, minHeight: 600)
        .task { @MainActor in await bootstrap() }
        .onChange(of: appModel.selectedSection) { _, newValue in
            persistUIState(section: newValue)
        }
        .onChange(of: appModel.appearanceOverride) { _, newValue in
            persistAppearance(override: newValue)
        }
        .onChange(of: uiState?.engineHost) { _, _ in
            guard let uiState else { return }
            configureEngineClient(with: uiState)
        }
        .onChange(of: uiState?.enginePort) { _, _ in
            guard let uiState else { return }
            configureEngineClient(with: uiState)
        }
        .onChange(of: uiState?.defaultFollowLogs) { _, _ in
            guard let uiState else { return }
            configureEngineClient(with: uiState)
        }
        .onChange(of: uiState?.logsPollIntervalSeconds) { _, _ in
            guard let uiState else { return }
            configureEngineClient(with: uiState)
        }
        .onChange(of: uiState?.eventsPollIntervalSeconds) { _, _ in
            guard let uiState else { return }
            configureEngineClient(with: uiState)
        }
        .onChange(of: uiState?.eventsLimit) { _, _ in
            guard let uiState else { return }
            configureEngineClient(with: uiState)
        }
        .onChange(of: logsViewModel.follow) { _, newValue in
            guard let uiState else { return }
            uiState.defaultFollowLogs = newValue
            uiState.lastUpdated = Date()
            try? modelContext.save()
        }
        .onChange(of: logsViewModel.pollInterval) { _, newValue in
            guard let uiState else { return }
            uiState.logsPollIntervalSeconds = newValue
            uiState.lastUpdated = Date()
            try? modelContext.save()
        }
        .onChange(of: eventsViewModel.pollInterval) { _, newValue in
            guard let uiState else { return }
            uiState.eventsPollIntervalSeconds = newValue
            uiState.lastUpdated = Date()
            try? modelContext.save()
        }
        .onChange(of: eventsViewModel.limit) { _, newValue in
            guard let uiState else { return }
            uiState.eventsLimit = newValue
            uiState.lastUpdated = Date()
            try? modelContext.save()
        }
        .onAppear { seedCommands() }
        .preferredColorScheme(appModel.appearanceOverride)
    }

    @MainActor
    private func bootstrap() async {
        loadUIState()
        platformStatus = RuntimeChecks.platformSupport()
        containerizationStatus = RuntimeChecks.containerizationFramework()

        async let status: Void = engineStatus.refresh()
        async let stacks: Void = sidebarModel.load()
        async let containers: Void = containersViewModel.load()
        async let images: Void = imagesViewModel.load()
        async let volumes: Void = volumesViewModel.load()
        async let networks: Void = networksViewModel.load()
        async let events: Void = eventsViewModel.load()
        async let stacksSection: Void = stacksViewModel.load()

        _ = await (status, stacks, containers, images, volumes, networks, events, stacksSection)
        await logsViewModel.load(containers: containersViewModel.containers)
    }

    private func loadUIState() {
        if let existing = try? modelContext.fetch(FetchDescriptor<UIState>()).first {
            uiState = existing
            appModel.selectedSection = AppSection(rawValue: existing.selectedSection) ?? .containers
            if let appearance = existing.appearanceOverride {
                switch appearance {
                case "light": appModel.appearanceOverride = .light
                case "dark": appModel.appearanceOverride = .dark
                default: appModel.appearanceOverride = nil
                }
            }
            configureEngineClient(with: existing)
        } else {
            let state = UIState()
            modelContext.insert(state)
            uiState = state
            try? modelContext.save()
            configureEngineClient(with: state)
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

    private func configureEngineClient(with uiState: UIState) {
        EngineClient.configure(host: uiState.engineHost, port: uiState.enginePort)
        logsViewModel.follow = uiState.defaultFollowLogs
        logsViewModel.pollInterval = uiState.logsPollIntervalSeconds
        eventsViewModel.limit = uiState.eventsLimit
        eventsViewModel.pollInterval = uiState.eventsPollIntervalSeconds
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
            CommandAction(title: "Refresh Stacks", subtitle: "Reload projects", icon: "square.stack.3d.up") {
                await sidebarModel.load()
                await stacksViewModel.load()
            },
            CommandAction(title: "Switch to Light Appearance", subtitle: "Overrides system setting", icon: "sun.max") {
                await MainActor.run { appModel.appearanceOverride = .light }
            },
            CommandAction(title: "Switch to Dark Appearance", subtitle: "Overrides system setting", icon: "moon") {
                await MainActor.run { appModel.appearanceOverride = .dark }
            },
            CommandAction(title: "Reset Appearance to System", subtitle: "Follow macOS mode", icon: "circle.lefthalf.filled") {
                await MainActor.run { appModel.appearanceOverride = nil }
            },
            CommandAction(title: "Go to Containers", subtitle: "Primary list", icon: AppSection.containers.systemImage) {
                await MainActor.run { appModel.selectedSection = .containers }
            },
            CommandAction(title: "Go to Images", subtitle: "View images", icon: AppSection.images.systemImage) {
                await MainActor.run { appModel.selectedSection = .images }
            },
            CommandAction(title: "Go to Volumes", subtitle: "Storage", icon: AppSection.volumes.systemImage) {
                await MainActor.run { appModel.selectedSection = .volumes }
            },
            CommandAction(title: "Go to Networks", subtitle: "Connectivity", icon: AppSection.networks.systemImage) {
                await MainActor.run { appModel.selectedSection = .networks }
            },
            CommandAction(title: "Go to Logs", subtitle: "Container logs", icon: AppSection.logs.systemImage) {
                await MainActor.run { appModel.selectedSection = .logs }
            },
            CommandAction(title: "Go to Events", subtitle: "Runtime events", icon: AppSection.events.systemImage) {
                await MainActor.run { appModel.selectedSection = .events }
            },
            CommandAction(title: "Go to Stacks", subtitle: "Projects", icon: AppSection.stacks.systemImage) {
                await MainActor.run { appModel.selectedSection = .stacks }
            }
        ]
    }
}

@MainActor
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
