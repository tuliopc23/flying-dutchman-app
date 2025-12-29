import FlyingDutchmanNetworking
import SwiftUI

#if canImport(AppKit)
import AppKit
#endif

@MainActor
@Observable
final class EventsViewModel {
    var events: [RuntimeEvent] = []
    var error: String?
    var isStreaming: Bool = false
    private var streamTask: Task<Void, Never>?

    func startStreaming(reset: Bool = false) {
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
    @Environment(\.colorScheme) private var colorScheme
    
    private static let timestampFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        return formatter
    }()

    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 12) {
                SectionHeader(title: "Events", subtitle: "Recent engine activity", icon: "waveform.path") {
                    if viewModel.isStreaming {
                        ProgressView().controlSize(.small)
                    }
                    Button {
                        viewModel.startStreaming()
                    } label: {
                        Label("Stream", systemImage: "dot.radiowaves.left.and.right")
                    }
                    Button {
                        viewModel.startStreaming(reset: true)
                    } label: {
                        Label("Refresh", systemImage: "arrow.clockwise")
                    }
                }

                if let error = viewModel.error {
                    Text(error)
                        .font(.footnote)
                        .foregroundStyle(.orange)
                }

                if viewModel.events.isEmpty {
                    Text("No events available.")
                        .foregroundStyle(.secondary)
                } else {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(viewModel.events, id: \.id) { event in
                            HStack {
                                Image(systemName: icon(for: event))
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(title(for: event))
                                    Text(detail(for: event))
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                Text(Self.timestampFormatter.string(from: event.timestamp))
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                                Button {
                                    #if canImport(AppKit)
                                    let line = "\(title(for: event)) · \(detail(for: event)) · \(event.containerId)"
                                    NSPasteboard.general.clearContents()
                                    NSPasteboard.general.setString(line, forType: .string)
                                    #endif
                                } label: {
                                    Image(systemName: "doc.on.doc")
                                }
                                .buttonStyle(.borderless)
                                .help("Copy event")
                            }
                            .padding(8)
                            .background(DesignTokens.glassFieldBackground(for: colorScheme))
                            .clipShape(DesignTokens.glassShape)
                        }
                    }
                }
            }
            .onDisappear {
                viewModel.stopStreaming()
            }
        }
    }
    
    private func icon(for event: RuntimeEvent) -> String {
        switch event.type {
        case .stateChanged:
            return "arrow.triangle.2.circlepath"
        case .logOutput:
            return "text.alignleft"
        case .resourceUpdate:
            return "speedometer"
        }
    }
    
    private func title(for event: RuntimeEvent) -> String {
        switch event.type {
        case .stateChanged(let from, let to):
            return "State: \(from.displayName) → \(to.displayName)"
        case .logOutput:
            return "Log output"
        case .resourceUpdate:
            return "Resource update"
        }
    }
    
    private func detail(for event: RuntimeEvent) -> String {
        switch event.type {
        case .stateChanged:
            return "Container \(event.containerId)"
        case .logOutput(let message):
            return message
        case .resourceUpdate(let info):
            let memoryMB = Double(info.memoryBytes) / 1024 / 1024
            return String(format: "CPU %.1f%% · Mem %.0f MB (%.1f%%)", info.cpuPercent, memoryMB, info.memoryPercent)
        }
    }
}
