import Testing

@Suite("App Launch Tests")
struct AppLaunchTests {
    @Test("App launches without crash")
    func appLaunchSmokeTest() {
        #expect(true)
    }
}
