Source: https://developer.apple.com/documentation/ExtensionFoundation/AppExtensionConfiguration

[ Skip Navigation ](https://developer.apple.com/documentation/ExtensionFoundation/AppExtensionConfiguration#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/ExtensionFoundation/AppExtensionConfiguration#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/ExtensionFoundation/AppExtensionConfiguration)
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
[ Open Menu ](https://developer.apple.com/documentation/ExtensionFoundation/AppExtensionConfiguration)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/ExtensionFoundation/AppExtensionConfiguration)
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
1 of 2 symbols inside -26575959 
Accepting a connection to the host app
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 2 symbols inside -26575959 [func accept(connection: NSXPCConnection) -> Bool](https://developer.apple.com/documentation/extensionfoundation/appextensionconfiguration/accept\(connection:\))
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
16 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ ExtensionFoundation ](https://developer.apple.com/documentation/extensionfoundation)
  * [ AppExtensionConfiguration ](https://developer.apple.com/documentation/ExtensionFoundation/AppExtensionConfiguration)
  *     * AppExtensionConfiguration 


Protocol
# AppExtensionConfiguration
An interface you use to configure the XPC connection in your app extension.
iOS 16.0+iPadOS 16.0+Mac Catalyst 16.0+macOS 13.0+tvOS 16.0+visionOS 1.1+watchOS 9.0+
```
@[MainActor](https://developer.apple.com/documentation/Swift/MainActor) @preconcurrency
protocol AppExtensionConfiguration : [Sendable](https://developer.apple.com/documentation/Swift/Sendable)
```

## [ Mentioned in ](https://developer.apple.com/documentation/ExtensionFoundation/AppExtensionConfiguration#mentions)
[](https://developer.apple.com/documentation/extensionfoundation/building-an-app-extension-to-support-a-host-app)
## [Overview](https://developer.apple.com/documentation/ExtensionFoundation/AppExtensionConfiguration#overview)
Adopt this protocol in a custom type, and use that type to finalize the XPC connection to the host app. The host app tries to create an XPC connection to your app extension shortly after launching it. The system directs that connection request to the code in your configuration object. Use your code to provide the host with the information it needs to communicate with your app extension.
This protocol supports app extensions that don’t offer any custom UI. If your app extension provides custom UI, instead use the [`AppExtensionSceneConfiguration`](https://developer.apple.com/documentation/ExtensionKit/AppExtensionSceneConfiguration) type from [ExtensionKit](https://developer.apple.com/documentation/ExtensionKit).
## [Topics](https://developer.apple.com/documentation/ExtensionFoundation/AppExtensionConfiguration#topics)
### [Accepting a connection to the host app](https://developer.apple.com/documentation/ExtensionFoundation/AppExtensionConfiguration#Accepting-a-connection-to-the-host-app)
[`func accept(connection: NSXPCConnection) -> Bool`](https://developer.apple.com/documentation/extensionfoundation/appextensionconfiguration/accept\(connection:\))
Returns a Boolean value that indicates whether you accept an incoming connection request from the host app.
**Required**
## [Relationships](https://developer.apple.com/documentation/ExtensionFoundation/AppExtensionConfiguration#relationships)
### [Inherits From](https://developer.apple.com/documentation/ExtensionFoundation/AppExtensionConfiguration#inherits-from)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)


### [Conforming Types](https://developer.apple.com/documentation/ExtensionFoundation/AppExtensionConfiguration#conforming-types)
  * [`ConnectionHandler`](https://developer.apple.com/documentation/extensionfoundation/connectionhandler)


## [See Also](https://developer.apple.com/documentation/ExtensionFoundation/AppExtensionConfiguration#see-also)
### [App-extension setup](https://developer.apple.com/documentation/ExtensionFoundation/AppExtensionConfiguration#App-extension-setup)
[Building an app extension to support a host app](https://developer.apple.com/documentation/extensionfoundation/building-an-app-extension-to-support-a-host-app)
Create an app extension to perform tasks in a separate process from a host app.
[`protocol AppExtension`](https://developer.apple.com/documentation/extensionfoundation/appextension)
An interface you use to declare the content, structure, and behavior of an app extension.
[`struct ConnectionHandler`](https://developer.apple.com/documentation/extensionfoundation/connectionhandler)
A type that contains a custom closure that handles incoming XPC connections.
Current page is AppExtensionConfiguration 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FExtensionFoundation%2FAppExtensionConfiguration).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
