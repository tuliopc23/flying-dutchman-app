Source: https://developer.apple.com/documentation/arkit/anchor

[ Skip Navigation ](https://developer.apple.com/documentation/arkit/anchor#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/arkit/anchor#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/arkit/anchor)
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
[ Open Menu ](https://developer.apple.com/documentation/arkit/anchor)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/arkit/anchor)
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
rP
4 of 12 symbols inside <root> containing 5 symbols[DataProvider](https://developer.apple.com/documentation/arkit/dataprovider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
5 of 12 symbols inside <root> containing 7 symbols[Anchor](https://developer.apple.com/documentation/arkit/anchor)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 7 symbols inside 694496414 
Inspecting an anchor
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
2 of 7 symbols inside 694496414 [var id: UUID](https://developer.apple.com/documentation/arkit/anchor/id)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
3 of 7 symbols inside 694496414 [var timestamp: TimeInterval](https://developer.apple.com/documentation/arkit/anchor/timestamp)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
4 of 7 symbols inside 694496414 [var originFromAnchorTransform: simd_float4x4](https://developer.apple.com/documentation/arkit/anchor/originfromanchortransform)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 7 symbols inside 694496414 
Tracking anchors over time
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
6 of 7 symbols inside 694496414 containing 6 symbols[AnchorUpdate](https://developer.apple.com/documentation/arkit/anchorupdate)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
7 of 7 symbols inside 694496414 containing 2 symbols[AnchorUpdateSequence](https://developer.apple.com/documentation/arkit/anchorupdatesequence)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
6 of 12 symbols inside <root> containing 70 symbols[ARKit in visionOS](https://developer.apple.com/documentation/arkit/arkit-in-visionos)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
7 of 12 symbols inside <root> containing 26 symbols[ARKit in visionOS C API](https://developer.apple.com/documentation/arkit/arkit-in-visionos-c-api)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 12 symbols inside <root>
iOS
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 12 symbols inside <root> [Verifying Device Support and User Permission](https://developer.apple.com/documentation/arkit/verifying-device-support-and-user-permission)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
10 of 12 symbols inside <root> containing 37 symbols[ARSession](https://developer.apple.com/documentation/arkit/arsession)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
11 of 12 symbols inside <root> containing 8 symbols[ARAnchor](https://developer.apple.com/documentation/arkit/aranchor)
19 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ ARKit ](https://developer.apple.com/documentation/arkit)
  * [ Anchor ](https://developer.apple.com/documentation/arkit/anchor)
  *     * Anchor 


Protocol
# Anchor
The identity, location, and orientation of an object in world space.
macOS 26.0+visionOS 1.0+
```
protocol Anchor : [CustomStringConvertible](https://developer.apple.com/documentation/Swift/CustomStringConvertible), [Identifiable](https://developer.apple.com/documentation/Swift/Identifiable), [Sendable](https://developer.apple.com/documentation/Swift/Sendable)
```

## [Topics](https://developer.apple.com/documentation/arkit/anchor#topics)
### [Inspecting an anchor](https://developer.apple.com/documentation/arkit/anchor#Inspecting-an-anchor)
[`var id: UUID`](https://developer.apple.com/documentation/arkit/anchor/id)
A unique identifier that distinguishes this anchor from all other anchors.
**Required**
[`var timestamp: TimeInterval`](https://developer.apple.com/documentation/arkit/anchor/timestamp)
**Required** Default implementation provided. 
[`var originFromAnchorTransform: simd_float4x4`](https://developer.apple.com/documentation/arkit/anchor/originfromanchortransform)
The position and orientation of this anchor in world space.
**Required**
### [Tracking anchors over time](https://developer.apple.com/documentation/arkit/anchor#Tracking-anchors-over-time)
[`struct AnchorUpdate`](https://developer.apple.com/documentation/arkit/anchorupdate)
Information about the event that updated an anchor.
[`struct AnchorUpdateSequence`](https://developer.apple.com/documentation/arkit/anchorupdatesequence)
An asynchronous sequence of updates to anchors.
## [Relationships](https://developer.apple.com/documentation/arkit/anchor#relationships)
### [Inherits From](https://developer.apple.com/documentation/arkit/anchor#inherits-from)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Identifiable`](https://developer.apple.com/documentation/Swift/Identifiable)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)


### [Inherited By](https://developer.apple.com/documentation/arkit/anchor#inherited-by)
  * [`TrackableAnchor`](https://developer.apple.com/documentation/arkit/trackableanchor)


### [Conforming Types](https://developer.apple.com/documentation/arkit/anchor#conforming-types)
  * [`AccessoryAnchor`](https://developer.apple.com/documentation/arkit/accessoryanchor)
  * [`BarcodeAnchor`](https://developer.apple.com/documentation/arkit/barcodeanchor)
  * [`CameraRegionAnchor`](https://developer.apple.com/documentation/arkit/cameraregionanchor)
  * [`DeviceAnchor`](https://developer.apple.com/documentation/arkit/deviceanchor)
  * [`EnvironmentProbeAnchor`](https://developer.apple.com/documentation/arkit/environmentprobeanchor)
  * [`HandAnchor`](https://developer.apple.com/documentation/arkit/handanchor)
  * [`ImageAnchor`](https://developer.apple.com/documentation/arkit/imageanchor)
  * [`MeshAnchor`](https://developer.apple.com/documentation/arkit/meshanchor)
  * [`ObjectAnchor`](https://developer.apple.com/documentation/arkit/objectanchor)
  * [`PlaneAnchor`](https://developer.apple.com/documentation/arkit/planeanchor)
  * [`RoomAnchor`](https://developer.apple.com/documentation/arkit/roomanchor)
  * [`WorldAnchor`](https://developer.apple.com/documentation/arkit/worldanchor)


## [See Also](https://developer.apple.com/documentation/arkit/anchor#see-also)
### [visionOS](https://developer.apple.com/documentation/arkit/anchor#visionOS)
[Setting up access to ARKit data](https://developer.apple.com/documentation/visionOS/setting-up-access-to-arkit-data)
Check whether your app can use ARKit and respect people’s privacy.
[`class ARKitSession`](https://developer.apple.com/documentation/arkit/arkitsession)
The main entry point for receiving data from ARKit.
[`protocol DataProvider`](https://developer.apple.com/documentation/arkit/dataprovider)
A source of live data from ARKit.
[API Reference ARKit in visionOS](https://developer.apple.com/documentation/arkit/arkit-in-visionos)
Create immersive augmented reality experiences.
Current page is Anchor 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Farkit%2Fanchor).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
