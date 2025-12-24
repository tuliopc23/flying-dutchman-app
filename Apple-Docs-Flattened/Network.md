Source: https://developer.apple.com/documentation/Network

[ Skip Navigation ](https://developer.apple.com/documentation/Network#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/Network#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/Network)
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
[ Open Menu ](https://developer.apple.com/documentation/Network)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/Network)


[](https://developer.apple.com/documentation/Network)
## [ Network  ](https://developer.apple.com/documentation/network)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 111 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 111 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
2 of 111 symbols inside <root> containing 18 symbols[NWEndpoint](https://developer.apple.com/documentation/network/nwendpoint)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
3 of 111 symbols inside <root> containing 51 symbols[NWParameters](https://developer.apple.com/documentation/network/nwparameters)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 111 symbols inside <root>
Connections and Listeners
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
5 of 111 symbols inside <root> containing 46 symbols[NWConnection](https://developer.apple.com/documentation/network/nwconnection)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
6 of 111 symbols inside <root> containing 29 symbols[NWListener](https://developer.apple.com/documentation/network/nwlistener)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
7 of 111 symbols inside <root> containing 19 symbols[NWBrowser](https://developer.apple.com/documentation/network/nwbrowser)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
8 of 111 symbols inside <root> containing 24 symbols[NWConnectionGroup](https://developer.apple.com/documentation/network/nwconnectiongroup)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
9 of 111 symbols inside <root> containing 20 symbols[NWEthernetChannel](https://developer.apple.com/documentation/network/nwethernetchannel)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 111 symbols inside <root>
Network Protocols
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
11 of 111 symbols inside <root> [Building a custom peer-to-peer protocol](https://developer.apple.com/documentation/network/building-a-custom-peer-to-peer-protocol)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 111 symbols inside <root> [Connecting iPadOS and visionOS apps over the local network](https://developer.apple.com/documentation/visionos/connecting-ipados-and-visionos-apps-over-the-local-network)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
13 of 111 symbols inside <root> containing 5 symbols[NWProtocolTCP](https://developer.apple.com/documentation/network/nwprotocoltcp)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
14 of 111 symbols inside <root> containing 5 symbols[NWProtocolTLS](https://developer.apple.com/documentation/network/nwprotocoltls)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
15 of 111 symbols inside <root> containing 7 symbols[NWProtocolQUIC](https://developer.apple.com/documentation/network/nwprotocolquic)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
16 of 111 symbols inside <root> containing 5 symbols[NWProtocolUDP](https://developer.apple.com/documentation/network/nwprotocoludp)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
17 of 111 symbols inside <root> containing 7 symbols[NWProtocolIP](https://developer.apple.com/documentation/network/nwprotocolip)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
18 of 111 symbols inside <root> containing 11 symbols[NWProtocolWebSocket](https://developer.apple.com/documentation/network/nwprotocolwebsocket)
111 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Framework
# Network
Create network connections to send and receive data using transport and security protocols.
iOS 12.0+iPadOS 12.0+Mac Catalyst 13.0+macOS 10.14+tvOS 12.0+visionOS 1.0+watchOS 6.0+
## [Overview](https://developer.apple.com/documentation/Network#overview)
Use this framework when you need direct access to protocols like TLS, TCP, and UDP for your custom application protocols. Continue to use [`URLSession`](https://developer.apple.com/documentation/Foundation/URLSession), which is built upon this framework, for loading HTTP- and URL-based resources. For in-depth advice on where to start with networking, see [TN3151: Choosing the right networking API](https://developer.apple.com/documentation/Technotes/tn3151-choosing-the-right-networking-api).
Note
watchOS supports Network framework for specific use cases. For more details, see [TN3135: Low-level networking on watchOS](https://developer.apple.com/documentation/Technotes/tn3135-low-level-networking-on-watchOS).
## [Topics](https://developer.apple.com/documentation/Network#topics)
### [Essentials](https://developer.apple.com/documentation/Network#Essentials)
[`enum NWEndpoint`](https://developer.apple.com/documentation/network/nwendpoint)
A local or remote endpoint in a network connection.
[`class NWParameters`](https://developer.apple.com/documentation/network/nwparameters)
An object that stores the protocols to use for connections, options for sending data, and network path constraints.
### [Connections and Listeners](https://developer.apple.com/documentation/Network#Connections-and-Listeners)
[`class NWConnection`](https://developer.apple.com/documentation/network/nwconnection)
A bidirectional data connection between a local endpoint and a remote endpoint.
[`class NWListener`](https://developer.apple.com/documentation/network/nwlistener)
An object you use to listen for incoming network connections.
[`class NWBrowser`](https://developer.apple.com/documentation/network/nwbrowser)
An object you use to browse for available network services.
[`class NWConnectionGroup`](https://developer.apple.com/documentation/network/nwconnectiongroup)
An object you use to communicate with a group of endpoints, such as an IP multicast group on a local network.
[`class NWEthernetChannel`](https://developer.apple.com/documentation/network/nwethernetchannel)
An object you use to send and receive custom Ethernet frames.
### [Network Protocols](https://developer.apple.com/documentation/Network#Network-Protocols)
Configure protocol options to use with connections and listeners, and inspect the results of protocol handshakes.
[Building a custom peer-to-peer protocol](https://developer.apple.com/documentation/network/building-a-custom-peer-to-peer-protocol)
Use networking frameworks to create a custom protocol for playing a game across iOS, iPadOS, watchOS, and tvOS devices.
[Connecting iPadOS and visionOS apps over the local network](https://developer.apple.com/documentation/visionOS/connecting-ipados-and-visionos-apps-over-the-local-network)
Build an iPadOS companion app to control your visionOS app.
[`class NWProtocolTCP`](https://developer.apple.com/documentation/network/nwprotocoltcp)
A network protocol for connections that use the Transmission Control Protocol.
[`class NWProtocolTLS`](https://developer.apple.com/documentation/network/nwprotocoltls)
A network protocol for connections that use Transport Layer Security.
[`class NWProtocolQUIC`](https://developer.apple.com/documentation/network/nwprotocolquic)
A network protocol for connections that use the QUIC transport protocol.
[`class NWProtocolUDP`](https://developer.apple.com/documentation/network/nwprotocoludp)
A network protocol for connections that use the User Datagram Protocol.
[`class NWProtocolIP`](https://developer.apple.com/documentation/network/nwprotocolip)
A network protocol for configuring the Internet Protocol on connections.
[`class NWProtocolWebSocket`](https://developer.apple.com/documentation/network/nwprotocolwebsocket)
A network protocol for connections that use WebSocket.
[`class NWProtocolFramer`](https://developer.apple.com/documentation/network/nwprotocolframer)
A customizable network protocol for defining application message parsers.
### [Network Security and Privacy](https://developer.apple.com/documentation/Network#Network-Security-and-Privacy)
[API Reference Security Options](https://developer.apple.com/documentation/network/security-options)
Configure security options for TLS handshakes.
[API Reference Privacy Management](https://developer.apple.com/documentation/network/privacy-management)
Configure parameters related to user privacy.
[Creating an Identity for Local Network TLS](https://developer.apple.com/documentation/network/creating-an-identity-for-local-network-tls)
Learn how to create and use a digital identity in your application for local network TLS.
### [Paths and Interfaces](https://developer.apple.com/documentation/Network#Paths-and-Interfaces)
[`struct NWPath`](https://developer.apple.com/documentation/network/nwpath)
An object that contains information about the properties of the network that a connection uses, or that are available to your app.
[`class NWPathMonitor`](https://developer.apple.com/documentation/network/nwpathmonitor)
An observer that you use to monitor and react to network changes.
[`struct NWInterface`](https://developer.apple.com/documentation/network/nwinterface)
An interface that a network connection uses to send and receive data.
### [Errors](https://developer.apple.com/documentation/Network#Errors)
[`enum NWError`](https://developer.apple.com/documentation/network/nwerror)
The errors returned by objects in the Network framework.
### [Network Debugging](https://developer.apple.com/documentation/Network#Network-Debugging)
[Choosing a Network Debugging Tool](https://developer.apple.com/documentation/network/choosing-a-network-debugging-tool)
Decide which tool works best for your network debugging problem.
[Debugging HTTP Server-Side Errors](https://developer.apple.com/documentation/network/debugging-http-server-side-errors)
Understand HTTP server-side errors and how to debug them.
[Debugging HTTPS Problems with CFNetwork Diagnostic Logging](https://developer.apple.com/documentation/network/debugging-https-problems-with-cfnetwork-diagnostic-logging)
Use CFNetwork diagnostic logging to investigate HTTP and HTTPS problems.
[API Reference Recording a Packet Trace](https://developer.apple.com/documentation/network/recording-a-packet-trace)
Learn how to record a low-level trace of network traffic.
[Taking Advantage of Third-Party Network Debugging Tools](https://developer.apple.com/documentation/network/taking-advantage-of-third-party-network-debugging-tools)
Learn about the available third-party network debugging tools.
[Testing and Debugging L4S in Your App](https://developer.apple.com/documentation/network/testing-and-debugging-l4s-in-your-app)
Learn how to verify your app on an L4S-capable host and network to improve your app’s responsiveness.
### [C-Language Symbols](https://developer.apple.com/documentation/Network#C-Language-Symbols)
Access Network framework symbols used in C.
[API Reference C-Language Symbols](https://developer.apple.com/documentation/network/c-language-symbols)
### [Structures](https://developer.apple.com/documentation/Network#Structures)
[`struct nw_interface_radio_type_t`](https://developer.apple.com/documentation/network/nw_interface_radio_type_t)
[`struct nw_multipath_version_t`](https://developer.apple.com/documentation/network/nw_multipath_version_t)
[`struct nw_path_unsatisfied_reason_t`](https://developer.apple.com/documentation/network/nw_path_unsatisfied_reason_t)
[`struct nw_quic_stream_type_t`](https://developer.apple.com/documentation/network/nw_quic_stream_type_t)
[`struct Bonjour`](https://developer.apple.com/documentation/network/bonjour)
A browser that discovers Bonjour services.
[`struct BonjourListenerProvider`](https://developer.apple.com/documentation/network/bonjourlistenerprovider)
Advertise a Bonjour service.
[`struct Coder`](https://developer.apple.com/documentation/network/coder)
A protocol that frames and encodes/decodes Codable types.
[`struct DefaultProtocolStorage`](https://developer.apple.com/documentation/network/defaultprotocolstorage)
[`struct Framer`](https://developer.apple.com/documentation/network/framer)
An instance of a Framer protocol to load into a protocol stack.
[`struct IP`](https://developer.apple.com/documentation/network/ip)
The system definition of the Internet Protocol (IP).
[`struct NWParametersBuilder`](https://developer.apple.com/documentation/network/nwparametersbuilder)
An opaque class that is responsible for creating and configuring NWParameters based on the parameterized protocol stack.
[`struct NWTXTRecord`](https://developer.apple.com/documentation/network/nwtxtrecord)
A dictionary representing a TXT record in a DNS packet.
[`struct NetworkJSONCoder`](https://developer.apple.com/documentation/network/networkjsoncoder)
[`struct NetworkPropertyListCoder`](https://developer.apple.com/documentation/network/networkpropertylistcoder)
[`struct ProtocolMetadataBuilder`](https://developer.apple.com/documentation/network/protocolmetadatabuilder)
A resultBuilder for configuring metadata in send methods in a declarative way.
[`struct ProtocolStackBuilder`](https://developer.apple.com/documentation/network/protocolstackbuilder)
A resultBuilder for specifying and configuring protocol stacks in a declarative way
[`struct ProxyConfiguration`](https://developer.apple.com/documentation/network/proxyconfiguration)
A proxy configuration for Relays, Oblivious HTTP, HTTP CONNECT, or SOCKSv5.
[`struct QUIC`](https://developer.apple.com/documentation/network/quic)
The system definition of the QUIC protocol.
[`struct QUICDatagram`](https://developer.apple.com/documentation/network/quicdatagram)
Send and receive unreliable datagrams over QUIC via RFC 9221
[`struct QUICStream`](https://developer.apple.com/documentation/network/quicstream)
A QUIC stream that runs over a QUIC connection.
[`struct TCP`](https://developer.apple.com/documentation/network/tcp)
The system definition of the Transmission Control Protocol (TCP).
[`struct TLS`](https://developer.apple.com/documentation/network/tls)
The system definition of the Transport Layer Security (TLS) protocol.
[`struct TLV`](https://developer.apple.com/documentation/network/tlv)
A Type-Length-Value (TLV) framing protocol.
[`struct TXTRecordDecoder`](https://developer.apple.com/documentation/network/txtrecorddecoder)
[`struct UDP`](https://developer.apple.com/documentation/network/udp)
The system definition of the User Datagram Protocol (UDP).
[`struct UnexpectedEndpointType`](https://developer.apple.com/documentation/network/unexpectedendpointtype)
An error generated when an unexpected endpoint type is supplied.
[`struct WebSocket`](https://developer.apple.com/documentation/network/websocket)
The system definition of the WebSocket protocol.
[`struct nw_link_quality_t`](https://developer.apple.com/documentation/network/nw_link_quality_t)
### [Classes](https://developer.apple.com/documentation/Network#Classes)
[`class NWMultiplexGroup`](https://developer.apple.com/documentation/network/nwmultiplexgroup)
[`class NetworkBrowser`](https://developer.apple.com/documentation/network/networkbrowser)
Discover advertised services and devices on the network.
[`class NetworkChannel`](https://developer.apple.com/documentation/network/networkchannel)
A base class supporting sending and recieving data through an arbitrary network channel.
[`class NetworkConnection`](https://developer.apple.com/documentation/network/networkconnection)
Connect to an endpoint on the network to send and receive data.
[`class NetworkListener`](https://developer.apple.com/documentation/network/networklistener)
Listen for incoming network connections.
### [Reference](https://developer.apple.com/documentation/Network#Reference)
[API Reference Network Constants](https://developer.apple.com/documentation/network/network-constants)
Access Network framework constants used in C.
[API Reference Network Functions](https://developer.apple.com/documentation/network/network-functions)
Access Network framework functions used in C.
[API Reference Network Data Types](https://developer.apple.com/documentation/network/network-data-types)
### [Protocols](https://developer.apple.com/documentation/Network#Protocols)
[`protocol BrowserProvider`](https://developer.apple.com/documentation/network/browserprovider)
BrowserProviders can be used when creating NetworkBrowsers.
[`protocol Connectable`](https://developer.apple.com/documentation/network/connectable)
Describes types that can be used to make NetworkConnections.
[`protocol ConnectionStorage`](https://developer.apple.com/documentation/network/connectionstorage)
Types that conform to ConnectionStorage can be used as additional storage within a connection.
[`protocol DatagramProtocol`](https://developer.apple.com/documentation/network/datagramprotocol)
Types that conform to DatagramProtocol send and receive messages with minimal or no metadata, usually constrained to a fixed maximum size.
[`protocol FramerProtocol`](https://developer.apple.com/documentation/network/framerprotocol)
Framer protocols allow custom framing and serialization of messages on a connection.
[`protocol ListenerProvider`](https://developer.apple.com/documentation/network/listenerprovider)
Extensible support for configuring advertise descriptors to define the service a listener should advertise.
[`protocol MessageProtocol`](https://developer.apple.com/documentation/network/messageprotocol)
Types that conform to MessageProtocol send and receive messages. The conforming type is responsible for specifying its message-specific metadata.
[`protocol MultiplexProtocol`](https://developer.apple.com/documentation/network/multiplexprotocol)
Types that conform to MultiplexProtocol are allowed to be the top protocol in a network protocol stack for multiplexing network connection objects.
[`protocol NWParametersProvider`](https://developer.apple.com/documentation/network/nwparametersprovider)
Types that conform to the NWParametersProvider protocol can be used to generate an NWParameters.
[`protocol NetworkCoder`](https://developer.apple.com/documentation/network/networkcoder)
[`protocol NetworkDecoder`](https://developer.apple.com/documentation/network/networkdecoder)
A type that conforms to the NetworkEncoder protocol can decode data to an Encodable object
[`protocol NetworkEncoder`](https://developer.apple.com/documentation/network/networkencoder)
A type that conforms to the NetworkEncoder protocol can encode a Encodable object to Data
[`protocol NetworkFixedWidthInteger`](https://developer.apple.com/documentation/network/networkfixedwidthinteger)
[`protocol NetworkMetadataProtocol`](https://developer.apple.com/documentation/network/networkmetadataprotocol)
Types that conform to NetworkProtocolOptions can be used when configuring protocol stacks.
[`protocol NetworkProtocolOptions`](https://developer.apple.com/documentation/network/networkprotocoloptions)
[`protocol OneToOneProtocol`](https://developer.apple.com/documentation/network/onetooneprotocol)
Types that conform to OneToOneProtocol are allowed to be the top protocol in a network protocol stack for non-multiplexed connections.
[`protocol StreamProtocol`](https://developer.apple.com/documentation/network/streamprotocol)
Types that conform to the StreamProtocol protocol expose methods for sending and receiving byte streams.
### [Variables](https://developer.apple.com/documentation/Network#Variables)
[`let kNWErrorDomainWiFiAware: CFString`](https://developer.apple.com/documentation/network/knwerrordomainwifiaware)
[`var nw_error_domain_wifi_aware: nw_error_domain_t`](https://developer.apple.com/documentation/network/nw_error_domain_wifi_aware)
[`var nw_link_quality_good: nw_link_quality_t`](https://developer.apple.com/documentation/network/nw_link_quality_good)
[`var nw_link_quality_minimal: nw_link_quality_t`](https://developer.apple.com/documentation/network/nw_link_quality_minimal)
[`var nw_link_quality_moderate: nw_link_quality_t`](https://developer.apple.com/documentation/network/nw_link_quality_moderate)
[`var nw_link_quality_unknown: nw_link_quality_t`](https://developer.apple.com/documentation/network/nw_link_quality_unknown)
### [Functions](https://developer.apple.com/documentation/Network#Functions)
[`func nw_parameters_get_allow_ultra_constrained(nw_parameters_t) -> Bool`](https://developer.apple.com/documentation/network/nw_parameters_get_allow_ultra_constrained\(_:\))
[`func nw_parameters_set_allow_ultra_constrained(nw_parameters_t, Bool)`](https://developer.apple.com/documentation/network/nw_parameters_set_allow_ultra_constrained\(_:_:\))
[`func nw_path_get_link_quality(nw_path_t) -> nw_link_quality_t`](https://developer.apple.com/documentation/network/nw_path_get_link_quality\(_:\))
[`func nw_path_is_ultra_constrained(nw_path_t) -> Bool`](https://developer.apple.com/documentation/network/nw_path_is_ultra_constrained\(_:\))
[`func withNetworkConnection<ApplicationProtocol>(to: NWEndpoint, using: () -> ApplicationProtocol, (NetworkConnection<ApplicationProtocol>) async throws -> Void) async throws`](https://developer.apple.com/documentation/network/withnetworkconnection\(to:using:_:\)-1sik8)
[`func withNetworkConnection<ApplicationProtocol>(to: NWEndpoint, using: () -> ApplicationProtocol, (NetworkConnection<ApplicationProtocol>) async throws -> Void) async throws`](https://developer.apple.com/documentation/network/withnetworkconnection\(to:using:_:\)-4wpc9)
[`func withNetworkConnection<ApplicationProtocol>(to: NWEndpoint, using: NWParametersBuilder<ApplicationProtocol>, (NetworkConnection<ApplicationProtocol>) async throws -> Void) async throws`](https://developer.apple.com/documentation/network/withnetworkconnection\(to:using:_:\)-7skhi)
[`func withNetworkConnection<ApplicationProtocol>(to: NWEndpoint, using: NWParametersBuilder<ApplicationProtocol>, (NetworkConnection<ApplicationProtocol>) async throws -> Void) async throws`](https://developer.apple.com/documentation/network/withnetworkconnection\(to:using:_:\)-887ho)
Current page is Network 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FNetwork).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
