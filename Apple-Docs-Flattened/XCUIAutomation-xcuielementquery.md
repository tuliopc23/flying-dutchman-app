Source: https://developer.apple.com/documentation/xcuiautomation/xcuielementquery

[ Skip Navigation ](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery)
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
[ Open Menu ](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery)


[](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery)
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
1 of 25 symbols inside 1651434992 
Creating new queries
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 25 symbols inside 1651434992 [func children(matching: XCUIElement.ElementType) -> XCUIElementQuery](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/children\(matching:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 25 symbols inside 1651434992 [func descendants(matching: XCUIElement.ElementType) -> XCUIElementQuery](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/descendants\(matching:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 25 symbols inside 1651434992 [func containing(NSPredicate) -> XCUIElementQuery](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/containing\(_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
5 of 25 symbols inside 1651434992 [func containing(XCUIElement.ElementType, identifier: String?) -> XCUIElementQuery](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/containing\(_:identifier:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
6 of 25 symbols inside 1651434992 [func matching(identifier: String) -> XCUIElementQuery](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/matching\(identifier:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
7 of 25 symbols inside 1651434992 [func matching(NSPredicate) -> XCUIElementQuery](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/matching\(_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
8 of 25 symbols inside 1651434992 [func matching(XCUIElement.ElementType, identifier: String?) -> XCUIElementQuery](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/matching\(_:identifier:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 25 symbols inside 1651434992 
Accessing matched elements
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
10 of 25 symbols inside 1651434992 [var allElementsBoundByAccessibilityElement: [XCUIElement]](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/allelementsboundbyaccessibilityelement)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
11 of 25 symbols inside 1651434992 [var allElementsBoundByIndex: [XCUIElement]](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/allelementsboundbyindex)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
12 of 25 symbols inside 1651434992 [var count: Int](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/count)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
13 of 25 symbols inside 1651434992 [var element: XCUIElement](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/element)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
14 of 25 symbols inside 1651434992 [func element(boundBy: Int) -> XCUIElement](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/element\(boundby:\))
50 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ XCUIAutomation ](https://developer.apple.com/documentation/xcuiautomation)
  * [ XCUIElementQuery ](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery)
  *     * XCUIElementQuery 


Class
# XCUIElementQuery
An object that defines the search criteria a test uses to identify UI elements.
iOSiPadOSMac CatalystmacOStvOSvisionOSwatchOSXcode 16.3+
```
@[MainActor](https://developer.apple.com/documentation/Swift/MainActor)
class XCUIElementQuery
```

## [ Mentioned in ](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery#mentions)
[](https://developer.apple.com/documentation/xcuiautomation/recording-ui-automation-for-testing)
## [Discussion](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery#Discussion)
Use element queries to find UI elements in your app that you interact with in the tests, to test for the presence of expected elements, or to discover elements to test their values.
For example, this test uses an element query to find the “Add Book” button, and after clicking the button, checks that there’s one button in an outline view cell titled “Untitled Book”. If the test can’t find the “Add Book” button, or there isn’t one “Untitled Book” cell, then the test fails.
```
@MainActor
func testClickingAddCreatesAnUntitledBook() throws {
    let app = XCUIApplication()
    app.launch()
    let list = app.windows["Reading Journal"]
    list.toolbars.children(matching: .button)["Add Book"].click()
    XCTAssertEqual(list.outlines["Sidebar"].cells.containing(.button, identifier:"Untitled Book").count, 1)
}

```

## [Topics](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery#topics)
### [Creating new queries](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery#Creating-new-queries)
[`func children(matching: XCUIElement.ElementType) -> XCUIElementQuery`](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/children\(matching:\))
Returns a new query that matches all direct children of the requested type.
[`func descendants(matching: XCUIElement.ElementType) -> XCUIElementQuery`](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/descendants\(matching:\))
Returns a new query that matches all descendants of the requested type.
[`func containing(NSPredicate) -> XCUIElementQuery`](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/containing\(_:\))
Returns a new query that matches elements containing a descendant that meets the logical conditions of the provided predicate.
[`func containing(XCUIElement.ElementType, identifier: String?) -> XCUIElementQuery`](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/containing\(_:identifier:\))
Returns a new query that matches elements that contain a descendant of the requested type and an identifying property that matches a provided identifier.
[`func matching(identifier: String) -> XCUIElementQuery`](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/matching\(identifier:\))
Returns a new query that matches elements that have an identifying property that matches a provided identifier.
[`func matching(NSPredicate) -> XCUIElementQuery`](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/matching\(_:\))
Returns a new query that matches elements that meet the logical conditions of the provided predicate.
[`func matching(XCUIElement.ElementType, identifier: String?) -> XCUIElementQuery`](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/matching\(_:identifier:\))
Returns a new query that matches elements of the requested type and have an identifying property that matches a provided identifier.
### [Accessing matched elements](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery#Accessing-matched-elements)
[`var allElementsBoundByAccessibilityElement: [XCUIElement]`](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/allelementsboundbyaccessibilityelement)
Immediately evaluates the query and returns an array of elements bound to the resulting accessibility elements.
[`var allElementsBoundByIndex: [XCUIElement]`](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/allelementsboundbyindex)
Immediately evaluates the query and returns an array of elements bound by the index of each result.
[`var count: Int`](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/count)
Evaluates the query and returns the number of elements that match.
[`var element: XCUIElement`](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/element)
The query’s single matching element.
[`func element(boundBy: Int) -> XCUIElement`](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/element\(boundby:\))
Uses an index into the query’s results to determine which underlying accessibility element to use.
[`func element(matching: NSPredicate) -> XCUIElement`](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/element\(matching:\))
Matches the predicate.
[`func element(matching: XCUIElement.ElementType, identifier: String?) -> XCUIElement`](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/element\(matching:identifier:\))
Matches the provided element type and identifier.
[`subscript(String) -> XCUIElement`](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/subscript\(_:\))
Returns a descendant element that matches a provided identifier.
[`func element(at: Int) -> XCUIElement`](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/element\(at:\))
Returns an element that resolves to the index into the query’s result set.
Deprecated
### [Debugging element queries](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery#Debugging-element-queries)
[`var debugDescription: String`](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery/debugdescription)
Provides debugging information about the query.
### [Identifying window buttons](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery#Identifying-window-buttons)
[`let XCUIIdentifierCloseWindow: String`](https://developer.apple.com/documentation/xcuiautomation/xcuiidentifierclosewindow)
The identifier for a window’s close button.
[`let XCUIIdentifierFullScreenWindow: String`](https://developer.apple.com/documentation/xcuiautomation/xcuiidentifierfullscreenwindow)
The identifier for a window’s full-screen button.
[`let XCUIIdentifierMinimizeWindow: String`](https://developer.apple.com/documentation/xcuiautomation/xcuiidentifierminimizewindow)
The identifier for a window’s minimize button.
[`let XCUIIdentifierZoomWindow: String`](https://developer.apple.com/documentation/xcuiautomation/xcuiidentifierzoomwindow)
The identifier for a window’s zoom button.
## [Relationships](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery#relationships)
### [Inherits From](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery#inherits-from)
  * [`NSObject`](https://developer.apple.com/documentation/ObjectiveC/NSObject-swift.class)


### [Conforms To](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery#conforms-to)
  * [`CVarArg`](https://developer.apple.com/documentation/Swift/CVarArg)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`NSObjectProtocol`](https://developer.apple.com/documentation/ObjectiveC/NSObjectProtocol)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`XCUIElementTypeQueryProvider`](https://developer.apple.com/documentation/xcuiautomation/xcuielementtypequeryprovider)


## [See Also](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery#see-also)
### [UI element queries](https://developer.apple.com/documentation/xcuiautomation/xcuielementquery#UI-element-queries)
[`protocol XCUIElementTypeQueryProvider`](https://developer.apple.com/documentation/xcuiautomation/xcuielementtypequeryprovider)
A type that provides ready-made queries for locating descendant UI elements.
Current page is XCUIElementQuery 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fxcuiautomation%2Fxcuielementquery).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
