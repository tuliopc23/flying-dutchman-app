Source: https://developer.apple.com/documentation/xcuiautomation/xcuielement

[ Skip Navigation ](https://developer.apple.com/documentation/xcuiautomation/xcuielement#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/xcuiautomation/xcuielement#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/xcuiautomation/xcuielement)
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
[ Open Menu ](https://developer.apple.com/documentation/xcuiautomation/xcuielement)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/xcuiautomation/xcuielement)


[](https://developer.apple.com/documentation/xcuiautomation/xcuielement)
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
1 of 65 symbols inside -791677115 
Querying element state
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 65 symbols inside -791677115 [func waitForExistence(timeout: TimeInterval) -> Bool](https://developer.apple.com/documentation/xcuiautomation/xcuielement/waitforexistence\(timeout:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 65 symbols inside -791677115 [func waitForNonExistence(timeout: TimeInterval) -> Bool](https://developer.apple.com/documentation/xcuiautomation/xcuielement/waitfornonexistence\(timeout:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 65 symbols inside -791677115 [func wait<V>(for: KeyPath<XCUIElement, V>, toEqual: V, timeout: TimeInterval) -> Bool](https://developer.apple.com/documentation/xcuiautomation/xcuielement/wait\(for:toequal:timeout:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
5 of 65 symbols inside -791677115 [var exists: Bool](https://developer.apple.com/documentation/xcuiautomation/xcuielement/exists)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
6 of 65 symbols inside -791677115 [var isHittable: Bool](https://developer.apple.com/documentation/xcuiautomation/xcuielement/ishittable)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
7 of 65 symbols inside -791677115 [var debugDescription: String](https://developer.apple.com/documentation/xcuiautomation/xcuielement/debugdescription)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 65 symbols inside -791677115 
Querying descendant elements
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
9 of 65 symbols inside -791677115 [func children(matching: XCUIElement.ElementType) -> XCUIElementQuery](https://developer.apple.com/documentation/xcuiautomation/xcuielement/children\(matching:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
10 of 65 symbols inside -791677115 [func descendants(matching: XCUIElement.ElementType) -> XCUIElementQuery](https://developer.apple.com/documentation/xcuiautomation/xcuielement/descendants\(matching:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
11 of 65 symbols inside -791677115 
Typing text
90 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ XCUIAutomation ](https://developer.apple.com/documentation/xcuiautomation)
  * [ XCUIElement ](https://developer.apple.com/documentation/xcuiautomation/xcuielement)
  *     * XCUIElement 


Class
# XCUIElement
A UI element in an application.
iOSiPadOSMac CatalystmacOStvOSvisionOSwatchOSXcode 16.3+
```
@[MainActor](https://developer.apple.com/documentation/Swift/MainActor)
class XCUIElement
```

## [Overview](https://developer.apple.com/documentation/xcuiautomation/xcuielement#overview)
In macOS and iPadOS 15 and later, [`XCUIElement`](https://developer.apple.com/documentation/xcuiautomation/xcuielement) provides a way to test your app with keyboard and mouse interactions, such as typing, clicking, scrolling, and moving and pausing the pointer. In iOS, [`XCUIElement`](https://developer.apple.com/documentation/xcuiautomation/xcuielement) provides a way to test your app with gestures, such as tapping, swiping, pinching, and rotating.
Note
[`XCUIElement`](https://developer.apple.com/documentation/xcuiautomation/xcuielement) adopts the [`XCUIElementAttributes`](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes) protocol, which provides additional properties for querying the current state of a UI element’s attributes.
## [Topics](https://developer.apple.com/documentation/xcuiautomation/xcuielement#topics)
### [Querying element state](https://developer.apple.com/documentation/xcuiautomation/xcuielement#Querying-element-state)
[`func waitForExistence(timeout: TimeInterval) -> Bool`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/waitforexistence\(timeout:\))
Waits the specified amount of time for an element to exist.
[`func waitForNonExistence(timeout: TimeInterval) -> Bool`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/waitfornonexistence\(timeout:\))
Waits the specified amount of time for an element to no longer exist.
[`func wait<V>(for: KeyPath<XCUIElement, V>, toEqual: V, timeout: TimeInterval) -> Bool`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/wait\(for:toequal:timeout:\))
Waits a specified amount of time for a property value to equal a specified value.
[`var exists: Bool`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/exists)
Determines if the element exists.
[`var isHittable: Bool`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/ishittable)
Determines if the system can compute a hit point for the element.
[`var debugDescription: String`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/debugdescription)
Provides debugging information about the element.
### [Querying descendant elements](https://developer.apple.com/documentation/xcuiautomation/xcuielement#Querying-descendant-elements)
[`func children(matching: XCUIElement.ElementType) -> XCUIElementQuery`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/children\(matching:\))
Returns a query for all direct children of the element matching the type you specify.
[`func descendants(matching: XCUIElement.ElementType) -> XCUIElementQuery`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/descendants\(matching:\))
Returns a query for all descendants of the element matching the type you specify.
### [Typing text](https://developer.apple.com/documentation/xcuiautomation/xcuielement#Typing-text)
[`func typeText(String)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/typetext\(_:\))
Types a string into the element.
### [Combining keystrokes](https://developer.apple.com/documentation/xcuiautomation/xcuielement#Combining-keystrokes)
[`func typeKey(XCUIKeyboardKey, modifierFlags: XCUIElement.KeyModifierFlags)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/typekey\(_:modifierflags:\)-6gaoi)
Types a single key from the XCUIKeyboardKey enumeration with the specified modifier flags.
[`func typeKey(String, modifierFlags: XCUIElement.KeyModifierFlags)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/typekey\(_:modifierflags:\)-9ubn)
Types a single key that a string represents with the flags you specify.
[`struct XCUIKeyboardKey`](https://developer.apple.com/documentation/xcuiautomation/xcuikeyboardkey)
Constants to represent keys that have no typewritten equivalent.
[`class func perform(withKeyModifiers: XCUIElement.KeyModifierFlags, block: () -> Void)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/perform\(withkeymodifiers:block:\))
Executes a block of code while holding a combination keystroke.
[`struct KeyModifierFlags`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/keymodifierflags)
Flags for simulating combination keystrokes with keys, such as Control, Option, Shift, and Command.
### [Moving the pointer](https://developer.apple.com/documentation/xcuiautomation/xcuielement#Moving-the-pointer)
[`func hover()`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/hover\(\))
Moves the pointer over the element.
### [Clicking](https://developer.apple.com/documentation/xcuiautomation/xcuielement#Clicking)
[`func click()`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/click\(\))
Sends a click event to a hittable point computed for the element.
[`func click(forDuration: TimeInterval, thenDragTo: XCUIElement)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/click\(forduration:thendragto:\))
Clicks and holds an element for a duration you specify, and then drags it to another element.
[`func click(forDuration: TimeInterval, thenDragTo: XCUIElement, withVelocity: XCUIGestureVelocity, thenHoldForDuration: TimeInterval)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/click\(forduration:thendragto:withvelocity:thenholdforduration:\))
Clicks and holds an element for a duration, drags it at a velocity, and holds it over another element for a duration, all of which you specify.
[`func doubleClick()`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/doubleclick\(\))
Sends a double-click event to a hittable point the system computes for the element.
[`func rightClick()`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/rightclick\(\))
Sends a Control-click event to a hittable point the system computes for the element.
### [Scrolling](https://developer.apple.com/documentation/xcuiautomation/xcuielement#Scrolling)
[`func scroll(byDeltaX: CGFloat, deltaY: CGFloat)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/scroll\(bydeltax:deltay:\))
Scrolls the view by the number of x and y pixels you specify.
### [Tapping and pressing](https://developer.apple.com/documentation/xcuiautomation/xcuielement#Tapping-and-pressing)
[`func tap()`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/tap\(\))
Sends a tap event to a hittable point the system computes for the element.
[`func doubleTap()`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/doubletap\(\))
Sends a double-tap event to a hittable point the system computes for the element.
[`func press(forDuration: TimeInterval)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/press\(forduration:\))
Sends a press-and-hold gesture to a hittable point the system computes for the element, holding for the duration you specify.
[`func press(forDuration: TimeInterval, thenDragTo: XCUIElement)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/press\(forduration:thendragto:\))
Initiates a press-and-hold gesture, then drags to another element.
[`func press(forDuration: TimeInterval, thenDragTo: XCUIElement, withVelocity: XCUIGestureVelocity, thenHoldForDuration: TimeInterval)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/press\(forduration:thendragto:withvelocity:thenholdforduration:\))
Initiates a press-and-hold gesture, drags to another element at a velocity, and holds for a duration, all of which you specify.
### [Tapping multiple times](https://developer.apple.com/documentation/xcuiautomation/xcuielement#Tapping-multiple-times)
[`func twoFingerTap()`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/twofingertap\(\))
Sends a two-finger tap event to a hittable point the system computes for the element.
[`func tap(withNumberOfTaps: Int, numberOfTouches: Int)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/tap\(withnumberoftaps:numberoftouches:\))
Sends one or more taps with one or more touch points.
### [Performing gestures](https://developer.apple.com/documentation/xcuiautomation/xcuielement#Performing-gestures)
[`func swipeLeft()`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/swipeleft\(\))
Sends a swipe-left gesture.
[`func swipeLeft(velocity: XCUIGestureVelocity)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/swipeleft\(velocity:\))
Sends a swipe-left gesture with a velocity you specify.
[`func swipeRight()`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/swiperight\(\))
Sends a swipe-right gesture.
[`func swipeRight(velocity: XCUIGestureVelocity)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/swiperight\(velocity:\))
Sends a swipe-right gesture with a velocity you specify.
[`func swipeUp()`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/swipeup\(\))
Sends a swipe-up gesture.
[`func swipeUp(velocity: XCUIGestureVelocity)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/swipeup\(velocity:\))
Sends a swipe-up gesture with a velocity you specify.
[`func swipeDown()`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/swipedown\(\))
Sends a swipe-down gesture.
[`func swipeDown(velocity: XCUIGestureVelocity)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/swipedown\(velocity:\))
Sends a swipe-down gesture with a velocity you specify.
[`func pinch(withScale: CGFloat, velocity: CGFloat)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/pinch\(withscale:velocity:\))
Sends a pinching gesture with two touches.
[`func rotate(CGFloat, withVelocity: CGFloat)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/rotate\(_:withvelocity:\))
Sends a rotation gesture with two touches.
[`struct XCUIGestureVelocity`](https://developer.apple.com/documentation/xcuiautomation/xcuigesturevelocity)
A value that describes how fast a gesture moves across the screen, in pixels per second.
### [Interacting with sliders](https://developer.apple.com/documentation/xcuiautomation/xcuielement#Interacting-with-sliders)
[`var normalizedSliderPosition: CGFloat`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/normalizedsliderposition)
Returns the position of the slider’s indicator as a normalized value.
[`func adjust(toNormalizedSliderPosition: CGFloat)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/adjust\(tonormalizedsliderposition:\))
Manipulates the UI to change the value the slider displays to a new value, based on a normalized position.
### [Interacting with pickers](https://developer.apple.com/documentation/xcuiautomation/xcuielement#Interacting-with-pickers)
[`func adjust(toPickerWheelValue: String)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/adjust\(topickerwheelvalue:\))
Changes the value that the picker wheel displays.
### [Calculating coordinates](https://developer.apple.com/documentation/xcuiautomation/xcuielement#Calculating-coordinates)
[`func coordinate(withNormalizedOffset: CGVector) -> XCUICoordinate`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/coordinate\(withnormalizedoffset:\))
Creates and returns a new coordinate with a normalized offset.
### [Supporting types](https://developer.apple.com/documentation/xcuiautomation/xcuielement#Supporting-types)
[`enum ElementType`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/elementtype)
The types of UI elements that you find, inspect, and interact with in a UI test.
[`enum SizeClass`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/sizeclass)
The user interface size classes you can inspect in a UI test.
[`struct AttributeName`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/attributename)
A set of string constants that serve as keys for storing element attributes in a dictionary.
### [Deprecated methods](https://developer.apple.com/documentation/xcuiautomation/xcuielement#Deprecated-methods)
[`func swipeDown(withVelocity: XCUIGestureVelocity)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/swipedown\(withvelocity:\))
Sends a swipe-down gesture with a velocity you specify.
Deprecated
[`func swipeUp(withVelocity: XCUIGestureVelocity)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/swipeup\(withvelocity:\))
Sends a swipe-up gesture with a velocity you specify.
Deprecated
[`func swipeLeft(withVelocity: XCUIGestureVelocity)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/swipeleft\(withvelocity:\))
Sends a swipe-left gesture with a velocity you specify.
Deprecated
[`func swipeRight(withVelocity: XCUIGestureVelocity)`](https://developer.apple.com/documentation/xcuiautomation/xcuielement/swiperight\(withvelocity:\))
Sends a swipe-right gesture with a velocity you specify.
Deprecated
## [Relationships](https://developer.apple.com/documentation/xcuiautomation/xcuielement#relationships)
### [Inherits From](https://developer.apple.com/documentation/xcuiautomation/xcuielement#inherits-from)
  * [`NSObject`](https://developer.apple.com/documentation/ObjectiveC/NSObject-swift.class)


### [Inherited By](https://developer.apple.com/documentation/xcuiautomation/xcuielement#inherited-by)
  * [`XCUIApplication`](https://developer.apple.com/documentation/xcuiautomation/xcuiapplication)


### [Conforms To](https://developer.apple.com/documentation/xcuiautomation/xcuielement#conforms-to)
  * [`CVarArg`](https://developer.apple.com/documentation/Swift/CVarArg)
  * [`Copyable`](https://developer.apple.com/documentation/Swift/Copyable)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`NSObjectProtocol`](https://developer.apple.com/documentation/ObjectiveC/NSObjectProtocol)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`XCUIElementAttributes`](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes)
  * [`XCUIElementSnapshotProviding`](https://developer.apple.com/documentation/xcuiautomation/xcuielementsnapshotproviding)
  * [`XCUIElementTypeQueryProvider`](https://developer.apple.com/documentation/xcuiautomation/xcuielementtypequeryprovider)
  * [`XCUIScreenshotProviding`](https://developer.apple.com/documentation/xcuiautomation/xcuiscreenshotproviding)


## [See Also](https://developer.apple.com/documentation/xcuiautomation/xcuielement#see-also)
### [UI elements](https://developer.apple.com/documentation/xcuiautomation/xcuielement#UI-elements)
[`protocol XCUIElementAttributes`](https://developer.apple.com/documentation/xcuiautomation/xcuielementattributes)
Attributes exposed by UI elements.
[`protocol XCUIElementSnapshot`](https://developer.apple.com/documentation/xcuiautomation/xcuielementsnapshot)
A set of attributes to express a snapshot of an element’s attributes and descendant user interface hierarchy.
[`protocol XCUIElementSnapshotProviding`](https://developer.apple.com/documentation/xcuiautomation/xcuielementsnapshotproviding)
A method to capture a snapshot of an element’s attributes and descendant user interface hierarchy.
[`class XCUICoordinate`](https://developer.apple.com/documentation/xcuiautomation/xcuicoordinate)
A location on screen relative to a UI element.
Current page is XCUIElement 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fxcuiautomation%2Fxcuielement).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
