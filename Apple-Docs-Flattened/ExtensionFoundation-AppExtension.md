Source: https://developer.apple.com/documentation/ExtensionFoundation/AppExtension

[ Skip Navigation ](https://developer.apple.com/documentation/ExtensionFoundation/AppExtension#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/ExtensionFoundation/AppExtension#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/ExtensionFoundation/AppExtension)
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
[ Open Menu ](https://developer.apple.com/documentation/ExtensionFoundation/AppExtension)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/ExtensionFoundation/AppExtension)
## [ ExtensionFoundation  ](https://developer.apple.com/documentation/extensionfoundation)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 14 symbols inside <root>
Essentials
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
1 of 16 symbols inside 1991522586 
Creating an app extension
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 16 symbols inside 1991522586 [init()](https://developer.apple.com/documentation/extensionfoundation/appextension/init\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 16 symbols inside 1991522586 
Configuring the app extension
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
4 of 16 symbols inside 1991522586 [var configuration: Self.Configuration](https://developer.apple.com/documentation/extensionfoundation/appextension/configuration-swift.property)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
5 of 16 symbols inside 1991522586 [Configuration](https://developer.apple.com/documentation/extensionfoundation/appextension/configuration-swift.associatedtype)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 16 symbols inside 1991522586 
Running the main event loop
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
7 of 16 symbols inside 1991522586 [static func main() throws](https://developer.apple.com/documentation/extensionfoundation/appextension/main\(\)-5zfjx)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
8 of 16 symbols inside 1991522586 [static func main() throws](https://developer.apple.com/documentation/extensionfoundation/appextension/main\(\)-w0u9)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 16 symbols inside 1991522586 
Instance Properties
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
10 of 16 symbols inside 1991522586 [var extensionPoint: AppExtensionPoint](https://developer.apple.com/documentation/extensionfoundation/appextension/extensionpoint)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
11 of 16 symbols inside 1991522586 
Type Aliases
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
12 of 16 symbols inside 1991522586 [AppExtension.Bind](https://developer.apple.com/documentation/extensionfoundation/appextension/bind)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
13 of 16 symbols inside 1991522586 [AppExtension.Identifier](https://developer.apple.com/documentation/extensionfoundation/appextension/identifier)
30 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ ExtensionFoundation ](https://developer.apple.com/documentation/extensionfoundation)
  * [ AppExtension ](https://developer.apple.com/documentation/ExtensionFoundation/AppExtension)
  *     * AppExtension 


Protocol
# AppExtension
An interface you use to declare the content, structure, and behavior of an app extension.
iOS 16.0+iPadOS 16.0+Mac Catalyst 16.0+macOS 13.0+tvOS 16.0+visionOS 1.1+watchOS 9.0+
```
protocol AppExtension
```

## [ Mentioned in ](https://developer.apple.com/documentation/ExtensionFoundation/AppExtension#mentions)
[](https://developer.apple.com/documentation/extensionfoundation/building-an-app-extension-to-support-a-host-app)
## [Overview](https://developer.apple.com/documentation/ExtensionFoundation/AppExtension#overview)
This type provides the entry point for an app extension, and every app extension must have a concrete type that adopts it. When a host app launches an app extension, the system looks for an object that adopts this protocol. The protocol provides default implementations of the code required to run the app extension.
When adopting this protocol, implement the [`configuration`](https://developer.apple.com/documentation/extensionfoundation/appextension/configuration-swift.property) property and provide a type capable of establishing an XPC connection to the host app. If your app extension sends only data to the host app, and doesn’t provide a UI, provide a type that implements the [`AppExtensionConfiguration`](https://developer.apple.com/documentation/extensionfoundation/appextensionconfiguration) protocol. If your extension provides UI elements for the host app to display, instead provide an instance of the [`AppExtensionSceneConfiguration`](https://developer.apple.com/documentation/ExtensionKit/AppExtensionSceneConfiguration) type.
## [Topics](https://developer.apple.com/documentation/ExtensionFoundation/AppExtension#topics)
### [Creating an app extension](https://developer.apple.com/documentation/ExtensionFoundation/AppExtension#Creating-an-app-extension)
[`init()`](https://developer.apple.com/documentation/extensionfoundation/appextension/init\(\))
Initializes the app extension and prepares it to run.
**Required**
### [Configuring the app extension](https://developer.apple.com/documentation/ExtensionFoundation/AppExtension#Configuring-the-app-extension)
[`var configuration: Self.Configuration`](https://developer.apple.com/documentation/extensionfoundation/appextension/configuration-swift.property)
The configuration details for this app extension.
**Required**
[`associatedtype Configuration : AppExtensionConfiguration`](https://developer.apple.com/documentation/extensionfoundation/appextension/configuration-swift.associatedtype)
A type that manages configuration data for an app extension.
**Required**
### [Running the main event loop](https://developer.apple.com/documentation/ExtensionFoundation/AppExtension#Running-the-main-event-loop)
[`static func main() throws`](https://developer.apple.com/documentation/extensionfoundation/appextension/main\(\)-5zfjx)
The main entry point for an app extension that doesn’t present any UI.
[`static func main() throws`](https://developer.apple.com/documentation/extensionfoundation/appextension/main\(\)-w0u9)
The main entry point for an app extension that doesn’t present any UI.
### [Instance Properties](https://developer.apple.com/documentation/ExtensionFoundation/AppExtension#Instance-Properties)
[`var extensionPoint: AppExtensionPoint`](https://developer.apple.com/documentation/extensionfoundation/appextension/extensionpoint)
**Required** Default implementation provided. 
### [Type Aliases](https://developer.apple.com/documentation/ExtensionFoundation/AppExtension#Type-Aliases)
[`typealias Bind`](https://developer.apple.com/documentation/extensionfoundation/appextension/bind)
[`typealias Identifier`](https://developer.apple.com/documentation/extensionfoundation/appextension/identifier)
[`typealias Implementing`](https://developer.apple.com/documentation/extensionfoundation/appextension/implementing)
### [Default Implementations](https://developer.apple.com/documentation/ExtensionFoundation/AppExtension#Default-Implementations)
[API Reference AppExtension Implementations](https://developer.apple.com/documentation/extensionfoundation/appextension/appextension-implementations)
## [See Also](https://developer.apple.com/documentation/ExtensionFoundation/AppExtension#see-also)
### [App-extension setup](https://developer.apple.com/documentation/ExtensionFoundation/AppExtension#App-extension-setup)
[Building an app extension to support a host app](https://developer.apple.com/documentation/extensionfoundation/building-an-app-extension-to-support-a-host-app)
Create an app extension to perform tasks in a separate process from a host app.
[`protocol AppExtensionConfiguration`](https://developer.apple.com/documentation/extensionfoundation/appextensionconfiguration)
An interface you use to configure the XPC connection in your app extension.
[`struct ConnectionHandler`](https://developer.apple.com/documentation/extensionfoundation/connectionhandler)
A type that contains a custom closure that handles incoming XPC connections.
Current page is AppExtension 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FExtensionFoundation%2FAppExtension).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
