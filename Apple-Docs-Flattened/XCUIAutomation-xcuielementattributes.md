Source: https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes

[ Skip Navigation ](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes)
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
[ Open Menu ](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes)


[](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes)
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
1 of 18 symbols inside -481731363 
Identity
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
2 of 18 symbols inside -481731363 [var identifier: String](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes/identifier)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
3 of 18 symbols inside -481731363 [var elementType: XCUIElement.ElementType](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes/elementtype)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
4 of 18 symbols inside -481731363 containing 86 symbols[XCUIElement.ElementType](https://developer.apple.com/documentation/xcuiautomation/xcuielement/elementtype)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 18 symbols inside -481731363 
Value
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
6 of 18 symbols inside -481731363 [var value: Any?](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes/value)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
7 of 18 symbols inside -481731363 [var placeholderValue: String?](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes/placeholdervalue)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
8 of 18 symbols inside -481731363 [var title: String](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes/title)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
9 of 18 symbols inside -481731363 [var label: String](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes/label)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 18 symbols inside -481731363 
Interaction state
43 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ XCUIAutomation ](https://developer.apple.com/documentation/xcuiautomation)
  * [ XCUIElementAttributes ](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes)
  *     * XCUIElementAttributes 


Protocol
# XCUIElementAttributes
Attributes exposed by UI elements.
iOSiPadOSMac CatalystmacOStvOSvisionOSwatchOSXcode 16.3+
```
@[MainActor](https://developer.apple.com/documentation/Swift/MainActor)
protocol XCUIElementAttributes
```

## [Overview](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes#overview)
The [`XCUIElementAttributes`](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes) protocol adds attribute-related functionality to the [`XCUIElement`](https://developer.apple.com/documentation/xcuiautomation/xcuielement) class. Access these properties on an instance of [`XCUIElement`](https://developer.apple.com/documentation/xcuiautomation/xcuielement) to query the current state of the UI element’s attributes.
Note
The attributes provided by this protocol represent data exposed to the Accessibility system, and are available during query matching.
## [Topics](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes#topics)
### [Identity](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes#Identity)
[`var identifier: String`](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes/identifier)
The element’s accessibility identifier.
**Required**
[`var elementType: XCUIElement.ElementType`](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes/elementtype)
The type of the element.
**Required**
[`enum ElementType`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/elementtype)
The types of UI elements that you find, inspect, and interact with in a UI test.
### [Value](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes#Value)
[`var value: Any?`](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes/value)
The raw value attribute of the element.
**Required**
[`var placeholderValue: String?`](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes/placeholdervalue)
The value displayed when the element has no value.
**Required**
[`var title: String`](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes/title)
The title attribute of the element.
**Required**
[`var label: String`](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes/label)
The label attribute of the element.
**Required**
### [Interaction state](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes#Interaction-state)
[`var hasFocus: Bool`](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes/hasfocus)
The property that determines whether the element has UI focus.
**Required**
[`var isEnabled: Bool`](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes/isenabled)
Whether or not the element is enabled for user interaction.
**Required**
[`var isSelected: Bool`](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes/isselected)
The property that determines whether the element is selected.
**Required**
### [Size](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes#Size)
[`var frame: CGRect`](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes/frame)
The frame of the element in the screen’s coordinate space.
**Required**
[`var horizontalSizeClass: XCUIElement.SizeClass`](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes/horizontalsizeclass)
The horizontal size class of the element.
**Required**
[`var verticalSizeClass: XCUIElement.SizeClass`](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes/verticalsizeclass)
The vertical size class of the element.
**Required**
[`enum SizeClass`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/sizeclass)
The user interface size classes you can inspect in a UI test.
## [Relationships](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes#relationships)
### [Inherited By](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes#inherited-by)
  * [`XCUIElementSnapshot`](https://developer.apple.com/documentation/xcuiautomation/xcuielementsnapshot)


### [Conforming Types](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes#conforming-types)
  * [`XCUIApplication`](https://developer.apple.com/documentation/xcuiautomation/xcuiapplication)
  * [`XCUIElement`](https://developer.apple.com/documentation/xcuiautomation/xcuielement)


## [See Also](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes#see-also)
### [UI elements](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes#UI-elements)
[`class XCUIElement`](https://developer.apple.com/documentation/xcuiautomation/xcuielement)
A UI element in an application.
[`protocol XCUIElementSnapshot`](https://developer.apple.com/documentation/xcuiautomation/xcuielementsnapshot)
A set of attributes to express a snapshot of an element’s attributes and descendant user interface hierarchy.
[`protocol XCUIElementSnapshotProviding`](https://developer.apple.com/documentation/xcuiautomation/xcuielementsnapshotproviding)
A method to capture a snapshot of an element’s attributes and descendant user interface hierarchy.
[`class XCUICoordinate`](https://developer.apple.com/documentation/xcuiautomation/xcuicoordinate)
A location on screen relative to a UI element.
Current page is XCUIElementAttributes 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fxcuiautomation%2Fxcuielementattributes).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
