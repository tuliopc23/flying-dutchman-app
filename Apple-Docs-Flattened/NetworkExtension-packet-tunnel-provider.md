Source: https://developer.apple.com/documentation/networkextension/packet-tunnel-provider

[ Skip Navigation ](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider)
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
[ Open Menu ](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider)


[](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider)
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
1 of 23 symbols inside -1592533377 
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
2 of 23 symbols inside -1592533377 [Network Extensions Entitlement](https://developer.apple.com/documentation/bundleresources/entitlements/com.apple.developer.networking.networkextension)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 23 symbols inside -1592533377 
Packet tunnel provider
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
4 of 23 symbols inside -1592533377 containing 11 symbols[NEPacketTunnelProvider](https://developer.apple.com/documentation/networkextension/nepackettunnelprovider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
5 of 23 symbols inside -1592533377 containing 14 symbols[NETunnelProvider](https://developer.apple.com/documentation/networkextension/netunnelprovider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
6 of 23 symbols inside -1592533377 containing 14 symbols[NEProvider](https://developer.apple.com/documentation/networkextension/neprovider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
7 of 23 symbols inside -1592533377 containing 7 symbols[NEPacketTunnelNetworkSettings](https://developer.apple.com/documentation/networkextension/nepackettunnelnetworksettings)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
8 of 23 symbols inside -1592533377 containing 8 symbols[NETunnelNetworkSettings](https://developer.apple.com/documentation/networkextension/netunnelnetworksettings)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
9 of 23 symbols inside -1592533377 [NEEthernetTunnelProvider](https://developer.apple.com/documentation/networkextension/neethernettunnelprovider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
10 of 23 symbols inside -1592533377 containing 4 symbols[NEEthernetTunnelNetworkSettings](https://developer.apple.com/documentation/networkextension/neethernettunnelnetworksettings)
55 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Collection
  * [ Network Extension ](https://developer.apple.com/documentation/networkextension)
  * [ Packet tunnel provider ](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider)
  *     * Packet tunnel provider 


API Collection
# Packet tunnel provider
Implement a VPN client for a packet-oriented, custom VPN protocol.
## [Overview](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider#overview)
A virtual private network (VPN) is a form of network tunnel where a VPN client uses the public Internet to create a connection to a VPN server and then passes private network traffic over that connection. If you want to build a VPN client that implements a packet-oriented, custom VPN protocol, create a packet tunnel provider app extension.
When the system starts a VPN configuration that uses your packet tunnel provider, it performs the following steps:
  * Launches your app extension.
  * Instantiates your packet tunnel provider subclass within that app extension.
  * Starts forwarding packets to your provider.


Your provider should open a tunnel to a VPN server and send those packets over that tunnel. Similarly, if your provider receives packets from the tunnel, it should pass them back to the system.
Packet tunnel providers can run in destination IP mode or source-application mode. The latter is one form of per-app VPN (the other form is an [App proxy provider](https://developer.apple.com/documentation/networkextension/app-proxy-provider)).
For detailed information about packet tunnel provider deployment options, see [TN3134: Network Extension provider deployment](https://developer.apple.com/documentation/Technotes/tn3134-network-extension-provider-deployment).
Note
When a VPN configuration is active, connections use the VPN instead of iCloud Private Relay. Network Extension providers also don’t use iCloud Private Relay.
## [Topics](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider#topics)
### [Essentials](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider#Essentials)
[`Network Extensions Entitlement`](https://developer.apple.com/documentation/BundleResources/Entitlements/com.apple.developer.networking.networkextension)
The APIs an app can use to customize networking features.
### [Packet tunnel provider](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider#Packet-tunnel-provider)
[`class NEPacketTunnelProvider`](https://developer.apple.com/documentation/networkextension/nepackettunnelprovider)
The principal class for a packet tunnel provider app extension.
[`class NETunnelProvider`](https://developer.apple.com/documentation/networkextension/netunnelprovider)
An abstract base class shared by NEPacketTunnelProvider and NEAppProxyProvider.
[`class NEProvider`](https://developer.apple.com/documentation/networkextension/neprovider)
An abstract base class for all NetworkExtension providers.
[`class NEPacketTunnelNetworkSettings`](https://developer.apple.com/documentation/networkextension/nepackettunnelnetworksettings)
The configuration for a packet tunnel provider’s virtual interface.
[`class NETunnelNetworkSettings`](https://developer.apple.com/documentation/networkextension/netunnelnetworksettings)
The configuration for a tunnel provider’s virtual interface.
[`class NEEthernetTunnelProvider`](https://developer.apple.com/documentation/networkextension/neethernettunnelprovider)
A type that implements the client side of a custom link-layer packet tunneling protocol.
[`class NEEthernetTunnelNetworkSettings`](https://developer.apple.com/documentation/networkextension/neethernettunnelnetworksettings)
The network settings for an ethernet-based VPN tunnel.
### [Packet handling](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider#Packet-handling)
[`class NEPacketTunnelFlow`](https://developer.apple.com/documentation/networkextension/nepackettunnelflow)
An object you use to read and write packets to and from the tunnel’s virtual interface.
[`class NEPacket`](https://developer.apple.com/documentation/networkextension/nepacket)
A network packet and its associated properties.
[API Reference In-Provider Networking](https://developer.apple.com/documentation/networkextension/in-provider-networking)
Network APIs for use by all types of NetworkExtension providers and by hotspot helpers.
### [VPN configuration](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider#VPN-configuration)
[`class NETunnelProviderManager`](https://developer.apple.com/documentation/networkextension/netunnelprovidermanager)
An object to create and manage the tunnel provider’s VPN configuration.
[`class NEVPNManager`](https://developer.apple.com/documentation/networkextension/nevpnmanager)
An object to create and manage a Personal VPN configuration.
[`class NETunnelProviderProtocol`](https://developer.apple.com/documentation/networkextension/netunnelproviderprotocol)
Configuration parameters for a VPN tunnel.
[`class NEAppRule`](https://developer.apple.com/documentation/networkextension/neapprule)
The identity of an app whose traffic is to be routed through the tunnel.
[API Reference VPN On Demand Rules](https://developer.apple.com/documentation/networkextension/vpn-on-demand-rules)
Set up VPN On Demand.
### [VPN control](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider#VPN-control)
[`class NETunnelProviderSession`](https://developer.apple.com/documentation/networkextension/netunnelprovidersession)
An object to start and stop a tunnel connection and get its status.
[`class NEVPNConnection`](https://developer.apple.com/documentation/networkextension/nevpnconnection)
An object to start and stop a Personal VPN connection and get its status.
## [See Also](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider#see-also)
### [Virtual private networks](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider#Virtual-private-networks)
[Routing your VPN network traffic](https://developer.apple.com/documentation/networkextension/routing-your-vpn-network-traffic)
Configure your VPN to include and exclude some network traffic.
[API Reference Personal VPN](https://developer.apple.com/documentation/networkextension/personal-vpn)
Create and manage a VPN configuration that uses one of the built-in VPN protocols (IPsec or IKEv2).
[API Reference App proxy provider](https://developer.apple.com/documentation/networkextension/app-proxy-provider)
Implement a VPN client for a flow-oriented, custom VPN protocol.
Current page is Packet tunnel provider 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fnetworkextension%2Fpacket-tunnel-provider).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
