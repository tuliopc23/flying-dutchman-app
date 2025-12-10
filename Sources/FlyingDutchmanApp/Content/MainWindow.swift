import Shared
import SwiftUI

struct MainWindow: View {
    @Bindable var statusViewModel: StatusViewModel
    @Bindable var sidebarViewModel: SidebarViewModel
    @Bindable var containersViewModel: ContainerListViewModel
    @Bindable var imagesViewModel: ImageListViewModel
    @Bindable var volumesViewModel: VolumeListViewModel
    @Bindable var networksViewModel: NetworkListViewModel
    @Bindable var eventsViewModel: EventsViewModel
    @Bindable var logsViewModel: LogsViewModel
    @Bindable var commandRegistry: CommandRegistry
    @Binding var showPalette: Bool
    let platformStatus: RuntimeChecks.PlatformStatus?
    let containerizationStatus: RuntimeChecks.ToolCheck?
    @Binding var selectedSection: AppSection
    @Binding var appearanceOverride: ColorScheme?

    var body: some View {
        NavigationSplitView {
            SidebarView(viewModel: sidebarViewModel)
        } detail: {
            VStack(alignment: .leading, spacing: 16) {
                if let platformStatus, !platformStatus.isSupported {
                    DiagnosticsBanner(
                        title: "Unsupported Platform",
                        message: platformStatus.message,
                        icon: "macwindow.badge.exclamationmark",
                        tone: .warning
                    )
                }

                if let containerizationStatus, containerizationStatus.status != "ok" {
                    DiagnosticsBanner(
                        title: containerizationStatus.name,
                        message: containerizationStatus.message,
                        icon: "shippingbox.fill",
                        tone: containerizationStatus.status == "missing" ? .warning : .info
                    )
                }

                GlassCard {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Flying Dutchman Foundation")
                                .font(.largeTitle.weight(.semibold))
                            HStack(spacing: 8) {
                                Image(systemName: DesignTokens.statusSymbol(for: statusViewModel.primaryStatus))
                                    .foregroundStyle(DesignTokens.statusColor(for: statusViewModel.primaryStatus))
                                Text(statusViewModel.statusText)
                                    .font(.title3)
                                    .foregroundStyle(.secondary)
                                if let mode = statusViewModel.mode {
                                    Text("mode: \(mode)")
                                        .font(.footnote)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            if !statusViewModel.workerStatuses.isEmpty {
                                HStack(spacing: 8) {
                                    ForEach(statusViewModel.workerStatuses.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                                        StatusBadge(label: "\(key): \(value)", state: value)
                                    }
                                }
                            }
                        }
                        Spacer()
                        Button {
                            Task { await statusViewModel.refresh() }
                        } label: {
                            Label("Refresh", systemImage: "arrow.clockwise")
                        }
                    }
                }

                Picker("Section", selection: $selectedSection) {
                    ForEach(AppSection.allCases) { section in
                        Label(section.title, systemImage: section.systemImage)
                            .tag(section)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.top, 4)

                contentForSection
            }
            .padding(24)
            .sheet(isPresented: $showPalette) {
                CommandPaletteView(registry: commandRegistry) {
                    showPalette = false
                }
                .frame(width: 520)
                .presentationDetents([.medium])
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack(spacing: 2) {
                        Text("Flying Dutchman")
                            .font(.headline)
                        Text(selectedSection.title)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                ToolbarItemGroup {
                    Button {
                        Task { await refreshCurrentSection() }
                    } label: {
                        Label("Refresh", systemImage: "arrow.clockwise")
                    }

                    Menu {
                        Button("Light") { appearanceOverride = .light }
                        Button("Dark") { appearanceOverride = .dark }
                        Button("System") { appearanceOverride = nil }
                    } label: {
                        Label("Appearance", systemImage: "circle.lefthalf.filled")
                    }

                    Button {
                        showPalette = true
                    } label: {
                        Label("Command Palette", systemImage: "command")
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var contentForSection: some View {
        switch selectedSection {
        case .containers:
            VStack(spacing: 16) {
                ProjectDetailView(project: sidebarViewModel.selected)
                ContainerListView(viewModel: containersViewModel)
            }
        case .images:
            ImageListView(viewModel: imagesViewModel)
        case .volumes:
            VolumeListView(viewModel: volumesViewModel)
        case .networks:
            NetworkListView(viewModel: networksViewModel)
        case .logs:
            LogsView(viewModel: logsViewModel, containers: containersViewModel.containers)
        case .events:
            EventsView(viewModel: eventsViewModel)
        }
    }

    private func refreshCurrentSection() async {
        switch selectedSection {
        case .containers:
            await containersViewModel.load()
        case .images:
            await imagesViewModel.load()
        case .volumes:
            await volumesViewModel.load()
        case .networks:
            await networksViewModel.load()
        case .logs:
            await logsViewModel.load(containers: containersViewModel.containers)
        case .events:
            await eventsViewModel.load()
        }
    }
}
