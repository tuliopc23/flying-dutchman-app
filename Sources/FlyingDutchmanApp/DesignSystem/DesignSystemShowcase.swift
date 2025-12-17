// DesignSystemShowcase.swift
// Flying Dutchman Design System - Visual Token Gallery
// SwiftUI Previews for all design tokens

import SwiftUI

/// Design system showcase displaying all tokens visually
/// Open in Xcode Canvas to preview colors, typography, spacing, etc.
struct DesignSystemShowcase: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xl) {
                // Header
                VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                    Text("Flying Dutchman Design System")
                        .font(DesignSystem.Typography.largeTitle)
                        .foregroundStyle(DesignSystem.Colors.textPrimary)
                    
                    Text("Netherlands Football Team Palette • macOS Tahoe Liquid Glass")
                        .font(DesignSystem.Typography.callout)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                }
                .padding(DesignSystem.Inset.xl)
                
                Divider()
                
                // Colors
                ColorShowcase()
                Divider()
                
                // Typography
                TypographyShowcase()
                Divider()
                
                // Spacing
                SpacingShowcase()
                Divider()
                
                // Corner Radius & Shapes
                ShapesShowcase()
                Divider()
                
                // Shadows
                ShadowsShowcase()
                Divider()
                
                // Liquid Glass
                GlassShowcase()
                Divider()
                
                // SF Symbols
                SymbolsShowcase()
            }
        }
        .background(DesignSystem.Colors.background)
    }
}

// MARK: - Color Showcase

struct ColorShowcase: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
            Text("Colors")
                .font(DesignSystem.Typography.title1)
                .foregroundStyle(DesignSystem.Colors.textPrimary)
            
            // Brand Colors
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                Text("Brand Colors (Netherlands Palette)")
                    .font(DesignSystem.Typography.headline)
                
                HStack(spacing: DesignSystem.Spacing.md) {
                    ColorSwatch(name: "Accent Orange", color: DesignSystem.Colors.accent)
                    ColorSwatch(name: "Primary Blue", color: DesignSystem.Colors.primary)
                    ColorSwatch(name: "Brand White", color: DesignSystem.Colors.brandWhite)
                }
            }
            
            // Surface Colors
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                Text("Surface Colors")
                    .font(DesignSystem.Typography.headline)
                
                HStack(spacing: DesignSystem.Spacing.md) {
                    ColorSwatch(name: "Primary", color: DesignSystem.Colors.surfacePrimary)
                    ColorSwatch(name: "Secondary", color: DesignSystem.Colors.surfaceSecondary)
                    ColorSwatch(name: "Tertiary", color: DesignSystem.Colors.surfaceTertiary)
                }
            }
            
            // Text Colors
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                Text("Text Colors")
                    .font(DesignSystem.Typography.headline)
                
                HStack(spacing: DesignSystem.Spacing.md) {
                    ColorSwatch(name: "Primary", color: DesignSystem.Colors.textPrimary)
                    ColorSwatch(name: "Secondary", color: DesignSystem.Colors.textSecondary)
                    ColorSwatch(name: "Tertiary", color: DesignSystem.Colors.textTertiary)
                }
            }
            
            // State Colors
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                Text("State Colors")
                    .font(DesignSystem.Typography.headline)
                
                HStack(spacing: DesignSystem.Spacing.md) {
                    ColorSwatch(name: "Success", color: DesignSystem.Colors.success)
                    ColorSwatch(name: "Warning", color: DesignSystem.Colors.warning)
                    ColorSwatch(name: "Error", color: DesignSystem.Colors.error)
                    ColorSwatch(name: "Info", color: DesignSystem.Colors.info)
                }
            }
        }
        .padding(DesignSystem.Inset.xl)
    }
}

struct ColorSwatch: View {
    let name: String
    let color: Color
    
    var body: some View {
        VStack(spacing: DesignSystem.Spacing.xs) {
            RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.regular)
                .fill(color)
                .frame(width: 80, height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.regular)
                        .stroke(DesignSystem.Colors.separator, lineWidth: 1)
                )
            
            Text(name)
                .font(DesignSystem.Typography.caption1)
                .foregroundStyle(DesignSystem.Colors.textSecondary)
        }
    }
}

// MARK: - Typography Showcase

