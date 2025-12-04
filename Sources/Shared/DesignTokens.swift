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
}
