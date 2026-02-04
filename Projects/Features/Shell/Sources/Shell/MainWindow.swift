import SwiftUI
import Shared
import DesignSystem
import UIComponents

public struct MainWindow: View {
    @Environment(AppState.self) private var state

    public init() {}

    public var body: some View {
        @Bindable var state = state

        let features = state.features

        NavigationSplitView {
            SidebarView(selection: $state.selectedSection)
                .navigationSplitViewColumnWidth(min: 200, ideal: 240)
        } detail: {
            NavigationStack(path: $state.navigationPath) {
                ScrollView {
                    VStack(alignment: .leading, spacing: DesignSystem.Spacing.lg) {
                        DiagnosticsSection()
                        EngineStatusHero()
                        DetailContentView()
                    }
                    .padding(DesignSystem.Spacing.xl)
                }
                .navigationTitle(state.selectedSection.title)
                .toolbarTitleDisplayMode(.inline)
                .toolbar {
                    MainToolbar()
                }
            }
        }
        .unifiedChrome()
        .preferredColorScheme(state.appearanceOverride)
        .sheet(isPresented: $state.showPalette) {
            Text("Command Palette Placeholder")
                .frame(width: 520, height: 300)
        }
    }
}

// MARK: - Subviews

struct DiagnosticsSection: View {
    @Environment(AppState.self) private var state

    var body: some View {
        Group {
            if let platformStatus = state.platformStatus, !platformStatus.isSupported {
                DiagnosticsBanner(
                    title: "Unsupported Platform",
                    message: platformStatus.message,
                    icon: "macwindow.badge.exclamationmark",
                    tone: .warning
                )
            }

            if let containerizationStatus = state.containerizationStatus, containerizationStatus.status != "ok" {
                DiagnosticsBanner(
                    title: containerizationStatus.name,
                    message: containerizationStatus.message,
                    icon: "shippingbox.fill",
                    tone: containerizationStatus.status == "missing" ? .warning : .info
                )
            }
        }
    }
}

struct EngineStatusHero: View {
    @Environment(AppState.self) private var state

    var body: some View {
        GlassCard {
            HStack(spacing: DesignSystem.Spacing.md) {
                VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                    Text("Flying Dutchman Engine")
                        .font(DesignSystem.Typography.title1)
                        .foregroundStyle(DesignSystem.Colors.textPrimary)

                    HStack(spacing: DesignSystem.Spacing.sm) {
                        Image.systemIcon(
                            statusSymbol(for: state.primaryStatus),
                            size: DesignSystem.Size.iconRegular
                        )
                        .foregroundStyle(statusColor(for: state.primaryStatus))

                        Text(state.engineStatus)
                            .font(DesignSystem.Typography.title3)
                            .foregroundStyle(DesignSystem.Colors.textSecondary)
                    }
                }
                Spacer()
                Button {
                    Task { await state.refreshEngineStatus() }
                } label: {
                    Label("Refresh", systemImage: "arrow.clockwise")
                }
                .buttonStyle(.glass)
            }
        }
    }

    // MARK: - Status Helpers

    private func statusSymbol(for status: String) -> String {
        switch status.lowercased() {
        case "running", "ok", "ready", "healthy": return "checkmark.circle.fill"
        case "stopped", "offline", "disabled": return "xmark.circle.fill"
        default: return "questionmark.circle.fill"
        }
    }

    private func statusColor(for status: String) -> Color {
        switch status.lowercased() {
        case "running", "ok", "ready", "healthy": return DesignSystem.Colors.success
        case "stopped", "offline", "disabled": return DesignSystem.Colors.textTertiary
        default: return DesignSystem.Colors.textTertiary
        }
    }
}

struct DetailContentView: View {
    @Environment(AppState.self) private var state

    var body: some View {
        let features = state.features
        switch state.selectedSection {
        case .containers:
            VStack(spacing: DesignSystem.Spacing.lg) {
                features.stacks.detailView(state.sidebar.selectedStack)
                features.containers.listView(state.sidebar.selectedStack)
            }
        case .images:
            features.images.listView()
        case .volumes:
            features.volumes.listView()
        case .networks:
            features.networks.listView()
        case .logs:
            features.diagnostics.logsView(state.containers)
        case .events:
            features.diagnostics.eventsView()
        case .stacks:
            features.stacks.listView()
        }
    }
}

struct MainToolbar: ToolbarContent {
    @Environment(AppState.self) private var state

    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .primaryAction) {
            Button {
                Task { await state.refreshCurrentSection() }
            } label: {
                Label("Refresh", systemImage: "arrow.clockwise")
            }
            .buttonStyle(.glass)

            Menu {
                Button("Light") { state.appearanceOverride = .light }
                Button("Dark") { state.appearanceOverride = .dark }
                Button("System") { state.appearanceOverride = nil }
            } label: {
                Label("Appearance", systemImage: "circle.lefthalf.filled")
            }
            .buttonStyle(.glass)

            Button {
                state.showPalette = true
            } label: {
                Label("Command Palette", systemImage: "command")
            }
            .buttonStyle(.glassProminent)
            .tint(DesignSystem.Colors.accent)
        }
    }
}
