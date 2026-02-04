import Dependencies
import DesignSystem
import FlyingDutchmanNetworking
import Shared
import SwiftUI
import UIComponents

@MainActor
@Observable
public final class MachineListViewModel {
    public var machines: [Machine] = []
    public var error: String?
    public var isLoading: Bool = false
    public var searchQuery: String = ""
    public var showRunningOnly: Bool = false
    public var showCreateSheet: Bool = false

    public init() {}

    public var filtered: [Machine] {
        machines.filter { machine in
            let matchesQuery: Bool
            if searchQuery.isEmpty {
                matchesQuery = true
            } else {
                let needle = searchQuery.lowercased()
                matchesQuery = machine.name.lowercased().contains(needle)
                    || machine.distro.lowercased().contains(needle)
            }
            let matchesStatus = !showRunningOnly || machine.status == .running
            return matchesQuery && matchesStatus
        }
    }

    public func load() async {
        isLoading = true
        defer { isLoading = false }
        do {
            machines = try await EngineClient.listMachines()
        } catch {
            machines = []
            self.error = "Failed to load machines: \(error.localizedDescription)"
        }
    }

    public func start(_ machine: Machine) async {
        await mutate(machine) { id in
            try await EngineClient.startMachine(nameOrID: id)
        }
    }

    public func stop(_ machine: Machine) async {
        await mutate(machine) { id in
            try await EngineClient.stopMachine(nameOrID: id)
        }
    }

    public func restart(_ machine: Machine) async {
        await mutate(machine) { id in
            try await EngineClient.restartMachine(nameOrID: id)
        }
    }

    public func delete(_ machine: Machine) async {
        isLoading = true
        defer { isLoading = false }
        do {
            try await EngineClient.deleteMachine(nameOrID: machine.id)
            machines.removeAll { $0.id == machine.id }
        } catch {
            self.error = "Delete failed: \(error.localizedDescription)"
        }
    }

    public func create(name: String, config: MachineConfig) async {
        isLoading = true
        defer { isLoading = false }
        do {
            let created = try await EngineClient.createMachine(name: name, config: config)
            machines.append(created)
        } catch {
            self.error = "Create failed: \(error.localizedDescription)"
        }
    }

    private func mutate(
        _ machine: Machine,
        action: @escaping (String) async throws -> Machine
    ) async {
        isLoading = true
        defer { isLoading = false }
        do {
            let updated = try await action(machine.id)
            if let index = machines.firstIndex(where: { $0.id == updated.id }) {
                machines[index] = updated
            }
        } catch {
            self.error = "Action failed: \(error.localizedDescription)"
        }
    }
}

public struct MachineListView: View {
    @Bindable var viewModel: MachineListViewModel

    public init(viewModel: MachineListViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(spacing: DesignSystem.Spacing.lg) {
            header

            Toggle("Running only", isOn: $viewModel.showRunningOnly)
                .toggleStyle(.switch)
                .controlSize(.mini)
                .padding(.horizontal, DesignSystem.Spacing.md)

            if let error = viewModel.error {
                DiagnosticsBanner(
                    title: "Error",
                    message: error,
                    icon: "exclamationmark.triangle",
                    tone: .warning
                )
                .padding(.horizontal, DesignSystem.Spacing.md)
            }

            if viewModel.filtered.isEmpty {
                EmptyStateCard(
                    title: "No machines found",
                    message: viewModel.searchQuery.isEmpty
                        ? "Create a Linux machine to get started."
                        : "Try adjusting your search filters.",
                    systemImage: "laptopcomputer"
                )
                .padding(.horizontal, DesignSystem.Spacing.md)
            } else {
                LazyVStack(spacing: DesignSystem.Spacing.sm) {
                    ForEach(viewModel.filtered) { machine in
                        NavigationLink(value: machine) {
                            MachineRow(machine: machine, viewModel: viewModel)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, DesignSystem.Spacing.md)
            }
        }
        .onAppear {
            if viewModel.machines.isEmpty {
                Task { await viewModel.load() }
            }
        }
        .searchable(text: $viewModel.searchQuery)
        .navigationDestination(for: Machine.self) { machine in
            MachineDetailView(viewModel: MachineDetailViewModel(machine: machine))
        }
        .sheet(isPresented: $viewModel.showCreateSheet) {
            MachineCreateSheet(viewModel: viewModel)
        }
    }

    private var header: some View {
        HStack {
            Text("Machines")
                .font(DesignSystem.Typography.title2)
                .foregroundStyle(DesignSystem.Colors.textPrimary)

            Spacer()

            if viewModel.isLoading {
                ProgressView()
                    .controlSize(.small)
            }

            Button {
                viewModel.showCreateSheet = true
            } label: {
                Label("Create", systemImage: "plus")
            }
            .buttonStyle(.glassProminent)

            Button {
                Task { await viewModel.load() }
            } label: {
                Label("Refresh", systemImage: "arrow.clockwise")
            }
            .buttonStyle(.glass)
        }
        .padding(.horizontal, DesignSystem.Spacing.md)
    }
}

struct MachineRow: View {
    let machine: Machine
    var viewModel: MachineListViewModel

    var body: some View {
        GlassCard {
            HStack(spacing: DesignSystem.Spacing.md) {
                Image.systemIcon(statusSymbol(for: machine.status), size: DesignSystem.Size.iconLarge)
                    .foregroundStyle(statusColor(for: machine.status))

                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: DesignSystem.Spacing.xs) {
                        Text(machine.name)
                            .font(DesignSystem.Typography.headline)
                            .foregroundStyle(DesignSystem.Colors.textPrimary)

                        if machine.isKubernetesCluster {
                            Text("k8s")
                                .font(DesignSystem.Typography.caption1)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(DesignSystem.Colors.surfaceTertiary)
                                .clipShape(DesignSystem.Shapes.chip)
                        }
                    }

                    Text("\(machine.distro) \(machine.version) • \(machine.cpuCount) CPU • \(machine.memoryGB)GB")
                        .font(DesignSystem.Typography.caption1)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                }

                Spacer()

                if let ip = machine.ipAddress {
                    Text(ip)
                        .font(DesignSystem.Typography.codeSmall)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(DesignSystem.Colors.surfaceTertiary)
                        .clipShape(DesignSystem.Shapes.chip)
                }

                actionButtons(for: machine)
            }
            .padding(DesignSystem.Inset.sm)
        }
    }

