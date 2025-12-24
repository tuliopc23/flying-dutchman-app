Source: https://developer.apple.com/documentation/network/nwconnectiongroup

[ Skip Navigation ](https://developer.apple.com/documentation/network/nwconnectiongroup#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/network/nwconnectiongroup#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/network/nwconnectiongroup)
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
[ Open Menu ](https://developer.apple.com/documentation/network/nwconnectiongroup)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/network/nwconnectiongroup)
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
1 of 24 symbols inside 839099943 
Establishing Group Connectivity
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 24 symbols inside 839099943 [init(with: any NWGroupDescriptor, using: NWParameters)](https://developer.apple.com/documentation/network/nwconnectiongroup/init\(with:using:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
3 of 24 symbols inside 839099943 containing 8 symbols[NWMulticastGroup](https://developer.apple.com/documentation/network/nwmulticastgroup)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
4 of 24 symbols inside 839099943 containing 2 symbols[NWGroupDescriptor](https://developer.apple.com/documentation/network/nwgroupdescriptor)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
5 of 24 symbols inside 839099943 [func start(queue: DispatchQueue)](https://developer.apple.com/documentation/network/nwconnectiongroup/start\(queue:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 24 symbols inside 839099943 
Sending and Receiving Group Messages
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
7 of 24 symbols inside 839099943 [func setReceiveHandler(maximumMessageSize: Int, rejectOversizedMessages: Bool, handler: ((NWConnectionGroup.Message, Data?, Bool) -> Void)?)](https://developer.apple.com/documentation/network/nwconnectiongroup/setreceivehandler\(maximummessagesize:rejectoversizedmessages:handler:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
8 of 24 symbols inside 839099943 [func send(content: Data?, to: NWEndpoint?, message: NWConnectionGroup.Message, completion: (NWError?) -> Void)](https://developer.apple.com/documentation/network/nwconnectiongroup/send\(content:to:message:completion:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
9 of 24 symbols inside 839099943 containing 14 symbols[NWConnectionGroup.Message](https://developer.apple.com/documentation/network/nwconnectiongroup/message)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 24 symbols inside 839099943 
Managing Groups
135 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Network ](https://developer.apple.com/documentation/network)
  * [ NWConnectionGroup ](https://developer.apple.com/documentation/network/nwconnectiongroup)
  *     * NWConnectionGroup 


Class
# NWConnectionGroup
An object you use to communicate with a group of endpoints, such as an IP multicast group on a local network.
iOS 14.0+iPadOS 14.0+Mac Catalyst 14.0+macOS 11.0+tvOS 14.0+visionOS 1.0+watchOS 7.0+
```
final class NWConnectionGroup
```

## [Topics](https://developer.apple.com/documentation/network/nwconnectiongroup#topics)
### [Establishing Group Connectivity](https://developer.apple.com/documentation/network/nwconnectiongroup#Establishing-Group-Connectivity)
[`init(with: any NWGroupDescriptor, using: NWParameters)`](https://developer.apple.com/documentation/network/nwconnectiongroup/init\(with:using:\))
Initializes a new connection group with a group identifier.
[`class NWMulticastGroup`](https://developer.apple.com/documentation/network/nwmulticastgroup)
A descriptor for a group you use to join an IP multicast group on a local network.
[`protocol NWGroupDescriptor`](https://developer.apple.com/documentation/network/nwgroupdescriptor)
A protocol that defines a group of endpoints with which you can communicate, such as a multicast group.
[`func start(queue: DispatchQueue)`](https://developer.apple.com/documentation/network/nwconnectiongroup/start\(queue:\))
Joins the group, registers to receive messages, and sets the queue on you handle group events.
### [Sending and Receiving Group Messages](https://developer.apple.com/documentation/network/nwconnectiongroup#Sending-and-Receiving-Group-Messages)
[`func setReceiveHandler(maximumMessageSize: Int, rejectOversizedMessages: Bool, handler: ((NWConnectionGroup.Message, Data?, Bool) -> Void)?)`](https://developer.apple.com/documentation/network/nwconnectiongroup/setreceivehandler\(maximummessagesize:rejectoversizedmessages:handler:\))
Sets a handler that receives inbound messages from members of the group.
[`func send(content: Data?, to: NWEndpoint?, message: NWConnectionGroup.Message, completion: (NWError?) -> Void)`](https://developer.apple.com/documentation/network/nwconnectiongroup/send\(content:to:message:completion:\))
Sends data to the entire group, or to a specific member of the group.
[`class Message`](https://developer.apple.com/documentation/network/nwconnectiongroup/message)
An object that represents a message that you send or receive within a group, and that contains protocol metadata and send properties.
### [Managing Groups](https://developer.apple.com/documentation/network/nwconnectiongroup#Managing-Groups)
[`var stateUpdateHandler: ((NWConnectionGroup.State) -> Void)?`](https://developer.apple.com/documentation/network/nwconnectiongroup/stateupdatehandler)
A handler that receives connection group state updates.
[`enum State`](https://developer.apple.com/documentation/network/nwconnectiongroup/state-swift.enum)
States that indicate whether you can use a connection group to send and receive messages.
[`var state: NWConnectionGroup.State`](https://developer.apple.com/documentation/network/nwconnectiongroup/state-swift.property)
The current state of the connection group.
[`func cancel()`](https://developer.apple.com/documentation/network/nwconnectiongroup/cancel\(\))
Cancels the connection group object and leaves the network group.
### [Inspecting Groups](https://developer.apple.com/documentation/network/nwconnectiongroup#Inspecting-Groups)
[`let descriptor: any NWGroupDescriptor`](https://developer.apple.com/documentation/network/nwconnectiongroup/descriptor)
The descriptor of the group you use to initialize the connection group.
[`let parameters: NWParameters`](https://developer.apple.com/documentation/network/nwconnectiongroup/parameters)
The parameters with which you initialize the connection group.
[`var queue: DispatchQueue?`](https://developer.apple.com/documentation/network/nwconnectiongroup/queue)
The queue on which you handle group events.
### [Instance Properties](https://developer.apple.com/documentation/network/nwconnectiongroup#Instance-Properties)
[`var newConnectionHandler: ((NWConnection) -> Void)?`](https://developer.apple.com/documentation/network/nwconnectiongroup/newconnectionhandler)
### [Instance Methods](https://developer.apple.com/documentation/network/nwconnectiongroup#Instance-Methods)
[`func extract(connectionTo: NWEndpoint?, using: NWProtocolOptions?) -> NWConnection?`](https://developer.apple.com/documentation/network/nwconnectiongroup/extract\(connectionto:using:\))
[`func metadata(definition: NWProtocolDefinition) -> NWProtocolMetadata?`](https://developer.apple.com/documentation/network/nwconnectiongroup/metadata\(definition:\))
[`func reinsert(connection: NWConnection) -> Bool`](https://developer.apple.com/documentation/network/nwconnectiongroup/reinsert\(connection:\))
## [Relationships](https://developer.apple.com/documentation/network/nwconnectiongroup#relationships)
### [Conforms To](https://developer.apple.com/documentation/network/nwconnectiongroup#conforms-to)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)


## [See Also](https://developer.apple.com/documentation/network/nwconnectiongroup#see-also)
### [Connections and Listeners](https://developer.apple.com/documentation/network/nwconnectiongroup#Connections-and-Listeners)
[`class NWConnection`](https://developer.apple.com/documentation/network/nwconnection)
A bidirectional data connection between a local endpoint and a remote endpoint.
[`class NWListener`](https://developer.apple.com/documentation/network/nwlistener)
An object you use to listen for incoming network connections.
[`class NWBrowser`](https://developer.apple.com/documentation/network/nwbrowser)
An object you use to browse for available network services.
[`class NWEthernetChannel`](https://developer.apple.com/documentation/network/nwethernetchannel)
An object you use to send and receive custom Ethernet frames.
Current page is NWConnectionGroup 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fnetwork%2Fnwconnectiongroup).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
