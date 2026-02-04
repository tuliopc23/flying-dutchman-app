import SwiftUI
import Shared
#if canImport(AppKit)
import AppKit
#endif

public struct MenuBarView: View {
    @Environment(AppState.self) private var state
    @Environment(\.openWindow) private var openWindow

    public init() {}

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header
            HStack {
                Circle()
                    .fill(state.isEngineHealthy ? Color.green : Color.red)
                    .frame(width: 8, height: 8)
                
                Text(state.isEngineHealthy ? "Flying Dutchman: Running" : "Engine Stopped")
                    .font(.caption)
                    .fontWeight(.medium)
                
                Spacer()
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color(nsColor: .controlBackgroundColor))
            
            Divider()
            
            // Running Containers
            if !state.containers.isEmpty {
                let running = state.containers.filter { $0.status == .running }
                if !running.isEmpty {
                    Text("Running Containers")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal, 12)
                        .padding(.top, 8)
                        .padding(.bottom, 4)
                    
                    ForEach(running.prefix(5)) { container in
                        HStack {
                            Image(systemName: "cube.fill")
                                .font(.caption)
                            Text(container.name)
                                .font(.caption)
                                .lineLimit(1)
                            Spacer()
                            Text(container.image)
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 4)
                    }
                    
                    if running.count > 5 {
                        Text("+ \(running.count - 5) more")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                    }
                    
                    Divider()
                        .padding(.top, 4)
                } else {
                    Text("No containers running")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .padding(12)
                    Divider()
                }
            } else {
                Text("No containers found")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .padding(12)
                Divider()
            }
            
            // Actions
            VStack(spacing: 4) {
                Button("Open Dashboard") {
                    openWindow(id: "main")
                    NSApp.activate(ignoringOtherApps: true)
                }
                .buttonStyle(.borderless) // Menu item style
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                
                Button("Quit Flying Dutchman") {
                    NSApplication.shared.terminate(nil)
                }
                .buttonStyle(.borderless)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
            }
            .padding(.vertical, 4)
        }
        .frame(width: 280)
        .padding(.bottom, 4)
        .onAppear {
            Task {
                await state.refreshEngineStatus()
                await state.refreshContainers()
            }
        }
    }
}
