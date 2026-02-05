import AppKit
import DesignSystem
import FlyingDutchmanNetworking
import FlyingDutchmanPersistence
import Shared
import SwiftUI
import UIComponents

public enum KubernetesClusterKind: String, Sendable {
    case vm
    case container
}

public struct KubernetesCluster: Identifiable, Hashable, Sendable {
    public let id: String
    public let name: String
    public let kind: KubernetesClusterKind
    public let status: ClusterStatus
    public let ipAddress: String?
    public let kubernetesVersion: String?

    public enum ClusterStatus: String, Sendable {
        case running
        case stopped
        case starting
        case stopping
        case error
    }
}

@MainActor
@Observable
public final class KubernetesListViewModel {
    public var clusters: [KubernetesCluster] = []
    public var error: String?
    public var isLoading: Bool = false
    public var showCreateSheet: Bool = false

    public init() {}

    public func load() async {
        isLoading = true
        defer { isLoading = false }
        do {
            async let machines = EngineClient.listMachines()
            async let containers = EngineClient.listContainers()

            let machineClusters = try await machines
                .filter(\.isKubernetesCluster)
                .map { machine in
                    KubernetesCluster(
                        id: machine.id,
                        name: machine.name,
                        kind: .vm,
                        status: map(machine.status),
                        ipAddress: machine.ipAddress,
                        kubernetesVersion: machine.kubernetesVersion
                    )
                }

            let containerClusters = try await containers
                .filter { $0.image.localizedCaseInsensitiveContains("k3s") }
                .map { container in
                    KubernetesCluster(
                        id: container.id.uuidString,
                        name: container.name,
                        kind: .container,
                        status: map(container.status),
                        ipAddress: nil,
                        kubernetesVersion: nil
                    )
                }

            clusters = (machineClusters + containerClusters).sorted { $0.name < $1.name }
        } catch {
            clusters = []
            self.error = "Failed to load clusters: \(error.localizedDescription)"
        }
    }

    public func createCluster(name: String, cpu: Int, memory: Int, useVM: Bool) async {
        isLoading = true
        defer { isLoading = false }
        do {
            if useVM {
                let config = MachineConfig(
                    distro: "ubuntu",
                    version: "24.04",
                    cpuCount: cpu,
                    memoryGB: memory,
                    diskGB: 20,
                    installK3s: true
                )
                _ = try await EngineClient.createMachine(name: name, config: config)
            } else {
                let config = ContainerConfig(
                    portMappings: [
                        PortMapping(hostPort: 6443, containerPort: 6443),
                        PortMapping(hostPort: 30080, containerPort: 80),
                        PortMapping(hostPort: 30443, containerPort: 443),
                    ],
                    env: ["K3S_TOKEN": "flying-dutchman-token"],
                    command: ["server", "--disable=traefik"]
                )
                _ = try await EngineClient.createContainer(
                    name: name,
                    image: "rancher/k3s:latest",
                    config: config
                )
            }
            await load()
        } catch {
            self.error = "Create failed: \(error.localizedDescription)"
        }
    }

    public func start(_ cluster: KubernetesCluster) async {
        await mutate(cluster) { cluster in
            switch cluster.kind {
            case .vm:
                _ = try await EngineClient.startMachine(nameOrID: cluster.id)
            case .container:
                if let id = UUID(uuidString: cluster.id) {
                    _ = try await EngineClient.startContainer(id: id)
                }
            }
        }
    }

    public func stop(_ cluster: KubernetesCluster) async {
        await mutate(cluster) { cluster in
            switch cluster.kind {
            case .vm:
                _ = try await EngineClient.stopMachine(nameOrID: cluster.id)
            case .container:
                if let id = UUID(uuidString: cluster.id) {
                    _ = try await EngineClient.stopContainer(id: id)
                }
            }
        }
    }

    public func delete(_ cluster: KubernetesCluster) async {
        await mutate(cluster) { cluster in
            switch cluster.kind {
            case .vm:
                try await EngineClient.deleteMachine(nameOrID: cluster.id)
            case .container:
                if let id = UUID(uuidString: cluster.id) {
                    try await EngineClient.removeContainer(id: id)
                }
            }
        }
    }

