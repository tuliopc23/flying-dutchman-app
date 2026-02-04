// Spacing.swift
// Flying Dutchman Design System - Spacing & Size Tokens

import SwiftUI

extension DesignSystem {
    /// Spacing scale for consistent layout
    public enum Spacing {
        public static let xxs: CGFloat = 2
        public static let xs: CGFloat = 4
        public static let sm: CGFloat = 8
        public static let md: CGFloat = 12
        public static let lg: CGFloat = 16
        public static let xl: CGFloat = 24
        public static let xxl: CGFloat = 32
        public static let xxxl: CGFloat = 48
    }
    
    /// Size tokens for consistent component dimensions
    public enum Size {
        public static let buttonCompact: CGFloat = 28
        public static let buttonRegular: CGFloat = 36
        public static let buttonLarge: CGFloat = 44
        public static let buttonXLarge: CGFloat = 52
        public static let iconSmall: CGFloat = 12
        public static let iconRegular: CGFloat = 16
        public static let iconLarge: CGFloat = 20
        public static let iconXLarge: CGFloat = 24
        public static let iconHuge: CGFloat = 32
        public static let sidebarMinWidth: CGFloat = 200
        public static let sidebarDefaultWidth: CGFloat = 240
        public static let sidebarMaxWidth: CGFloat = 320
        public static let toolbarHeight: CGFloat = 52
        public static let rowHeightRegular: CGFloat = 44
        public static let rowHeightCompact: CGFloat = 32
        public static let cardMaxWidth: CGFloat = 600
        public static let inputHeight: CGFloat = 28
        public static let inputHeightLarge: CGFloat = 36
    }
    
    /// Inset tokens for padding variants (using SwiftUI.EdgeInsets)
    public enum Inset {
        /// Extra small inset - 4pt
        public static let xs = EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        
        /// Small inset - 8pt
        public static let sm = EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        
        /// Medium inset - 12pt
        public static let md = EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)
        
        /// Large inset - 16pt
        public static let lg = EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
        
        /// Extra large inset - 24pt
        public static let xl = EdgeInsets(top: 24, leading: 24, bottom: 24, trailing: 24)
        
        /// Card inset (asymmetric - more vertical space)
        public static let card = EdgeInsets(top: 20, leading: 16, bottom: 20, trailing: 16)
        
        /// List item inset (horizontal emphasis)
        public static let listItem = EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12)
    }
}



// MARK: - Usage Examples

/*
 // Apply consistent spacing
 VStack(spacing: DesignSystem.Spacing.md) {
     Text("Item 1")
     Text("Item 2")
 }
 .padding(DesignSystem.Spacing.lg)
 
 // Use size tokens for fixed dimensions
 Button("Action") { }
     .frame(height: DesignSystem.Size.buttonRegular)
 
 // Apply semantic insets
 VStack {
     // content
 }
 .padding(DesignSystem.Inset.card)
 
 // Sidebar configuration
 NavigationSplitView {
     // sidebar
 }
 .navigationSplitViewColumnWidth(
     min: DesignSystem.Size.sidebarMinWidth,
     ideal: DesignSystem.Size.sidebarDefaultWidth,
     max: DesignSystem.Size.sidebarMaxWidth
 )
 */
