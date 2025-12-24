Source: https://developer.apple.com/documentation/arkit/building_local_experiences_with_room_tracking

[ Skip Navigation ](https://developer.apple.com/documentation/arkit/building_local_experiences_with_room_tracking#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/arkit/building_local_experiences_with_room_tracking#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/arkit/building_local_experiences_with_room_tracking)
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
[ Open Menu ](https://developer.apple.com/documentation/arkit/building_local_experiences_with_room_tracking)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/arkit/building_local_experiences_with_room_tracking)
## [ ARKit  ](https://developer.apple.com/documentation/arkit)
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
Collection
12 of 12 symbols inside <root> containing 38 symbols[ARKit in iOS](https://developer.apple.com/documentation/arkit/arkit-in-ios)
12 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ ARKit ](https://developer.apple.com/documentation/arkit)
  * [ Building local experiences with room tracking ](https://developer.apple.com/documentation/arkit/building_local_experiences_with_room_tracking)
  *     * Building local experiences with room tracking 


Sample Code
# Building local experiences with room tracking
Use room tracking in visionOS to provide custom interactions with physical spaces.
[ Download ](https://docs-assets.developer.apple.com/published/7520c7f45d/BuildingLocalExperiencesWithRoomTracking.zip)
visionOS 2.0+Xcode 16.0+
## [Overview](https://developer.apple.com/documentation/arkit/building_local_experiences_with_room_tracking#overview)
Note
This sample code project is associated with WWDC24 session [10100: Create enhanced spatial computing experiences with ARKit](https://developer.apple.com/wwdc24/10100/).
### [Configure the sample code project](https://developer.apple.com/documentation/arkit/building_local_experiences_with_room_tracking#4452915)
Because this sample uses [ARKit](https://developer.apple.com/documentation/arkit), you can only run this sample on a device, not in Simulator. This sample can run on the following:
  * An Apple Vision Pro with visionOS 2 or later


Current page is Building local experiences with room tracking 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Farkit%2Fbuilding_local_experiences_with_room_tracking).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
