import DesignSystem
import Shared
import SwiftUI
import UIComponents

// MARK: - Main Window

public struct MainWindow: View {
    @Environment(AppState.self) private var state

    public init() {}

    public var body: some View {
        @Bindable var state = state

        NavigationSplitView {
            SidebarView(selection: $state.selectedSection)
                .navigationSplitViewColumnWidth(min: 200, ideal: 240)
        } detail: {
            NavigationStack(path: $state.navigationPath) {
                VStack(alignment: .leading, spacing: DesignSystem.Spacing.lg) {
                    VStack(alignment: .leading, spacing: DesignSystem.Spacing.lg) {
                        DiagnosticsSection()
                        EngineStatusHero()
                    }
                    .padding(.horizontal, DesignSystem.Spacing.xl)
                    .padding(.top, DesignSystem.Spacing.xl)

                    DetailContentView()
                }
                .navigationTitle(state.selectedSection.title)
                .toolbarTitleDisplayMode(.inline)
                .toolbar(id: "main-toolbar") {
                    MainToolbar()
                }
            }
        }
        .unifiedChrome()
        .sheet(isPresented: $state.showPalette) {
            CommandPaletteView(registry: state.commandRegistry) {
                state.showPalette = false
            }
            .frame(width: 560, height: 360)
        }
    }
}

// MARK: - Subviews

struct DiagnosticsSection: View {
    @Environment(AppState.self) private var state
    @State private var isExpanded: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
            if let platformStatus = state.platformStatus, !platformStatus.isSupported {
                DiagnosticsBanner(
                    title: "Unsupported Platform",
                    message: platformStatus.message,
                    icon: "macwindow.badge.exclamationmark",
                    tone: .warning
                )
            }

            if state.activeRuntimeMode == "stub" {
                #if DEBUG
                    DiagnosticsBanner(
                        title: "Stub Runtime Mode Active",
                        message: "Running in development/demo mode with mocked container engines.",
                        icon: "info.circle.fill",
                        tone: .info
                    )
                #else
                    DiagnosticsBanner(
                        title: "Critical: Native Runtime Unavailable",
                        message: "Apple Containerization framework or kernel is missing on this host. Silent fallback to stub is prevented in release mode; operations are disabled.",
                        icon: "exclamationmark.octagon.fill",
                        tone: .warning
                    )
                #endif
            }

            if let kernelStatus = state.kernelStatus, kernelStatus.status != "ok" {
                DiagnosticsBanner(
                    title: kernelStatus.name,
                    message: kernelStatus.message,
                    icon: "cpu",
                    tone: .warning
                )
            }

            if let databaseStatus = state.databaseStatus, databaseStatus.status != "ok" {
                DiagnosticsBanner(
                    title: databaseStatus.name,
                    message: databaseStatus.message,
                    icon: "cylinder.split.1x2.fill",
                    tone: .warning
                )
            }

            if let portsStatus = state.portsStatus, portsStatus.status != "ok" {
                DiagnosticsBanner(
                    title: portsStatus.name,
                    message: portsStatus.message,
                    icon: "network",
                    tone: .warning
                )
            }

            Button {
                withAnimation { isExpanded.toggle() }
            } label: {
                HStack {
                    Image(systemName: "checklist")
                    Text("First-Run Diagnostics & Setup")
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                }
                .font(DesignSystem.Typography.headline)
                .foregroundStyle(DesignSystem.Colors.textPrimary)
            }
            .buttonStyle(.glass)

            if isExpanded {
                GlassCard {
                    VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                        DiagnosticRow(
                            label: "macOS Version",
                            value: "\(state.platformStatus?.osVersion.majorVersion ?? 0).\(state.platformStatus?.osVersion.minorVersion ?? 0)",
                            status: state.platformStatus?.isSupported == true ? "ok" : "warning"
                        )
                        DiagnosticRow(
                            label: "Architecture",
                            value: state.platformStatus?.isAppleSilicon == true ? "arm64" : "x86_64",
                            status: state.platformStatus?.isAppleSilicon == true ? "ok" : "warning"
                        )
                        DiagnosticRow(
                            label: "Runtime Mode",
                            value: state.activeRuntimeMode,
                            status: state.activeRuntimeMode == "stub" ? "warning" : "ok"
                        )
                        DiagnosticRow(
                            label: "Framework",
                            value: state.containerizationStatus?.message ?? "unknown",
                            status: state.containerizationStatus?.status ?? "unknown"
                        )
                        DiagnosticRow(
                            label: "Linux Kernel",
                            value: state.kernelStatus?.message ?? "unknown",
                            status: state.kernelStatus?.status ?? "unknown"
                        )
                        DiagnosticRow(
                            label: "Initfs",
                            value: state.initfsStatus?.message ?? "unknown",
                            status: state.initfsStatus?.status ?? "unknown"
                        )
                        DiagnosticRow(
                            label: "Database",
                            value: state.databaseStatus?.message ?? "unknown",
                            status: state.databaseStatus?.status ?? "unknown"
                        )
                        DiagnosticRow(
                            label: "Ports Availability",
                            value: state.portsStatus?.message ?? "unknown",
                            status: state.portsStatus?.status ?? "unknown"
                        )
                    }
                    .padding(.vertical, DesignSystem.Spacing.xs)
                }
            }
        }
    }
}

struct DiagnosticRow: View {
    let label: String
    let value: String
    let status: String

    var body: some View {
        HStack {
            Text(label)
                .font(DesignSystem.Typography.subheadline)
                .foregroundStyle(DesignSystem.Colors.textSecondary)
                .frame(width: 140, alignment: .leading)

            Text(value)
                .font(DesignSystem.Typography.body)
                .foregroundStyle(DesignSystem.Colors.textPrimary)
                .lineLimit(1)
                .truncationMode(.tail)

            Spacer()

            Image(systemName: isReady ? "checkmark.circle.fill" : "exclamationmark.triangle.fill")
                .foregroundStyle(isReady ? DesignSystem.Colors.success : DesignSystem.Colors.warning)
        }
    }

    private var isReady: Bool {
        status.lowercased() == "ok" || status.lowercased() == "ready"
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
        case "running", "ok", "ready", "healthy": "checkmark.circle.fill"
        case "stopped", "offline", "disabled": "xmark.circle.fill"
        default: "questionmark.circle.fill"
        }
    }

    private func statusColor(for status: String) -> Color {
        switch status.lowercased() {
        case "running", "ok", "ready", "healthy": DesignSystem.Colors.success
        case "stopped", "offline", "disabled": DesignSystem.Colors.textTertiary
        default: DesignSystem.Colors.textTertiary
        }
    }
}

struct DetailContentView: View {
    @Environment(AppState.self) private var state

    var body: some View {
        let features = state.features
        switch state.selectedSection {
        case .dashboard:
            features.dashboard.dashboardView()
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
        case .machines:
            features.machines.listView()
        case .kubernetes:
            features.kubernetes.listView()
        case .debugShell:
            features.debugShell.listView()
        }
    }
}

struct MainToolbar: CustomizableToolbarContent {
    @Environment(AppState.self) private var state

    var body: some CustomizableToolbarContent {
        ToolbarItem(id: "refresh", placement: .primaryAction) {
            Button {
                Task { await state.refreshCurrentSection() }
            } label: {
                Label("Refresh", systemImage: "arrow.clockwise")
            }
            .buttonStyle(.glass)
        }

        ToolbarItem(id: "command-palette", placement: .primaryAction) {
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
