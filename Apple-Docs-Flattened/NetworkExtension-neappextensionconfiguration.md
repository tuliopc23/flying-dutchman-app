Source: https://developer.apple.com/documentation/networkextension/neappextensionconfiguration

[ Skip Navigation ](https://developer.apple.com/documentation/networkextension/neappextensionconfiguration#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/networkextension/neappextensionconfiguration#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/networkextension/neappextensionconfiguration)
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
[ Open Menu ](https://developer.apple.com/documentation/networkextension/neappextensionconfiguration)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/networkextension/neappextensionconfiguration)
## [ Network Extension  ](https://developer.apple.com/documentation/networkextension)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
16 of 32 symbols inside <root> containing 6 symbols[URL filters](https://developer.apple.com/documentation/networkextension/url-filters)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
17 of 32 symbols inside <root>
DNS configurations
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
18 of 32 symbols inside <root> containing 6 symbols[DNS settings](https://developer.apple.com/documentation/networkextension/dns-settings)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
19 of 32 symbols inside <root> containing 12 symbols[DNS proxy provider](https://developer.apple.com/documentation/networkextension/dns-proxy-provider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
20 of 32 symbols inside <root>
Local networking
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
21 of 32 symbols inside <root> containing 5 symbols[Local push connectivity](https://developer.apple.com/documentation/networkextension/local-push-connectivity)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
22 of 32 symbols inside <root>
App extensions
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
23 of 32 symbols inside <root> containing 2 symbols[NEAppExtensionConfiguration](https://developer.apple.com/documentation/networkextension/neappextensionconfiguration)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 2 symbols inside 1304495922 
Communicating over XPC
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 2 symbols inside 1304495922 [func accept(connection: NSXPCConnection) -> Bool](https://developer.apple.com/documentation/networkextension/neappextensionconfiguration/accept\(connection:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
24 of 32 symbols inside <root>
Protocols
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
25 of 32 symbols inside <root> containing 2 symbols[NEAppProxyUDPFlowHandling](https://developer.apple.com/documentation/networkextension/neappproxyudpflowhandling)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
26 of 32 symbols inside <root>
Structures
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
27 of 32 symbols inside <root> containing 8 symbols[NETunnelProviderError](https://developer.apple.com/documentation/networkextension/netunnelprovidererror-swift.struct)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
28 of 32 symbols inside <root> containing 11 symbols[NEVPNError](https://developer.apple.com/documentation/networkextension/nevpnerror-swift.struct)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
29 of 32 symbols inside <root>
Variables
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
V
30 of 32 symbols inside <root> [let NERelayClientErrorDomain: String](https://developer.apple.com/documentation/networkextension/nerelayclienterrordomain)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
31 of 32 symbols inside <root>
Enumerations
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
32 of 32 symbols inside <root> containing 13 symbols[NERelayManagerClientError](https://developer.apple.com/documentation/networkextension/nerelaymanagerclienterror)
34 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Network Extension ](https://developer.apple.com/documentation/networkextension)
  * [ NEAppExtensionConfiguration ](https://developer.apple.com/documentation/networkextension/neappextensionconfiguration)
  *     * NEAppExtensionConfiguration 


Class
# NEAppExtensionConfiguration
A class that defines configuration options for use in NetworkExtension app extensions.
iOS 26.0+iPadOS 26.0+Mac Catalyst 26.0+macOS 26.0+visionOS 26.0+
```
@[MainActor](https://developer.apple.com/documentation/Swift/MainActor) @preconcurrency
class NEAppExtensionConfiguration
```

## [Overview](https://developer.apple.com/documentation/networkextension/neappextensionconfiguration#overview)
This class conforms to `NEAppExtensionConfigurationProtocol` and [`AppExtensionConfiguration`](https://developer.apple.com/documentation/ExtensionFoundation/AppExtensionConfiguration) from the [ExtensionFoundation](https://developer.apple.com/documentation/ExtensionFoundation) framework. It exists only for use by the framework; you don’t need to use its methods and properties directly.
## [Topics](https://developer.apple.com/documentation/networkextension/neappextensionconfiguration#topics)
### [Communicating over XPC](https://developer.apple.com/documentation/networkextension/neappextensionconfiguration#Communicating-over-XPC)
[`func accept(connection: NSXPCConnection) -> Bool`](https://developer.apple.com/documentation/networkextension/neappextensionconfiguration/accept\(connection:\))
Accepts incoming XPC connections from the host process.
## [Relationships](https://developer.apple.com/documentation/networkextension/neappextensionconfiguration#relationships)
### [Inherited By](https://developer.apple.com/documentation/networkextension/neappextensionconfiguration#inherited-by)
  * [`NEHotspotAuthenticationProviderConfiguration`](https://developer.apple.com/documentation/networkextension/nehotspotauthenticationproviderconfiguration)
  * [`NEHotspotEvaluationProviderConfiguration`](https://developer.apple.com/documentation/networkextension/nehotspotevaluationproviderconfiguration)
  * [`NEURLFilterControlProviderConfiguration`](https://developer.apple.com/documentation/networkextension/neurlfiltercontrolproviderconfiguration)


### [Conforms To](https://developer.apple.com/documentation/networkextension/neappextensionconfiguration#conforms-to)
  * [`AppExtensionConfiguration`](https://developer.apple.com/documentation/ExtensionFoundation/AppExtensionConfiguration)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)


Current page is NEAppExtensionConfiguration 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fnetworkextension%2Fneappextensionconfiguration).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
