Source: https://developer.apple.com/documentation/networkextension/personal-vpn

[ Skip Navigation ](https://developer.apple.com/documentation/networkextension/personal-vpn#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/networkextension/personal-vpn#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/networkextension/personal-vpn)
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
[ Open Menu ](https://developer.apple.com/documentation/networkextension/personal-vpn)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/networkextension/personal-vpn)


[](https://developer.apple.com/documentation/networkextension/personal-vpn)
## [ Network Extension  ](https://developer.apple.com/documentation/networkextension)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 32 symbols inside <root>
Wi-Fi management
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 32 symbols inside <root>
Wi-Fi management
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
2 of 32 symbols inside <root> containing 7 symbols[Wi-Fi configuration](https://developer.apple.com/documentation/networkextension/wi-fi-configuration)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 32 symbols inside <root> [Configuring a Wi-Fi accessory to join a network](https://developer.apple.com/documentation/networkextension/configuring-a-wi-fi-accessory-to-join-a-network)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
4 of 32 symbols inside <root> containing 15 symbols[Hotspot helper](https://developer.apple.com/documentation/networkextension/hotspot-helper)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 32 symbols inside <root>
Virtual private networks
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 32 symbols inside <root> [Routing your VPN network traffic](https://developer.apple.com/documentation/networkextension/routing-your-vpn-network-traffic)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
7 of 32 symbols inside <root> containing 10 symbols[Personal VPN](https://developer.apple.com/documentation/networkextension/personal-vpn)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 10 symbols inside 1407047476 
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
2 of 10 symbols inside 1407047476 [Personal VPN Entitlement](https://developer.apple.com/documentation/bundleresources/entitlements/com.apple.developer.networking.vpn.api)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 10 symbols inside 1407047476 
VPN configuration
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
4 of 10 symbols inside 1407047476 containing 23 symbols[NEVPNManager](https://developer.apple.com/documentation/networkextension/nevpnmanager)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
5 of 10 symbols inside 1407047476 containing 29 symbols[NEVPNProtocolIKEv2](https://developer.apple.com/documentation/networkextension/nevpnprotocolikev2)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
6 of 10 symbols inside 1407047476 containing 7 symbols[NEVPNProtocolIPSec](https://developer.apple.com/documentation/networkextension/nevpnprotocolipsec)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
7 of 10 symbols inside 1407047476 containing 19 symbols[NEVPNProtocol](https://developer.apple.com/documentation/networkextension/nevpnprotocol)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
8 of 10 symbols inside 1407047476 containing 6 symbols[VPN On Demand Rules](https://developer.apple.com/documentation/networkextension/vpn-on-demand-rules)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 10 symbols inside 1407047476 
VPN control
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
10 of 10 symbols inside 1407047476 containing 17 symbols[NEVPNConnection](https://developer.apple.com/documentation/networkextension/nevpnconnection)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
8 of 32 symbols inside <root> containing 23 symbols[Packet tunnel provider](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider)
42 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Collection
  * [ Network Extension ](https://developer.apple.com/documentation/networkextension)
  * [ Personal VPN ](https://developer.apple.com/documentation/networkextension/personal-vpn)
  *     * Personal VPN 


API Collection
# Personal VPN
Create and manage a VPN configuration that uses one of the built-in VPN protocols (IPsec or IKEv2).
## [Overview](https://developer.apple.com/documentation/networkextension/personal-vpn#overview)
With the Personal VPN feature in macOS and iOS, your app can create and manage a VPN configuration that uses one of the built-in VPN protocols (IPsec or IKEv2). The user must explicitly authorize your app the first time it saves a VPN configuration.
Note
Personal VPN only supports recommended VPN protocols; it doesn’t support legacy VPN protocols, like PPTP and L2TP.
Before starting with Personal VPN, verify that the client is compatible with your VPN server. Use Apple Configurator to create a configuration profile with a VPN payload for your server. If you can connect using the VPN configuration from your configuration profile, you should be able to connect using Personal VPN.
To get started, call the [`shared()`](https://developer.apple.com/documentation/networkextension/nevpnmanager/shared\(\)) class method to access the [`NEVPNManager`](https://developer.apple.com/documentation/networkextension/nevpnmanager) singleton. Then load the VPN configuration by calling [`loadFromPreferences(completionHandler:)`](https://developer.apple.com/documentation/networkextension/nevpnmanager/loadfrompreferences\(completionhandler:\)); if you haven’t previously saved a configuration, this call returns an empty configuration. Modify this configuration as you see fit, and save it using [`saveToPreferences(completionHandler:)`](https://developer.apple.com/documentation/networkextension/nevpnmanager/savetopreferences\(completionhandler:\)).
Once you’ve set up a Personal VPN configuration, you can connect and disconnect the VPN using the [`NEVPNConnection`](https://developer.apple.com/documentation/networkextension/nevpnconnection) class. Use the [`connection`](https://developer.apple.com/documentation/networkextension/nevpnmanager/connection) property of [`NEVPNManager`](https://developer.apple.com/documentation/networkextension/nevpnmanager) to get the correct instance of that class.
Both iOS and macOS also support managed VPN, meaning VPN configurations installed by a configuration profile. Managed VPN configurations take precedence over Personal VPN configurations. If there’s simultaneously a managed VPN configuration and Personal VPN configuration, both configured to act as the default route, the managed tunnel serves as the default route.
Note
When a VPN configuration is active, connections use the VPN instead of iCloud Private Relay. Network Extension providers also don’t use iCloud Private Relay.
## [Topics](https://developer.apple.com/documentation/networkextension/personal-vpn#topics)
### [Essentials](https://developer.apple.com/documentation/networkextension/personal-vpn#Essentials)
[`Personal VPN Entitlement`](https://developer.apple.com/documentation/BundleResources/Entitlements/com.apple.developer.networking.vpn.api)
The API an app can use to create and control a custom system VPN configuration.
### [VPN configuration](https://developer.apple.com/documentation/networkextension/personal-vpn#VPN-configuration)
[`class NEVPNManager`](https://developer.apple.com/documentation/networkextension/nevpnmanager)
An object to create and manage a Personal VPN configuration.
[`class NEVPNProtocolIKEv2`](https://developer.apple.com/documentation/networkextension/nevpnprotocolikev2)
Settings for an IKEv2 VPN configuration.
[`class NEVPNProtocolIPSec`](https://developer.apple.com/documentation/networkextension/nevpnprotocolipsec)
Settings for an IPsec VPN configuration.
[`class NEVPNProtocol`](https://developer.apple.com/documentation/networkextension/nevpnprotocol)
Settings common to both IKEv2 and IPsec VPN configurations.
[API Reference VPN On Demand Rules](https://developer.apple.com/documentation/networkextension/vpn-on-demand-rules)
Set up VPN On Demand.
### [VPN control](https://developer.apple.com/documentation/networkextension/personal-vpn#VPN-control)
[`class NEVPNConnection`](https://developer.apple.com/documentation/networkextension/nevpnconnection)
An object to start and stop a Personal VPN connection and get its status.
## [See Also](https://developer.apple.com/documentation/networkextension/personal-vpn#see-also)
### [Virtual private networks](https://developer.apple.com/documentation/networkextension/personal-vpn#Virtual-private-networks)
[Routing your VPN network traffic](https://developer.apple.com/documentation/networkextension/routing-your-vpn-network-traffic)
Configure your VPN to include and exclude some network traffic.
[API Reference Packet tunnel provider](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider)
Implement a VPN client for a packet-oriented, custom VPN protocol.
[API Reference App proxy provider](https://developer.apple.com/documentation/networkextension/app-proxy-provider)
Implement a VPN client for a flow-oriented, custom VPN protocol.
Current page is Personal VPN 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fnetworkextension%2Fpersonal-vpn).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
