Source: https://developer.apple.com/documentation/XCTest/defining-test-cases-and-test-methods

[ Skip Navigation ](https://developer.apple.com/documentation/XCTest/defining-test-cases-and-test-methods#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/XCTest/defining-test-cases-and-test-methods#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/XCTest/defining-test-cases-and-test-methods)
  * [Apple Developer](https://developer.apple.com/)


[ Search Developer Cancel  ](https://developer.apple.com/search/)
  * [Apple Developer](https://developer.apple.com/)
  * [News](https://developer.apple.com/news/)
  * [Discover](https://developer.apple.com/discover/)
  * [Design](https://developer.apple.com/design/)
  * [Develop](https://developer.apple.com/develop/)
  * [Distribute](https://developer.apple.com/distribute/)
  * [Support](https://developer.apple.com/support/)
  * [Account](https://developer.apple.com/account/)
  * [](https://developer.apple.com/search/)


Cancel 
Only search within “Documentation”
### Quick Links
  * [Downloads](https://developer.apple.com/download/)
  * [Documentation](https://developer.apple.com/documentation/)
  * [Sample Code](https://developer.apple.com/documentation/samplecode/)
  * [Videos](https://developer.apple.com/videos/)
  * [Forums](https://developer.apple.com/forums/)

5 Quick Links
[ Documentation ](https://developer.apple.com/documentation)
[ Open Menu ](https://developer.apple.com/documentation/XCTest/defining-test-cases-and-test-methods)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/XCTest/defining-test-cases-and-test-methods)


[](https://developer.apple.com/documentation/XCTest/defining-test-cases-and-test-methods)
## [ XCTest  ](https://developer.apple.com/documentation/xctest)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 30 symbols inside <root>
Test cases and test methods
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 30 symbols inside <root>
Test cases and test methods
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 30 symbols inside <root> [Defining Test Cases and Test Methods](https://developer.apple.com/documentation/xctest/defining-test-cases-and-test-methods)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
3 of 30 symbols inside <root> containing 57 symbols[XCTestCase](https://developer.apple.com/documentation/xctest/xctestcase)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
4 of 30 symbols inside <root> containing 15 symbols[XCTest](https://developer.apple.com/documentation/xctest/xctest)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 30 symbols inside <root>
Test assertions
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
6 of 30 symbols inside <root> containing 5 symbols[Boolean Assertions](https://developer.apple.com/documentation/xctest/boolean-assertions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
7 of 30 symbols inside <root> containing 5 symbols[Nil and Non-Nil Assertions](https://developer.apple.com/documentation/xctest/nil-and-non-nil-assertions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
8 of 30 symbols inside <root> containing 11 symbols[Equality and Inequality Assertions](https://developer.apple.com/documentation/xctest/equality-and-inequality-assertions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
9 of 30 symbols inside <root> containing 5 symbols[Comparable Value Assertions](https://developer.apple.com/documentation/xctest/comparable-value-assertions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
10 of 30 symbols inside <root> containing 2 symbols[Error Assertions](https://developer.apple.com/documentation/xctest/error-assertions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
11 of 30 symbols inside <root> [NSException Assertions](https://developer.apple.com/documentation/xctest/nsexception-assertions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
12 of 30 symbols inside <root> containing 2 symbols[Unconditional Test Failures](https://developer.apple.com/documentation/xctest/unconditional-test-failures)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
13 of 30 symbols inside <root> containing 7 symbols[Expected Failures](https://developer.apple.com/documentation/xctest/expected-failures)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
14 of 30 symbols inside <root> containing 4 symbols[Methods for Skipping Tests](https://developer.apple.com/documentation/xctest/methods-for-skipping-tests)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
15 of 30 symbols inside <root>
Asynchronous tests
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
16 of 30 symbols inside <root> containing 12 symbols[Asynchronous Tests and Expectations](https://developer.apple.com/documentation/xctest/asynchronous-tests-and-expectations)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
17 of 30 symbols inside <root>
UI tests
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
18 of 30 symbols inside <root> [XCUIAutomation](https://developer.apple.com/documentation/xcuiautomation)
30 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ XCTest ](https://developer.apple.com/documentation/xctest)
  * [ Defining Test Cases and Test Methods ](https://developer.apple.com/documentation/XCTest/defining-test-cases-and-test-methods)
  *     * Defining Test Cases and Test Methods 


Article
# Defining Test Cases and Test Methods
Add test cases and test methods to a test target to confirm that your code performs as expected.
## [Overview](https://developer.apple.com/documentation/XCTest/defining-test-cases-and-test-methods#overview)
Add tests to your Xcode project by writing one or more test methods, each of which verifies a specific aspect of your code. Group related test methods into test cases, each of which is a subclass of [`XCTestCase`](https://developer.apple.com/documentation/xctest/xctestcase).
To add tests to your project:
  * Create a new subclass of [`XCTestCase`](https://developer.apple.com/documentation/xctest/xctestcase) within a test target.
  * Add one or more test methods to the test case.
  * Add one or more test assertions to each test method.


A test method is an instance method on an [`XCTestCase`](https://developer.apple.com/documentation/xctest/xctestcase) subclass, with no parameters, no return value, and a name that begins with the lowercase word _test_. Test methods are automatically detected by the XCTest framework in Xcode.
Listing 1. Example test case and test method
  * [ Swift ](https://developer.apple.com/documentation/XCTest/defining-test-cases-and-test-methods)
  * [ Objective-C ](https://developer.apple.com/documentation/XCTest/defining-test-cases-and-test-methods)


```
class TableValidationTests: XCTestCase {
    /// Tests that a new table instance has zero rows and columns.
    func testEmptyTableRowAndColumnCount() {
        let table = Table()
        XCTAssertEqual(table.rowCount, 0, "Row count was not zero.")
        XCTAssertEqual(table.columnCount, 0, "Column count was not zero.")
    }
}

```

```
@interface TableValidationTests: XCTestCase
@end
@implementation TableValidationTests
/// Tests that a new table instance has zero rows and columns.
- (void)testEmptyTableRowAndColumnCount {
    Table *table = [[Table alloc] init];
    XCTAssertEqual(table.rowCount, 0, "Row count was not zero.");
    XCTAssertEqual(table.columnCount, 0, "Column count was not zero.");
}
@end

```

This example defines an [`XCTestCase`](https://developer.apple.com/documentation/xctest/xctestcase) subclass, `TableValidationTests`, with a single test method, `testEmptyTableRowAndColumnCount()`. This test method creates a new instance of a class called `Table`, and checks that its `rowCount` and `columnCount` properties are both equal to 0 after initialization.
Tip
Test case and test method names are used in Xcode’s test navigator and integration reports to group and identify tests.
To help clarify the organization of your tests, give each test case a name that summarizes the tests within it, such as `TableValidationTests`, `NetworkReachabilityTests`, or `JSONParsingTests`.
To help identify failing tests, give each test method a name that makes it clear what is tested by that method, such as `testEmptyTableRowAndColumnCount()`, `testUnreachableURLAccessThrowsAnError()`, or `testUserJSONFeedParsing()`.
### [Asserting Test Conditions](https://developer.apple.com/documentation/XCTest/defining-test-cases-and-test-methods#Asserting-Test-Conditions)
You can check (or _assert_) conditions inside test methods to make sure that your code is behaving as expected. Use the `XCTAssert` family of functions to check for Boolean conditions, `nil` or non-`nil` values, expected values, errors, or thrown exceptions.
For example, Listing 1 above uses the [`XCTAssertEqual`](https://developer.apple.com/documentation/xctest/xctassertequal) macro to assert that two integers have the same value.
## [See Also](https://developer.apple.com/documentation/XCTest/defining-test-cases-and-test-methods#see-also)
### [Test cases and test methods](https://developer.apple.com/documentation/XCTest/defining-test-cases-and-test-methods#Test-cases-and-test-methods)
[`class XCTestCase`](https://developer.apple.com/documentation/xctest/xctestcase)
The primary class for defining test cases, test methods, and performance tests.
[`class XCTest`](https://developer.apple.com/documentation/xctest/xctest)
An abstract base class for creating, managing, and executing tests.
Current page is Defining Test Cases and Test Methods 
[Apple](https://www.apple.com)
  1. [Developer](https://developer.apple.com/)
  2. [ Documentation ](https://developer.apple.com/documentation/)


###  Platforms 
Toggle Menu 
  * [iOS](https://developer.apple.com/ios/)
  * [iPadOS](https://developer.apple.com/ipados/)
  * [macOS](https://developer.apple.com/macos/)
  * [tvOS](https://developer.apple.com/tvos/)
  * [visionOS](https://developer.apple.com/visionos/)
  * [watchOS](https://developer.apple.com/watchos/)


###  Tools 
Toggle Menu 
  * [Swift](https://developer.apple.com/swift/)
  * [SwiftUI](https://developer.apple.com/swiftui/)
  * [Swift Playground](https://developer.apple.com/swift-playground/)
  * [TestFlight](https://developer.apple.com/testflight/)
  * [Xcode](https://developer.apple.com/xcode/)
  * [Xcode Cloud](https://developer.apple.com/xcode-cloud/)
  * [SF Symbols](https://developer.apple.com/sf-symbols/)


###  Topics & Technologies 
Toggle Menu 
  * [Accessibility](https://developer.apple.com/accessibility/)
  * [Accessories](https://developer.apple.com/accessories/)
  * [App Extension](https://developer.apple.com/app-extensions/)
  * [App Store](https://developer.apple.com/app-store/)
  * [Audio & Video](https://developer.apple.com/audio/)
  * [Augmented Reality](https://developer.apple.com/augmented-reality/)
  * [Design](https://developer.apple.com/design/)
  * [Distribution](https://developer.apple.com/distribute/)
  * [Education](https://developer.apple.com/education/)
  * [Fonts](https://developer.apple.com/fonts/)
  * [Games](https://developer.apple.com/games/)
  * [Health & Fitness](https://developer.apple.com/health-fitness/)
  * [In-App Purchase](https://developer.apple.com/in-app-purchase/)
  * [Localization](https://developer.apple.com/localization/)
  * [Maps & Location](https://developer.apple.com/maps/)
  * [Machine Learning & AI](https://developer.apple.com/machine-learning/)
  * [Open Source](https://opensource.apple.com/)
  * [Security](https://developer.apple.com/security/)
  * [Safari & Web](https://developer.apple.com/safari/)


###  Resources 
Toggle Menu 
  *   * [Documentation](https://developer.apple.com/documentation/)
  * [Tutorials](https://developer.apple.com/learn/)
  * [Downloads](https://developer.apple.com/download/)
  * [Forums](https://developer.apple.com/forums/)
  * [Videos](https://developer.apple.com/videos/)


###  Support 
Toggle Menu 
  * [Support Articles](https://developer.apple.com/support/articles/)
  * [Contact Us](https://developer.apple.com/contact/)
  * [Bug Reporting](https://developer.apple.com/bug-reporting/)
  * [System Status](https://developer.apple.com/system-status/)


###  Account 
Toggle Menu 
  * [Apple Developer](https://developer.apple.com/account/)
  * [App Store Connect](https://appstoreconnect.apple.com/)
  * [Certificates, IDs, & Profiles](https://developer.apple.com/account/ios/certificate/)
  * [Feedback Assistant](https://feedbackassistant.apple.com/)


###  Programs 
Toggle Menu 
  * [Apple Developer Program](https://developer.apple.com/programs/)
  * [Apple Developer Enterprise Program](https://developer.apple.com/programs/enterprise/)
  * [App Store Small Business Program](https://developer.apple.com/app-store/small-business-program/)
  * [MFi Program](https://mfi.apple.com/)
  * [News Partner Program](https://developer.apple.com/programs/news-partner/)
  * [Video Partner Program](https://developer.apple.com/programs/video-partner/)
  * [Security Bounty Program](https://developer.apple.com/security-bounty/)
  * [Security Research Device Program](https://developer.apple.com/programs/security-research-device/)


###  Events 
Toggle Menu 
  * [Meet with Apple](https://developer.apple.com/events/)
  * [Apple Developer Centers](https://developer.apple.com/events/developer-centers/)
  * [App Store Awards](https://developer.apple.com/app-store/app-store-awards/)
  * [Apple Design Awards](https://developer.apple.com/design/awards/)
  * [Apple Developer Academies](https://developer.apple.com/academies/)
  * [WWDC](https://developer.apple.com/wwdc/)


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FXCTest%2Fdefining-test-cases-and-test-methods).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
