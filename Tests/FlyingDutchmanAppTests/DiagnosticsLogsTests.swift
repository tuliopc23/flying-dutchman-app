import Foundation
@testable import Diagnostics
import Testing

@Suite("Diagnostics Logs Tests")
struct DiagnosticsLogsTests {
    @Test("Logs view model shows recovery guidance when live logs cannot be loaded")
    func logsViewModelSurfacesRecoveryGuidanceOnFailure() throws {
        let fallback = LogsViewModel.liveLogsUnavailableState(for: URLError(.cannotConnectToHost))

        let firstLine = try #require(fallback.lines.first)
        #expect(firstLine.hasPrefix("Logs unavailable:"))
        #expect(fallback.message == LogsViewModel.liveLogsUnavailableMessage)
        #expect(!fallback.message.contains("stub"))
    }
}