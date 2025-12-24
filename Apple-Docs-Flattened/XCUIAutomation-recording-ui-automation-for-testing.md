Source: https://developer.apple.com/documentation/xcuiautomation/recording-ui-automation-for-testing

[ Skip Navigation ](https://developer.apple.com/documentation/xcuiautomation/recording-ui-automation-for-testing#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/xcuiautomation/recording-ui-automation-for-testing#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/xcuiautomation/recording-ui-automation-for-testing)
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
[ Open Menu ](https://developer.apple.com/documentation/xcuiautomation/recording-ui-automation-for-testing)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/xcuiautomation/recording-ui-automation-for-testing)


[](https://developer.apple.com/documentation/xcuiautomation/recording-ui-automation-for-testing)
## [ XCUIAutomation  ](https://developer.apple.com/documentation/xcuiautomation)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 25 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 25 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 25 symbols inside <root> [Recording UI automation for testing](https://developer.apple.com/documentation/xcuiautomation/recording-ui-automation-for-testing)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 25 symbols inside <root>
UI element queries
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
4 of 25 symbols inside <root> containing 25 symbols[XCUIElementQuery](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
5 of 25 symbols inside <root> containing 85 symbols[XCUIElementTypeQueryProvider](https://developer.apple.com/documentation/xcuiautomation/xcuielementtypequeryprovider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 25 symbols inside <root>
UI elements
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
7 of 25 symbols inside <root> containing 65 symbols[XCUIElement](https://developer.apple.com/documentation/xcuiautomation/xcuielement)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
8 of 25 symbols inside <root> containing 18 symbols[XCUIElementAttributes](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
9 of 25 symbols inside <root> containing 3 symbols[XCUIElementSnapshot](https://developer.apple.com/documentation/xcuiautomation/xcuielementsnapshot)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
10 of 25 symbols inside <root> containing 2 symbols[XCUIElementSnapshotProviding](https://developer.apple.com/documentation/xcuiautomation/xcuielementsnapshotproviding)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
11 of 25 symbols inside <root> containing 30 symbols[XCUICoordinate](https://developer.apple.com/documentation/xcuiautomation/xcuicoordinate)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 25 symbols inside <root>
Application lifecycle
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
13 of 25 symbols inside <root> containing 25 symbols[XCUIApplication](https://developer.apple.com/documentation/xcuiautomation/xcuiapplication)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
14 of 25 symbols inside <root>
Screenshots
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
15 of 25 symbols inside <root> containing 3 symbols[XCUIScreen](https://developer.apple.com/documentation/xcuiautomation/xcuiscreen)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
16 of 25 symbols inside <root> containing 3 symbols[XCUIScreenshot](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshot)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
17 of 25 symbols inside <root> containing 2 symbols[XCUIScreenshotProviding](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
18 of 25 symbols inside <root>
Device simulation
25 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ XCUIAutomation ](https://developer.apple.com/documentation/xcuiautomation)
  * [ Recording UI automation for testing ](https://developer.apple.com/documentation/xcuiautomation/recording-ui-automation-for-testing)
  *     * Recording UI automation for testing 


Article
# Recording UI automation for testing
Capture and replay interaction sequences to verify your app’s behavior.
## [Overview](https://developer.apple.com/documentation/xcuiautomation/recording-ui-automation-for-testing#Overview)
When you write UI tests with XCUIAutomation, you use [`XCUIElementQuery`](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery) to find the elements in your app that your test interacts with. You can write your own element queries, but doing so can be difficult if you aren’t familiar with the UI framework’s element hierarchy. Use UI recording to replicate your app interactions so that Xcode constructs the element queries for you.
### [Create a test class and test method](https://developer.apple.com/documentation/xcuiautomation/recording-ui-automation-for-testing#Create-a-test-class-and-test-method)
In the UI automation test target for your app, create a class that subclasses [`XCTestCase`](https://developer.apple.com/documentation/XCTest/XCTestCase). Then add a test method with no parameters, and a name that begins with the word `test`. For more information on test methods, see [Defining Test Cases and Test Methods](https://developer.apple.com/documentation/XCTest/defining-test-cases-and-test-methods).
### [Record your interaction with your app](https://developer.apple.com/documentation/xcuiautomation/recording-ui-automation-for-testing#Record-your-interaction-with-your-app)
Click in the test method body at the line where you want to record your test’s interactions with your app, and click the record button (red dot) at the edge of the editor.
![A screenshot of Xcode, showing the Record UI Test button in the editor sidebar.](https://docs-assets.developer.apple.com/published/d8c62fe86140904441270665c719e976/recording-ui-automation-xcode%402x.png)
Xcode asks if you want to start recording a UI test. Click Yes.
If your app isn’t running already, Xcode builds it and launches it. Then, as you interact with elements in your app, Xcode adds queries to the test that locate those elements, and actions that replicate your interactions with the elements. When you finish interacting with the app, stop recording by clicking the stop button at the edge of the editor.
Note
The first time you record a UI test, Xcode prompts you to grant it access to control the computer. In this alert, click Open Settings. Next, in the Accessibility privacy settings, toggle the Xcode Helper switch to the on position.
You can also record interactions with your app’s settings UI and any alert panels it creates. In these situations, you don’t need to launch your app in the test.
### [Select appropriate element queries](https://developer.apple.com/documentation/xcuiautomation/recording-ui-automation-for-testing#Select-appropriate-element-queries)
When you interact with elements in your app’s UI while recording UI automation, Xcode adds element queries to the test that locate the elements you interact with. Multiple element queries can identify the same element; for example, you can identify a button by its title, or by its index in its parent view’s collection of buttons. For each element query that Xcode adds to your test, it provides a collection of alternative queries that locate the same element.
To choose from multiple queries representing the same UI element, click the disclosure triangle next to the element query. Choose the query that best represents the meaning of the element in your app. For example, if you’re likely to move a given button when redesigning your app’s UI, but the name of the button never changes, choose a query that locates it by name instead of its index in its parent element.
To commit your choice of element query, double-click the entry in the disclosure list.
### [Verify the state of your app](https://developer.apple.com/documentation/xcuiautomation/recording-ui-automation-for-testing#Verify-the-state-of-your-app)
In your test method, after the interactions that Xcode recorded, add assertions to verify that your app’s UI is in the expected state following the interactions. Use element queries to find UI elements, and assertion macros from [XCTest](https://developer.apple.com/documentation/XCTest) to assert that the elements have the expected properties.
Note
A test method that doesn’t contain any assertions passes if it runs to completion without throwing any errors. Use this to test that recorded interactions in your app are still possible in updated versions, and that the app doesn’t crash when you interact with it.
### [Interact with multiple apps](https://developer.apple.com/documentation/xcuiautomation/recording-ui-automation-for-testing#Interact-with-multiple-apps)
You can record interaction with multiple apps in a UI test, for example, to make changes in Settings or to validate that actions you make in one of your apps are reflected in another app’s UI.
Your test can interact with any app that’s installed on the device or Simulator where you run the test. Xcode automatically creates [`XCUIApplication`](https://developer.apple.com/documentation/xcuiautomation/xcuiapplication) instances for apps you interact with while you record a test.
Current page is Recording UI automation for testing 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fxcuiautomation%2Frecording-ui-automation-for-testing).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
