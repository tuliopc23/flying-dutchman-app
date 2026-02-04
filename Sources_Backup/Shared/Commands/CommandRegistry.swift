import Foundation
import Observation

public struct CommandAction: Identifiable, Hashable {
    public let id: UUID
    public let title: String
    public let subtitle: String?
    public let icon: String
    public let perform: () async -> Void

    public init(
        id: UUID = UUID(),
        title: String,
        subtitle: String? = nil,
        icon: String,
        perform: @escaping () async -> Void
    ) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.perform = perform
    }

    public static func == (lhs: CommandAction, rhs: CommandAction) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

@Observable
public final class CommandRegistry {
    public var actions: [CommandAction]
    public var query: String

    public init(actions: [CommandAction] = [], query: String = "") {
        self.actions = actions
        self.query = query
    }

    public func filtered() -> [CommandAction] {
        let trimmed = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return actions }
        let needle = trimmed.lowercased()
        let matches = actions.compactMap { action -> (CommandAction, Int)? in
            let haystack = "\(action.title) \(action.subtitle ?? "")".lowercased()
            guard let score = Fuzzy.matchScore(query: needle, in: haystack) else { return nil }
            return (action, score)
        }
        return matches
            .sorted { lhs, rhs in
                if lhs.1 == rhs.1 {
                    lhs.0.title < rhs.0.title
                } else {
                    lhs.1 < rhs.1
                }
            }
            .map { $0.0 }
    }

    enum Fuzzy {
        static func matchScore(query: String, in text: String) -> Int? {
            var score = 0
            var searchStart = text.startIndex
            for character in query {
                guard let idx = text[searchStart...].firstIndex(of: character) else {
                    return nil
                }
                score += text.distance(from: searchStart, to: idx)
                searchStart = text.index(after: idx)
            }
            return score
        }
    }
}
