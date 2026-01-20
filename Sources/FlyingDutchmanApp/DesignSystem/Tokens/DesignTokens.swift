// DesignTokens.swift
// Flying Dutchman Design System - Unified Token Access

import SwiftUI
import Shared

/// Unified access to design tokens for glass UI components
public enum DesignTokens {
    /// Background color for glass-styled text fields and code areas
    public static func glassFieldBackground(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark
            ? Color.white.opacity(0.05)
            : Color.black.opacity(0.03)
    }
    
    /// Standard rounded rectangle shape for glass components
    public static var glassShape: RoundedRectangle {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
    }
    
    /// Symbol name for container status
    public static func containerStatusSymbol(for status: ContainerSummary.Status) -> String {
        switch status {
        case .running: return "checkmark.circle.fill"
        case .stopped: return "xmark.circle.fill"
        case .created, .starting, .stopping: return "exclamationmark.triangle.fill"
        case .removing, .removed: return "xmark.octagon.fill"
        }
    }
    
    /// Color for container status
    public static func containerStatusColor(for status: ContainerSummary.Status) -> Color {
        switch status {
        case .running: return DesignSystem.Colors.success
        case .stopped: return DesignSystem.Colors.textTertiary
        case .created, .starting, .stopping: return DesignSystem.Colors.warning
        case .removing, .removed: return DesignSystem.Colors.error
        }
    }
}
