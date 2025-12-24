Source: https://developer.apple.com/documentation/corelocation/cllocationupdate

[ Skip Navigation ](https://developer.apple.com/documentation/corelocation/cllocationupdate#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/corelocation/cllocationupdate#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/corelocation/cllocationupdate)
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
[ Open Menu ](https://developer.apple.com/documentation/corelocation/cllocationupdate)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/corelocation/cllocationupdate)
## [ Core Location  ](https://developer.apple.com/documentation/corelocation)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 63 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 63 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 63 symbols inside <root> [Configuring your app to use location services](https://developer.apple.com/documentation/corelocation/configuring-your-app-to-use-location-services)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 63 symbols inside <root> [Supporting live updates in SwiftUI and Mac Catalyst apps](https://developer.apple.com/documentation/corelocation/supporting-live-updates-in-swiftui-and-mac-catalyst-apps)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
4 of 63 symbols inside <root> containing 70 symbols[CLLocationManager](https://developer.apple.com/documentation/corelocation/cllocationmanager)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
5 of 63 symbols inside <root> containing 10 symbols[CLBackgroundActivitySession](https://developer.apple.com/documentation/corelocation/clbackgroundactivitysession-3mzv3)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
6 of 63 symbols inside <root> containing 17 symbols[CLLocationUpdate](https://developer.apple.com/documentation/corelocation/cllocationupdate)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 17 symbols inside 1487099664 
Determining movement and location
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
2 of 17 symbols inside 1487099664 [var isStationary: Bool](https://developer.apple.com/documentation/corelocation/cllocationupdate/isstationary)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
3 of 17 symbols inside 1487099664 [var location: CLLocation?](https://developer.apple.com/documentation/corelocation/cllocationupdate/location)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 17 symbols inside 1487099664 
Receiving location updates
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
5 of 17 symbols inside 1487099664 [static func liveUpdates(CLLocationUpdate.LiveConfiguration) -> CLLocationUpdate.Updates](https://developer.apple.com/documentation/corelocation/cllocationupdate/liveupdates\(_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
6 of 17 symbols inside 1487099664 containing 6 symbols[CLLocationUpdate.LiveConfiguration](https://developer.apple.com/documentation/corelocation/cllocationupdate/liveconfiguration)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
7 of 17 symbols inside 1487099664 containing 2 symbols[CLLocationUpdate.Updates](https://developer.apple.com/documentation/corelocation/cllocationupdate/updates)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 17 symbols inside 1487099664 
Instance Properties
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
9 of 17 symbols inside 1487099664 [var accuracyLimited: Bool](https://developer.apple.com/documentation/corelocation/cllocationupdate/accuracylimited)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
10 of 17 symbols inside 1487099664 [var authorizationDenied: Bool](https://developer.apple.com/documentation/corelocation/cllocationupdate/authorizationdenied)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
11 of 17 symbols inside 1487099664 [var authorizationDeniedGlobally: Bool](https://developer.apple.com/documentation/corelocation/cllocationupdate/authorizationdeniedglobally)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
12 of 17 symbols inside 1487099664 [var authorizationRequestInProgress: Bool](https://developer.apple.com/documentation/corelocation/cllocationupdate/authorizationrequestinprogress)
80 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Core Location ](https://developer.apple.com/documentation/corelocation)
  * [ CLLocationUpdate ](https://developer.apple.com/documentation/corelocation/cllocationupdate)
  *     * CLLocationUpdate 


Structure
# CLLocationUpdate
A structure that contains the location information the framework delivers with each update.
iOS 17.0+iPadOS 17.0+Mac Catalyst 17.0+macOS 14.0+tvOS 17.0+visionOS 1.0+watchOS 10.0+
```
struct CLLocationUpdate
```

## [ Mentioned in ](https://developer.apple.com/documentation/corelocation/cllocationupdate#mentions)
[](https://developer.apple.com/documentation/corelocation/handling-location-updates-in-the-background)
## [Overview](https://developer.apple.com/documentation/corelocation/cllocationupdate#overview)
You use `CLLocationUpate` events to observe changes in the device’s location, and to determine the activity type.
## [Topics](https://developer.apple.com/documentation/corelocation/cllocationupdate#topics)
### [Determining movement and location](https://developer.apple.com/documentation/corelocation/cllocationupdate#Determining-movement-and-location)
[`var isStationary: Bool`](https://developer.apple.com/documentation/corelocation/cllocationupdate/isstationary)
A Boolean value that indicates whether the user is stationary.
Deprecated
[`var location: CLLocation?`](https://developer.apple.com/documentation/corelocation/cllocationupdate/location)
The user’s location, if available.
### [Receiving location updates](https://developer.apple.com/documentation/corelocation/cllocationupdate#Receiving-location-updates)
[`static func liveUpdates(CLLocationUpdate.LiveConfiguration) -> CLLocationUpdate.Updates`](https://developer.apple.com/documentation/corelocation/cllocationupdate/liveupdates\(_:\))
Tells Core Location to start delivering the location updates it produces for the configuration you specify.
[`enum LiveConfiguration`](https://developer.apple.com/documentation/corelocation/cllocationupdate/liveconfiguration)
Values for indicating the kind of updates the framework delivers.
[`struct Updates`](https://developer.apple.com/documentation/corelocation/cllocationupdate/updates)
A structure that represents an asynchronous sequence of location updates.
### [Instance Properties](https://developer.apple.com/documentation/corelocation/cllocationupdate#Instance-Properties)
[`var accuracyLimited: Bool`](https://developer.apple.com/documentation/corelocation/cllocationupdate/accuracylimited)
[`var authorizationDenied: Bool`](https://developer.apple.com/documentation/corelocation/cllocationupdate/authorizationdenied)
[`var authorizationDeniedGlobally: Bool`](https://developer.apple.com/documentation/corelocation/cllocationupdate/authorizationdeniedglobally)
[`var authorizationRequestInProgress: Bool`](https://developer.apple.com/documentation/corelocation/cllocationupdate/authorizationrequestinprogress)
[`var authorizationRestricted: Bool`](https://developer.apple.com/documentation/corelocation/cllocationupdate/authorizationrestricted)
[`var insufficientlyInUse: Bool`](https://developer.apple.com/documentation/corelocation/cllocationupdate/insufficientlyinuse)
[`var locationUnavailable: Bool`](https://developer.apple.com/documentation/corelocation/cllocationupdate/locationunavailable)
[`var serviceSessionRequired: Bool`](https://developer.apple.com/documentation/corelocation/cllocationupdate/servicesessionrequired)
[`var stationary: Bool`](https://developer.apple.com/documentation/corelocation/cllocationupdate/stationary)
## [Relationships](https://developer.apple.com/documentation/corelocation/cllocationupdate#relationships)
### [Conforms To](https://developer.apple.com/documentation/corelocation/cllocationupdate#conforms-to)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)


## [See Also](https://developer.apple.com/documentation/corelocation/cllocationupdate#see-also)
### [Essentials](https://developer.apple.com/documentation/corelocation/cllocationupdate#Essentials)
[Configuring your app to use location services](https://developer.apple.com/documentation/corelocation/configuring-your-app-to-use-location-services)
Prepare your app to start collecting location data.
[Supporting live updates in SwiftUI and Mac Catalyst apps](https://developer.apple.com/documentation/corelocation/supporting-live-updates-in-swiftui-and-mac-catalyst-apps)
Enable background events by adding lifecycle event support.
[`class CLLocationManager`](https://developer.apple.com/documentation/corelocation/cllocationmanager)
The object you use to start and stop the delivery of location-related events to your app.
[`class CLBackgroundActivitySession`](https://developer.apple.com/documentation/corelocation/clbackgroundactivitysession-3mzv3)
An object that manages a visual indicator that keeps your app in use in the background, allowing it to receive updates or events.
[Adopting live updates in Core Location](https://developer.apple.com/documentation/corelocation/adopting-live-updates-in-core-location)
Simplify location delivery using asynchronous events in Swift.
[Monitoring location changes with Core Location](https://developer.apple.com/documentation/corelocation/monitoring-location-changes-with-core-location)
Define boundaries and act on user location updates.
Current page is CLLocationUpdate 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fcorelocation%2Fcllocationupdate).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
