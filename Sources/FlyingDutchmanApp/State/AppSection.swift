import Foundation

enum AppSection: String, CaseIterable, Identifiable {
    case containers
    case stacks
    case images
    case volumes
    case networks
    case logs
    case events

    var id: String { rawValue }

    var title: String {
        switch self {
        case .containers: return "Containers"
        case .stacks: return "Stacks"
        case .images: return "Images"
        case .volumes: return "Volumes"
        case .networks: return "Networks"
        case .logs: return "Logs"
        case .events: return "Events"
        }
    }

    var systemImage: String {
        switch self {
        case .containers: return "shippingbox.circle"
        case .stacks: return "square.stack.3d.up"
        case .images: return "shippingbox.fill"
        case .volumes: return "internaldrive"
        case .networks: return "network"
        case .logs: return "terminal"
        case .events: return "waveform.path"
        }
    }

    var shortcutKey: KeyEquivalent {
        switch self {
        case .containers: return "1"
        case .stacks: return "2"
        case .images: return "3"
        case .volumes: return "4"
        case .networks: return "5"
        case .logs: return "6"
        case .events: return "7"
        }
    }
}
