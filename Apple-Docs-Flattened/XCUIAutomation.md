Source: https://developer.apple.com/documentation/xcuiautomation

[ Skip Navigation ](https://developer.apple.com/documentation/xcuiautomation#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/xcuiautomation#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/xcuiautomation)
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
[ Open Menu ](https://developer.apple.com/documentation/xcuiautomation)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/xcuiautomation)


[](https://developer.apple.com/documentation/xcuiautomation)
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
Framework
# XCUIAutomation
Replicate sequences of interactions and make sure that your app’s user interface behaves as intended.
Xcode 16.3+
## [Overview](https://developer.apple.com/documentation/xcuiautomation#overview)
UI testing lets you verify that when you change parts of your app’s data model, your app’s view controllers, views, and controls respond appropriately. You can also create test cases to manipulate your app’s views and controls, as if a person is interacting with your interface. Use the XCUIAutomation framework to control your app’s user interface and inspect its state. Use [XCTest](https://developer.apple.com/documentation/XCTest) to write tests that control your app using XCUIAutomation, and check if your app’s state matches your expectations.
Note
UI testing isn’t available to apps you build using the visionOS SDK. You can still use it to test compatible iPad and iPhone apps that you build using the iOS SDK but run in visionOS.
## [Topics](https://developer.apple.com/documentation/xcuiautomation#topics)
### [Essentials](https://developer.apple.com/documentation/xcuiautomation#Essentials)
[Recording UI automation for testing](https://developer.apple.com/documentation/xcuiautomation/recording-ui-automation-for-testing)
Capture and replay interaction sequences to verify your app’s behavior.
### [UI element queries](https://developer.apple.com/documentation/xcuiautomation#UI-element-queries)
[`class XCUIElementQuery`](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery)
An object that defines the search criteria a test uses to identify UI elements.
[`protocol XCUIElementTypeQueryProvider`](https://developer.apple.com/documentation/xcuiautomation/xcuielementtypequeryprovider)
A type that provides ready-made queries for locating descendant UI elements.
### [UI elements](https://developer.apple.com/documentation/xcuiautomation#UI-elements)
[`class XCUIElement`](https://developer.apple.com/documentation/xcuiautomation/xcuielement)
A UI element in an application.
[`protocol XCUIElementAttributes`](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes)
Attributes exposed by UI elements.
[`protocol XCUIElementSnapshot`](https://developer.apple.com/documentation/xcuiautomation/xcuielementsnapshot)
A set of attributes to express a snapshot of an element’s attributes and descendant user interface hierarchy.
[`protocol XCUIElementSnapshotProviding`](https://developer.apple.com/documentation/xcuiautomation/xcuielementsnapshotproviding)
A method to capture a snapshot of an element’s attributes and descendant user interface hierarchy.
[`class XCUICoordinate`](https://developer.apple.com/documentation/xcuiautomation/xcuicoordinate)
A location on screen relative to a UI element.
### [Application lifecycle](https://developer.apple.com/documentation/xcuiautomation#Application-lifecycle)
[`class XCUIApplication`](https://developer.apple.com/documentation/xcuiautomation/xcuiapplication)
A proxy that can launch, monitor, and terminate a test application.
### [Screenshots](https://developer.apple.com/documentation/xcuiautomation#Screenshots)
[`class XCUIScreen`](https://developer.apple.com/documentation/xcuiautomation/xcuiscreen)
A physical screen attached to a device.
[`class XCUIScreenshot`](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshot)
A captured image of a screen, app, or UI element state.
[`protocol XCUIScreenshotProviding`](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding)
A type that can provide a screenshot of its current UI state.
### [Device simulation](https://developer.apple.com/documentation/xcuiautomation#Device-simulation)
[`class XCUIDevice`](https://developer.apple.com/documentation/xcuiautomation/xcuidevice)
A proxy that can simulate physical buttons, device orientation, and Siri interaction for an iOS, watchOS, or tvOS device.
[`class XCUISystem`](https://developer.apple.com/documentation/xcuiautomation/xcuisystem)
A proxy that provides an interface to OS-specific properties and actions.
[`class XCUISiriService`](https://developer.apple.com/documentation/xcuiautomation/xcuisiriservice)
A proxy that simulates a device’s Siri interface.
### [Remote control simulation](https://developer.apple.com/documentation/xcuiautomation#Remote-control-simulation)
[`class XCUIRemote`](https://developer.apple.com/documentation/xcuiautomation/xcuiremote)
A class that simulates interaction with a physical remote control.
### [UI testing availability](https://developer.apple.com/documentation/xcuiautomation#UI-testing-availability)
[`var XCUI_UI_TESTING_AVAILABLE: Int32`](https://developer.apple.com/documentation/xcuiautomation/xcui_ui_testing_available)
Indicates whether the current environment supports UI testing.
Current page is XCUIAutomation 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fxcuiautomation).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