struct TypographyShowcase: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
            Text("Typography")
                .font(DesignSystem.Typography.title1)
                .foregroundStyle(DesignSystem.Colors.textPrimary)
            
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                TypeSample(name: "Large Title", font: DesignSystem.Typography.largeTitle, text: "The quick brown fox")
                TypeSample(name: "Title 1", font: DesignSystem.Typography.title1, text: "The quick brown fox")
                TypeSample(name: "Title 2", font: DesignSystem.Typography.title2, text: "The quick brown fox")
                TypeSample(name: "Title 3", font: DesignSystem.Typography.title3, text: "The quick brown fox")
                TypeSample(name: "Headline", font: DesignSystem.Typography.headline, text: "The quick brown fox")
                TypeSample(name: "Body", font: DesignSystem.Typography.body, text: "The quick brown fox jumps over the lazy dog")
                TypeSample(name: "Callout", font: DesignSystem.Typography.callout, text: "The quick brown fox jumps over the lazy dog")
                TypeSample(name: "Subheadline", font: DesignSystem.Typography.subheadline, text: "The quick brown fox jumps over")
                TypeSample(name: "Code (SF Mono)", font: DesignSystem.Typography.code, text: "docker ps -a --format json")
            }
        }
        .padding(DesignSystem.Inset.xl)
    }
}

struct TypeSample: View {
    let name: String
    let font: Font
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(name)
                .font(DesignSystem.Typography.caption1)
                .foregroundStyle(DesignSystem.Colors.textTertiary)
            
            Text(text)
                .font(font)
                .foregroundStyle(DesignSystem.Colors.textPrimary)
        }
    }
}

// MARK: - Spacing Showcase

struct SpacingShowcase: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
            Text("Spacing")
                .font(DesignSystem.Typography.title1)
                .foregroundStyle(DesignSystem.Colors.textPrimary)
            
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                SpacingSample(name: "XXS", value: DesignSystem.Spacing.xxs)
                SpacingSample(name: "XS", value: DesignSystem.Spacing.xs)
                SpacingSample(name: "SM", value: DesignSystem.Spacing.sm)
                SpacingSample(name: "MD", value: DesignSystem.Spacing.md)
                SpacingSample(name: "LG", value: DesignSystem.Spacing.lg)
                SpacingSample(name: "XL", value: DesignSystem.Spacing.xl)
                SpacingSample(name: "XXL", value: DesignSystem.Spacing.xxl)
                SpacingSample(name: "XXXL", value: DesignSystem.Spacing.xxxl)
            }
        }
        .padding(DesignSystem.Inset.xl)
    }
}

struct SpacingSample: View {
    let name: String
    let value: CGFloat
    
    var body: some View {
        HStack(spacing: DesignSystem.Spacing.md) {
            Text("\(name) (\(Int(value))pt)")
                .font(DesignSystem.Typography.subheadline)
                .foregroundStyle(DesignSystem.Colors.textSecondary)
                .frame(width: 100, alignment: .leading)
            
            Rectangle()
                .fill(DesignSystem.Colors.accent)
                .frame(width: value, height: 20)
        }
    }
}

// MARK: - Shapes Showcase

struct ShapesShowcase: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
            Text("Corner Radius & Shapes")
                .font(DesignSystem.Typography.title1)
                .foregroundStyle(DesignSystem.Colors.textPrimary)
            
            HStack(spacing: DesignSystem.Spacing.lg) {
                ShapeSample(name: "Tight (4pt)", radius: DesignSystem.CornerRadius.tight)
                ShapeSample(name: "Regular (8pt)", radius: DesignSystem.CornerRadius.regular)
                ShapeSample(name: "Comfortable (12pt)", radius: DesignSystem.CornerRadius.comfortable)
                ShapeSample(name: "Spacious (16pt)", radius: DesignSystem.CornerRadius.spacious)
            }
            
            HStack(spacing: DesignSystem.Spacing.lg) {
                VStack {
                    Capsule()
                        .fill(DesignSystem.Colors.accent)
                        .frame(width: 100, height: 40)
                    Text("Capsule (Button)")
                        .font(DesignSystem.Typography.caption1)
                }
                
                VStack {
                    Circle()
                        .fill(DesignSystem.Colors.primary)
                        .frame(width: 60, height: 60)
                    Text("Circle")
                        .font(DesignSystem.Typography.caption1)
                }
            }
        }
        .padding(DesignSystem.Inset.xl)
    }
}

struct ShapeSample: View {
    let name: String
    let radius: CGFloat
    
    var body: some View {
        VStack(spacing: DesignSystem.Spacing.xs) {
            RoundedRectangle(cornerRadius: radius, style: .continuous)
                .fill(DesignSystem.Colors.accent)
                .frame(width: 80, height: 60)
            
            Text(name)
                .font(DesignSystem.Typography.caption1)
                .foregroundStyle(DesignSystem.Colors.textSecondary)
        }
    }
}

// MARK: - Shadows Showcase

