import Charts
import Dependencies
import DesignSystem
import FlyingDutchmanPersistence
import Shared
import SwiftUI
import UIComponents

@MainActor
@Observable
public final class DashboardViewModel {
    public var cpuMetrics: [MetricPoint] = []
    public var memoryMetrics: [MetricPoint] = []

    public var runningContainers: Int = 0
    public var stoppedContainers: Int = 0
    public var totalImages: Int = 0

    private let metricsService = MetricsService()
    private let containerStore = ContainerStore()

    public init() {}

    public func start() async {
        await metricsService.startPolling()

        // Start UI refresh loop
        Task {
            while true {
                await refresh()
                try? await Task.sleep(nanoseconds: 2 * 1_000_000_000) // 2s UI refresh
            }
        }
    }

    private func refresh() async {
        // Update stats
        let containers = containerStore.fetchAll()
        runningContainers = containers.count(where: { $0.status == .running })
        stoppedContainers = containers.count(where: { $0.status != .running })

        // Update charts
        let since = Date().addingTimeInterval(-300) // Last 5 minutes for "Live" feel
        cpuMetrics = await metricsService.getMetrics(type: "cpu", since: since)
        memoryMetrics = await metricsService.getMetrics(type: "memory", since: since)
    }
}

public struct DashboardView: View {
    @Bindable var viewModel: DashboardViewModel

    public init(viewModel: DashboardViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        ScrollView {
            VStack(spacing: DesignSystem.Spacing.xl) {
                // Hero Section
                HeroSection(viewModel: viewModel)

                // Status Grid
                StatusGrid(viewModel: viewModel)

                // Quick Actions
                QuickActionsRow()
            }
            .padding(DesignSystem.Inset.xl)
        }
        .background(DesignSystem.Colors.background)
        .task {
            await viewModel.start()
        }
    }
}

// MARK: - Hero Section

struct HeroSection: View {
    let viewModel: DashboardViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.lg) {
            Text("System Overview")
                .font(DesignSystem.Typography.title2)
                .foregroundStyle(DesignSystem.Colors.textPrimary)

            GlassCard {
                VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
                    HStack {
                        Label("CPU Load", systemImage: "cpu")
                            .font(DesignSystem.Typography.headline)
                            .foregroundStyle(DesignSystem.Colors.textSecondary)
                        Spacer()
                        Text(String(format: "%.1f%%", viewModel.cpuMetrics.last?.value ?? 0))
                            .font(.system(.title, design: .rounded).weight(.semibold))
                            .foregroundStyle(DesignSystem.Colors.primary)
                    }

                    Chart(viewModel.cpuMetrics) { point in
                        AreaMark(
                            x: .value("Time", point.timestamp),
                            y: .value("Load", point.value)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    DesignSystem.Colors.primary.opacity(0.6),
                                    DesignSystem.Colors.primary.opacity(0.1),
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )

                        LineMark(
                            x: .value("Time", point.timestamp),
                            y: .value("Load", point.value)
                        )
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(DesignSystem.Colors.primary)
                        .lineStyle(StrokeStyle(lineWidth: 2))
                    }
                    .chartYScale(domain: 0 ... 100)
                    .chartXAxis(.hidden)
                    .chartYAxis(.hidden)
                    .frame(height: 180)
                }
            }
        }
    }
}

// MARK: - Status Grid

struct StatusGrid: View {
    let viewModel: DashboardViewModel

    var body: some View {
        LazyVGrid(
            columns: [GridItem(.adaptive(minimum: 240), spacing: DesignSystem.Spacing.lg)],
            spacing: DesignSystem.Spacing.lg
        ) {
            StatusCard(
                title: "Containers",
                value: "\(viewModel.runningContainers)",
                subtitle: "\(viewModel.stoppedContainers) stopped",
                icon: "shippingbox.fill",
                color: DesignSystem.Colors.accent
            )

            StatusCard(
                title: "Memory Usage",
                value: String(format: "%.0f MB", viewModel.memoryMetrics.last?.value ?? 0),
                subtitle: "Active allocation",
                icon: "memorychip",
                color: .orange
            )

            StatusCard(
                title: "Disk Usage",
                value: "12.4 GB", // Placeholder
                subtitle: "Images & Volumes",
                icon: "internaldrive.fill",
                color: .gray
            )
        }
    }
}

struct StatusCard: View {
    let title: String
    let value: String
    let subtitle: String
    let icon: String
    let color: Color

    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                HStack {
                    Image(systemName: icon)
                        .font(.title2)
                        .foregroundStyle(color)
                        .frame(width: 40, height: 40)
                        .background(color.opacity(0.1))
                        .clipShape(Circle())

                    Spacer()
                }

                Spacer().frame(height: 8)

                Text(value)
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundStyle(DesignSystem.Colors.textPrimary)

                Text(title)
                    .font(DesignSystem.Typography.headline)
                    .foregroundStyle(DesignSystem.Colors.textPrimary)

                Text(subtitle)
                    .font(DesignSystem.Typography.caption1)
                    .foregroundStyle(DesignSystem.Colors.textTertiary)
            }
        }
    }
}

// MARK: - Quick Actions

struct QuickActionsRow: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.lg) {
            Text("Quick Actions")
                .font(DesignSystem.Typography.title2)
                .foregroundStyle(DesignSystem.Colors.textPrimary)

            HStack(spacing: DesignSystem.Spacing.md) {
                Button(action: {}) {
                    Label("New Container", systemImage: "plus")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.glassProminent)
                .tint(DesignSystem.Colors.accent)

                Button(action: {}) {
                    Label("Pull Image", systemImage: "arrow.down.circle")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.glass)

                Button(action: {}) {
                    Label("Debug Shell", systemImage: "terminal")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.glass)
            }
        }
    }
}