    public func kubeconfig(_ cluster: KubernetesCluster) async -> String? {
        do {
            switch cluster.kind {
            case .vm:
                let config = try await EngineClient.executeMachineCommand(
                    nameOrID: cluster.id,
                    command: "sudo cat /etc/rancher/k3s/k3s.yaml"
                )
                if let ip = cluster.ipAddress {
                    return config.replacingOccurrences(of: "https://127.0.0.1:6443", with: "https://\(ip):6443")
                }
                return config
            case .container:
                return """
                apiVersion: v1
                kind: Config
                clusters:
                - cluster:
                    server: https://localhost:6443
                    insecure-skip-tls-verify: true
                  name: \(cluster.name)
                contexts:
                - context:
                    cluster: \(cluster.name)
                    user: \(cluster.name)
                  name: \(cluster.name)
                current-context: \(cluster.name)
                users:
                - name: \(cluster.name)
                  user:
                    token: flying-dutchman-token
                """
            }
        } catch {
            self.error = "Failed to load kubeconfig: \(error.localizedDescription)"
            return nil
        }
    }

    private func mutate(
        _ cluster: KubernetesCluster,
        action: @escaping (KubernetesCluster) async throws -> Void
    ) async {
        isLoading = true
        defer { isLoading = false }
        do {
            try await action(cluster)
            await load()
        } catch {
            self.error = "Action failed: \(error.localizedDescription)"
        }
    }

    private func map(_ status: MachineStatus) -> KubernetesCluster.ClusterStatus {
        switch status {
        case .running: .running
        case .stopped: .stopped
        case .starting: .starting
        case .stopping: .stopping
        case .creating: .starting
        case .error: .error
        }
    }

    private func map(_ status: ContainerSummary.Status) -> KubernetesCluster.ClusterStatus {
        switch status {
        case .running: .running
        case .stopped: .stopped
        case .starting: .starting
        case .stopping: .stopping
        case .created: .stopped
        case .removing, .removed: .stopped
        }
    }
}

public struct KubernetesListView: View {
    @Bindable var viewModel: KubernetesListViewModel
    @State private var kubeconfig: String?
    @State private var showKubeconfig: Bool = false

    public init(viewModel: KubernetesListViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(spacing: DesignSystem.Spacing.lg) {
            header

            if let error = viewModel.error {
                DiagnosticsBanner(
                    title: "Error",
                    message: error,
                    icon: "exclamationmark.triangle",
                    tone: .warning
                )
                .padding(.horizontal, DesignSystem.Spacing.md)
            }

            if viewModel.clusters.isEmpty {
                EmptyStateCard(
                    title: "No Kubernetes clusters",
                    message: "Create a cluster to get started.",
                    systemImage: "hexagon"
                )
                .padding(.horizontal, DesignSystem.Spacing.md)
            } else {
                LazyVStack(spacing: DesignSystem.Spacing.sm) {
                    ForEach(viewModel.clusters) { cluster in
                        KubernetesRow(cluster: cluster, viewModel: viewModel) {
                            Task {
                                kubeconfig = await viewModel.kubeconfig(cluster)
                                showKubeconfig = true
                            }
                        }
                    }
                }
                .padding(.horizontal, DesignSystem.Spacing.md)
            }
        }
        .onAppear {
            if viewModel.clusters.isEmpty {
                Task { await viewModel.load() }
            }
        }
        .sheet(isPresented: $viewModel.showCreateSheet) {
            KubernetesCreateSheet(viewModel: viewModel)
        }
        .sheet(isPresented: $showKubeconfig) {
            KubernetesKubeconfigSheet(kubeconfig: kubeconfig ?? "")
        }
    }

