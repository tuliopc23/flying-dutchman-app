import SwiftUI

struct CommandAction: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let subtitle: String?
    let icon: String
    let perform: () async -> Void
}

@Observable
final class CommandRegistry {
    var actions: [CommandAction] = []
    var query: String = ""

    func filtered() -> [CommandAction] {
        let q = query.lowercased()
        guard !q.isEmpty else { return actions }
        return actions.filter { $0.title.lowercased().contains(q) || ($0.subtitle?.lowercased().contains(q) ?? false) }
    }
}

struct CommandPaletteView: View {
    @Bindable var registry: CommandRegistry

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            TextField("Search commands", text: $registry.query)
                .textFieldStyle(.roundedBorder)
            if registry.filtered().isEmpty {
                Text("No commands").foregroundStyle(.secondary)
            } else {
                List(registry.filtered()) { action in
                    HStack {
                        Image(systemName: action.icon)
                        VStack(alignment: .leading, spacing: 2) {
                            Text(action.title)
                            if let subtitle = action.subtitle {
                                Text(subtitle).font(.caption).foregroundStyle(.secondary)
                            }
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        Task { await action.perform() }
                    }
                }
                .listStyle(.plain)
                .frame(maxHeight: 320)
            }
        }
        .padding(16)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .shadow(radius: 16)
        .padding()
    }
}
