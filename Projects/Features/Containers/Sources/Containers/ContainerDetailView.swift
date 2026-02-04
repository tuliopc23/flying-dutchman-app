import Dependencies
import DesignSystem
import FlyingDutchmanNetworking
import FlyingDutchmanPersistence
import Shared
import SwiftUI
import UIComponents

@MainActor
@Observable
final class ContainerDetailViewModel {
    var container: ContainerSummary
    var logs: [String] = []
    var isLoadingLogs: Bool = false
    var isPerformingAction: Bool = false
    var error: String?

    init(container: ContainerSummary) {
        self.container = container
    }

    func loadLogs() async {
        isLoadingLogs = true
        defer { isLoadingLogs = false }
        do {
            logs = try await EngineClient.containerLogs(containerID: container.id)
        } catch {
            self.error = "Failed to load logs: \(error.localizedDescription)"
        }
    }

    func start() async {
        await performAction { [self] in
            let updated = try await EngineClient.startContainer(id: container.id)
            self.container = updated
            return updated
        }
    }

    func stop() async {
        await performAction { [self] in
            let updated = try await EngineClient.stopContainer(id: container.id)
            self.container = updated
            return updated
        }
    }

    func restart() async {
        await performAction { [self] in
            let updated = try await EngineClient.restartContainer(id: container.id)
            self.container = updated
            return updated
        }
    }

    private func performAction(_ action: @MainActor () async throws -> ContainerSummary) async {
        isPerformingAction = true
        error = nil
        defer { isPerformingAction = false }
        do {
            container = try await action()
        } catch {
            self.error = "Action failed: \(error.localizedDescription)"
        }
    }
}

struct ContainerDetailView: View {
    @Bindable var viewModel: ContainerDetailViewModel
    @Environment(\.colorScheme) private var colorScheme
    @Dependency(\.terminalLauncher) private var terminalLauncher

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Header Card
                headerCard

                // Metadata Card
                metadataCard

                // Ports Card
                if !viewModel.container.ports.isEmpty {
                    portsCard
                }

                // Logs Card
                logsCard