    private var header: some View {
        HStack {
            Text("Kubernetes")
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

struct KubernetesRow: View {
    let cluster: KubernetesCluster
    var viewModel: KubernetesListViewModel
    var onKubeconfig: () -> Void

    var body: some View {
        GlassCard {
            HStack(spacing: DesignSystem.Spacing.md) {
                Image.systemIcon("hexagon", size: DesignSystem.Size.iconLarge)
                    .foregroundStyle(statusColor(for: cluster.status))

                VStack(alignment: .leading, spacing: 2) {
                    Text(cluster.name)
                        .font(DesignSystem.Typography.headline)

                    Text("\(cluster.kind == .vm ? "VM" : "Container") cluster")
                        .font(DesignSystem.Typography.caption1)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                }

                Spacer()

                if let url = AppConfig.Networking.kubernetesURL(for: cluster.name) {
                    Link("\(url.host ?? "k8s"):\(AppConfig.Networking.httpsProxyPort)", destination: url)
                        .font(DesignSystem.Typography.codeSmall)
                }

                actionButtons
            }
            .padding(DesignSystem.Inset.sm)
        }
    }

    private var actionButtons: some View {
        HStack(spacing: DesignSystem.Spacing.xs) {
            switch cluster.status {
            case .running:
                Button {
                    Task { await viewModel.stop(cluster) }
                } label: {
                    Label("Stop", systemImage: "stop.fill")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.glass)

            case .stopped, .error, .starting, .stopping:
                Button {
                    Task { await viewModel.start(cluster) }
                } label: {
                    Label("Start", systemImage: "play.fill")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.glassProminent)
                .tint(DesignSystem.Colors.success)
            }

            Button {
                Task { await viewModel.delete(cluster) }
            } label: {
                Label("Delete", systemImage: "trash")
                    .labelStyle(.iconOnly)
            }
            .buttonStyle(.glass)

            Button {
                onKubeconfig()
            } label: {
                Label("Kubeconfig", systemImage: "doc.on.doc")
                    .labelStyle(.iconOnly)
            }
            .buttonStyle(.glass)
        }
    }

    private func statusColor(for status: KubernetesCluster.ClusterStatus) -> Color {
        switch status {
        case .running: DesignSystem.Colors.success
        case .error: DesignSystem.Colors.warning
        default: DesignSystem.Colors.textTertiary
        }
    }
}

struct KubernetesCreateSheet: View {
    @Bindable var viewModel: KubernetesListViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var name: String = ""
    @State private var cpu: Int = 2
    @State private var memory: Int = 2
    @State private var useVM: Bool = true
    @State private var defaultsLoaded: Bool = false
    private let uiStateStore = UIStateStore()

    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.lg) {
            Text("Create Kubernetes Cluster")
                .font(DesignSystem.Typography.title2)

            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)

            Toggle("Use VM (recommended)", isOn: $useVM)
                .toggleStyle(.switch)

            HStack(spacing: DesignSystem.Spacing.md) {
                Stepper("CPU: \(cpu)", value: $cpu, in: 1 ... 16)
                Stepper("RAM: \(memory)GB", value: $memory, in: 1 ... 64)
            }

            Spacer()

            HStack {
                Button("Cancel") { dismiss() }
                    .buttonStyle(.glass)

                Spacer()

                Button("Create") {
                    Task {
                        await viewModel.createCluster(name: name, cpu: cpu, memory: memory, useVM: useVM)
                        dismiss()
                    }
                }
                .buttonStyle(.glassProminent)
                .disabled(name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
        }
        .padding(DesignSystem.Spacing.xl)
        .frame(width: 520)
        .task {
            guard !defaultsLoaded else { return }
            let defaults = uiStateStore.get()
            cpu = defaults.defaultKubernetesCPUCount
            memory = defaults.defaultKubernetesMemoryGB
            defaultsLoaded = true
        }
    }
}

struct KubernetesKubeconfigSheet: View {
    let kubeconfig: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.lg) {
            Text("Kubeconfig")
                .font(DesignSystem.Typography.title2)

            TextEditor(text: .constant(kubeconfig))
                .font(DesignSystem.Typography.codeSmall)
                .frame(minHeight: 240)

            HStack {
                Button("Close") { dismiss() }
                    .buttonStyle(.glass)

                Spacer()

                Button("Copy") {
                    NSPasteboard.general.clearContents()
                    NSPasteboard.general.setString(kubeconfig, forType: .string)
                }
                .buttonStyle(.glassProminent)
            }
        }
        .padding(DesignSystem.Spacing.xl)
        .frame(width: 640, height: 420)
    }
}
