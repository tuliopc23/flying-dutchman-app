Source: https://developer.apple.com/documentation/network/nwethernetchannel

[ Skip Navigation ](https://developer.apple.com/documentation/network/nwethernetchannel#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/network/nwethernetchannel#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/network/nwethernetchannel)
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
[ Open Menu ](https://developer.apple.com/documentation/network/nwethernetchannel)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/network/nwethernetchannel)
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
1 of 20 symbols inside 1404707731 
Managing Ethernet Channels
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 20 symbols inside 1404707731 [init(on: NWInterface, etherType: UInt16)](https://developer.apple.com/documentation/network/nwethernetchannel/init\(on:ethertype:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 20 symbols inside 1404707731 [func start(queue: DispatchQueue)](https://developer.apple.com/documentation/network/nwethernetchannel/start\(queue:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 20 symbols inside 1404707731 [func cancel()](https://developer.apple.com/documentation/network/nwethernetchannel/cancel\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 20 symbols inside 1404707731 
Handling State Updates
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
6 of 20 symbols inside 1404707731 [var state: NWEthernetChannel.State](https://developer.apple.com/documentation/network/nwethernetchannel/state-swift.property)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
7 of 20 symbols inside 1404707731 containing 7 symbols[NWEthernetChannel.State](https://developer.apple.com/documentation/network/nwethernetchannel/state-swift.enum)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
8 of 20 symbols inside 1404707731 [var stateUpdateHandler: ((NWEthernetChannel.State) -> Void)?](https://developer.apple.com/documentation/network/nwethernetchannel/stateupdatehandler)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 20 symbols inside 1404707731 
Sending and Receiving Ethernet Frames
131 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Network ](https://developer.apple.com/documentation/network)
  * [ NWEthernetChannel ](https://developer.apple.com/documentation/network/nwethernetchannel)
  *     * NWEthernetChannel 


Class
# NWEthernetChannel
An object you use to send and receive custom Ethernet frames.
macOS 10.15+
```
final class NWEthernetChannel
```

## [Overview](https://developer.apple.com/documentation/network/nwethernetchannel#overview)
Use Ethernet channels to send and receive custom Ethernet frame types over an interface.
Creating Ethernet channels requires the `com.apple.developer.networking.custom-protocol` entitlement.
## [Topics](https://developer.apple.com/documentation/network/nwethernetchannel#topics)
### [Managing Ethernet Channels](https://developer.apple.com/documentation/network/nwethernetchannel#Managing-Ethernet-Channels)
[`init(on: NWInterface, etherType: UInt16)`](https://developer.apple.com/documentation/network/nwethernetchannel/init\(on:ethertype:\))
Initializes an Ethernet channel on a specific interface with a custom Ethernet type.
[`func start(queue: DispatchQueue)`](https://developer.apple.com/documentation/network/nwethernetchannel/start\(queue:\))
Starts the process of registering the channel, and sets the queue on which all channel events are delivered.
[`func cancel()`](https://developer.apple.com/documentation/network/nwethernetchannel/cancel\(\))
Unregisters the channel from the interface.
### [Handling State Updates](https://developer.apple.com/documentation/network/nwethernetchannel#Handling-State-Updates)
[`var state: NWEthernetChannel.State`](https://developer.apple.com/documentation/network/nwethernetchannel/state-swift.property)
The current state of the channel.
[`enum State`](https://developer.apple.com/documentation/network/nwethernetchannel/state-swift.enum)
States indicating whether an Ethernet channel is able to send and receive frames.
[`var stateUpdateHandler: ((NWEthernetChannel.State) -> Void)?`](https://developer.apple.com/documentation/network/nwethernetchannel/stateupdatehandler)
A handler that delivers channel state updates.
### [Sending and Receiving Ethernet Frames](https://developer.apple.com/documentation/network/nwethernetchannel#Sending-and-Receiving-Ethernet-Frames)
[`func send(content: Data, to: NWEthernetChannel.EthernetAddress, vlanTag: UInt16, completion: (NWError?) -> Void)`](https://developer.apple.com/documentation/network/nwethernetchannel/send\(content:to:vlantag:completion:\))
Sends a single Ethernet frame over a channel to a specific Ethernet address.
[`var receiveHandler: ((Data, UInt16, NWEthernetChannel.EthernetAddress, NWEthernetChannel.EthernetAddress) -> Void)?`](https://developer.apple.com/documentation/network/nwethernetchannel/receivehandler)
A handler that delivers inbound Ethernet frames.
[`struct EthernetAddress`](https://developer.apple.com/documentation/network/nwethernetchannel/ethernetaddress)
A 48-bit Ethernet address.
### [Inspecting Ethernet Channels](https://developer.apple.com/documentation/network/nwethernetchannel#Inspecting-Ethernet-Channels)
[`let etherType: UInt16`](https://developer.apple.com/documentation/network/nwethernetchannel/ethertype)
The custom Ethernet type with which the channel was initialized.
[`let interface: NWInterface`](https://developer.apple.com/documentation/network/nwethernetchannel/interface)
The interface with which the channel was initialized.
[`var queue: DispatchQueue?`](https://developer.apple.com/documentation/network/nwethernetchannel/queue)
The queue on which channel events will be delivered.
### [Initializers](https://developer.apple.com/documentation/network/nwethernetchannel#Initializers)
[`init(on: NWInterface, etherType: UInt16, parameters: NWParameters)`](https://developer.apple.com/documentation/network/nwethernetchannel/init\(on:ethertype:parameters:\))
### [Instance Properties](https://developer.apple.com/documentation/network/nwethernetchannel#Instance-Properties)
[`var maximumPayloadSize: Int`](https://developer.apple.com/documentation/network/nwethernetchannel/maximumpayloadsize)
## [Relationships](https://developer.apple.com/documentation/network/nwethernetchannel#relationships)
### [Conforms To](https://developer.apple.com/documentation/network/nwethernetchannel#conforms-to)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)


## [See Also](https://developer.apple.com/documentation/network/nwethernetchannel#see-also)
### [Connections and Listeners](https://developer.apple.com/documentation/network/nwethernetchannel#Connections-and-Listeners)
[`class NWConnection`](https://developer.apple.com/documentation/network/nwconnection)
A bidirectional data connection between a local endpoint and a remote endpoint.
[`class NWListener`](https://developer.apple.com/documentation/network/nwlistener)
An object you use to listen for incoming network connections.
[`class NWBrowser`](https://developer.apple.com/documentation/network/nwbrowser)
An object you use to browse for available network services.
[`class NWConnectionGroup`](https://developer.apple.com/documentation/network/nwconnectiongroup)
An object you use to communicate with a group of endpoints, such as an IP multicast group on a local network.
Current page is NWEthernetChannel 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fnetwork%2Fnwethernetchannel).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
