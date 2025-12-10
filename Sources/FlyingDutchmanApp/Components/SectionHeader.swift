import SwiftUI

struct SectionHeader<Content: View>: View {
    let title: String
    let subtitle: String?
    let icon: String
    @ViewBuilder var actions: Content

    init(title: String, subtitle: String? = nil, icon: String, @ViewBuilder actions: () -> Content) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.actions = actions()
    }

    var body: some View {
        HStack {
            HStack(spacing: 10) {
                Image(systemName: icon)
                    .foregroundStyle(.primary)
                VStack(alignment: .leading, spacing: 2) {
                    Text(title).font(.title3.weight(.semibold))
                    if let subtitle {
                        Text(subtitle).font(.caption).foregroundStyle(.secondary)
                    }
                }
            }
            Spacer(minLength: 12)
            actions
                .buttonStyle(.borderless)
        }
    }
}
