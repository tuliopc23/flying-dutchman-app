import Shared
import FlyingDutchmanContainers
import FlyingDutchmanNetworking
import SwiftUI

#if canImport(AppKit)
import AppKit
#endif

@MainActor
@Observable
final class LogsViewModel {
    var lines: [String] = []
    var error: String?
    var isLoading: Bool = false
    var selectedContainer: ContainerSummary?
    var filter: String = ""
    var follow: Bool = false
    var pollInterval: TimeInterval = 5
    private var lastLoaded: Date = .distantPast
    private var followTask: Task<Void, Never>?
    private var keepAliveTask: Task<Void, Never>?

    func load(containers: [ContainerSummary]) async {
        followTask?.cancel()
        isLoading = true
        error = nil
        let target = selectedContainer ?? containers.first
        guard let target else {
            lines = ["No containers available."]
            isLoading = false
            return
        }
        do {
            lines = try await EngineClient.fetchLogs(id: target.id)
        } catch {
            lines = ["Logs unavailable: \(error.localizedDescription)"]
            self.error = "Engine unreachable; showing stub log."
        }
        isLoading = false
        lastLoaded = Date()
    }

    var filteredLines: [String] {
        guard !filter.isEmpty else { return lines }
        let needle = filter.lowercased()
        return lines.filter { $0.lowercased().contains(needle) }
    }

    func scheduleFollow(containers: [ContainerSummary]) {
        guard follow else { return }
        followTask?.cancel()
        followTask = Task { @MainActor [pollInterval] in
            while !Task.isCancelled {
                let elapsed = Date().timeIntervalSince(lastLoaded)
                let delay = max(1, pollInterval - elapsed)
                try? await Task.sleep(for: .seconds(delay))
                await load(containers: containers)
            }
        }
        scheduleKeepAlive()
    }

    func cancelFollow() {
        followTask?.cancel()
        followTask = nil
        keepAliveTask?.cancel()
        keepAliveTask = nil
    }

    private func scheduleKeepAlive() {
        keepAliveTask?.cancel()
        keepAliveTask = Task { @MainActor in
            while !Task.isCancelled {
                try? await Task.sleep(for: .seconds(max(10, pollInterval * 2)))
            }
        }
    }
}

struct LogsView: View {
    @Bindable var viewModel: LogsViewModel
    let containers: [ContainerSummary]

    var body: some View {
        GlassCard {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Label("Logs", systemImage: "terminal")
                        .font(.title3.weight(.semibold))
                    Spacer()
                    Toggle("Follow", isOn: $viewModel.follow)
                        .toggleStyle(.switch)
                        .labelsHidden()
                        .help("Stay on latest entries")
                    Menu("Container") {
                        ForEach(containers) { container in
                            Button(container.name) {
                                viewModel.selectedContainer = container
                                Task { @MainActor in await viewModel.load(containers: containers) }
                            }
                        }
                    }
                    Button {
                        Task { @MainActor in await viewModel.load(containers: containers) }
                    } label: {
                        Label("Refresh", systemImage: "arrow.clockwise")
                    }
                }

                if let error = viewModel.error {
                    Text(error)
                        .font(.footnote)
                        .foregroundStyle(.orange)
                }

                TextField("Filter logs", text: $viewModel.filter)
                    .textFieldStyle(.roundedBorder)

                ScrollView {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(Array(viewModel.filteredLines.enumerated()), id: \.offset) { idx, line in
                            HStack {
                                Text(line)
                                    .font(.system(.footnote, design: .monospaced))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Button {
                                    #if canImport(AppKit)
                                    NSPasteboard.general.clearContents()
                                    NSPasteboard.general.setString(line, forType: .string)
                                    #endif
                                } label: {
                                    Image(systemName: "doc.on.doc")
                                }
                                .buttonStyle(.borderless)
                                .help("Copy line")
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(minHeight: 120)
            }
            .onChange(of: viewModel.follow) { _, newValue in
                if newValue {
                    viewModel.scheduleFollow(containers: containers)
                } else {
                    viewModel.cancelFollow()
                }
            }
            .onAppear {
                if viewModel.follow {
                    viewModel.scheduleFollow(containers: containers)
                }
            }
            .onDisappear {
                viewModel.cancelFollow()
            }
        }
    }
}
