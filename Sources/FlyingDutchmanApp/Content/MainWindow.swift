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
    @Bindable var stacksViewModel: StacksViewModel
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
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.lg) {
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
                    HStack(spacing: DesignSystem.Spacing.md) {
                        VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                            Text("Flying Dutchman Foundation")
                                .font(DesignSystem.Typography.title1)
                                .foregroundStyle(DesignSystem.Colors.textPrimary)
                            
                            HStack(spacing: DesignSystem.Spacing.sm) {
                                Image.systemIcon(
                                    statusSymbol(for: statusViewModel.primaryStatus),
                                    size: DesignSystem.Size.iconRegular
                                )
                                .foregroundStyle(statusColor(for: statusViewModel.primaryStatus))
                                
                                Text(statusViewModel.statusText)
                                    .font(DesignSystem.Typography.title3)
                                    .foregroundStyle(DesignSystem.Colors.textSecondary)
                                
                                if let mode = statusViewModel.mode {
                                    Text("mode: \(mode)")
                                        .font(DesignSystem.Typography.footnote)
                                        .foregroundStyle(DesignSystem.Colors.textTertiary)
                                }
                            }
                            
                            if !statusViewModel.workerStatuses.isEmpty {
                                HStack(spacing: DesignSystem.Spacing.sm) {
                                    ForEach(statusViewModel.workerStatuses.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                                        StatusBadge(label: "\(key): \(value)", state: value)
                                    }
                                }
                            }
                        }
                        Spacer()
                        Button {
                            Task { @MainActor in await statusViewModel.refresh() }
                        } label: {
                            Label("Refresh", systemImage: "arrow.clockwise")
                        }
                        .buttonStyle(.glass)
                    }
                }

                Picker("Section", selection: $selectedSection) {
                    ForEach(AppSection.allCases) { section in
                        Label(section.title, systemImage: section.systemImage)
                            .tag(section)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.top, DesignSystem.Spacing.xs)

                contentForSection
            }
            .padding(DesignSystem.Spacing.xl)
            .sheet(isPresented: $showPalette) {
                CommandPaletteView(registry: commandRegistry) {
                    showPalette = false
                }
                .frame(width: 520)
                .presentationDetents([.medium])
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack(spacing: DesignSystem.Spacing.xxs) {
                        Text("Flying Dutchman")
                            .font(DesignSystem.Typography.headline)
                            .foregroundStyle(DesignSystem.Colors.textPrimary)
                        Text(selectedSection.title)
                            .font(DesignSystem.Typography.caption1)
                            .foregroundStyle(DesignSystem.Colors.textSecondary)
                    }
                }
                ToolbarItemGroup(placement: .primaryAction) {
                    Button {
                        Task { @MainActor in await refreshCurrentSection() }
                    } label: {
                        Label("Refresh", systemImage: "arrow.clockwise")
                    }
                    .buttonStyle(.glass)

                    Menu {
                        Button("Light") { appearanceOverride = .light }
                        Button("Dark") { appearanceOverride = .dark }
                        Button("System") { appearanceOverride = nil }
                    } label: {
                        Label("Appearance", systemImage: "circle.lefthalf.filled")
                    }
                    .buttonStyle(.glass)

                    Button {
                        showPalette = true
                    } label: {
                        Label("Command Palette", systemImage: "command")
                    }
                    .buttonStyle(.glassProminent)
                    .tint(DesignSystem.Colors.accent)
                }
            }
        }
        .unifiedChrome()
    }

    @ViewBuilder
    private var contentForSection: some View {
        switch selectedSection {
        case .containers:
            VStack(spacing: DesignSystem.Spacing.lg) {
                StackDetailView(stack: sidebarViewModel.selectedStack)
                ContainerListView(viewModel: containersViewModel, stack: sidebarViewModel.selectedStack)
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
        case .stacks:
            StacksView(viewModel: stacksViewModel)
        }
    }

    @MainActor
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
        case .stacks:
            await stacksViewModel.load()
        }
    }
    
    // MARK: - Status Helpers (migrated from legacy DesignTokens)
    
    private func statusSymbol(for status: String) -> String {
        switch status.lowercased() {
        case "running", "ok", "ready", "healthy": return "checkmark.circle.fill"
        case "stopped", "offline", "disabled": return "xmark.circle.fill"
        case "paused", "warning", "degraded": return "exclamationmark.triangle.fill"
        case "error", "failed", "critical": return "xmark.octagon.fill"
        default: return "questionmark.circle.fill"
        }
    }
    
    private func statusColor(for status: String) -> Color {
        switch status.lowercased() {
        case "running", "ok", "ready", "healthy": return DesignSystem.Colors.success
        case "stopped", "offline", "disabled": return DesignSystem.Colors.textTertiary
        case "paused", "warning", "degraded": return DesignSystem.Colors.warning
        case "error", "failed", "critical": return DesignSystem.Colors.error
        default: return DesignSystem.Colors.textTertiary
        }
    }
}
