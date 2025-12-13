import Shared
import FlyingDutchmanContainers
import FlyingDutchmanNetworking
import SwiftUI

#if canImport(AppKit)
import AppKit
#endif

@Observable
final class EventsViewModel {
    var events: [DockerEvent] = []
    var error: String?
    var isLoading: Bool = false
    var limit: Int = 50
    var isStreaming: Bool = false
    var pollInterval: TimeInterval = 5
    private var lastLoaded: Date = .distantPast
    private var streamTask: Task<Void, Never>?
    private var keepAliveTask: Task<Void, Never>?

    func load(stream: Bool = false) async {
        if stream == false {
            streamTask?.cancel()
        }
        isLoading = true
        error = nil
        isStreaming = stream
        do {
            events = try await EngineClient.fetchEvents(stream: stream, limit: limit)
        } catch {
            self.error = "Events unavailable: \(error.localizedDescription)"
        }
        isLoading = false
        lastLoaded = Date()
    }

    func scheduleStreaming() {
        guard isStreaming else { return }
        streamTask?.cancel()
        streamTask = Task { [pollInterval, limit] in
            while !Task.isCancelled {
                try await Task.sleep(for: .seconds(pollInterval))
                await load(stream: true)
            }
        }
        scheduleKeepAlive()
    }

    func cancelStreaming() {
        streamTask?.cancel()
        streamTask = nil
        keepAliveTask?.cancel()
        keepAliveTask = nil
    }

    private func scheduleKeepAlive() {
        keepAliveTask?.cancel()
        keepAliveTask = Task {
            while !Task.isCancelled {
                try await Task.sleep(for: .seconds(max(10, pollInterval * 2)))
            }
        }
    }
}

struct EventsView: View {
    @Bindable var viewModel: EventsViewModel
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 12) {
                SectionHeader(title: "Events", subtitle: "Recent engine activity", icon: "waveform.path") {
                    if viewModel.isStreaming {
                        ProgressView().controlSize(.small)
                    }
                    Button {
                        Task { await viewModel.load(stream: true) }
                    } label: {
                        Label("Stream", systemImage: "dot.radiowaves.left.and.right")
                    }
                    Button {
                        Task { await viewModel.load() }
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
                                Image(systemName: "sparkles")
                                VStack(alignment: .leading, spacing: 2) {
                                    Text("\(event.action) · \(event.status)")
                                    Text(event.from ?? "—")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)
                                }
                                Spacer()
                                Text("\(event.time)")
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                                Button {
                                    #if canImport(AppKit)
                                    let line = "\(event.action) · \(event.status) · \(event.from ?? "") · \(event.time)"
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
            .onChange(of: viewModel.isStreaming) { _, newValue in
                if newValue {
                    viewModel.scheduleStreaming()
                }
            }
            .onDisappear {
                viewModel.cancelStreaming()
            }
        }
    }
}