struct ShadowsShowcase: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
            Text("Shadows")
                .font(DesignSystem.Typography.title1)
                .foregroundStyle(DesignSystem.Colors.textPrimary)
            
            HStack(spacing: DesignSystem.Spacing.xl) {
                ShadowSample(name: "Subtle", shadow: DesignSystem.Shadow.subtle)
                ShadowSample(name: "Card", shadow: DesignSystem.Shadow.card)
                ShadowSample(name: "Floating", shadow: DesignSystem.Shadow.floating)
                ShadowSample(name: "Prominent", shadow: DesignSystem.Shadow.prominent)
            }
        }
        .padding(DesignSystem.Inset.xl)
    }
}

struct ShadowSample: View {
    let name: String
    let shadow: DesignSystem.ShadowStyle
    
    var body: some View {
        VStack(spacing: DesignSystem.Spacing.sm) {
            RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.comfortable)
                .fill(DesignSystem.Colors.surfacePrimary)
                .frame(width: 80, height: 60)
                .shadow(shadow)
            
            Text(name)
                .font(DesignSystem.Typography.caption1)
                .foregroundStyle(DesignSystem.Colors.textSecondary)
        }
    }
}

// MARK: - Glass Showcase

struct GlassShowcase: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
            Text("Liquid Glass Effects")
                .font(DesignSystem.Typography.title1)
                .foregroundStyle(DesignSystem.Colors.textPrimary)
            
            Text("Note: Liquid Glass effects require macOS Tahoe 26+ and render best over colorful backgrounds")
                .font(DesignSystem.Typography.callout)
                .foregroundStyle(DesignSystem.Colors.textSecondary)
            
            HStack(spacing: DesignSystem.Spacing.lg) {
                VStack {
                    Text("Glass Card")
                        .font(DesignSystem.Typography.headline)
                        .padding(DesignSystem.Inset.md)
                        .glassCard()
                    
                    Text("Glass Card")
                        .font(DesignSystem.Typography.caption1)
                }
                
                VStack {
                    Button("Glass Button") { }
                        .buttonStyle(.glass)
                    
                    Text("Glass Button")
                        .font(DesignSystem.Typography.caption1)
                }
                
                VStack {
                    Button("Prominent Glass") { }
                        .buttonStyle(.glassProminent)
                        .tint(DesignSystem.Colors.accent)
                    
                    Text("Prominent Glass")
                        .font(DesignSystem.Typography.caption1)
                }
            }
        }
        .padding(DesignSystem.Inset.xl)
    }
}

// MARK: - SF Symbols Showcase

struct SymbolsShowcase: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
            Text("SF Symbols")
                .font(DesignSystem.Typography.title1)
                .foregroundStyle(DesignSystem.Colors.textPrimary)
            
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                Text("Sizes")
                    .font(DesignSystem.Typography.headline)
                
                HStack(spacing: DesignSystem.Spacing.lg) {
                    SymbolSample(name: "Small (12pt)", size: DesignSystem.Size.iconSmall)
                    SymbolSample(name: "Regular (16pt)", size: DesignSystem.Size.iconRegular)
                    SymbolSample(name: "Large (20pt)", size: DesignSystem.Size.iconLarge)
                    SymbolSample(name: "XLarge (24pt)", size: DesignSystem.Size.iconXLarge)
                }
            }
            
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                Text("Common Icons")
                    .font(DesignSystem.Typography.headline)
                
                HStack(spacing: DesignSystem.Spacing.md) {
                    Image.iconPlay
                    Image.iconPause
                    Image.iconStop
                    Image.iconRefresh
                    Image.iconSearch
                    Image.iconSettings
                    Image.iconSidebar
                }
                .foregroundStyle(DesignSystem.Colors.textPrimary)
            }
        }
        .padding(DesignSystem.Inset.xl)
    }
}

struct SymbolSample: View {
    let name: String
    let size: CGFloat
    
    var body: some View {
        VStack(spacing: DesignSystem.Spacing.xs) {
            Image.systemIcon("shippingbox.fill", size: size)
                .foregroundStyle(DesignSystem.Colors.accent)
            
            Text(name)
                .font(DesignSystem.Typography.caption1)
                .foregroundStyle(DesignSystem.Colors.textSecondary)
        }
    }
}

// MARK: - Preview

#Preview("Design System Showcase") {
    DesignSystemShowcase()
        .frame(width: 900, height: 1400)
}

#Preview("Design System Showcase - Dark Mode") {
    DesignSystemShowcase()
        .frame(width: 900, height: 1400)
        .preferredColorScheme(.dark)
}
