Source: https://developer.apple.com/documentation/network/nwendpoint

[ Skip Navigation ](https://developer.apple.com/documentation/network/nwendpoint#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/network/nwendpoint#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/network/nwendpoint)
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
[ Open Menu ](https://developer.apple.com/documentation/network/nwendpoint)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/network/nwendpoint)
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
1 of 18 symbols inside -1484696645 
Endpoint Types
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
2 of 18 symbols inside -1484696645 [case hostPort(host: NWEndpoint.Host, port: NWEndpoint.Port)](https://developer.apple.com/documentation/network/nwendpoint/hostport\(host:port:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
3 of 18 symbols inside -1484696645 [case service(name: String, type: String, domain: String, interface: NWInterface?)](https://developer.apple.com/documentation/network/nwendpoint/service\(name:type:domain:interface:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
4 of 18 symbols inside -1484696645 [case url(URL)](https://developer.apple.com/documentation/network/nwendpoint/url\(_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
5 of 18 symbols inside -1484696645 [case unix(path: String)](https://developer.apple.com/documentation/network/nwendpoint/unix\(path:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 18 symbols inside -1484696645 
Host and Ports
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
7 of 18 symbols inside -1484696645 containing 8 symbols[NWEndpoint.Host](https://developer.apple.com/documentation/network/nwendpoint/host)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
8 of 18 symbols inside -1484696645 containing 12 symbols[NWEndpoint.Port](https://developer.apple.com/documentation/network/nwendpoint/port)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 18 symbols inside -1484696645 
Internet Addresses
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
10 of 18 symbols inside -1484696645 containing 9 symbols[IPAddress](https://developer.apple.com/documentation/network/ipaddress)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
11 of 18 symbols inside -1484696645 containing 17 symbols[IPv4Address](https://developer.apple.com/documentation/network/ipv4address)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
12 of 18 symbols inside -1484696645 containing 25 symbols[IPv6Address](https://developer.apple.com/documentation/network/ipv6address)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
13 of 18 symbols inside -1484696645 
Endpoint Properties
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
14 of 18 symbols inside -1484696645 [var interface: NWInterface?](https://developer.apple.com/documentation/network/nwendpoint/interface)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
15 of 18 symbols inside -1484696645 
Enumeration Cases
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
16 of 18 symbols inside -1484696645 [case opaque(nw_endpoint_t)](https://developer.apple.com/documentation/network/nwendpoint/opaque\(_:\))
129 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Network ](https://developer.apple.com/documentation/network)
  * [ NWEndpoint ](https://developer.apple.com/documentation/network/nwendpoint)
  *     * NWEndpoint 


Enumeration
# NWEndpoint
A local or remote endpoint in a network connection.
iOS 12.0+iPadOS 12.0+Mac Catalyst 12.0+macOS 10.14+tvOS 12.0+visionOS 1.0+watchOS 5.0+
```
enum NWEndpoint
```

## [Topics](https://developer.apple.com/documentation/network/nwendpoint#topics)
### [Endpoint Types](https://developer.apple.com/documentation/network/nwendpoint#Endpoint-Types)
[`case hostPort(host: NWEndpoint.Host, port: NWEndpoint.Port)`](https://developer.apple.com/documentation/network/nwendpoint/hostport\(host:port:\))
An endpoint represented as a host and port, with the host including both names and addresses.
[`case service(name: String, type: String, domain: String, interface: NWInterface?)`](https://developer.apple.com/documentation/network/nwendpoint/service\(name:type:domain:interface:\))
An endpoint represented as a Bonjour service.
[`case url(URL)`](https://developer.apple.com/documentation/network/nwendpoint/url\(_:\))
An endpoint represented as a URL, with host and port values inferred from the URL.
[`case unix(path: String)`](https://developer.apple.com/documentation/network/nwendpoint/unix\(path:\))
An endpoint represented as a UNIX domain path.
### [Host and Ports](https://developer.apple.com/documentation/network/nwendpoint#Host-and-Ports)
[`enum Host`](https://developer.apple.com/documentation/network/nwendpoint/host)
A name or address that identifies a network endpoint.
[`struct Port`](https://developer.apple.com/documentation/network/nwendpoint/port)
A port number you use along with a host to identify a network endpoint.
### [Internet Addresses](https://developer.apple.com/documentation/network/nwendpoint#Internet-Addresses)
[`protocol IPAddress`](https://developer.apple.com/documentation/network/ipaddress)
An abstract protocol you use to interact with IP addresses.
[`struct IPv4Address`](https://developer.apple.com/documentation/network/ipv4address)
A structure containing an IPv4 address.
[`struct IPv6Address`](https://developer.apple.com/documentation/network/ipv6address)
A structure containing an IPv6 address.
### [Endpoint Properties](https://developer.apple.com/documentation/network/nwendpoint#Endpoint-Properties)
[`var interface: NWInterface?`](https://developer.apple.com/documentation/network/nwendpoint/interface)
The optional interface associated with this endpoint, such as the interface on which it was discovered.
### [Enumeration Cases](https://developer.apple.com/documentation/network/nwendpoint#Enumeration-Cases)
[`case opaque(nw_endpoint_t)`](https://developer.apple.com/documentation/network/nwendpoint/opaque\(_:\))
### [Instance Properties](https://developer.apple.com/documentation/network/nwendpoint#Instance-Properties)
[`var txtRecord: NWTXTRecord?`](https://developer.apple.com/documentation/network/nwendpoint/txtrecord)
## [Relationships](https://developer.apple.com/documentation/network/nwendpoint#relationships)
### [Conforms To](https://developer.apple.com/documentation/network/nwendpoint#conforms-to)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)


## [See Also](https://developer.apple.com/documentation/network/nwendpoint#see-also)
### [Essentials](https://developer.apple.com/documentation/network/nwendpoint#Essentials)
[`class NWParameters`](https://developer.apple.com/documentation/network/nwparameters)
An object that stores the protocols to use for connections, options for sending data, and network path constraints.
Current page is NWEndpoint 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fnetwork%2Fnwendpoint).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
