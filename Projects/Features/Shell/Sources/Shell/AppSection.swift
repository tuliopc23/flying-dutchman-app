import Foundation
import SwiftUI

public enum AppSection: String, CaseIterable, Identifiable {
    case containers
    case stacks
    case images
    case volumes
    case networks
    case logs
    case events

    public var id: String {
        rawValue
    }

    public var title: String {
        switch self {
        case .containers: "Containers"
        case .stacks: "Stacks"
        case .images: "Images"
        case .volumes: "Volumes"
        case .networks: "Networks"
        case .logs: "Logs"
        case .events: "Events"
        }
    }

    public var systemImage: String {
        switch self {
        case .containers: "shippingbox.circle"
        case .stacks: "square.stack.3d.up"
        case .images: "shippingbox.fill"
        case .volumes: "internaldrive"
        case .networks: "network"
        case .logs: "terminal"
        case .events: "waveform.path"
        }
    }

    public var shortcutKey: KeyEquivalent {
        switch self {
        case .containers: "1"
        case .stacks: "2"
        case .images: "3"
        case .volumes: "4"
        case .networks: "5"
        case .logs: "6"
        case .events: "7"
        }
    }
}
