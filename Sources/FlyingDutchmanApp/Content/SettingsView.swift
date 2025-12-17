import Shared
import SwiftData
import SwiftUI

struct SettingsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var states: [UIState]

    private var state: UIState? { states.first }

    var body: some View {
        Form {
            Section("Engine") {
                TextField("Host", text: Binding(
                    get: { state?.engineHost ?? AppConfig.Engine.host },
                    set: { newValue in
                        ensureState().engineHost = newValue
                        persist()
                    }
                ))

                Stepper(value: Binding(
                    get: { state?.enginePort ?? AppConfig.Engine.port },
                    set: { newValue in
                        ensureState().enginePort = newValue
                        persist()
                    }
                ), in: 1...65_535) {
                    Text("Port: \(state?.enginePort ?? AppConfig.Engine.port)")
                }
            }

            Section("UI") {
                Toggle("Default: Follow logs", isOn: Binding(
                    get: { state?.defaultFollowLogs ?? false },
                    set: { newValue in
                        ensureState().defaultFollowLogs = newValue
                        persist()
                    }
                ))

                Stepper(value: Binding(
                    get: { Int(state?.logsPollIntervalSeconds ?? 5) },
                    set: { newValue in
                        ensureState().logsPollIntervalSeconds = Double(newValue)
                        persist()
                    }
                ), in: 1...60) {
                    Text("Logs poll: \(Int(state?.logsPollIntervalSeconds ?? 5))s")
                }

                Stepper(value: Binding(
                    get: { Int(state?.eventsPollIntervalSeconds ?? 5) },
                    set: { newValue in
                        ensureState().eventsPollIntervalSeconds = Double(newValue)
                        persist()
                    }
                ), in: 1...60) {
                    Text("Events poll: \(Int(state?.eventsPollIntervalSeconds ?? 5))s")
                }

                Stepper(value: Binding(
                    get: { state?.eventsLimit ?? 50 },
                    set: { newValue in
                        ensureState().eventsLimit = newValue
                        persist()
                    }
                ), in: 10...500, step: 10) {
                    Text("Events limit: \(state?.eventsLimit ?? 50)")
                }
            }
        }
        .padding(DesignSystem.Inset.lg)
        .frame(width: 420)
        .background(DesignSystem.Colors.background)
    }

    private func ensureState() -> UIState {
        if let existing = state {
            return existing
        }
        let created = UIState()
        modelContext.insert(created)
        try? modelContext.save()
        return created
    }

    private func persist() {
        state?.lastUpdated = Date()
        try? modelContext.save()
    }
}