                // Error Display
                if let error = viewModel.error {
                    errorCard(error)
                }
            }
            .padding()
        }
        .navigationTitle(viewModel.container.name)
        .task {
            await viewModel.loadLogs()
        }
    }

    // MARK: - Header Card

    private var headerCard: some View {
        GlassCard {
            HStack(spacing: 16) {
                // Status Icon with Animation
                Image.systemIcon(
                    DesignTokens.containerStatusSymbol(for: viewModel.container.status),
                    size: DesignSystem.Size.iconHuge
                )
                .foregroundStyle(DesignTokens.containerStatusColor(for: viewModel.container.status))
                .symbolEffect(.variableColor.iterative, isActive: viewModel.container.status == .running)

                VStack(alignment: .leading, spacing: 4) {
                    Text(viewModel.container.name)
                        .font(DesignSystem.Typography.title2)
                        .foregroundStyle(DesignSystem.Colors.textPrimary)

                    Text(statusText)
                        .font(DesignSystem.Typography.subheadline)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)

                    Text("ID: \(viewModel.container.id.uuidString.prefix(12))")
                        .font(DesignSystem.Typography.caption2)
                        .foregroundStyle(DesignSystem.Colors.textTertiary)
                        .monospaced()
                }

                Spacer()

                // Action Buttons
                VStack(spacing: 8) {
                    actionButtons
                }
            }
            .padding(DesignSystem.Inset.md)
        }
    }

    @ViewBuilder
    private var actionButtons: some View {
        if viewModel.isPerformingAction {
            ProgressView()
                .controlSize(.regular)
        } else {
            switch viewModel.container.status {
            case .running:
                Button {
                    Task { await viewModel.stop() }
                } label: {
                    Label("Stop", systemImage: "stop.fill")
                        .frame(minWidth: 100)
                }
                .buttonStyle(.bordered)

                Button {
                    Task { await viewModel.restart() }
                } label: {
                    Label("Restart", systemImage: "arrow.triangle.2.circlepath")
                        .frame(minWidth: 100)
                }
                .buttonStyle(.bordered)

                Button {
                    Task { await openDebugShell() }
                } label: {
                    Label("Debug Shell", systemImage: "terminal")
                        .frame(minWidth: 120)
                }
                .buttonStyle(.bordered)

            case .stopped, .created:
                Button {
                    Task { await viewModel.start() }
                } label: {
                    Label("Start", systemImage: "play.fill")
                        .frame(minWidth: 100)
                }
                .buttonStyle(.borderedProminent)

            case .starting, .stopping, .removing, .removed:
                EmptyView()
            }
        }
    }

    private var statusText: String {
        viewModel.container.status.displayName
    }

    private func openDebugShell() async {
        do {
            try await terminalLauncher.openTerminal("fd shell \(viewModel.container.name)")
        } catch {
            viewModel.error = "Failed to open terminal: \(error.localizedDescription)"
        }
    }

    // MARK: - Metadata Card

    private var metadataCard: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 12) {
                SectionHeader(title: "Container Information", icon: "info.circle")

                Divider()

                VStack(spacing: 10) {
                    metadataRow(label: "Image", value: viewModel.container.image, icon: "cube.box")
                    metadataRow(label: "Created", value: formatDate(viewModel.container.createdAt), icon: "clock")
                    metadataRow(label: "Status", value: statusText, icon: "tag")
                    if let url = AppConfig.Networking.url(for: viewModel.container.name) {
                        metadataLinkRow(label: "URL", url: url, icon: "globe")
                    }
                }
            }
            .padding()
        }
    }

    private func metadataRow(label: String, value: String, icon: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundStyle(.secondary)
                .frame(width: 20)

            Text(label)
                .foregroundStyle(.secondary)
                .frame(width: 80, alignment: .leading)

            Text(value)
                .fontWeight(.medium)

            Spacer()
        }
        .padding(.vertical, 4)
    }

    private func metadataLinkRow(label: String, url: URL, icon: String) -> some View {
        let host = url.host ?? url.absoluteString
        let portSuffix = url.port.map { ":\($0)" } ?? ""
        let displayText = host + portSuffix

        return HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundStyle(.secondary)
                .frame(width: 20)

            Text(label)
                .foregroundStyle(.secondary)
                .frame(width: 80, alignment: .leading)

            Link(displayText, destination: url)
                .font(DesignSystem.Typography.caption1)
                .foregroundStyle(DesignSystem.Colors.accent)
                .lineLimit(1)
                .truncationMode(.middle)

            Spacer()
        }
        .padding(.vertical, 4)
    }

    // MARK: - Ports Card

    private var portsCard: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 12) {
                SectionHeader(title: "Exposed Ports", icon: "network")

                Divider()

                VStack(alignment: .leading, spacing: 8) {
                    ForEach(viewModel.container.ports, id: \.self) { port in
                        HStack {
                            Image(systemName: "arrow.left.arrow.right")
                                .foregroundStyle(.secondary)
                            Text(port)
                                .monospaced()
                            Spacer()
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .padding()
        }
    }

    // MARK: - Logs Card

    private var logsCard: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    SectionHeader(title: "Logs", icon: "doc.text")

                    Spacer()

                    if viewModel.isLoadingLogs {
                        ProgressView()
                            .controlSize(.small)
                    } else {
                        Button {
                            Task { await viewModel.loadLogs() }
                        } label: {
                            Label("Refresh", systemImage: "arrow.clockwise")
                        }
                        .buttonStyle(.borderless)
                    }
                }

                Divider()

                if viewModel.logs.isEmpty {
                    EmptyStateCard(
                        title: "No logs available",
                        message: "Start the container to see logs here.",
                        systemImage: "doc.text"
                    )
                } else {
                    ScrollView(.vertical) {
                        VStack(alignment: .leading, spacing: 4) {
                            ForEach(Array(viewModel.logs.enumerated()), id: \.offset) { _, line in
                                Text(line)
                                    .font(.system(.caption, design: .monospaced))
                                    .foregroundStyle(.secondary)
                                    .textSelection(.enabled)
                            }
                        }
                        .padding(8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(DesignTokens.glassFieldBackground(for: colorScheme))
                        .clipShape(DesignTokens.glassShape)
                    }
                    .frame(height: 300)
                }
            }
            .padding()
        }
    }

    // MARK: - Error Card

    private func errorCard(_ message: String) -> some View {
        GlassCard {
            HStack(spacing: 12) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundStyle(.orange)
                Text(message)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding()
        }
    }

    // MARK: - Helpers

    private func formatDate(_ date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}

// MARK: - Preview

#Preview("Running Container") {
    NavigationStack {
        ContainerDetailView(
            viewModel: ContainerDetailViewModel(
                container: SeedData.sampleContainers[0]
            )
        )
    }
}

#Preview("Stopped Container") {
    NavigationStack {
        ContainerDetailView(
            viewModel: ContainerDetailViewModel(
                container: SeedData.sampleContainers[2]
            )
        )
    }
}
