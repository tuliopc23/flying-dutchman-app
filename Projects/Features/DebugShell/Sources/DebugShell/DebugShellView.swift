import Dependencies
import DesignSystem
import Shared
import SwiftUI
import UIComponents

@MainActor
@Observable
public final class DebugShellViewModel {
    public var error: String?

    public init() {}
}

public struct DebugShellView: View {
    @Bindable var viewModel: DebugShellViewModel
    @Dependency(\.terminalLauncher) private var terminalLauncher

    public init(viewModel: DebugShellViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.lg) {
            header

            GlassCard {
                VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
                    SectionHeader(title: "Debug Shell", icon: "terminal")
                    Text("Launch a shell into a running container or machine.")
                        .font(DesignSystem.Typography.body)
                        .foregroundStyle(DesignSystem.Colors.textSecondary)

                    Text("Container: fd shell <container>")
                        .font(DesignSystem.Typography.codeSmall)
                    Text("Machine: fd machines ssh <name>")
                        .font(DesignSystem.Typography.codeSmall)

                    Button {
                        Task { await openHelp() }
                    } label: {
                        Label("Open Terminal", systemImage: "terminal")
                    }
                    .buttonStyle(.glassProminent)
                }
                .padding(DesignSystem.Inset.md)
            }

            if let error = viewModel.error {
                DiagnosticsBanner(
                    title: "Error",
                    message: error,
                    icon: "exclamationmark.triangle",
                    tone: .warning
                )
            }

            Spacer()
        }
        .padding(DesignSystem.Spacing.lg)
    }

    private var header: some View {
        HStack {
            Text("Debug Shell")
                .font(DesignSystem.Typography.title2)
                .foregroundStyle(DesignSystem.Colors.textPrimary)
            Spacer()
        }
    }

    private func openHelp() async {
        do {
            try await terminalLauncher.openTerminal("fd shell --help")
        } catch {
            viewModel.error = "Failed to open terminal: \(error.localizedDescription)"
        }
    }
}
