import DesignSystem
import Shared
import SwiftUI
import UIComponents

struct SystemInspectorView: View {
    @Environment(AppState.self) private var state

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.lg) {
                // Header
                HStack {
                    Text("Inspector")
                        .font(DesignSystem.Typography.headline)
                        .foregroundStyle(DesignSystem.Colors.textPrimary)
                    Spacer()
                    Circle()
                        .fill(state.isEngineHealthy ? DesignSystem.Colors.success : DesignSystem.Colors.warning)
                        .frame(width: 8, height: 8)
                }

                // Status Section
                VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                    Text("ENGINE STATUS")
                        .font(DesignSystem.Typography.caption1)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)

                    GlassCard {
                        VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                            HStack {
                                Text("Health")
                                    .font(DesignSystem.Typography.subheadline)
                                Spacer()
                                Text(state.isEngineHealthy ? "Healthy" : "Offline")
                                    .font(DesignSystem.Typography.subheadline)
                                    .foregroundStyle(state.isEngineHealthy ? DesignSystem.Colors.success : DesignSystem
                                        .Colors.warning)
                            }

                            HStack {
                                Text("Mode")
                                    .font(DesignSystem.Typography.subheadline)
                                Spacer()
                                Text(state.activeRuntimeMode)
                                    .font(DesignSystem.Typography.subheadline)
                                    .foregroundStyle(DesignSystem.Colors.textSecondary)
                            }
                        }
                    }
                }

                // Inventory Section
                VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                    Text("ACTIVE INVENTORY")
                        .font(DesignSystem.Typography.caption1)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)

                    GlassCard {
                        VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                            HStack {
                                Label("Containers", systemImage: "shippingbox.fill")
                                    .font(DesignSystem.Typography.subheadline)
                                Spacer()
                                Text("\(state.containers.count)")
                                    .font(DesignSystem.Typography.subheadline)
                                    .bold()
                            }

                            Divider()
                                .padding(.vertical, 2)

                            HStack {
                                Label("Machines", systemImage: "macpro.gen3.fill")
                                    .font(DesignSystem.Typography.subheadline)
                                Spacer()
                                Text("\(state.machines.count)")
                                    .font(DesignSystem.Typography.subheadline)
                                    .bold()
                            }

                            Divider()
                                .padding(.vertical, 2)

                            HStack {
                                Label("Stacks", systemImage: "square.stack.3d.up.fill")
                                    .font(DesignSystem.Typography.subheadline)
                                Spacer()
                                Text("\(state.sidebar.stacks.count)")
                                    .font(DesignSystem.Typography.subheadline)
                                    .bold()
                            }
                        }
                    }
                }

                // Quick Actions
                VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                    Text("ACTIONS")
                        .font(DesignSystem.Typography.caption1)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)

                    Button {
                        Task { await state.refreshEngineStatus() }
                    } label: {
                        Label("Refresh Engine", systemImage: "arrow.clockwise")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .buttonStyle(.glass)

                    Button {
                        state.refreshDiagnostics()
                    } label: {
                        Label("Rerun Diagnostics", systemImage: "stethoscope")
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .buttonStyle(.glass)
                }
            }
            .padding(DesignSystem.Spacing.md)
        }
    }
}
