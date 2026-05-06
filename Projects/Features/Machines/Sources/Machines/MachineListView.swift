import DesignSystem
import Shared
import SwiftUI
import UIComponents

public struct MachineListView: View {
    @Bindable var viewModel: MachineListViewModel

    public init(viewModel: MachineListViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(spacing: DesignSystem.Spacing.lg) {
            header

            Toggle("Running only", isOn: $viewModel.showRunningOnly)
                .toggleStyle(.switch)
                .controlSize(.mini)
                .padding(.horizontal, DesignSystem.Spacing.md)

            if let error = viewModel.error {
                DiagnosticsBanner(
                    title: "Error",
                    message: error,
                    icon: "exclamationmark.triangle",
                    tone: .warning
                )
                .padding(.horizontal, DesignSystem.Spacing.md)
            }

            if viewModel.filtered.isEmpty {
                EmptyStateCard(
                    title: "No machines found",
                    message: viewModel.searchQuery.isEmpty
                        ? "Create a Linux machine to get started."
                        : "Try adjusting your search filters.",
                    systemImage: "laptopcomputer"
                )
                .padding(.horizontal, DesignSystem.Spacing.md)
            } else {
                LazyVStack(spacing: DesignSystem.Spacing.sm) {
                    ForEach(viewModel.filtered) { machine in
                        NavigationLink(value: machine) {
                            MachineRow(machine: machine, viewModel: viewModel)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, DesignSystem.Spacing.md)
            }
        }
        .onAppear {
            if viewModel.machines.isEmpty {
                Task { await viewModel.load() }
            }
        }
        .searchable(text: $viewModel.searchQuery)
        .navigationDestination(for: Machine.self) { machine in
            MachineDetailView(viewModel: MachineDetailViewModel(machine: machine))
        }
        .sheet(isPresented: $viewModel.showCreateSheet) {
            MachineCreateSheet(viewModel: viewModel)
        }
    }

    private var header: some View {
        HStack {
            Text("Machines")
                .font(DesignSystem.Typography.title2)
                .foregroundStyle(DesignSystem.Colors.textPrimary)

            Spacer()

            if viewModel.isLoading {
                ProgressView()
                    .controlSize(.small)
            }

            Button {
                viewModel.showCreateSheet = true
            } label: {
                Label("Create", systemImage: "plus")
            }
            .buttonStyle(.glassProminent)

            Button {
                Task { await viewModel.load() }
            } label: {
                Label("Refresh", systemImage: "arrow.clockwise")
            }
            .buttonStyle(.glass)
        }
        .padding(.horizontal, DesignSystem.Spacing.md)
    }
}
