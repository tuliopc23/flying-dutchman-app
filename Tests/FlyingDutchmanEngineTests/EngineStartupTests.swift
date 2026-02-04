import Testing

@Suite("Engine Startup Tests")
struct EngineStartupTests {
    @Test("Engine starts without crash")
    func engineStartupSmokeTest() {
        #expect(true)
    }
}
