Source: https://developer.apple.com/documentation/XCTest

[ Skip Navigation ](https://developer.apple.com/documentation/XCTest#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/XCTest#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/XCTest)
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
[ Open Menu ](https://developer.apple.com/documentation/XCTest)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/XCTest)


[](https://developer.apple.com/documentation/XCTest)
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
Framework
# XCTest
Create and run unit tests, performance tests, and UI tests for your Xcode project.
xcode 5.0+
## [Overview](https://developer.apple.com/documentation/XCTest#overview)
Use the XCTest framework to write unit tests for your Xcode projects that integrate seamlessly with Xcode’s testing workflow.
Tests assert that certain conditions are satisfied during code execution, and record test failures (with optional messages) if those conditions aren’t satisfied. Tests can also measure the performance of blocks of code to check for performance regressions. Use XCTest in combination with [XCUIAutomation](https://developer.apple.com/documentation/XCUIAutomation) to interact with an application’s UI and validate user interaction flows. For more information, see [Recording UI automation for testing](https://developer.apple.com/documentation/XCUIAutomation/recording-ui-automation-for-testing).
Tip
Xcode 16 and later includes Swift Testing, a framework for writing unit tests that takes advantage of the powerful capabilities of the Swift programming language. Consider using Swift Testing for new unit test development and migrating existing tests as described in [Migrating a test from XCTest](https://developer.apple.com/documentation/Testing/MigratingFromXCTest). A test target can contain tests using both Swift Testing and XCTest, however don’t mix API from the two frameworks in the same test. Continue to use XCTest for user interface tests and [Performance Tests](https://developer.apple.com/documentation/xctest/performance-tests).
## [Topics](https://developer.apple.com/documentation/XCTest#topics)
### [Test cases and test methods](https://developer.apple.com/documentation/XCTest#Test-cases-and-test-methods)
[Defining Test Cases and Test Methods](https://developer.apple.com/documentation/xctest/defining-test-cases-and-test-methods)
Add test cases and test methods to a test target to confirm that your code performs as expected.
[`class XCTestCase`](https://developer.apple.com/documentation/xctest/xctestcase)
The primary class for defining test cases, test methods, and performance tests.
[`class XCTest`](https://developer.apple.com/documentation/xctest/xctest)
An abstract base class for creating, managing, and executing tests.
### [Test assertions](https://developer.apple.com/documentation/XCTest#Test-assertions)
[API Reference Boolean Assertions](https://developer.apple.com/documentation/xctest/boolean-assertions)
Test a condition that generates a true or false result.
[API Reference Nil and Non-Nil Assertions](https://developer.apple.com/documentation/xctest/nil-and-non-nil-assertions)
Check whether a test condition has, or doesn’t have, a value.
[API Reference Equality and Inequality Assertions](https://developer.apple.com/documentation/xctest/equality-and-inequality-assertions)
Check whether two values are equal or unequal.
[API Reference Comparable Value Assertions](https://developer.apple.com/documentation/xctest/comparable-value-assertions)
Compare two values to determine whether one is larger or smaller than the other.
[API Reference Error Assertions](https://developer.apple.com/documentation/xctest/error-assertions)
Check whether a function call throws, or doesn’t throw, an error.
[API Reference NSException Assertions](https://developer.apple.com/documentation/xctest/nsexception-assertions)
Check whether a function call throws, or doesn’t throw, an exception.
[API Reference Unconditional Test Failures](https://developer.apple.com/documentation/xctest/unconditional-test-failures)
Generate a failure immediately and unconditionally.
[API Reference Expected Failures](https://developer.apple.com/documentation/xctest/expected-failures)
Anticipate known test failures to prevent failing tests from affecting your workflows.
[API Reference Methods for Skipping Tests](https://developer.apple.com/documentation/xctest/methods-for-skipping-tests)
Skip tests when meeting specified conditions.
### [Asynchronous tests](https://developer.apple.com/documentation/XCTest#Asynchronous-tests)
[API Reference Asynchronous Tests and Expectations](https://developer.apple.com/documentation/xctest/asynchronous-tests-and-expectations)
Verify that asynchronous code behaves as expected.
### [UI tests](https://developer.apple.com/documentation/XCTest#UI-tests)
[XCUIAutomation](https://developer.apple.com/documentation/XCUIAutomation)
Replicate sequences of interactions and make sure that your app’s user interface behaves as intended.
### [Performance tests](https://developer.apple.com/documentation/XCTest#Performance-tests)
[API Reference Performance Tests](https://developer.apple.com/documentation/xctest/performance-tests)
Gather metrics while running your code, and report a failure if the metrics become significantly worse than a baseline value.
### [Activities and attachments](https://developer.apple.com/documentation/XCTest#Activities-and-attachments)
[API Reference Activities and Attachments](https://developer.apple.com/documentation/xctest/activities-and-attachments)
Split long tests into substeps with activities, and attach output data like files and screenshots.
### [Test execution](https://developer.apple.com/documentation/XCTest#Test-execution)
[API Reference Test Execution and Observation](https://developer.apple.com/documentation/xctest/test-execution-and-observation)
Observe, introspect, and customize the test execution flow.
### [Deprecated](https://developer.apple.com/documentation/XCTest#Deprecated)
[API Reference Deprecated Symbols](https://developer.apple.com/documentation/xctest/deprecated-symbols)
These symbols are deprecated and are no longer recommended.
### [Variables](https://developer.apple.com/documentation/XCTest#Variables)
[`var XCT_UI_TESTING_AVAILABLE: Int32`](https://developer.apple.com/documentation/xctest/xct_ui_testing_available)
### [Functions](https://developer.apple.com/documentation/XCTest#Functions)
[`func XCTAssertNoThrow<T>(@autoclosure () throws -> T, @autoclosure () -> String, file: StaticString, line: UInt)`](https://developer.apple.com/documentation/xctest/xctassertnothrow\(_:_:file:line:\))
Asserts that an expression doesn’t throw an error.
Current page is XCTest 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FXCTest).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
