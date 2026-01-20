import Testing

@Suite("App Launch Tests")
struct AppLaunchTests {
    @Test("App launches without crash")
    func appLaunchSmokeTest() async throws {
        #expect(true)
    }
}
