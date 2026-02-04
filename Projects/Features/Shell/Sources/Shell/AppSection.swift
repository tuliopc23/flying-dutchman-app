import Foundation
import SwiftUI

public enum AppSection: String, CaseIterable, Identifiable {
    case containers
    case stacks
    case images
    case machines
    case kubernetes
    case volumes
    case networks
    case logs
    case events
    case debugShell

    public var id: String {
        rawValue
    }

    public var title: String {
        switch self {
        case .containers: "Containers"
        case .stacks: "Stacks"
        case .images: "Images"
        case .machines: "Machines"
        case .kubernetes: "Kubernetes"
        case .volumes: "Volumes"
        case .networks: "Networks"
        case .logs: "Logs"
        case .events: "Events"
        case .debugShell: "Debug Shell"
        }
    }

    public var systemImage: String {
        switch self {
        case .containers: "shippingbox.circle"
        case .stacks: "square.stack.3d.up"
        case .images: "shippingbox.fill"
        case .machines: "server.rack"
        case .kubernetes: "hexagon"
        case .volumes: "internaldrive"
        case .networks: "network"
        case .logs: "terminal"
        case .events: "waveform.path"
        case .debugShell: "chevron.left.slash.chevron.right"
        }
    }

    public var shortcutKey: KeyEquivalent {
        switch self {
        case .containers: "1"
        case .stacks: "2"
        case .images: "3"
        case .machines: "4"
        case .kubernetes: "5"
        case .volumes: "6"
        case .networks: "7"
        case .logs: "8"
        case .events: "9"
        case .debugShell: "0"
        }
    }
}
