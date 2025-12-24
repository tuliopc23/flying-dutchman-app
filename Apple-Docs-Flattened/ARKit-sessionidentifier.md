Source: https://developer.apple.com/documentation/arkit/aranchor/sessionidentifier

[ Skip Navigation ](https://developer.apple.com/documentation/arkit/aranchor/sessionidentifier#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/arkit/aranchor/sessionidentifier#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/arkit/aranchor/sessionidentifier)
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
[ Open Menu ](https://developer.apple.com/documentation/arkit/aranchor/sessionidentifier)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/arkit/aranchor/sessionidentifier)


[](https://developer.apple.com/documentation/arkit/aranchor/sessionidentifier)
## [ ARKit  ](https://developer.apple.com/documentation/arkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 12 symbols inside <root>
visionOS
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
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 8 symbols inside -1602539804 
Creating Anchors
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 8 symbols inside -1602539804 [init(transform: simd_float4x4)](https://developer.apple.com/documentation/arkit/aranchor/init\(transform:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 8 symbols inside -1602539804 [init(name: String, transform: simd_float4x4)](https://developer.apple.com/documentation/arkit/aranchor/init\(name:transform:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
4 of 8 symbols inside -1602539804 [var name: String?](https://developer.apple.com/documentation/arkit/aranchor/name)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 8 symbols inside -1602539804 
Tracking Anchors
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
6 of 8 symbols inside -1602539804 [var identifier: UUID](https://developer.apple.com/documentation/arkit/aranchor/identifier)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
7 of 8 symbols inside -1602539804 [var sessionIdentifier: UUID?](https://developer.apple.com/documentation/arkit/aranchor/sessionidentifier)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
8 of 8 symbols inside -1602539804 [var transform: simd_float4x4](https://developer.apple.com/documentation/arkit/aranchor/transform)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
12 of 12 symbols inside <root> containing 38 symbols[ARKit in iOS](https://developer.apple.com/documentation/arkit/arkit-in-ios)
20 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ ARKit ](https://developer.apple.com/documentation/arkit)
  * [ ARAnchor ](https://developer.apple.com/documentation/arkit/aranchor)
  * [ sessionIdentifier ](https://developer.apple.com/documentation/arkit/aranchor/sessionidentifier)
  *     * [ ARAnchor ](https://developer.apple.com/documentation/arkit/aranchor)
    * sessionIdentifier 


Instance Property
# sessionIdentifier
The unique identifier of the session that owns this anchor.
iOS 13.0+iPadOS 13.0+Mac Catalyst 13.1+
```
var sessionIdentifier: [UUID](https://developer.apple.com/documentation/Foundation/UUID)? { get }
```

## [Discussion](https://developer.apple.com/documentation/arkit/aranchor/sessionidentifier#Discussion)
ARKit sets this property when a user first adds an anchor to a session. In multiuser experiences, use this ID to identify the user that created the anchor.
## [See Also](https://developer.apple.com/documentation/arkit/aranchor/sessionidentifier#see-also)
### [Tracking Anchors](https://developer.apple.com/documentation/arkit/aranchor/sessionidentifier#Tracking-Anchors)
[`var identifier: UUID`](https://developer.apple.com/documentation/arkit/aranchor/identifier)
A unique identifier for the anchor.
[`var transform: simd_float4x4`](https://developer.apple.com/documentation/arkit/aranchor/transform)
A matrix encoding the position, orientation, and scale of the anchor relative to the world coordinate space of the AR session the anchor is placed in.
Current page is sessionIdentifier 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Farkit%2Faranchor%2Fsessionidentifier).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
