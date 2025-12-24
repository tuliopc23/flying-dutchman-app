Source: https://developer.apple.com/documentation/ExtensionFoundation

[ Skip Navigation ](https://developer.apple.com/documentation/ExtensionFoundation#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/ExtensionFoundation#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/ExtensionFoundation)
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
[ Open Menu ](https://developer.apple.com/documentation/ExtensionFoundation)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/ExtensionFoundation)
## [ ExtensionFoundation  ](https://developer.apple.com/documentation/extensionfoundation)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 14 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 14 symbols inside <root> [Adding support for app extensions to your app](https://developer.apple.com/documentation/extensionfoundation/adding-support-for-app-extensions-to-your-app)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 14 symbols inside <root>
App-extension setup
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 14 symbols inside <root> [Building an app extension to support a host app](https://developer.apple.com/documentation/extensionfoundation/building-an-app-extension-to-support-a-host-app)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
5 of 14 symbols inside <root> containing 16 symbols[AppExtension](https://developer.apple.com/documentation/extensionfoundation/appextension)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
6 of 14 symbols inside <root> containing 2 symbols[AppExtensionConfiguration](https://developer.apple.com/documentation/extensionfoundation/appextensionconfiguration)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
7 of 14 symbols inside <root> containing 3 symbols[ConnectionHandler](https://developer.apple.com/documentation/extensionfoundation/connectionhandler)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 14 symbols inside <root>
Host-app configuration
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 14 symbols inside <root> [Discovering app extensions from your app](https://developer.apple.com/documentation/extensionfoundation/discovering-app-extensions-from-your-app)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
10 of 14 symbols inside <root> containing 9 symbols[AppExtensionProcess](https://developer.apple.com/documentation/extensionfoundation/appextensionprocess)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
11 of 14 symbols inside <root> containing 12 symbols[AppExtensionIdentity](https://developer.apple.com/documentation/extensionfoundation/appextensionidentity)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 14 symbols inside <root>
Extension-point management
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
13 of 14 symbols inside <root> containing 20 symbols[AppExtensionPoint](https://developer.apple.com/documentation/extensionfoundation/appextensionpoint)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
14 of 14 symbols inside <root> [ExtensionPointDefining](https://developer.apple.com/documentation/extensionfoundation/extensionpointdefining)
14 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Framework
# ExtensionFoundation
Create executable bundles to extend the functionality of other apps.
iOS 16.0+iPadOS 16.0+Mac Catalyst 16.0+macOS 13.0+tvOS 17.4+visionOS 1.1+watchOS 9.0+
## [Overview](https://developer.apple.com/documentation/ExtensionFoundation#overview)
An app extension is an executable code bundle that extends the capabilities of the system, or the capabilities of another app. At the system level, app extensions give you a way to add your custom capabilities to system features. For example, [widgets](https://developer.apple.com/documentation/WidgetKit/Creating-a-Widget-Extension) display your app’s content in specific locations like the iOS Home Screen and Lock screen. To build app extensions for system features, you typically use a different framework or a dedicated set of types instead of this framework.
Adopt the `ExtensionFoundation` framework directly when you want to add support for app extensions to your own apps. An app extension model gives you a way to extend your app’s capabilities safely in several ways. If your app needs to run risky code, you might isolate that code in an app extension to prevent it from affecting the rest of your app. Alternatively, a productivity app might give other developers a way to create app extensions that extend the app’s core feature set.
Host apps use the `ExtensionFoundation` framework to find and launch available app extensions. App extensions use this framework to communicate with the host app and support non-UI features. If your app also integrates custom UI from its app extensions, adopt the [ExtensionKit](https://developer.apple.com/documentation/ExtensionKit) framework in addition to this one.
## [Topics](https://developer.apple.com/documentation/ExtensionFoundation#topics)
### [Essentials](https://developer.apple.com/documentation/ExtensionFoundation#Essentials)
[Adding support for app extensions to your app](https://developer.apple.com/documentation/extensionfoundation/adding-support-for-app-extensions-to-your-app)
Create an app extension model by defining your code’s extension points and communicating with app extensions at runtime.
### [App-extension setup](https://developer.apple.com/documentation/ExtensionFoundation#App-extension-setup)
[Building an app extension to support a host app](https://developer.apple.com/documentation/extensionfoundation/building-an-app-extension-to-support-a-host-app)
Create an app extension to perform tasks in a separate process from a host app.
[`protocol AppExtension`](https://developer.apple.com/documentation/extensionfoundation/appextension)
An interface you use to declare the content, structure, and behavior of an app extension.
[`protocol AppExtensionConfiguration`](https://developer.apple.com/documentation/extensionfoundation/appextensionconfiguration)
An interface you use to configure the XPC connection in your app extension.
[`struct ConnectionHandler`](https://developer.apple.com/documentation/extensionfoundation/connectionhandler)
A type that contains a custom closure that handles incoming XPC connections.
### [Host-app configuration](https://developer.apple.com/documentation/ExtensionFoundation#Host-app-configuration)
[Discovering app extensions from your app](https://developer.apple.com/documentation/extensionfoundation/discovering-app-extensions-from-your-app)
Find the app extensions that match your host app’s extension points and are available to use.
[`struct AppExtensionProcess`](https://developer.apple.com/documentation/extensionfoundation/appextensionprocess)
A type the host app creates to launch and manage an app extension.
[`struct AppExtensionIdentity`](https://developer.apple.com/documentation/extensionfoundation/appextensionidentity)
A type that uniquely identifies an app extension on the system.
### [Extension-point management](https://developer.apple.com/documentation/ExtensionFoundation#Extension-point-management)
[`struct AppExtensionPoint`](https://developer.apple.com/documentation/extensionfoundation/appextensionpoint)
A type you use to declare your host app’s extension points and bind to them from app extensions.
[`protocol ExtensionPointDefining`](https://developer.apple.com/documentation/extensionfoundation/extensionpointdefining)
An interface that extension point types adopt.
Current page is ExtensionFoundation 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FExtensionFoundation).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
