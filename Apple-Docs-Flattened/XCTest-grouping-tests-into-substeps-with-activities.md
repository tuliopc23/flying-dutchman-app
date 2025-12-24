Source: https://developer.apple.com/documentation/xctest/grouping-tests-into-substeps-with-activities

[ Skip Navigation ](https://developer.apple.com/documentation/xctest/grouping-tests-into-substeps-with-activities#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/xctest/grouping-tests-into-substeps-with-activities#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/xctest/grouping-tests-into-substeps-with-activities)
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
[ Open Menu ](https://developer.apple.com/documentation/xctest/grouping-tests-into-substeps-with-activities)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/xctest/grouping-tests-into-substeps-with-activities)


[](https://developer.apple.com/documentation/xctest/grouping-tests-into-substeps-with-activities)
## [ XCTest  ](https://developer.apple.com/documentation/xctest)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
27 of 30 symbols inside <root>
Variables
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
17 of 30 symbols inside <root>
UI tests
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
18 of 30 symbols inside <root> [XCUIAutomation](https://developer.apple.com/documentation/xcuiautomation)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
19 of 30 symbols inside <root>
Performance tests
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
20 of 30 symbols inside <root> containing 16 symbols[Performance Tests](https://developer.apple.com/documentation/xctest/performance-tests)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
21 of 30 symbols inside <root>
Activities and attachments
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
22 of 30 symbols inside <root> containing 7 symbols[Activities and Attachments](https://developer.apple.com/documentation/xctest/activities-and-attachments)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 7 symbols inside -1216764902 
Activities
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 7 symbols inside -1216764902 [Grouping Tests into Substeps with Activities](https://developer.apple.com/documentation/xctest/grouping-tests-into-substeps-with-activities)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
3 of 7 symbols inside -1216764902 containing 2 symbols[XCTContext](https://developer.apple.com/documentation/xctest/xctcontext)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
4 of 7 symbols inside -1216764902 containing 4 symbols[XCTActivity](https://developer.apple.com/documentation/xctest/xctactivity)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 7 symbols inside -1216764902 
Attachments
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 7 symbols inside -1216764902 [Adding Attachments to Tests, Activities, and Issues](https://developer.apple.com/documentation/xctest/adding-attachments-to-tests-activities-and-issues)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
7 of 7 symbols inside -1216764902 containing 28 symbols[XCTAttachment](https://developer.apple.com/documentation/xctest/xctattachment)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
23 of 30 symbols inside <root>
Test execution
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
24 of 30 symbols inside <root> containing 17 symbols[Test Execution and Observation](https://developer.apple.com/documentation/xctest/test-execution-and-observation)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
25 of 30 symbols inside <root>
Deprecated
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
26 of 30 symbols inside <root> containing 16 symbols[Deprecated Symbols](https://developer.apple.com/documentation/xctest/deprecated-symbols)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
27 of 30 symbols inside <root>
Variables
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
V
28 of 30 symbols inside <root> [var XCT_UI_TESTING_AVAILABLE: Int32](https://developer.apple.com/documentation/xctest/xct_ui_testing_available)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
29 of 30 symbols inside <root>
Functions
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
30 of 30 symbols inside <root> [func XCTAssertNoThrow<T>(@autoclosure () throws -> T, @autoclosure () -> String, file: StaticString, line: UInt)](https://developer.apple.com/documentation/xctest/xctassertnothrow\(_:_:file:line:\))
37 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ XCTest ](https://developer.apple.com/documentation/xctest)
  * [ Activities and Attachments ](https://developer.apple.com/documentation/xctest/activities-and-attachments)
  * [ Grouping Tests into Substeps with Activities ](https://developer.apple.com/documentation/xctest/grouping-tests-into-substeps-with-activities)
  *     * [ Activities and Attachments ](https://developer.apple.com/documentation/xctest/activities-and-attachments)
    * Grouping Tests into Substeps with Activities 


Article
# Grouping Tests into Substeps with Activities
Simplify test reports by creating activities that organize substeps within complex test methods.
## [Overview](https://developer.apple.com/documentation/xctest/grouping-tests-into-substeps-with-activities#overview)
Use activities to break longer test methods, such as UI tests and integration tests, into smaller named substeps.
Each activity wraps a block of code, giving the code a name. You can nest and call activities within other activities. Xcode test reports organize results by activity name, making test reports for complex, multistep tests easier to understand.
For long test methods, especially in UI tests that contain lots of steps, simplify your test methods by refactoring them into utility methods or substeps with activities.
### [Organize Long Test Methods into Substeps](https://developer.apple.com/documentation/xctest/grouping-tests-into-substeps-with-activities#Organize-Long-Test-Methods-into-Substeps)
Identify the substeps that you want to group into named activities. For example, you might break down a login UI test into three substeps: opening the login window, entering a password, and closing the login window. Then, create named activities for each substep you identify.
  * [ Swift ](https://developer.apple.com/documentation/xctest/grouping-tests-into-substeps-with-activities)
  * [ Objective-C ](https://developer.apple.com/documentation/xctest/grouping-tests-into-substeps-with-activities)


```
func testLogin() throws {
    openLoginWindow()
    enterPassword(for: .member)
    closeLoginWindow()
}


func openLoginWindow() {
    XCTContext.runActivity(named: "Open login window") { activity in
        let loginButton = app.buttons["Login"]
        
        XCTAssertTrue(loginButton.exists, "Login button is missing.")
        XCTAssertTrue(loginButton.isHittable, "Login button is not hittable.")
        XCTAssertFalse(app.staticTexts["Logged In"].exists, "Logged In label is visible and should not be.")


        loginButton.tap()
        
        let loginLabel = app.staticTexts["Login:"]
        XCTAssertTrue(loginLabel.waitForExistence(timeout: 3.0), "Login label is missing.")
    }
}


func enterPassword(for userType: TestUserType) {
    XCTContext.runActivity(named: "Enter password") { activity in
        let userNameTextField = app.textFields["user name"]
        userNameTextField.tap()
        userNameTextField.typeText(userType.userName)


        let passwordSecureTextField = app.secureTextFields["password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(userType.password)
        
        // Dismiss keyboard.
        app.children(matching: .window).firstMatch.tap()
    }
}


func closeLoginWindow() {
    XCTContext.runActivity(named: "Close login window") { activity in
        let submitLoginButton = app.buttons["Submit"]
        XCTAssertTrue(submitLoginButton.exists, "Submit button is missing.")
        XCTAssertTrue(submitLoginButton.isHittable, "Submit button is not hittable.")
        submitLoginButton.tap()
        XCTAssertTrue(app.staticTexts["Logged In"].waitForExistence(timeout: 3.0), "Logged In label is missing.")
    }
}



```

```
- (void)testLogin {
    [self openLoginWindow];
    [self enterPasswordAndUserName:@"member"];
    [self closeLoginWindow];
}


- (void)openLoginWindow {
    [XCTContext runActivityNamed:@"Open login window" block:^(id<XCTActivity> activity) {
        XCUIElement *loginButton = self.app.buttons[@"Login"];
        XCTAssertTrue(loginButton.exists, @"Login button is missing.");
        XCTAssertTrue(loginButton.isHittable, @"Login button is not hittable.");
        XCTAssertFalse(self.app.staticTexts[@"Logged In"].exists, @"Logged In label is visible and should not be.");
        [loginButton tap];
        
        XCUIElement *loginLabel = self.app.staticTexts[@"Login:"];
        BOOL loginLabelAppeared = [loginLabel waitForExistenceWithTimeout:3.0];
        XCTAssertTrue(loginLabelAppeared, @"Login label is missing.");
    }];
}


- (void)enterPasswordAndUserName:(NSString *)userName {
    [XCTContext runActivityNamed:@"Enter password" block:^(id<XCTActivity> activity) {
        XCUIElement *userNameTextField = self.app.textFields[@"user name"];
        [userNameTextField tap];
        [userNameTextField typeText:userName];
        
        XCUIElement *passwordSecureTextField = self.app.secureTextFields[@"password"];
        [passwordSecureTextField tap];
        [passwordSecureTextField typeText:@"password"];
        
        //Dismiss keyboard.
        [[[self.app childrenMatchingType:XCUIElementTypeWindow] firstMatch] tap];
    }];
}


- (void)closeLoginWindow {
    [XCTContext runActivityNamed:@"Close login window" block:^(id<XCTActivity> activity) {
        XCUIElement *submitLoginButton = self.app.buttons[@"Submit"];
        XCTAssertTrue(submitLoginButton.exists, @"Submit button is missing.");
        XCTAssertTrue(submitLoginButton.isHittable, @"Submit button is not hittable.");
        [submitLoginButton tap];


        BOOL loggedInLabelAppeared = [self.app.staticTexts[@"Logged In"] waitForExistenceWithTimeout:3.0];
        XCTAssertTrue(loggedInLabelAppeared, @"Logged In label is missing.");
    }];
}



```

Activities run against the current testing context, represented by [`XCTContext`](https://developer.apple.com/documentation/xctest/xctcontext). To run a block of code as an activity, call the [`runActivityNamed:block:`](https://developer.apple.com/documentation/xctest/xctcontext/runactivitynamed:block:) class method on `XCTContext`, passing your test code as the block to execute.
### [Build Utility Methods from Common Test Substeps](https://developer.apple.com/documentation/xctest/grouping-tests-into-substeps-with-activities#Build-Utility-Methods-from-Common-Test-Substeps)
Convert common test substeps into self-contained utility methods for reuse in multiple tests with activities. For example, if you have three UI tests that each require the user to be logged in, extract the login process into a utility method that wraps the process inside an activity called `Login`, and call the utility method from within each test method. The login activity appears in the Xcode test report for each test method that calls it.
  * [ Swift ](https://developer.apple.com/documentation/xctest/grouping-tests-into-substeps-with-activities)
  * [ Objective-C ](https://developer.apple.com/documentation/xctest/grouping-tests-into-substeps-with-activities)


```
func testAdminLoginFeatures() throws {
    let loginResult = login(for: .admin)
    try XCTAssertTrue(loginResult.get() == .admin)
    
    XCTAssertTrue(app.buttons["Admin Features"].exists, "Missing Admin Features button.")
    XCTAssertFalse(app.buttons["Member Features"].exists, "Member Features button is visible and should not be.")
}


func testMemberLoginFeatures() throws {
    let loginResult = login(for: .member)
    try XCTAssertTrue(loginResult.get() == .member)
    
    XCTAssertFalse(app.buttons["Admin Features"].exists, "Admin Features button is visible and should not be.")
    XCTAssertTrue(app.buttons["Member Features"].exists, "Missing Member Features button.")
}


func testGuestLoginFeatures() throws {
    let loginResult = login(for: .guest)
    
    switch loginResult {
    case .success:
        XCTAssertFalse(app.buttons["Admin Features"].exists, "Admin Features button is visible and should not be.")
        XCTAssertFalse(app.buttons["Member Features"].exists, "Member Features button is visible and should not be.")
    case .failure(let error):
        throw XCTSkip("Guest logins are still not working, skip this test. Error was: \(error)")
    }
}


func login(for userType: TestUserType) -> Result<TestUserType, Error> {
    return XCTContext.runActivity(named: "Login") { activity in
        performLoginUITests(for: userType)
        
        guard app.staticTexts["Logged In"].exists else {
            let screenshot = app.windows.firstMatch.screenshot()
            let attachment = XCTAttachment(screenshot: screenshot)
            attachment.lifetime = .keepAlways
            activity.add(attachment)
            return .failure(TestLoginError.invalidLogin)
        }
        return .success(userType)
    }
}



```

```
- (void)testAdminLoginFeatures {
    BOOL loginResult = [self loginForUserName:@"admin"];
    XCTAssertTrue(loginResult);
    
    XCTAssertTrue(self.app.buttons[@"Admin Features"].exists, @"Missing Admin Features button.");
    XCTAssertFalse(self.app.buttons[@"Member Features"].exists, @"Member Features button is visible and should not be.");
}


- (void)testMemberLoginFeatures {
    BOOL loginResult = [self loginForUserName:@"member"];
    XCTAssertTrue(loginResult);


    XCTAssertFalse(self.app.buttons[@"Admin Features"].exists, @"Admin Features button is visible and should not be.");
    XCTAssertTrue(self.app.buttons[@"Member Features"].exists, @"Missing Member Features button.");
}


- (void)testGuestLoginFeatures {
    BOOL loginResult = [self loginForUserName:@"guest"];
    if (loginResult == YES) {
        XCTAssertFalse(self.app.buttons[@"Admin Features"].exists, @"Admin Features button is visible and should not be.");
        XCTAssertFalse(self.app.buttons[@"Member Features"].exists, @"Member Features button is visible and should not be.");
    } else {
        XCTSkip(@"Guest logins are still not working, skip this test.");
    }
}


- (BOOL)loginForUserName:(NSString *) userName {
    __block BOOL loginSuccessful = NO;
    [XCTContext runActivityNamed:@"Login" block:^(id<XCTActivity> activity) {
        [self performLoginUITestsForUserName:userName];
        loginSuccessful = self.app.staticTexts[@"Logged In"].exists;
        if (!loginSuccessful) {
            XCUIScreenshot *screenshot = [self.app.windows.firstMatch screenshot];
            XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:screenshot];
            attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
            [activity addAttachment:attachment];
        }
    }];
    return loginSuccessful;
}



```

If the login fails, the login activity adds a screenshot as an attachment for later investigation. For more information, see [Adding Attachments to Tests, Activities, and Issues](https://developer.apple.com/documentation/xctest/adding-attachments-to-tests-activities-and-issues).
You can use `XCTContext` anywhere within your test target, not just within test methods on an [`XCTestCase`](https://developer.apple.com/documentation/xctest/xctestcase) subclass. This enables you to define activities in your own utility code, such as in custom methods on subclasses of [`XCUIApplication`](https://developer.apple.com/documentation/XCUIAutomation/XCUIApplication) or [`XCUIElement`](https://developer.apple.com/documentation/XCUIAutomation/XCUIElement).
## [See Also](https://developer.apple.com/documentation/xctest/grouping-tests-into-substeps-with-activities#see-also)
### [Activities](https://developer.apple.com/documentation/xctest/grouping-tests-into-substeps-with-activities#Activities)
[`class XCTContext`](https://developer.apple.com/documentation/xctest/xctcontext)
A proxy for the current testing context.
[`protocol XCTActivity`](https://developer.apple.com/documentation/xctest/xctactivity)
A named substep of a test method.
Current page is Grouping Tests into Substeps with Activities 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fxctest%2Fgrouping-tests-into-substeps-with-activities).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
