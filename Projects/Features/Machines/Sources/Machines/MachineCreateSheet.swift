import Dependencies
import DesignSystem
import FlyingDutchmanPersistence
import Shared
import SwiftUI
import UIComponents

struct MachineCreateSheet: View {
    @Bindable var viewModel: MachineListViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var name: String = ""
    @State private var distro: MachineDistro = .ubuntu
    @State private var version: String = MachineDistro.ubuntu.defaultVersions.first ?? "24.04"
    @State private var cpuCount: Int = 2
    @State private var memoryGB: Int = 2
    @State private var diskGB: Int = 20
    @State private var defaultsLoaded: Bool = false
    private let uiStateStore = UIStateStore()

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
        .task {
            guard !defaultsLoaded else { return }
            let defaults = uiStateStore.get()
            cpuCount = defaults.defaultMachineCPUCount
            memoryGB = defaults.defaultMachineMemoryGB
            diskGB = defaults.defaultMachineDiskGB
            defaultsLoaded = true
        }
    }
}
