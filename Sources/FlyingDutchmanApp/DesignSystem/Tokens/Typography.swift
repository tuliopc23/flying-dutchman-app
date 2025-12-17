// Typography.swift
// Flying Dutchman Design System - Typography Tokens
// SF Pro Display (headings), SF Pro Text (body), SF Mono (code)

import SwiftUI

extension DesignSystem {
    /// Typography scale using SF Pro family with Dynamic Type support
    public enum Typography {
        // MARK: - SF Pro Display (Headings & Titles)
        
        /// Large title - 36pt Bold (SF Pro Display)
        /// Use for hero headings, primary page titles
        public static let largeTitle = Font.system(size: 36, weight: .bold, design: .default)
        
        /// Title 1 - 28pt Bold (SF Pro Display)
        /// Use for main section headers
        public static let title1 = Font.system(size: 28, weight: .bold, design: .default)
        
        /// Title 2 - 22pt Semibold (SF Pro Display)
        /// Use for subsection headers
        public static let title2 = Font.system(size: 22, weight: .semibold, design: .default)
        
        /// Title 3 - 18pt Semibold (SF Pro Display)
        /// Use for card titles, small section headers
        public static let title3 = Font.system(size: 18, weight: .semibold, design: .default)
        
        // MARK: - SF Pro Text (Body & UI)
        
        /// Headline - 15pt Semibold (SF Pro Text)
        /// Use for emphasized list items, labels
        public static let headline = Font.system(size: 15, weight: .semibold, design: .default)
        
        /// Body - 15pt Regular (SF Pro Text)
        /// Default body text, primary content
        public static let body = Font.system(size: 15, weight: .regular, design: .default)
        
        /// Callout - 14pt Regular (SF Pro Text)
        /// Secondary content, descriptions
        public static let callout = Font.system(size: 14, weight: .regular, design: .default)
        
        /// Subheadline - 13pt Regular (SF Pro Text)
        /// Supporting text, metadata
        public static let subheadline = Font.system(size: 13, weight: .regular, design: .default)
        
        /// Footnote - 12pt Regular (SF Pro Text)
        /// Fine print, captions
        public static let footnote = Font.system(size: 12, weight: .regular, design: .default)
        
        /// Caption 1 - 11pt Regular (SF Pro Text)
        /// Small labels, timestamps
        public static let caption1 = Font.system(size: 11, weight: .regular, design: .default)
        
        /// Caption 2 - 10pt Regular (SF Pro Text)
        /// Tiny labels, legal text
        public static let caption2 = Font.system(size: 10, weight: .regular, design: .default)
        
        // MARK: - SF Mono (Code & Monospaced)
        
        /// Code - 13pt Regular (SF Mono)
        /// Inline code, terminal output
        public static let code = Font.system(size: 13, weight: .regular, design: .monospaced)
        
        /// Code Bold - 13pt Bold (SF Mono)
        /// Emphasized code, command names
        public static let codeBold = Font.system(size: 13, weight: .bold, design: .monospaced)
        
        /// Code Small - 11pt Regular (SF Mono)
        /// Compact code blocks, logs
        public static let codeSmall = Font.system(size: 11, weight: .regular, design: .monospaced)
        
        // MARK: - Dynamic Type Variants (Accessibility)
        
        /// Body with Dynamic Type support
        /// Scales automatically with system text size preferences
        public static let bodyDynamic = Font.body
        
        /// Headline with Dynamic Type support
        public static let headlineDynamic = Font.headline
        
        /// Title with Dynamic Type support
        public static let titleDynamic = Font.title
        
        /// Caption with Dynamic Type support
        public static let captionDynamic = Font.caption
        
        // MARK: - UI Control Fonts (Medium Weight)
        
        /// Button text - 13pt Medium (SF Pro Text)
        public static let button = Font.system(size: 13, weight: .medium, design: .default)
        
        /// Large button text - 15pt Semibold (SF Pro Text)
        public static let buttonLarge = Font.system(size: 15, weight: .semibold, design: .default)
        
        /// Toolbar item text - 13pt Medium (SF Pro Text)
        public static let toolbarItem = Font.system(size: 13, weight: .medium, design: .default)
        
        /// Tab label - 13pt Medium (SF Pro Text)
        public static let tabLabel = Font.system(size: 13, weight: .medium, design: .default)
    }
    
    /// Line height multipliers for text layout
    public enum LineHeight {
        /// Tight line height (1.2x) for headings
        public static let tight: CGFloat = 1.2
        
        /// Regular line height (1.5x) for body text
        public static let regular: CGFloat = 1.5
        
        /// Relaxed line height (1.75x) for long-form content
        public static let relaxed: CGFloat = 1.75
    }
    
    /// Letter spacing adjustments
    public enum LetterSpacing {
        /// Tight tracking for large headings
        public static let tight: CGFloat = -0.5
        
        /// Default tracking
        public static let normal: CGFloat = 0
        
        /// Wide tracking for all-caps labels
        public static let wide: CGFloat = 1.2
    }
}

// MARK: - SwiftUI Text Extensions

extension Text {
    /// Apply design system typography with semantic naming
    public func font(_ typography: Font) -> Text {
        self.font(typography)
    }
    
    /// Apply line height multiplier
    /// - Parameter multiplier: LineHeight token from DesignSystem.LineHeight
    public func lineHeight(_ multiplier: CGFloat) -> Text {
        self.lineSpacing(multiplier)
    }
    
    /// Apply letter spacing (tracking)
    /// - Parameter spacing: LetterSpacing token from DesignSystem.LetterSpacing
    public func letterSpacing(_ spacing: CGFloat) -> Text {
        self.tracking(spacing)
    }
}

// MARK: - Usage Examples

/*
 // Heading hierarchy
 VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
     Text("Main Title")
         .font(DesignSystem.Typography.title1)
         .foregroundStyle(DesignSystem.Colors.textPrimary)
     
     Text("Section Header")
         .font(DesignSystem.Typography.title3)
         .foregroundStyle(DesignSystem.Colors.textSecondary)
     
     Text("Body content with proper line height for readability.")
         .font(DesignSystem.Typography.body)
         .lineHeight(DesignSystem.LineHeight.regular)
 }
 
 // Code/monospaced text
 Text("docker ps -a")
     .font(DesignSystem.Typography.code)
     .foregroundStyle(DesignSystem.Colors.textPrimary)
     .padding(DesignSystem.Inset.sm)
     .background(DesignSystem.Colors.surfaceSecondary)
     .cornerRadius(DesignSystem.CornerRadius.regular)
 
 // Button with proper font
 Button("Primary Action") { }
     .font(DesignSystem.Typography.button)
 
 // Dynamic Type for accessibility
 Text("Scales with system preferences")
     .font(DesignSystem.Typography.bodyDynamic)
 
 // All-caps label with wide tracking
 Text("STATUS")
     .font(DesignSystem.Typography.caption1)
     .textCase(.uppercase)
     .letterSpacing(DesignSystem.LetterSpacing.wide)
 */
