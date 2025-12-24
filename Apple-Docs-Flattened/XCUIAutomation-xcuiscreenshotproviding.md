Source: https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding

[ Skip Navigation ](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding)
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
[ Open Menu ](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding)


[](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding)
## [ XCUIAutomation  ](https://developer.apple.com/documentation/xcuiautomation)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 25 symbols inside <root>
Essentials
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
1 of 2 symbols inside 667525754 
Taking a Screenshot
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 2 symbols inside 667525754 [func screenshot() -> XCUIScreenshot](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding/screenshot\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
18 of 25 symbols inside <root>
Device simulation
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
19 of 25 symbols inside <root> containing 25 symbols[XCUIDevice](https://developer.apple.com/documentation/xcuiautomation/xcuidevice)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
20 of 25 symbols inside <root> containing 2 symbols[XCUISystem](https://developer.apple.com/documentation/xcuiautomation/xcuisystem)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
21 of 25 symbols inside <root> containing 4 symbols[XCUISiriService](https://developer.apple.com/documentation/xcuiautomation/xcuisiriservice)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
22 of 25 symbols inside <root>
Remote control simulation
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
23 of 25 symbols inside <root> containing 5 symbols[XCUIRemote](https://developer.apple.com/documentation/xcuiautomation/xcuiremote)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
24 of 25 symbols inside <root>
UI testing availability
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
V
25 of 25 symbols inside <root> [var XCUI_UI_TESTING_AVAILABLE: Int32](https://developer.apple.com/documentation/xcuiautomation/xcui_ui_testing_available)
27 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ XCUIAutomation ](https://developer.apple.com/documentation/xcuiautomation)
  * [ XCUIScreenshotProviding ](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding)
  *     * XCUIScreenshotProviding 


Protocol
# XCUIScreenshotProviding
A type that can provide a screenshot of its current UI state.
iOSiPadOSMac CatalystmacOStvOSvisionOSwatchOSXcode 16.3+
```
@[MainActor](https://developer.apple.com/documentation/Swift/MainActor)
protocol XCUIScreenshotProviding : [NSObjectProtocol](https://developer.apple.com/documentation/ObjectiveC/NSObjectProtocol)
```

## [Overview](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding#overview)
Call this protocol’s [`screenshot()`](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding/screenshot\(\)) method on an [`XCUIScreen`](https://developer.apple.com/documentation/xcuiautomation/xcuiscreen) or [`XCUIElement`](https://developer.apple.com/documentation/xcuiautomation/xcuielement) to capture a screenshot of its current UI state.
## [Topics](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding#topics)
### [Taking a Screenshot](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding#Taking-a-Screenshot)
[`func screenshot() -> XCUIScreenshot`](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding/screenshot\(\))
Takes a screenshot of a screen or UI element’s current visual state.
**Required**
## [Relationships](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding#relationships)
### [Inherits From](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding#inherits-from)
  * [`NSObjectProtocol`](https://developer.apple.com/documentation/ObjectiveC/NSObjectProtocol)


### [Conforming Types](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding#conforming-types)
  * [`XCUIApplication`](https://developer.apple.com/documentation/xcuiautomation/xcuiapplication)
  * [`XCUIElement`](https://developer.apple.com/documentation/xcuiautomation/xcuielement)
  * [`XCUIScreen`](https://developer.apple.com/documentation/xcuiautomation/xcuiscreen)


## [See Also](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding#see-also)
### [Screenshots](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding#Screenshots)
[`class XCUIScreen`](https://developer.apple.com/documentation/xcuiautomation/xcuiscreen)
A physical screen attached to a device.
[`class XCUIScreenshot`](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshot)
A captured image of a screen, app, or UI element state.
Current page is XCUIScreenshotProviding 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fxcuiautomation%2Fxcuiscreenshotproviding).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
