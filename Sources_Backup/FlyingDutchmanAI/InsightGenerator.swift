import Foundation
import Shared

public enum InsightGenerator {
    public static func summarizeStatus(status: EngineStatus) -> String {
        "Engine \(status.engine) is \(status.status). AI insights not yet implemented."
    }
}
