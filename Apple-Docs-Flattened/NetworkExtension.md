Source: https://developer.apple.com/documentation/networkextension

[ Skip Navigation ](https://developer.apple.com/documentation/networkextension#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/networkextension#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/networkextension)
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
[ Open Menu ](https://developer.apple.com/documentation/networkextension)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/networkextension)


[](https://developer.apple.com/documentation/networkextension)
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
Collection
8 of 32 symbols inside <root> containing 23 symbols[Packet tunnel provider](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
9 of 32 symbols inside <root> containing 29 symbols[App proxy provider](https://developer.apple.com/documentation/networkextension/app-proxy-provider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 32 symbols inside <root>
Network relays
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
11 of 32 symbols inside <root> containing 5 symbols[Relays](https://developer.apple.com/documentation/networkextension/relays)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 32 symbols inside <root>
Content filters
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
13 of 32 symbols inside <root> containing 20 symbols[Content filter providers](https://developer.apple.com/documentation/networkextension/content-filter-providers)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
14 of 32 symbols inside <root> [Filtering Network Traffic](https://developer.apple.com/documentation/networkextension/filtering-network-traffic)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
15 of 32 symbols inside <root>
URL filters
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
16 of 32 symbols inside <root> containing 6 symbols[URL filters](https://developer.apple.com/documentation/networkextension/url-filters)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
17 of 32 symbols inside <root>
DNS configurations
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
18 of 32 symbols inside <root> containing 6 symbols[DNS settings](https://developer.apple.com/documentation/networkextension/dns-settings)
32 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Framework
# Network Extension
Customize and extend core networking features.
iOS 8.0+iPadOS 8.0+Mac Catalyst 13.1+macOS 10.10+tvOS 17.0+visionOS 1.0+watchOS 7.0+
## [Overview](https://developer.apple.com/documentation/networkextension#overview)
With the NetworkExtension framework, you can customize and extend the system’s core networking features. Specifically, you can:
  * Change the system’s Wi-Fi configuration
  * Integrate your app with the hotspot network subsystem (Hotspot Helper)
  * Create and manage VPN configurations, using the built-in VPN protocols (Personal VPN) or a custom VPN protocol
  * Create and manage network relay configurations
  * Implement an on-device content filter
  * Create and manage system-wide DNS configurations, using the built-in DNS protocols or a custom on-device DNS proxy


The NetworkExtension framework is available in macOS, iOS, tvOS, and visionOS, but not all features are available on all platforms and some features have specific restrictions (for example, some features only work on supervised iOS devices). The documentation for each feature describes these restrictions.
### [Options for implementing VPN](https://developer.apple.com/documentation/networkextension#Options-for-implementing-VPN)
The NetworkExtension framework has extensive support for virtual private networks (VPN). A VPN is a form of network tunnel, where a VPN client uses the public Internet to create a connection to a VPN server and then passes private network traffic over that connection.
VPNs have many different uses. For example, an enterprise might set up a VPN to give remote employees access to enterprise network resources that are not available on the public Internet. Or a consumer wanting to access the Internet from an untrusted network, such as the free Wi-Fi at an airport, might set up VPN to secure their traffic.
The supported operating systems include a number of different VPN APIs, distinguished by the protocols they support:
  * Use [Personal VPN](https://developer.apple.com/documentation/networkextension/personal-vpn) to create and manage a VPN configuration that uses one of the built-in VPN protocols (IPsec or IKEv2).
  * Create a [Packet tunnel provider](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider) to implement a VPN client for a packet-oriented, custom VPN protocol.
  * Create an [App proxy provider](https://developer.apple.com/documentation/networkextension/app-proxy-provider) to implement a VPN client for a flow-oriented, custom VPN protocol.


### [About Always-on VPN](https://developer.apple.com/documentation/networkextension#About-Always-on-VPN)
iOS supports Always-on VPN to ensure all IP traffic is tunneled back to the organization. See the [iOS Deployment Reference](https://support.apple.com/guide/deployment-reference-ios/always-on-vpn-iore8b083096/1/web/1) for information about how to configure Always-on VPN.
## [Topics](https://developer.apple.com/documentation/networkextension#topics)
### [Wi-Fi management](https://developer.apple.com/documentation/networkextension#Wi-Fi-management)
[API Reference Wi-Fi configuration](https://developer.apple.com/documentation/networkextension/wi-fi-configuration)
Add persistent Wi-Fi configurations, or temporarily move the device to a specific Wi-Fi network.
[Configuring a Wi-Fi accessory to join a network](https://developer.apple.com/documentation/networkextension/configuring-a-wi-fi-accessory-to-join-a-network)
Associate an iOS device with an accessory’s network to deliver network configuration information.
[API Reference Hotspot helper](https://developer.apple.com/documentation/networkextension/hotspot-helper)
Integrate your app with the iOS hotspot network subsystem.
### [Virtual private networks](https://developer.apple.com/documentation/networkextension#Virtual-private-networks)
[Routing your VPN network traffic](https://developer.apple.com/documentation/networkextension/routing-your-vpn-network-traffic)
Configure your VPN to include and exclude some network traffic.
[API Reference Personal VPN](https://developer.apple.com/documentation/networkextension/personal-vpn)
Create and manage a VPN configuration that uses one of the built-in VPN protocols (IPsec or IKEv2).
[API Reference Packet tunnel provider](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider)
Implement a VPN client for a packet-oriented, custom VPN protocol.
[API Reference App proxy provider](https://developer.apple.com/documentation/networkextension/app-proxy-provider)
Implement a VPN client for a flow-oriented, custom VPN protocol.
### [Network relays](https://developer.apple.com/documentation/networkextension#Network-relays)
[API Reference Relays](https://developer.apple.com/documentation/networkextension/relays)
Create and manage a system-wide network relay configuration that uses built-in proxying for TCP and UDP traffic over HTTP/3 and HTTP/2.
### [Content filters](https://developer.apple.com/documentation/networkextension#Content-filters)
[API Reference Content filter providers](https://developer.apple.com/documentation/networkextension/content-filter-providers)
Create an on-device network content filter.
[Filtering Network Traffic](https://developer.apple.com/documentation/networkextension/filtering-network-traffic)
Use the Network Extension framework to allow or deny network connections.
### [URL filters](https://developer.apple.com/documentation/networkextension#URL-filters)
[API Reference URL filters](https://developer.apple.com/documentation/networkextension/url-filters)
Create a filter that analyzes full URLs, while preserving privacy.
### [DNS configurations](https://developer.apple.com/documentation/networkextension#DNS-configurations)
[API Reference DNS settings](https://developer.apple.com/documentation/networkextension/dns-settings)
Create and manage a system-wide DNS configuration that uses built-in encrypted DNS protocols.
[API Reference DNS proxy provider](https://developer.apple.com/documentation/networkextension/dns-proxy-provider)
Create an on-device DNS proxy using a custom protocol.
### [Local networking](https://developer.apple.com/documentation/networkextension#Local-networking)
[API Reference Local push connectivity](https://developer.apple.com/documentation/networkextension/local-push-connectivity)
Provide functionality similar to Apple Push Notification Service when access to the wider internet is unavailable.
### [App extensions](https://developer.apple.com/documentation/networkextension#App-extensions)
[`class NEAppExtensionConfiguration`](https://developer.apple.com/documentation/networkextension/neappextensionconfiguration)
A class that defines configuration options for use in NetworkExtension app extensions.
### [Protocols](https://developer.apple.com/documentation/networkextension#Protocols)
[`protocol NEAppProxyUDPFlowHandling`](https://developer.apple.com/documentation/networkextension/neappproxyudpflowhandling)
### [Structures](https://developer.apple.com/documentation/networkextension#Structures)
[`struct NETunnelProviderError`](https://developer.apple.com/documentation/networkextension/netunnelprovidererror-swift.struct)
An error that the tunnel provider encounters.
[`struct NEVPNError`](https://developer.apple.com/documentation/networkextension/nevpnerror-swift.struct)
Information about an error encountered while configuring or using a VPN.
### [Variables](https://developer.apple.com/documentation/networkextension#Variables)
[`let NERelayClientErrorDomain: String`](https://developer.apple.com/documentation/networkextension/nerelayclienterrordomain)
### [Enumerations](https://developer.apple.com/documentation/networkextension#Enumerations)
[`enum NERelayManagerClientError`](https://developer.apple.com/documentation/networkextension/nerelaymanagerclienterror)
Current page is Network Extension 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fnetworkextension).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
