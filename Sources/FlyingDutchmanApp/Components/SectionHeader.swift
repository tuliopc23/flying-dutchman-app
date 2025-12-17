import SwiftUI

struct SectionHeader<Content: View>: View {
    let title: String
    let subtitle: String?
    let icon: String
    @ViewBuilder var actions: Content

    init(title: String, subtitle: String? = nil, icon: String, @ViewBuilder actions: () -> Content) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.actions = actions()
    }

    var body: some View {
        HStack(spacing: DesignSystem.Spacing.md) {
            HStack(spacing: DesignSystem.Spacing.sm) {
                Image.systemIcon(icon, size: DesignSystem.Size.iconLarge)
                    .foregroundStyle(DesignSystem.Colors.accent)
                
                VStack(alignment: .leading, spacing: DesignSystem.Spacing.xxs) {
                    Text(title)
                        .font(DesignSystem.Typography.title3)
                        .foregroundStyle(DesignSystem.Colors.textPrimary)
                    
                    if let subtitle {
                        Text(subtitle)
                            .font(DesignSystem.Typography.caption1)
                            .foregroundStyle(DesignSystem.Colors.textSecondary)
                    }
                }
            }
            
            Spacer(minLength: DesignSystem.Spacing.md)
            
            actions
                .buttonStyle(.borderless)
        }
    }
}
