import Charts
import DesignSystem
import Shared
import SwiftUI

struct ActivityChart: View {
    let metrics: [MetricPoint]
    let color: Color
    
    var body: some View {
        Chart(metrics) { point in
            AreaMark(
                x: .value("Time", point.timestamp),
                y: .value("Value", point.value)
            )
            .interpolationMethod(.catmullRom)
            .foregroundStyle(
                LinearGradient(
                    colors: [color.opacity(0.4), color.opacity(0.1)],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
            LineMark(
                x: .value("Time", point.timestamp),
                y: .value("Value", point.value)
            )
            .interpolationMethod(.catmullRom)
            .foregroundStyle(color)
        }
        .chartXAxis(.hidden)
        .chartYAxis(.hidden)
    }
}
