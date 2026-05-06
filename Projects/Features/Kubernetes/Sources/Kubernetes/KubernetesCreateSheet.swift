import DesignSystem
import FlyingDutchmanPersistence
import Shared
import SwiftUI
import UIComponents

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
                        await viewModel.createCluster(
                            name: name,
                            cpu: cpu,
                            memory: memory,
                            useVM: useVM
                        )
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
