Source: https://developer.apple.com/documentation/arkit/arkitsession

[ Skip Navigation ](https://developer.apple.com/documentation/arkit/arkitsession#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/arkit/arkitsession#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/arkit/arkitsession)
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
[ Open Menu ](https://developer.apple.com/documentation/arkit/arkitsession)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/arkit/arkitsession)
## [ ARKit  ](https://developer.apple.com/documentation/arkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 12 symbols inside <root>
visionOS
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 12 symbols inside <root>
visionOS
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 12 symbols inside <root> [Setting up access to ARKit data](https://developer.apple.com/documentation/visionos/setting-up-access-to-arkit-data)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
3 of 12 symbols inside <root> containing 19 symbols[ARKitSession](https://developer.apple.com/documentation/arkit/arkitsession)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 19 symbols inside 2125469592 
Starting and stopping a session
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 19 symbols inside 2125469592 [convenience init()](https://developer.apple.com/documentation/arkit/arkitsession/init\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 19 symbols inside 2125469592 [func run([any DataProvider]) async throws](https://developer.apple.com/documentation/arkit/arkitsession/run\(_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 19 symbols inside 2125469592 [func stop()](https://developer.apple.com/documentation/arkit/arkitsession/stop\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
5 of 19 symbols inside 2125469592 containing 10 symbols[ARKitSession.Error](https://developer.apple.com/documentation/arkit/arkitsession/error)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 19 symbols inside 2125469592 
Getting authorization
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
7 of 19 symbols inside 2125469592 [func requestAuthorization(for: [ARKitSession.AuthorizationType]) async -> [ARKitSession.AuthorizationType : ARKitSession.AuthorizationStatus]](https://developer.apple.com/documentation/arkit/arkitsession/requestauthorization\(for:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
8 of 19 symbols inside 2125469592 containing 8 symbols[ARKitSession.AuthorizationType](https://developer.apple.com/documentation/arkit/arkitsession/authorizationtype)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
9 of 19 symbols inside 2125469592 [func queryAuthorization(for: [ARKitSession.AuthorizationType]) async -> [ARKitSession.AuthorizationType : ARKitSession.AuthorizationStatus]](https://developer.apple.com/documentation/arkit/arkitsession/queryauthorization\(for:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
10 of 19 symbols inside 2125469592 containing 6 symbols[ARKitSession.AuthorizationStatus](https://developer.apple.com/documentation/arkit/arkitsession/authorizationstatus)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
11 of 19 symbols inside 2125469592 
Observing a session
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
12 of 19 symbols inside 2125469592 [var events: ARKitSession.Events](https://developer.apple.com/documentation/arkit/arkitsession/events-swift.property)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
13 of 19 symbols inside 2125469592 containing 6 symbols[ARKitSession.Events](https://developer.apple.com/documentation/arkit/arkitsession/events-swift.struct)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
14 of 19 symbols inside 2125469592 containing 5 symbols[ARKitSession.Event](https://developer.apple.com/documentation/arkit/arkitsession/event)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
15 of 19 symbols inside 2125469592 [var description: String](https://developer.apple.com/documentation/arkit/arkitsession/description)
31 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ ARKit ](https://developer.apple.com/documentation/arkit)
  * [ ARKitSession ](https://developer.apple.com/documentation/arkit/arkitsession)
  *     * ARKitSession 


Class
# ARKitSession
The main entry point for receiving data from ARKit.
macOS 26.0+visionOS 1.0+
```
final class ARKitSession
```

## [Overview](https://developer.apple.com/documentation/arkit/arkitsession#overview)
Sessions in ARKit require either implicit or explicit authorization. To explicitly ask for permission for a particular kind of data and choose when a person is prompted for that permission, call [`requestAuthorization(for:)`](https://developer.apple.com/documentation/arkit/arkitsession/requestauthorization\(for:\)) before [`run(_:)`](https://developer.apple.com/documentation/arkit/arkitsession/run\(_:\)).
The following shows a session that starts by requesting implicit authorization to use world sensing:
```
let planeData = PlaneDetectionProvider(alignments: [.horizontal, .vertical])


Task {
    do {
        try await self.session.run([planeData])
        // Update app based on the planeData.anchorUpdates async sequence.
    } catch {
        print("ARKitSession error:", error)
    }
}

```

Because a [`PlaneDetectionProvider`](https://developer.apple.com/documentation/arkit/planedetectionprovider) instance’s required authorizations include [`ARKitSession.AuthorizationType.worldSensing`](https://developer.apple.com/documentation/arkit/arkitsession/authorizationtype/worldsensing), the system asks someone using your app to permit world sensing before ARKit supplies any of that kind of data.
Note
ARKit stops sessions when they’re deinitialized; keep a reference to a session instance for as long as the session needs to run.
## [Topics](https://developer.apple.com/documentation/arkit/arkitsession#topics)
### [Starting and stopping a session](https://developer.apple.com/documentation/arkit/arkitsession#Starting-and-stopping-a-session)
[`convenience init()`](https://developer.apple.com/documentation/arkit/arkitsession/init\(\))
Creates a new session.
[`func run([any DataProvider]) async throws`](https://developer.apple.com/documentation/arkit/arkitsession/run\(_:\))
Runs a session with the data providers you supply.
[`func stop()`](https://developer.apple.com/documentation/arkit/arkitsession/stop\(\))
Stops all data providers running in this session.
[`struct Error`](https://developer.apple.com/documentation/arkit/arkitsession/error)
An error that might occur when running data providers on an ARKit session.
### [Getting authorization](https://developer.apple.com/documentation/arkit/arkitsession#Getting-authorization)
[`func requestAuthorization(for: [ARKitSession.AuthorizationType]) async -> [ARKitSession.AuthorizationType : ARKitSession.AuthorizationStatus]`](https://developer.apple.com/documentation/arkit/arkitsession/requestauthorization\(for:\))
Requests authorization from the user to use the specified kinds of ARKit data.
[`enum AuthorizationType`](https://developer.apple.com/documentation/arkit/arkitsession/authorizationtype)
The authorization types you can request from ARKit.
[`func queryAuthorization(for: [ARKitSession.AuthorizationType]) async -> [ARKitSession.AuthorizationType : ARKitSession.AuthorizationStatus]`](https://developer.apple.com/documentation/arkit/arkitsession/queryauthorization\(for:\))
Checks whether the current session is authorized for particular authorization types without requesting authorization.
[`enum AuthorizationStatus`](https://developer.apple.com/documentation/arkit/arkitsession/authorizationstatus)
The authorization states for a type of ARKit data.
### [Observing a session](https://developer.apple.com/documentation/arkit/arkitsession#Observing-a-session)
[`var events: ARKitSession.Events`](https://developer.apple.com/documentation/arkit/arkitsession/events-swift.property)
An asynchronous sequence of events that provide updates to the current authorization status of the session.
[`struct Events`](https://developer.apple.com/documentation/arkit/arkitsession/events-swift.struct)
A sequence of events.
[`enum Event`](https://developer.apple.com/documentation/arkit/arkitsession/event)
Enumeration of possible session events.
[`var description: String`](https://developer.apple.com/documentation/arkit/arkitsession/description)
A textual representation of this session.
### [Initializers](https://developer.apple.com/documentation/arkit/arkitsession#Initializers)
[`convenience init(device: RemoteDeviceIdentifier)`](https://developer.apple.com/documentation/arkit/arkitsession/init\(device:\))
Create a new session connected to the specified device.
### [Instance Properties](https://developer.apple.com/documentation/arkit/arkitsession#Instance-Properties)
[`var dataProviders: [any DataProvider]`](https://developer.apple.com/documentation/arkit/arkitsession/dataproviders)
A list of all data providers on this session.
## [Relationships](https://developer.apple.com/documentation/arkit/arkitsession#relationships)
### [Conforms To](https://developer.apple.com/documentation/arkit/arkitsession#conforms-to)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)


## [See Also](https://developer.apple.com/documentation/arkit/arkitsession#see-also)
### [visionOS](https://developer.apple.com/documentation/arkit/arkitsession#visionOS)
[Setting up access to ARKit data](https://developer.apple.com/documentation/visionOS/setting-up-access-to-arkit-data)
Check whether your app can use ARKit and respect people’s privacy.
[`protocol DataProvider`](https://developer.apple.com/documentation/arkit/dataprovider)
A source of live data from ARKit.
[`protocol Anchor`](https://developer.apple.com/documentation/arkit/anchor)
The identity, location, and orientation of an object in world space.
[API Reference ARKit in visionOS](https://developer.apple.com/documentation/arkit/arkit-in-visionos)
Create immersive augmented reality experiences.
Current page is ARKitSession 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Farkit%2Farkitsession).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
