import AppKit
import DesignSystem
import Shared
import SwiftUI
import UIComponents

struct KubernetesKubeconfigSheet: View {
    let kubeconfig: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.lg) {
            Text("Kubeconfig")
                .font(DesignSystem.Typography.title2)

            TextEditor(text: .constant(kubeconfig))
                .font(DesignSystem.Typography.codeSmall)
                .frame(minHeight: 240)

            HStack {
                Button("Close") { dismiss() }
                    .buttonStyle(.glass)

                Spacer()

                Button("Copy") {
                    NSPasteboard.general.clearContents()
                    NSPasteboard.general.setString(kubeconfig, forType: .string)
                }
                .buttonStyle(.glassProminent)
            }
        }
        .padding(DesignSystem.Spacing.xl)
        .frame(width: 640, height: 420)
    }
}
