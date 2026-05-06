import Dependencies
import DesignSystem
import FlyingDutchmanNetworking
import Shared
import SwiftUI
import UIComponents

@MainActor
@Observable
public final class DebugShellViewModel {
    public enum TargetKind: String, CaseIterable, Identifiable {
        case local
        case container
        case machine

        public var id: String {
            rawValue
        }

        public var title: String {
            rawValue.capitalized
        }
    }

    public struct TargetOption: Identifiable, Hashable {
        public let id: String
        public let title: String

        public init(id: String, title: String) {
            self.id = id
            self.title = title
        }
    }

    public var error: String?
    public var targetKind: TargetKind = .local
    public var containerTargets: [TargetOption] = []
    public var machineTargets: [TargetOption] = []
    public var selectedContainerID: String?
    public var selectedMachineID: String?
    public var session = EmbeddedTerminalSession()

    public init() {}

    var targetOptions: [TargetOption] {
        switch targetKind {
        case .local:
            [TargetOption(id: "local", title: "Local shell")]
        case .container:
            containerTargets
        case .machine:
            machineTargets
        }
    }

    var selectedTargetID: String {
        get {
            switch targetKind {
            case .local:
                "local"
            case .container:
                selectedContainerID ?? containerTargets.first?.id ?? ""
            case .machine:
                selectedMachineID ?? machineTargets.first?.id ?? ""
            }
        }
        set {
            switch targetKind {
            case .local:
                break
            case .container:
                selectedContainerID = newValue
            case .machine:
                selectedMachineID = newValue
            }
        }
    }

    var launchCommand: String {
        switch targetKind {
        case .local:
            return "/bin/zsh -il"
        case .container:
            guard let target = currentTarget else { return "fd shell <container>" }
            return "fd shell \(shellEscape(target.id))"
        case .machine:
            guard let target = currentTarget else { return "fd machines ssh <name>" }
            return "fd machines ssh \(shellEscape(target.id))"
        }
    }

    var currentTarget: TargetOption? {
        targetOptions.first(where: { $0.id == selectedTargetID }) ?? targetOptions.first
    }

    func loadTargets() async {
        error = nil
        do {
            async let containersTask = EngineClient.listContainers()
            async let machinesTask = EngineClient.listMachines()
            let containers = try await containersTask
            let machines = try await machinesTask
            containerTargets = containers
                .filter { $0.status == .running }
                .map { TargetOption(id: $0.name, title: "\($0.name) • \($0.image)") }
            machineTargets = machines
                .filter { $0.status == .running }
                .map { TargetOption(id: $0.name, title: "\($0.name) • \($0.distro) \($0.version)") }
            selectedContainerID = selectedContainerID ?? containerTargets.first?.id
            selectedMachineID = selectedMachineID ?? machineTargets.first?.id
        } catch {
            self.error = "Failed to load shell targets: \(error.localizedDescription)"
        }
    }

    func startEmbeddedSession() {
        session.start(command: launchCommand)
    }

    func stopEmbeddedSession() {
        session.stop()
    }

    private func shellEscape(_ value: String) -> String {
        "'" + value.replacingOccurrences(of: "'", with: "'\\''") + "'"
    }
}

public struct DebugShellView: View {
    @Bindable var viewModel: DebugShellViewModel
    @Dependency(\.terminalLauncher) private var terminalLauncher

    public init(viewModel: DebugShellViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.lg) {
            header

            controlsCard

            terminalCard

            if let error = viewModel.error ?? viewModel.session.error {
                DiagnosticsBanner(
                    title: "Error",
                    message: error,
                    icon: "exclamationmark.triangle",
                    tone: .warning
                )
            }

            Spacer()
        }
        .padding(DesignSystem.Spacing.lg)
        .task {
            await viewModel.loadTargets()
        }
    }

    private var header: some View {
        HStack(alignment: .firstTextBaseline) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Debug Shell")
                    .font(DesignSystem.Typography.title2)
                    .foregroundStyle(DesignSystem.Colors.textPrimary)
                Text(
                    "Run an embedded shell session for a local shell, container, or machine. External terminal launch remains available as fallback."
                )
                .font(DesignSystem.Typography.body)
                .foregroundStyle(DesignSystem.Colors.textSecondary)
            }
            Spacer()
        }
    }

    private var controlsCard: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
                SectionHeader(title: "Session", icon: "terminal")

                HStack(spacing: DesignSystem.Spacing.md) {
                    Picker("Target", selection: $viewModel.targetKind) {
                        ForEach(DebugShellViewModel.TargetKind.allCases) { kind in
                            Text(kind.title).tag(kind)
                        }
                    }
                    .pickerStyle(.segmented)

                    if viewModel.targetKind != .local {
                        Picker("Destination", selection: Binding(
                            get: { viewModel.selectedTargetID },
                            set: { viewModel.selectedTargetID = $0 }
                        )) {
                            ForEach(viewModel.targetOptions) { option in
                                Text(option.title).tag(option.id)
                            }
                        }
                        .frame(maxWidth: 320)
                    }
                }

                Text(viewModel.launchCommand)
                    .font(DesignSystem.Typography.codeSmall)
                    .foregroundStyle(DesignSystem.Colors.textSecondary)

                HStack(spacing: DesignSystem.Spacing.sm) {
                    Button {
                        viewModel.startEmbeddedSession()
                    } label: {
                        Label("Start Embedded Session", systemImage: "play.fill")
                    }
                    .buttonStyle(.glassProminent)
                    .disabled(viewModel.targetKind != .local && viewModel.targetOptions.isEmpty)

                    Button {
                        viewModel.stopEmbeddedSession()
                    } label: {
                        Label("Stop", systemImage: "stop.fill")
                    }
                    .buttonStyle(.glass)

                    Button {
                        Task { await openExternalTerminal() }
                    } label: {
                        Label("Open in Terminal", systemImage: "arrow.up.forward.app")
                    }
                    .buttonStyle(.glass)

                    Button {
                        Task { await viewModel.loadTargets() }
                    } label: {
                        Label("Refresh Targets", systemImage: "arrow.clockwise")
                    }
                    .buttonStyle(.glass)
                }
            }
            .padding(DesignSystem.Inset.md)
        }
    }

    private var terminalCard: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                SectionHeader(title: "Embedded Terminal", icon: "chevron.left.forwardslash.chevron.right")

                ScrollView {
                    Text(viewModel.session.output.isEmpty ? "Session output will appear here." : viewModel.session
                        .output)
                        .font(DesignSystem.Typography.codeSmall)
                        .foregroundStyle(DesignSystem.Colors.textPrimary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .textSelection(.enabled)
                }
                .frame(minHeight: 280)
                .padding(8)
                .background(DesignSystem.Colors.surfacePrimary)
                .clipShape(DesignSystem.Shapes.input)

                HStack {
                    TextField("Send input", text: $viewModel.session.input)
                        .textFieldStyle(.roundedBorder)
                        .onSubmit {
                            viewModel.session.sendInput()
                        }
                    Button("Send") {
                        viewModel.session.sendInput()
                    }
                    .buttonStyle(.glassProminent)
                }
            }
            .padding(DesignSystem.Inset.md)
        }
    }

    private func openExternalTerminal() async {
        do {
            try await terminalLauncher.openTerminal(viewModel.launchCommand)
        } catch {
            viewModel.error = "Failed to open terminal: \(error.localizedDescription)"
        }
    }
}
