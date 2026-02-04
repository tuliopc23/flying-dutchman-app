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
        VStack(spacing: 0) {
            // Header
            HStack(spacing: DesignSystem.Spacing.md) {
                Menu {
                    ForEach(containers) { container in
                        Button(container.name) {
                            viewModel.selectedContainer = container
                            Task { @MainActor in await viewModel.load(containers: containers) }
                        }
                    }
                } label: {
                    HStack {
                        Image(systemName: "shippingbox")
                        Text(viewModel.selectedContainer?.name ?? "Select Container")
                            .fontWeight(.medium)
                        Image(systemName: "chevron.down")
                            .imageScale(.small)
                            .foregroundStyle(.secondary)
                    }
                }
                .buttonStyle(.glass)
                .frame(width: 200)
                
                Spacer()
                
                Toggle("Follow", isOn: $viewModel.follow)
                    .toggleStyle(.switch)
                    .controlSize(.mini)
                
                Button {
                    Task { @MainActor in await viewModel.load(containers: containers) }
                } label: {
                    Label("Refresh", systemImage: "arrow.clockwise")
                        .labelStyle(.iconOnly)
                }
                .buttonStyle(.glass)
            }
            .padding(DesignSystem.Spacing.md)
            .background(.thinMaterial)
            
            // Search Bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(DesignSystem.Colors.textTertiary)
                TextField("Filter logs...", text: $viewModel.filter)
                    .textFieldStyle(.plain)
            }
            .padding(DesignSystem.Inset.sm)
            .background(DesignTokens.glassFieldBackground(for: .dark))
            .padding(.horizontal, DesignSystem.Spacing.md)
            .padding(.bottom, DesignSystem.Spacing.sm)

            Divider()

            // Log Content
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 2) {
                        if viewModel.isLoading && viewModel.filteredLines.isEmpty {
                            ProgressView()
                                .frame(maxWidth: .infinity, minHeight: 200)
                        } else if let error = viewModel.error {
                            Text(error)
                                .foregroundStyle(DesignSystem.Colors.warning)
                                .padding()
                        } else if viewModel.filteredLines.isEmpty {
                            Text("No logs available")
                                .foregroundStyle(DesignSystem.Colors.textTertiary)
                                .frame(maxWidth: .infinity, minHeight: 200)
                        } else {
                            ForEach(Array(viewModel.filteredLines.enumerated()), id: \.offset) { idx, line in
                                LogLineRow(line: line, index: idx)
                                    .id(idx)
                            }
                        }
                    }
                    .padding(DesignSystem.Spacing.md)
                }
                .background(Color.black.opacity(0.9))
                .onChange(of: viewModel.lines.count) { _, count in
                    if viewModel.follow && count > 0 {
                        withAnimation {
                            proxy.scrollTo(count - 1, anchor: .bottom)
                        }
                    }
                }
            }
        }
        .background(Color.black)
        .cornerRadius(12)
        .padding(DesignSystem.Spacing.md)
        .glassSurface(in: .rect(cornerRadius: 16))
        .onAppear {
            if viewModel.selectedContainer == nil {
                viewModel.selectedContainer = containers.first
            }
            Task { await viewModel.load(containers: containers) }
            if viewModel.follow {
                viewModel.scheduleFollow(containers: containers)
            }
        }
        .onDisappear {
            viewModel.cancelFollow()
        }
        .onChange(of: viewModel.follow) { _, newValue in
            if newValue {
                viewModel.scheduleFollow(containers: containers)
            } else {
                viewModel.cancelFollow()
            }
        }
    }
}

struct LogLineRow: View {
    let line: String
    let index: Int
    @State private var isHovering = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Text("\(index + 1)")
                .font(.system(size: 10, weight: .regular, design: .monospaced))
                .foregroundStyle(Color.white.opacity(0.3))
                .frame(width: 30, alignment: .trailing)
            
            Text(line)
                .font(.system(size: 11, weight: .regular, design: .monospaced))
                .foregroundStyle(Color.white.opacity(0.9))
                .textSelection(.enabled)
            
            Spacer()
            
            if isHovering {
                Button {
                    #if canImport(AppKit)
                    NSPasteboard.general.clearContents()
                    NSPasteboard.general.setString(line, forType: .string)
                    #endif
                } label: {
                    Image(systemName: "doc.on.doc")
                        .foregroundStyle(.white)
                }
                .buttonStyle(.borderless)
            }
        }
        .padding(.vertical, 1)
        .onHover { isHovering = $0 }
    }
}
