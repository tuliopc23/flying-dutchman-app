import FlyingDutchmanNetworking
import SwiftUI

#if canImport(AppKit)
import AppKit
#endif

@MainActor

@Observable
public final class EventsViewModel {
    public var events: [RuntimeEvent] = []
    public var error: String?
    public var isStreaming: Bool = false
    private var streamTask: Task<Void, Never>?

    public init() {}

    public func startStreaming(reset: Bool = false) {
        streamTask?.cancel()
        if reset {
            events.removeAll()
        }
        error = nil
        isStreaming = true
        streamTask = Task { @MainActor in
            do {
                for try await event in EngineClient.streamRuntimeEvents() {
                    events.append(event)
                }
                isStreaming = false
            } catch is CancellationError {
                isStreaming = false
            } catch {
                self.error = "Events unavailable: \(error.localizedDescription)"
                isStreaming = false
            }
        }
    }

    func stopStreaming() {
        streamTask?.cancel()
        streamTask = nil
        isStreaming = false
    }
}

struct EventsView: View {
    @Bindable var viewModel: EventsViewModel

    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("Events")
                    .font(DesignSystem.Typography.title2)
                    .foregroundStyle(DesignSystem.Colors.textPrimary)
                
                Spacer()
                
                if viewModel.isStreaming {
                    ProgressView().controlSize(.small)
                }
                
                Button {
                    viewModel.startStreaming()
                } label: {
                    Label("Stream", systemImage: "dot.radiowaves.left.and.right")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.glass)
                .disabled(viewModel.isStreaming)
                
                Button {
                    viewModel.startStreaming(reset: true)
                } label: {
                    Label("Reset", systemImage: "arrow.clockwise")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.glass)
            }
            .padding(DesignSystem.Spacing.md)
            .background(.thinMaterial)
            
            Divider()

            // Content
            ScrollView {
                LazyVStack(spacing: 2) {
                    if let error = viewModel.error {
                        DiagnosticsBanner(
                            title: "Stream Error",
                            message: error,
                            icon: "exclamationmark.triangle",
                            tone: .warning
                        )
                        .padding()
                    } else if viewModel.events.isEmpty {
                        EmptyStateCard(
                            title: "No events",
                            message: "Start streaming to see live engine activity.",
                            systemImage: "waveform.path"
                        )
                        .padding(DesignSystem.Spacing.xl)
                    } else {
                        ForEach(viewModel.events, id: \.id) { event in
                            EventRow(event: event)
                        }
                    }
                }
                .padding(.vertical, DesignSystem.Spacing.sm)
            }
            .background(DesignTokens.glassFieldBackground(for: .light))
        }
        .background(.background)
        .cornerRadius(12)
        .padding(DesignSystem.Spacing.md)
        .glassSurface(in: .rect(cornerRadius: 16))
        .onDisappear {
            viewModel.stopStreaming()
        }
    }
}

struct EventRow: View {
    let event: RuntimeEvent
    
    private static let timestampFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        return formatter
    }()
    
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: DesignSystem.Spacing.md) {
            Image(systemName: icon(for: event))
                .foregroundStyle(color(for: event))
                .frame(width: 20)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title(for: event))
                    .font(DesignSystem.Typography.subheadline)
                    .foregroundStyle(DesignSystem.Colors.textPrimary)
                
                Text(detail(for: event))
                    .font(DesignSystem.Typography.caption2)
                    .foregroundStyle(DesignSystem.Colors.textSecondary)
            }
            
            Spacer()
            
            Text(Self.timestampFormatter.string(from: event.timestamp))
                .font(DesignSystem.Typography.caption2)
                .foregroundStyle(DesignSystem.Colors.textTertiary)
                .monospacedDigit()
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(Color.clear)
        .contextMenu {
            Button("Copy Details") {
                #if canImport(AppKit)
                let line = "\(title(for: event)) · \(detail(for: event))"
                NSPasteboard.general.clearContents()
                NSPasteboard.general.setString(line, forType: .string)
                #endif
            }
        }
    }
    
    private func icon(for event: RuntimeEvent) -> String {
        switch event.type {
        case .stateChanged: return "arrow.triangle.2.circlepath"
        case .logOutput: return "text.alignleft"
        case .resourceUpdate: return "speedometer"
        }
    }
    
    private func color(for event: RuntimeEvent) -> Color {
        switch event.type {
        case .stateChanged: return DesignSystem.Colors.accent
        case .logOutput: return DesignSystem.Colors.textSecondary
        case .resourceUpdate: return DesignSystem.Colors.success
        }
    }
    
    private func title(for event: RuntimeEvent) -> String {
        switch event.type {
        case .stateChanged(let from, let to):
            return "\(from.displayName) → \(to.displayName)"
        case .logOutput:
            return "Log Output"
        case .resourceUpdate:
            return "Resource Update"
        }
    }
    
    private func detail(for event: RuntimeEvent) -> String {
        switch event.type {
        case .stateChanged:
            return "Container \(event.containerId.prefix(8))"
        case .logOutput(let message):
            return message
        case .resourceUpdate(let info):
            let memoryMB = Double(info.memoryBytes) / 1024 / 1024
            return String(format: "CPU %.1f%% · Mem %.0f MB", info.cpuPercent, memoryMB)
        }
    }
}
