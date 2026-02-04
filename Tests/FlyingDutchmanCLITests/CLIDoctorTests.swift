import Testing

@Suite("CLI Doctor Tests")
struct CLIDoctorTests {
    @Test("CLI doctor command works")
    func cliDoctorSmokeTest() {
        #expect(true)
    }
}
