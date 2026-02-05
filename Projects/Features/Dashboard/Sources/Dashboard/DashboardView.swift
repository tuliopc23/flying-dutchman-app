import Dependencies
import DesignSystem
import FlyingDutchmanPersistence
import Shared
import SwiftUI

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
    // ImageStore would be here
    
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
        runningContainers = containers.filter { $0.status == .running }.count
        stoppedContainers = containers.filter { $0.status != .running }.count
        
        // Update charts
        let since = Date().addingTimeInterval(-300) // Last 5 minutes for "Live" feel
        cpuMetrics = await metricsService.getMetrics(type: "cpu", since: since)
        memoryMetrics = await metricsService.getMetrics(type: "memory", since: since)
    }
}

public struct DashboardView: View {
    @State private var viewModel = DashboardViewModel()
    
    public init() {}
    
    public var body: some View {
        ScrollView {
            VStack(spacing: DesignSystem.Spacing.xl) {
                // Header
                HStack {
                    Text("Dashboard")
                        .font(DesignSystem.Typography.title1)
                        .foregroundStyle(DesignSystem.Colors.textPrimary)
                    Spacer()
                }
                
                // Status Cards Grid
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 240), spacing: DesignSystem.Spacing.lg)], spacing: DesignSystem.Spacing.lg) {
                    StatusCard(
                        title: "Containers",
                        value: "\(viewModel.runningContainers)",
                        subtitle: "\(viewModel.stoppedContainers) stopped",
                        icon: "shippingbox.fill",
                        color: DesignSystem.Colors.accent,
                        trend: nil
                    )
                    
                    StatusCard(
                        title: "CPU Load",
                        value: String(format: "%.1f%%", viewModel.cpuMetrics.last?.value ?? 0),
                        subtitle: "System Average",
                        icon: "cpu",
                        color: .blue,
                        chart: AnyView(ActivityChart(metrics: viewModel.cpuMetrics, color: .blue))
                    )
                    
                    StatusCard(
                        title: "Memory",
                        value: String(format: "%.0f MB", viewModel.memoryMetrics.last?.value ?? 0),
                        subtitle: "Used",
                        icon: "memorychip",
                        color: .orange,
                        chart: AnyView(ActivityChart(metrics: viewModel.memoryMetrics, color: .orange))
                    )
                }
                
                // Quick Actions
                VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
                    Text("Quick Actions")
                        .font(DesignSystem.Typography.title3)
                        .foregroundStyle(DesignSystem.Colors.textPrimary)
                    
                    HStack(spacing: DesignSystem.Spacing.md) {
                        QuickActionButton(title: "New Container", icon: "plus", color: .blue) {}
                        QuickActionButton(title: "Debug Shell", icon: "terminal", color: .gray) {}
                        QuickActionButton(title: "Documentation", icon: "book", color: .purple) {}
                    }
                }
            }
            .padding(DesignSystem.Inset.xl)
        }
        .background(DesignSystem.Colors.background)
        .task {
            await viewModel.start()
        }
    }
}

struct StatusCard: View {
    let title: String
    let value: String
    let subtitle: String
    let icon: String
    let color: Color
    var trend: Double? = nil
    var chart: AnyView? = nil
    
    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
                HStack {
                    Image(systemName: icon)
                        .font(.title2)
                        .foregroundStyle(color)
                        .frame(width: 40, height: 40)
                        .background(color.opacity(0.1))
                        .clipShape(Circle())
                    
                    Spacer()
                    
                    if let trend {
                        HStack(spacing: 2) {
                            Image(systemName: trend >= 0 ? "arrow.up" : "arrow.down")
                            Text(String(format: "%.0f%%", abs(trend)))
                        }
                        .font(DesignSystem.Typography.caption1)
                        .foregroundStyle(trend >= 0 ? DesignSystem.Colors.success : DesignSystem.Colors.error)
                    }
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(value)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundStyle(DesignSystem.Colors.textPrimary)
                    
                    Text(title)
                        .font(DesignSystem.Typography.body)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)
                }
                
                if let chart {
                    chart
                        .frame(height: 40)
                        .padding(.top, 4)
                } else {
                    Text(subtitle)
                        .font(DesignSystem.Typography.caption1)
                        .foregroundStyle(DesignSystem.Colors.textTertiary)
                        .padding(.top, 8)
                }
            }
            .padding(DesignSystem.Inset.md)
        }
    }
}

struct QuickActionButton: View {
    let title: String
    let icon: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .foregroundStyle(color)
                Text(title)
                    .foregroundStyle(DesignSystem.Colors.textPrimary)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(DesignSystem.Colors.surfaceSecondary)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(DesignSystem.Colors.separator, lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}
