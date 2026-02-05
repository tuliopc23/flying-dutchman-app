import Dependencies
import DesignSystem
import FlyingDutchmanPersistence
import Shared
import SwiftUI

public struct SettingsView: View {
    @State private var state: UIState = UIState()
    private let store = UIStateStore()
    @Dependency(\.terminalLauncher) private var terminalLauncher

    public init() {}

    public var body: some View {
        Form {
            Section("Engine") {
                TextField("Host", text: Binding(
                    get: { state.engineHost },
                    set: { newValue in
                        state.engineHost = newValue
                        persist()
                    }
                ))

                Stepper(value: Binding(
                    get: { state.enginePort },
                    set: { newValue in
                        state.enginePort = newValue
                        persist()
                    }
                ), in: 1 ... 65535) {
                    Text("Port: \(state.enginePort)")
                }
            }

            Section("UI") {
                Toggle("Default: Follow logs", isOn: Binding(
                    get: { state.defaultFollowLogs },
                    set: { newValue in
                        state.defaultFollowLogs = newValue
                        persist()
                    }
                ))

                Stepper(value: Binding(
                    get: { Int(state.logsPollIntervalSeconds) },
                    set: { newValue in
                        state.logsPollIntervalSeconds = Double(newValue)
                        persist()
                    }
                ), in: 1 ... 60) {
                    Text("Logs poll: \(Int(state.logsPollIntervalSeconds))s")
                }

                Stepper(value: Binding(
                    get: { Int(state.eventsPollIntervalSeconds) },
                    set: { newValue in
                        state.eventsPollIntervalSeconds = Double(newValue)
                        persist()
                    }
                ), in: 1 ... 60) {
                    Text("Events poll: \(Int(state.eventsPollIntervalSeconds))s")
                }

                Stepper(value: Binding(
                    get: { state.eventsLimit },
                    set: { newValue in
                        state.eventsLimit = newValue
                        persist()
                    }
                ), in: 10 ... 500, step: 10) {
                    Text("Events limit: \(state.eventsLimit)")
                }
            }

            Section("Startup") {
                Toggle("Start engine on app launch", isOn: Binding(
                    get: { state.startEngineOnLaunch },
                    set: { newValue in
                        state.startEngineOnLaunch = newValue
                        persist()
                    }
                ))

                Toggle("Launch at login (requires manual setup)", isOn: Binding(
                    get: { state.launchAtLogin },
                    set: { newValue in
                        state.launchAtLogin = newValue
                        persist()
                    }
                ))
            }

            Section("Defaults") {
                VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                    Text("Machines")
                        .font(DesignSystem.Typography.caption1)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)

                    Stepper(value: Binding(
                        get: { state.defaultMachineCPUCount },
                        set: { newValue in
                            state.defaultMachineCPUCount = newValue
                            persist()
                        }
                    ), in: 1 ... 16) {
                        Text("CPU: \(state.defaultMachineCPUCount)")
                    }

                    Stepper(value: Binding(
                        get: { state.defaultMachineMemoryGB },
                        set: { newValue in
                            state.defaultMachineMemoryGB = newValue
                            persist()
                        }
                    ), in: 1 ... 64) {
                        Text("RAM: \(state.defaultMachineMemoryGB)GB")
                    }

                    Stepper(value: Binding(
                        get: { state.defaultMachineDiskGB },
                        set: { newValue in
                            state.defaultMachineDiskGB = newValue
                            persist()
                        }
                    ), in: 10 ... 200) {
                        Text("Disk: \(state.defaultMachineDiskGB)GB")
                    }
                }

                Divider()

                VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                    Text("Kubernetes")
                        .font(DesignSystem.Typography.caption1)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)

                    Stepper(value: Binding(
                        get: { state.defaultKubernetesCPUCount },
                        set: { newValue in
                            state.defaultKubernetesCPUCount = newValue
                            persist()
                        }
                    ), in: 1 ... 16) {
                        Text("CPU: \(state.defaultKubernetesCPUCount)")
                    }

                    Stepper(value: Binding(
                        get: { state.defaultKubernetesMemoryGB },
                        set: { newValue in
                            state.defaultKubernetesMemoryGB = newValue
                            persist()
                        }
                    ), in: 1 ... 64) {
                        Text("RAM: \(state.defaultKubernetesMemoryGB)GB")
                    }
                }
            }

            Section("Networking") {
                Text("""
                Install the resolver and trust the local CA to enable HTTPS for \
                \(AppConfig.Networking.primaryDomainSuffix).
                """)
                .font(DesignSystem.Typography.caption1)
                .foregroundStyle(DesignSystem.Colors.textSecondary)

                HStack {
                    Button("Install Resolver") {
                        Task {
                            try? await terminalLauncher.openTerminal("sudo fd networking install-resolver")
                        }
                    }
                    .buttonStyle(.glass)

                    Button("Trust Local CA") {
                        Task {
                            try? await terminalLauncher.openTerminal("sudo fd trust-ca")
                        }
                    }
                    .buttonStyle(.glass)
                }
            }
        }
        .padding(DesignSystem.Inset.lg)
        .frame(width: 420)
        .background(DesignSystem.Colors.background)
        .task {
            state = store.get()
        }
    }

    private func persist() {
        state.lastUpdated = Date()
        let currentState = state
        Task {
            try? await store.save(currentState)
        }
    }
}
