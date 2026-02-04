import DesignSystem
import FlyingDutchmanPersistence
import Shared
import SwiftUI

public struct SettingsView: View {
    @State private var state: UIState = UIState()
    private let store = UIStateStore()

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
                ), in: 1...65_535) {
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
                ), in: 1...60) {
                    Text("Logs poll: \(Int(state.logsPollIntervalSeconds))s")
                }

                Stepper(value: Binding(
                    get: { Int(state.eventsPollIntervalSeconds) },
                    set: { newValue in
                        state.eventsPollIntervalSeconds = Double(newValue)
                        persist()
                    }
                ), in: 1...60) {
                    Text("Events poll: \(Int(state.eventsPollIntervalSeconds))s")
                }

                Stepper(value: Binding(
                    get: { state.eventsLimit },
                    set: { newValue in
                        state.eventsLimit = newValue
                        persist()
                    }
                ), in: 10...500, step: 10) {
                    Text("Events limit: \(state.eventsLimit)")
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