    private func actionButtons(for machine: Machine) -> some View {
        HStack(spacing: DesignSystem.Spacing.xs) {
            switch machine.status {
            case .running:
                Button {
                    Task { await viewModel.stop(machine) }
                } label: {
                    Label("Stop", systemImage: "stop.fill")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.glass)
                .help("Stop Machine")

                Button {
                    Task { await viewModel.restart(machine) }
                } label: {
                    Label("Restart", systemImage: "arrow.triangle.2.circlepath")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.glass)
                .help("Restart Machine")

            case .stopped, .error, .creating, .starting, .stopping:
                Button {
                    Task { await viewModel.start(machine) }
                } label: {
                    Label("Start", systemImage: "play.fill")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.glassProminent)
                .tint(DesignSystem.Colors.success)
                .help("Start Machine")
            }
        }
    }

    private func statusSymbol(for status: MachineStatus) -> String {
        switch status {
        case .running: "server.rack"
        case .stopped: "server.rack"
        case .starting: "arrow.triangle.2.circlepath"
        case .stopping: "arrow.down.circle"
        case .creating: "sparkles"
        case .error: "exclamationmark.triangle"
        }
    }

    private func statusColor(for status: MachineStatus) -> Color {
        switch status {
        case .running: DesignSystem.Colors.success
        case .error: DesignSystem.Colors.warning
        default: DesignSystem.Colors.textTertiary
        }
    }
}

struct MachineCreateSheet: View {
    @Bindable var viewModel: MachineListViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var name: String = ""
    @State private var distro: MachineDistro = .ubuntu
    @State private var version: String = MachineDistro.ubuntu.defaultVersions.first ?? "24.04"
    @State private var cpuCount: Int = 2
    @State private var memoryGB: Int = 2
    @State private var diskGB: Int = 20

    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.lg) {
            Text("Create Machine")
                .font(DesignSystem.Typography.title2)

            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)

            HStack(spacing: DesignSystem.Spacing.md) {
                Picker("Distro", selection: $distro) {
                    ForEach(MachineDistro.allCases, id: \.self) { distro in
                        Text(distro.displayName).tag(distro)
                    }
                }
                .pickerStyle(.menu)
                .onChange(of: distro) { _, newValue in
                    version = newValue.defaultVersions.first ?? "latest"
                }

                Picker("Version", selection: $version) {
                    ForEach(distro.defaultVersions, id: \.self) { version in
                        Text(version).tag(version)
                    }
                }
                .pickerStyle(.menu)
            }

            HStack(spacing: DesignSystem.Spacing.md) {
                Stepper("CPU: \(cpuCount)", value: $cpuCount, in: 1 ... 16)
                Stepper("RAM: \(memoryGB)GB", value: $memoryGB, in: 1 ... 64)
                Stepper("Disk: \(diskGB)GB", value: $diskGB, in: 10 ... 200)
            }

            Spacer()

            HStack {
                Button("Cancel") { dismiss() }
                    .buttonStyle(.glass)

                Spacer()

                Button("Create") {
                    Task {
                        let config = MachineConfig(
                            distro: distro.rawValue,
                            version: version,
                            cpuCount: cpuCount,
                            memoryGB: memoryGB,
                            diskGB: diskGB
                        )
                        await viewModel.create(name: name, config: config)
                        dismiss()
                    }
                }
                .buttonStyle(.glassProminent)
                .disabled(name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .padding(DesignSystem.Spacing.xl)
        .frame(width: 520)
    }
}

@MainActor
@Observable
final class MachineDetailViewModel {
    var machine: Machine
    var error: String?
    var isPerformingAction: Bool = false

    init(machine: Machine) {
        self.machine = machine
    }

