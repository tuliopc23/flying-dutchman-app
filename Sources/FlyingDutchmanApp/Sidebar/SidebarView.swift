import SwiftUI
import Shared

struct SidebarView: View {
    @Bindable var viewModel: SidebarViewModel

    var body: some View {
        ZStack {
            List(selection: $viewModel.selectedStack) {
                Section("Stacks") {
                    if viewModel.isEmpty {
                        EmptyStateView()
                            .listRowSeparator(.hidden)
                    } else {
                        ForEach(viewModel.stacks) { stack in
                            HStack(spacing: DesignSystem.Spacing.sm) {
                                Circle()
                                    .fill(stack.containerNames.isEmpty 
                                        ? DesignSystem.Colors.textTertiary.opacity(0.4) 
                                        : DesignSystem.Colors.success)
                                    .frame(width: 10, height: 10)
                                
                                VStack(alignment: .leading, spacing: DesignSystem.Spacing.xxs) {
                                    Text(stack.name)
                                        .font(DesignSystem.Typography.body)
                                        .foregroundStyle(DesignSystem.Colors.textPrimary)
                                    
                                    if let desc = stack.description {
                                        Text(desc)
                                            .font(DesignSystem.Typography.caption1)
                                            .foregroundStyle(DesignSystem.Colors.textSecondary)
                                    }
                                }
                            }
                            .contentShape(Rectangle())
                            .tag(stack)
                        }
                    }
                }
            }
            .listStyle(.sidebar)
            .glassSidebar()

            if viewModel.highlightSidebar {
                RoundedRectangle(
                    cornerRadius: DesignSystem.CornerRadius.comfortable,
                    style: .continuous
                )
                .strokeBorder(
                    DesignSystem.Colors.primary.opacity(0.55),
                    lineWidth: 2
                )
                .shadow(
                    color: DesignSystem.Colors.primary.opacity(0.3),
                    radius: 12
                )
                .padding(DesignSystem.Spacing.xs)
                .transition(.opacity)
                .animate(DesignSystem.Animations.quick, value: viewModel.highlightSidebar)
                .allowsHitTesting(false)
            }
        }
    }
}
