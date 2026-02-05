import Foundation
import Shared

public actor MetricsService {
    private let logger = Loggers.make(category: "metrics.service")
    // In a real implementation, this would inject a Store to persist metrics.
    // For this prototype, we'll keep a sliding window in memory for the chart.
    
    private var history: [MetricPoint] = []
    private let windowSize: TimeInterval = 3600 // 1 hour
    private var isRunning = false
    
    public init() {}
    
    public func startPolling() async {
        guard !isRunning else { return }
        isRunning = true
        
        Task {
            while isRunning {
                await tick()
                try? await Task.sleep(nanoseconds: 5 * 1_000_000_000) // 5s
            }
        }
    }
    
    public func stop() {
        isRunning = false
    }
    
    public func getMetrics(type: String, since: Date) -> [MetricPoint] {
        history.filter { $0.metricType == type && $0.timestamp >= since }
    }
    
    private func tick() {
        // Simulation: In a real app, query ContainerizationRuntime/Virtualization
        let cpuLoad = Double.random(in: 5...45)
        let memoryUsage = Double.random(in: 200...1024) // MB
        
        let now = Date()
        
        let cpuPoint = MetricPoint(timestamp: now, metricType: "cpu", value: cpuLoad)
        let memPoint = MetricPoint(timestamp: now, metricType: "memory", value: memoryUsage)
        
        history.append(cpuPoint)
        history.append(memPoint)
        
        // Prune old
        let cutoff = now.addingTimeInterval(-windowSize)
        history.removeAll { $0.timestamp < cutoff }
    }
}
