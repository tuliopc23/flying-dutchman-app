// DesignTokens+Status.swift
import SwiftUI
import Shared

extension DesignTokens {
    static func containerStatusSymbol(for status: ContainerSummary.Status) -> String {
        switch status {
        case .running: return "play.circle.fill"
        case .stopped, .created, .removed: return "stop.circle.fill"
        case .starting, .stopping, .removing: return "arrow.triangle.2.circlepath.circle.fill"
        }
    }
    
    static func containerStatusColor(for status: ContainerSummary.Status) -> Color {
        switch status {
        case .running: return DesignSystem.Colors.success
        case .stopped, .created, .removed: return DesignSystem.Colors.textTertiary
        case .starting, .stopping, .removing: return DesignSystem.Colors.warning
        }
    }
}
