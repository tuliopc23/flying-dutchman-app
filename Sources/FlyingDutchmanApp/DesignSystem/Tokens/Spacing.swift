// Spacing.swift
// Flying Dutchman Design System - Spacing & Size Tokens

import Foundation

extension DesignSystem {
    /// Spacing scale for consistent layout
    /// Based on 4pt base unit with exponential growth
    public enum Spacing {
        /// 2pt - Minimal spacing for tight layouts
        public static let xxs: CGFloat = 2
        
        /// 4pt - Extra small spacing
        public static let xs: CGFloat = 4
        
        /// 8pt - Small spacing (base unit)
        public static let sm: CGFloat = 8
        
        /// 12pt - Medium spacing (default for most layouts)
        public static let md: CGFloat = 12
        
        /// 16pt - Large spacing
        public static let lg: CGFloat = 16
        
        /// 24pt - Extra large spacing
        public static let xl: CGFloat = 24
        
        /// 32pt - Extra extra large spacing
        public static let xxl: CGFloat = 32
        
        /// 48pt - Maximum spacing for major sections
        public static let xxxl: CGFloat = 48
    }
    
    /// Size tokens for consistent component dimensions
    public enum Size {
        // MARK: - Button Heights (Tahoe-aligned)
        
        /// Compact button height - 28pt (for inspectors, dense layouts)
        public static let buttonCompact: CGFloat = 28
        
        /// Regular button height - 36pt (default macOS control size)
        public static let buttonRegular: CGFloat = 36
        
        /// Large button height - 44pt (prominent actions)
        public static let buttonLarge: CGFloat = 44
        
        /// Extra large button height - 52pt (hero CTAs)
        public static let buttonXLarge: CGFloat = 52
        
        // MARK: - Icon Sizes
        
        /// Small icon - 12pt (inline with text)
        public static let iconSmall: CGFloat = 12
        
        /// Regular icon - 16pt (standard toolbar/UI)
        public static let iconRegular: CGFloat = 16
        
        /// Large icon - 20pt (emphasis)
        public static let iconLarge: CGFloat = 20
        
        /// Extra large icon - 24pt (headers, hero elements)
        public static let iconXLarge: CGFloat = 24
        
        /// Huge icon - 32pt (app icons in lists)
        public static let iconHuge: CGFloat = 32
        
        // MARK: - Container Dimensions
        
        /// Sidebar minimum width
        public static let sidebarMinWidth: CGFloat = 200
        
        /// Sidebar default width
        public static let sidebarDefaultWidth: CGFloat = 240
        
        /// Sidebar maximum width
        public static let sidebarMaxWidth: CGFloat = 320
        
        /// Toolbar height (native macOS)
        public static let toolbarHeight: CGFloat = 52
        
        /// Row height for list items (regular)
        public static let rowHeightRegular: CGFloat = 44
        
        /// Row height for list items (compact)
        public static let rowHeightCompact: CGFloat = 32
        
        /// Card maximum width (for centered layouts)
        public static let cardMaxWidth: CGFloat = 600
        
        /// Input field height (regular)
        public static let inputHeight: CGFloat = 28
        
        /// Input field height (large)
        public static let inputHeightLarge: CGFloat = 36
    }
    
    /// Inset tokens for padding variants
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

// MARK: - SwiftUI View Extensions

import SwiftUI

extension View {
    /// Apply design system spacing as padding
    /// - Parameter spacing: Spacing token from DesignSystem.Spacing
    public func padding(_ spacing: CGFloat) -> some View {
        self.padding(spacing)
    }
    
    /// Apply design system insets as padding
    /// - Parameter inset: EdgeInsets token from DesignSystem.Inset
    public func padding(_ inset: EdgeInsets) -> some View {
        self.padding(inset)
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
