import SwiftUI

public enum DesignTokens {
    public static let glassShape = RoundedRectangle(cornerRadius: 16, style: .continuous)

    public static func statusSymbol(for status: String) -> String {
        switch status.lowercased() {
        case "running", "ok": return "bolt.circle.fill"
        case "stopped": return "pause.circle.fill"
        default: return "exclamationmark.triangle.fill"
        }
    }

    public static func statusColor(for status: String) -> Color {
        switch status.lowercased() {
        case "running", "ok": return .green
        case "stopped": return .gray
        default: return .orange
        }
    }

    public static func glassBackground(for colorScheme: ColorScheme) -> some ShapeStyle {
        colorScheme == .dark ? .ultraThinMaterial : .thinMaterial
    }

    public static func glassFieldBackground(for colorScheme: ColorScheme) -> some ShapeStyle {
        colorScheme == .dark ? .thinMaterial : .ultraThinMaterial
    }

    public static func glassStroke(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark ? .white.opacity(0.15) : .black.opacity(0.08)
    }

    public static func containerStatusSymbol(for status: ContainerSummary.Status) -> String {
        switch status {
        case .running: return "play.circle.fill"
        case .stopped: return "stop.circle.fill"
        case .paused: return "pause.circle.fill"
        }
    }

    public static func containerStatusColor(for status: ContainerSummary.Status) -> Color {
        switch status {
        case .running: return .green
        case .stopped: return .gray
        case .paused: return .orange
        }
    }
}
