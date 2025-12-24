Source: https://developer.apple.com/documentation/ExtensionKit

[ Skip Navigation ](https://developer.apple.com/documentation/ExtensionKit#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/ExtensionKit#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/ExtensionKit)
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
[ Open Menu ](https://developer.apple.com/documentation/ExtensionKit)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/ExtensionKit)
## [ ExtensionKit  ](https://developer.apple.com/documentation/extensionkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 12 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 12 symbols inside <root> [Including extension-based UI in your interface](https://developer.apple.com/documentation/extensionkit/including-extension-based-ui-in-your-interface)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 12 symbols inside <root>
UI definition
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
4 of 12 symbols inside <root> containing 3 symbols[AppExtensionScene](https://developer.apple.com/documentation/extensionkit/appextensionscene)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
5 of 12 symbols inside <root> containing 8 symbols[PrimitiveAppExtensionScene](https://developer.apple.com/documentation/extensionkit/primitiveappextensionscene)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
6 of 12 symbols inside <root> containing 11 symbols[AppExtensionSceneBuilder](https://developer.apple.com/documentation/extensionkit/appextensionscenebuilder)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 12 symbols inside <root>
App extension configuration
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
8 of 12 symbols inside <root> containing 5 symbols[AppExtensionSceneConfiguration](https://developer.apple.com/documentation/extensionkit/appextensionsceneconfiguration)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 12 symbols inside <root>
Host app presentation
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 12 symbols inside <root> [Displaying the app extensions available to your app](https://developer.apple.com/documentation/extensionkit/displaying-the-app-extensions-available-to-your-app)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
11 of 12 symbols inside <root> containing 9 symbols[EXHostViewController](https://developer.apple.com/documentation/extensionkit/exhostviewcontroller)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
12 of 12 symbols inside <root> [EXAppExtensionBrowserViewController](https://developer.apple.com/documentation/extensionkit/exappextensionbrowserviewcontroller)
12 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Framework
# ExtensionKit
Make custom UI from an app extension available in a host app, and manage the list of enabled and disabled app extensions.
iOS 16.1+iPadOS 16.1+Mac Catalyst 16.0+macOS 13.0+tvOS 16.0+visionOS 1.0+watchOS 10.0+
## [Overview](https://developer.apple.com/documentation/ExtensionKit#overview)
An app extension is a code bundle that extends the capabilities of the system, or the capabilities of another app. At the system level, app extensions give you a way to add your custom capabilities to system features. For example, [widgets](https://developer.apple.com/documentation/WidgetKit/Creating-a-Widget-Extension) display your app’s content in specific locations like the iOS Home Screen and Lock screen. System features typically provide a custom workflow for building the associated app extension, but still use this framework to implement support for those features.
If your app supports the incorporation of content from custom app extensions, adopt this framework and the [ExtensionFoundation](https://developer.apple.com/documentation/ExtensionFoundation) framework to support that capability. Adopt `ExtensionKit` in your app extensions and use it to define the views you want to display. In a host app, use this framework to present the interfaces that app extensions provide. This framework also provides a view controller to show enabled and disabled app extensions from your app’s interface.
## [Topics](https://developer.apple.com/documentation/ExtensionKit#topics)
### [Essentials](https://developer.apple.com/documentation/ExtensionKit#Essentials)
[Including extension-based UI in your interface](https://developer.apple.com/documentation/extensionkit/including-extension-based-ui-in-your-interface)
Build app extensions that provide a custom UI, and host those views in your app’s interface.
### [UI definition](https://developer.apple.com/documentation/ExtensionKit#UI-definition)
[`protocol AppExtensionScene`](https://developer.apple.com/documentation/extensionkit/appextensionscene)
An interface you use to provide a specific scene from your app extension’s UI.
[`struct PrimitiveAppExtensionScene`](https://developer.apple.com/documentation/extensionkit/primitiveappextensionscene)
A type you use to deliver the contents of your app-extension-based UI.
[`struct AppExtensionSceneBuilder`](https://developer.apple.com/documentation/extensionkit/appextensionscenebuilder)
A custom parameter attribute that constructs extension scenes from closures.
### [App extension configuration](https://developer.apple.com/documentation/ExtensionKit#App-extension-configuration)
[`struct AppExtensionSceneConfiguration`](https://developer.apple.com/documentation/extensionkit/appextensionsceneconfiguration)
An object you use to configure an app extension that provides a custom UI.
### [Host app presentation](https://developer.apple.com/documentation/ExtensionKit#Host-app-presentation)
[Displaying the app extensions available to your app](https://developer.apple.com/documentation/extensionkit/displaying-the-app-extensions-available-to-your-app)
Show the app extensions available to your app, so that people can approve, enable, or disable them.
[`class EXHostViewController`](https://developer.apple.com/documentation/extensionkit/exhostviewcontroller)
A view controller that hosts remote views provided by an app extension.
[`class EXAppExtensionBrowserViewController`](https://developer.apple.com/documentation/extensionkit/exappextensionbrowserviewcontroller)
A view controller that displays an interface to enable or disable the host app’s extensions.
Current page is ExtensionKit 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FExtensionKit).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
