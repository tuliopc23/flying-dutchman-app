import Foundation

enum AppSection: String, CaseIterable, Identifiable {
    case containers
    case images
    case volumes
    case networks
    case logs
    case events

    var id: String { rawValue }

    var title: String {
        switch self {
        case .containers: return "Containers"
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
        case .images: return "shippingbox.fill"
        case .volumes: return "internaldrive"
        case .networks: return "network"
        case .logs: return "terminal"
        case .events: return "waveform.path"
        }
    }
}