    func start() async {
        await performAction { try await EngineClient.startMachine(nameOrID: machine.id) }
    }

    func stop() async {
        await performAction { try await EngineClient.stopMachine(nameOrID: machine.id) }
    }

    func restart() async {
        await performAction { try await EngineClient.restartMachine(nameOrID: machine.id) }
    }

    func delete() async {
        isPerformingAction = true
        defer { isPerformingAction = false }
        do {
            try await EngineClient.deleteMachine(nameOrID: machine.id)
        } catch {
            self.error = "Delete failed: \(error.localizedDescription)"
        }
    }

    private func performAction(_ action: @MainActor () async throws -> Machine) async {
        isPerformingAction = true
        error = nil
        defer { isPerformingAction = false }
        do {
            machine = try await action()
        } catch {
            self.error = "Action failed: \(error.localizedDescription)"
        }
    }
}

struct MachineDetailView: View {
    @Bindable var viewModel: MachineDetailViewModel
    @Dependency(\.terminalLauncher) private var terminalLauncher

    var body: some View {
        ScrollView {
            VStack(spacing: DesignSystem.Spacing.lg) {
                headerCard
                metadataCard

                if let error = viewModel.error {
                    DiagnosticsBanner(
                        title: "Error",
                        message: error,
                        icon: "exclamationmark.triangle",
                        tone: .warning
                    )
                }
            }
            .padding(DesignSystem.Spacing.lg)
        }
        .navigationTitle(viewModel.machine.name)
    }

    private var headerCard: some View {
        GlassCard {
            HStack(spacing: DesignSystem.Spacing.md) {
                Image.systemIcon("server.rack", size: DesignSystem.Size.iconHuge)
                    .foregroundStyle(statusColor(for: viewModel.machine.status))

                VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                    Text(viewModel.machine.name)
                        .font(DesignSystem.Typography.title2)
                    Text(statusText)
                        .font(DesignSystem.Typography.subheadline)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                    Text("ID: \(viewModel.machine.id.prefix(12))")
                        .font(DesignSystem.Typography.caption2)
                        .foregroundStyle(DesignSystem.Colors.textTertiary)
                        .monospaced()
                }

                Spacer()

                VStack(spacing: DesignSystem.Spacing.xs) {
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
            switch viewModel.machine.status {
            case .running:
                Button {
                    Task { await viewModel.stop() }
                } label: {
                    Label("Stop", systemImage: "stop.fill")
                        .frame(minWidth: 110)
                }
                .buttonStyle(.bordered)

                Button {
                    Task { await viewModel.restart() }
                } label: {
                    Label("Restart", systemImage: "arrow.triangle.2.circlepath")
                        .frame(minWidth: 110)
                }
                .buttonStyle(.bordered)

                Button {
                    Task { await openSSH() }
                } label: {
                    Label("SSH", systemImage: "terminal")
                        .frame(minWidth: 110)
                }
                .buttonStyle(.bordered)

            case .stopped, .error, .creating, .starting, .stopping:
                Button {
                    Task { await viewModel.start() }
                } label: {
                    Label("Start", systemImage: "play.fill")
                        .frame(minWidth: 110)
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }

    private var metadataCard: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
                SectionHeader(title: "Machine Details", icon: "info.circle")
                Divider()

                metadataRow(
                    label: "Distro",
                    value: "\(viewModel.machine.distro) \(viewModel.machine.version)",
                    icon: "cube"
                )
                metadataRow(
                    label: "Resources",
                    value: "\(viewModel.machine.cpuCount) CPU • \(viewModel.machine.memoryGB)GB RAM",
                    icon: "speedometer"
                )
                metadataRow(
                    label: "Disk",
                    value: "\(viewModel.machine.diskGB)GB",
                    icon: "internaldrive"
                )

                if let ip = viewModel.machine.ipAddress {
                    metadataRow(label: "IP Address", value: ip, icon: "network")
                }
            }
            .padding(DesignSystem.Inset.md)
        }
    }

    private var statusText: String {
        viewModel.machine.status.rawValue.capitalized
    }

    private func statusColor(for status: MachineStatus) -> Color {
        switch status {
        case .running: DesignSystem.Colors.success
        case .error: DesignSystem.Colors.warning
        default: DesignSystem.Colors.textTertiary
        }
    }

    private func metadataRow(label: String, value: String, icon: String) -> some View {
        HStack(spacing: DesignSystem.Spacing.sm) {
            Image.systemIcon(icon, size: DesignSystem.Size.iconRegular)
                .foregroundStyle(DesignSystem.Colors.textTertiary)

            Text(label)
                .font(DesignSystem.Typography.body)
                .foregroundStyle(DesignSystem.Colors.textSecondary)

            Spacer()

            Text(value)
                .font(DesignSystem.Typography.body)
                .foregroundStyle(DesignSystem.Colors.textPrimary)
        }
    }

    private func openSSH() async {
        do {
            try await terminalLauncher.openTerminal("fd machines ssh \(viewModel.machine.name)")
        } catch {
            viewModel.error = "Failed to open terminal: \(error.localizedDescription)"
        }
    }
}
