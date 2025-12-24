Source: https://developer.apple.com/documentation/arkit/verifying-device-support-and-user-permission

[ Skip Navigation ](https://developer.apple.com/documentation/arkit/verifying-device-support-and-user-permission#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/arkit/verifying-device-support-and-user-permission#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/arkit/verifying-device-support-and-user-permission)
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
[ Open Menu ](https://developer.apple.com/documentation/arkit/verifying-device-support-and-user-permission)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/arkit/verifying-device-support-and-user-permission)


[](https://developer.apple.com/documentation/arkit/verifying-device-support-and-user-permission)
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
  * [ Verifying Device Support and User Permission ](https://developer.apple.com/documentation/arkit/verifying-device-support-and-user-permission)
  *     * Verifying Device Support and User Permission 


Article
# Verifying Device Support and User Permission
Check whether your app can use ARKit and respect user privacy at runtime.
## [Overview](https://developer.apple.com/documentation/arkit/verifying-device-support-and-user-permission#overview)
ARKit requires iOS 11.0 or later and an iOS device with an A9 or later processor. Some ARKit features require later iOS versions or specific devices. ARKit also uses a device camera, so you need to configure iOS privacy controls so the user can permit camera access for your app.
How to handle device compatibility support depends on how your app uses ARKit:
  * **If the basic functionality of your app requires AR (using the back camera):** Add the `arkit` key in the [UIRequiredDeviceCapabilities](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/iPhoneOSKeys.html#//apple_ref/doc/uid/TP40009252-SW3) section of your app’s `Info.plist` file. Using this key makes your app available only to ARKit-compatible devices.
  * **If augmented reality is a secondary feature of your app:** Check for whether the current device supports the AR configuration you want to use by testing the [`isSupported`](https://developer.apple.com/documentation/arkit/arconfiguration/issupported) property of the appropriate [`ARConfiguration`](https://developer.apple.com/documentation/arkit/arconfiguration) subclass.
  * **If your app uses face-tracking AR:** Face tracking requires the front-facing TrueDepth camera on iPhone X. Your app remains available on other devices, so you must test the [`ARFaceTrackingConfiguration`](https://developer.apple.com/documentation/arkit/arfacetrackingconfiguration).[`isSupported`](https://developer.apple.com/documentation/arkit/arconfiguration/issupported) property to determine face-tracking support on the current device.


Tip
Check the [`isSupported`](https://developer.apple.com/documentation/arkit/arconfiguration/issupported) property before offering AR features in your app’s UI, so that users on unsupported devices aren’t disappointed by trying to access those features.
### [Handle User Consent and Privacy](https://developer.apple.com/documentation/arkit/verifying-device-support-and-user-permission#Handle-User-Consent-and-Privacy)
For your app to use ARKit, the user must explicitly grant your app permission for camera access. ARKit automatically asks the user for permission the first time your app runs an AR session.
iOS requires your app to provide a static message to be displayed when the system asks for camera or microphone permission. Your app’s `Info.plist` file must include the [NSCameraUsageDescription](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CocoaKeys.html#//apple_ref/doc/plist/info/NSCameraUsageDescription) key. For that key, provide text that explains why your app needs camera access so that the user can feel confident granting permission to your app.
Note
If you create a new ARKit app using the Xcode template, a default camera usage description is provided for you.
If your app uses [`ARFaceTrackingConfiguration`](https://developer.apple.com/documentation/arkit/arfacetrackingconfiguration), ARKit provides your app with personal facial information. If you use ARKit face tracking features, your app must include a privacy policy describing to users how you intend to use face tracking and face data. For details, see the [Apple Developer Program License Agreement](https://developer.apple.com/terms/).
## [See Also](https://developer.apple.com/documentation/arkit/verifying-device-support-and-user-permission#see-also)
### [iOS](https://developer.apple.com/documentation/arkit/verifying-device-support-and-user-permission#iOS)
[`class ARSession`](https://developer.apple.com/documentation/arkit/arsession)
The object that manages the major tasks associated with every AR experience, such as motion tracking, camera passthrough, and image analysis.
[`class ARAnchor`](https://developer.apple.com/documentation/arkit/aranchor)
An object that specifies the position and orientation of an item in the physical environment.
[API Reference ARKit in iOS](https://developer.apple.com/documentation/arkit/arkit-in-ios)
Integrate iOS device camera and motion features to produce augmented reality experiences in your app or game.
Current page is Verifying Device Support and User Permission 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Farkit%2Fverifying-device-support-and-user-permission).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
