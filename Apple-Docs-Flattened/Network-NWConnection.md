Source: https://developer.apple.com/documentation/network/nwconnection

[ Skip Navigation ](https://developer.apple.com/documentation/network/nwconnection#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/network/nwconnection#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/network/nwconnection)
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
[ Open Menu ](https://developer.apple.com/documentation/network/nwconnection)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/network/nwconnection)
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
1 of 46 symbols inside 1577751495 
Creating Connections
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 46 symbols inside 1577751495 [convenience init(host: NWEndpoint.Host, port: NWEndpoint.Port, using: NWParameters)](https://developer.apple.com/documentation/network/nwconnection/init\(host:port:using:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 46 symbols inside 1577751495 [init(to: NWEndpoint, using: NWParameters)](https://developer.apple.com/documentation/network/nwconnection/init\(to:using:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 46 symbols inside 1577751495 [func start(queue: DispatchQueue)](https://developer.apple.com/documentation/network/nwconnection/start\(queue:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
5 of 46 symbols inside 1577751495 [func restart()](https://developer.apple.com/documentation/network/nwconnection/restart\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 46 symbols inside 1577751495 
Handling State Updates
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
7 of 46 symbols inside 1577751495 [var state: NWConnection.State](https://developer.apple.com/documentation/network/nwconnection/state-swift.property)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
8 of 46 symbols inside 1577751495 containing 7 symbols[NWConnection.State](https://developer.apple.com/documentation/network/nwconnection/state-swift.enum)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
9 of 46 symbols inside 1577751495 [var stateUpdateHandler: ((NWConnection.State) -> Void)?](https://developer.apple.com/documentation/network/nwconnection/stateupdatehandler)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 46 symbols inside 1577751495 
Sending and Receiving Data
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
11 of 46 symbols inside 1577751495 [func send(content: Data?, contentContext: NWConnection.ContentContext, isComplete: Bool, completion: NWConnection.SendCompletion)](https://developer.apple.com/documentation/network/nwconnection/send\(content:contentcontext:iscomplete:completion:\)-5ecuz)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
12 of 46 symbols inside 1577751495 [func send<Content>(content: Content?, contentContext: NWConnection.ContentContext, isComplete: Bool, completion: NWConnection.SendCompletion)](https://developer.apple.com/documentation/network/nwconnection/send\(content:contentcontext:iscomplete:completion:\)-3mfmt)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
13 of 46 symbols inside 1577751495 containing 3 symbols[NWConnection.SendCompletion](https://developer.apple.com/documentation/network/nwconnection/sendcompletion)
157 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Network ](https://developer.apple.com/documentation/network)
  * [ NWConnection ](https://developer.apple.com/documentation/network/nwconnection)
  *     * NWConnection 


Class
# NWConnection
A bidirectional data connection between a local endpoint and a remote endpoint.
iOS 12.0+iPadOS 12.0+Mac Catalyst 12.0+macOS 10.14+tvOS 12.0+visionOS 1.0+watchOS 5.0+
```
final class NWConnection
```

## [ Mentioned in ](https://developer.apple.com/documentation/network/nwconnection#mentions)
[](https://developer.apple.com/documentation/network/inspecting-app-activity-data)
## [Topics](https://developer.apple.com/documentation/network/nwconnection#topics)
### [Creating Connections](https://developer.apple.com/documentation/network/nwconnection#Creating-Connections)
[`convenience init(host: NWEndpoint.Host, port: NWEndpoint.Port, using: NWParameters)`](https://developer.apple.com/documentation/network/nwconnection/init\(host:port:using:\))
Initializes a new connection to a host and port.
[`init(to: NWEndpoint, using: NWParameters)`](https://developer.apple.com/documentation/network/nwconnection/init\(to:using:\))
Initializes a new connection to a remote endpoint.
[`func start(queue: DispatchQueue)`](https://developer.apple.com/documentation/network/nwconnection/start\(queue:\))
Starts establishing a connection, and sets the queue on which to deliver all connection events.
[`func restart()`](https://developer.apple.com/documentation/network/nwconnection/restart\(\))
Restarts a connection that is in the waiting state.
### [Handling State Updates](https://developer.apple.com/documentation/network/nwconnection#Handling-State-Updates)
[`var state: NWConnection.State`](https://developer.apple.com/documentation/network/nwconnection/state-swift.property)
The current state of the connection.
[`enum State`](https://developer.apple.com/documentation/network/nwconnection/state-swift.enum)
States indicating whether a connection can be used to send and receive data.
[`var stateUpdateHandler: ((NWConnection.State) -> Void)?`](https://developer.apple.com/documentation/network/nwconnection/stateupdatehandler)
A handler that receives connection state updates.
### [Sending and Receiving Data](https://developer.apple.com/documentation/network/nwconnection#Sending-and-Receiving-Data)
[`func send(content: Data?, contentContext: NWConnection.ContentContext, isComplete: Bool, completion: NWConnection.SendCompletion)`](https://developer.apple.com/documentation/network/nwconnection/send\(content:contentcontext:iscomplete:completion:\)-5ecuz)
Sends data on a connection.
[`func send<Content>(content: Content?, contentContext: NWConnection.ContentContext, isComplete: Bool, completion: NWConnection.SendCompletion)`](https://developer.apple.com/documentation/network/nwconnection/send\(content:contentcontext:iscomplete:completion:\)-3mfmt)
Sends data on a connection using a custom Data type.
[`enum SendCompletion`](https://developer.apple.com/documentation/network/nwconnection/sendcompletion)
A completion handler that indicates when the connection has finished processing sent content.
[`func receive(minimumIncompleteLength: Int, maximumLength: Int, completion: (Data?, NWConnection.ContentContext?, Bool, NWError?) -> Void)`](https://developer.apple.com/documentation/network/nwconnection/receive\(minimumincompletelength:maximumlength:completion:\))
Schedules a single receive completion handler, with a range indicating how many bytes the handler can receive at one time.
[`func receiveMessage(completion: (Data?, NWConnection.ContentContext?, Bool, NWError?) -> Void)`](https://developer.apple.com/documentation/network/nwconnection/receivemessage\(completion:\))
Schedules a single receive completion handler for a complete message, as opposed to a range of bytes.
[`func batch(() -> Void)`](https://developer.apple.com/documentation/network/nwconnection/batch\(_:\))
Defines a block in which calls to send and receive are processed as a batch to improve performance.
[`class ContentContext`](https://developer.apple.com/documentation/network/nwconnection/contentcontext)
An object that represents a message to send or receive, containing protocol metadata and send properties.
[`var maximumDatagramSize: Int`](https://developer.apple.com/documentation/network/nwconnection/maximumdatagramsize)
The maximum size of a datagram message that can be sent on a connection.
### [Canceling Connections](https://developer.apple.com/documentation/network/nwconnection#Canceling-Connections)
[`func cancel()`](https://developer.apple.com/documentation/network/nwconnection/cancel\(\))
Cancels the connection and gracefully disconnects any established network protocols.
[`func forceCancel()`](https://developer.apple.com/documentation/network/nwconnection/forcecancel\(\))
Cancels the connection and immediately disconnects any established network protocols.
[`func cancelCurrentEndpoint()`](https://developer.apple.com/documentation/network/nwconnection/cancelcurrentendpoint\(\))
Causes the current endpoint to be rejected, allowing the connection to try another resolved address.
### [Handling Path Updates](https://developer.apple.com/documentation/network/nwconnection#Handling-Path-Updates)
[`var currentPath: NWPath?`](https://developer.apple.com/documentation/network/nwconnection/currentpath)
The network path the connection is using.
[`var pathUpdateHandler: ((NWPath) -> Void)?`](https://developer.apple.com/documentation/network/nwconnection/pathupdatehandler)
A handler that receives network path updates.
[`var viabilityUpdateHandler: ((Bool) -> Void)?`](https://developer.apple.com/documentation/network/nwconnection/viabilityupdatehandler)
A handler that receives updates when data can be sent and received.
[`var betterPathUpdateHandler: ((Bool) -> Void)?`](https://developer.apple.com/documentation/network/nwconnection/betterpathupdatehandler)
A handler that receives updates when an alternative network path is preferred over the current path.
### [Collecting Connection Metrics](https://developer.apple.com/documentation/network/nwconnection#Collecting-Connection-Metrics)
[Collecting Network Connection Metrics](https://developer.apple.com/documentation/network/collecting-network-connection-metrics)
Use reports to understand how DNS and protocol handshakes impact connection establishment.
[`func requestEstablishmentReport(queue: DispatchQueue, completion: (NWConnection.EstablishmentReport?) -> Void)`](https://developer.apple.com/documentation/network/nwconnection/requestestablishmentreport\(queue:completion:\))
Requests a copy of the connection’s establishment report once the connection is in the ready state.
[`struct EstablishmentReport`](https://developer.apple.com/documentation/network/nwconnection/establishmentreport)
A report that provides metrics about the establishment of a connection.
[`func startDataTransferReport() -> NWConnection.PendingDataTransferReport`](https://developer.apple.com/documentation/network/nwconnection/startdatatransferreport\(\))
Begins a new data transfer report, which can later be collected.
[`class PendingDataTransferReport`](https://developer.apple.com/documentation/network/nwconnection/pendingdatatransferreport)
An outstanding data transfer report that has yet to be collected.
[`struct DataTransferReport`](https://developer.apple.com/documentation/network/nwconnection/datatransferreport)
A report that provides metrics about data being sent and received on a connection.
### [Inspecting Connections](https://developer.apple.com/documentation/network/nwconnection#Inspecting-Connections)
[`func metadata(definition: NWProtocolDefinition) -> NWProtocolMetadata?`](https://developer.apple.com/documentation/network/nwconnection/metadata\(definition:\))
Retrieves the connection-wide metadata for a specific protocol.
[`class NWProtocolMetadata`](https://developer.apple.com/documentation/network/nwprotocolmetadata)
The abstract superclass for specifying metadata about a network protocol.
[`let endpoint: NWEndpoint`](https://developer.apple.com/documentation/network/nwconnection/endpoint)
The remote endpoint with which the connection was initialized.
[`let parameters: NWParameters`](https://developer.apple.com/documentation/network/nwconnection/parameters)
The parameters with which the connection was initialized.
[`var queue: DispatchQueue?`](https://developer.apple.com/documentation/network/nwconnection/queue)
The queue on which connection events are delivered.
### [Initializers](https://developer.apple.com/documentation/network/nwconnection#Initializers)
[`convenience init?(from: NWConnectionGroup, to: NWEndpoint?, using: NWProtocolOptions?)`](https://developer.apple.com/documentation/network/nwconnection/init\(from:to:using:\))
[`convenience init?(message: NWConnectionGroup.Message)`](https://developer.apple.com/documentation/network/nwconnection/init\(message:\))
### [Instance Methods](https://developer.apple.com/documentation/network/nwconnection#Instance-Methods)
[`func receiveDiscontiguous(minimumIncompleteLength: Int, maximumLength: Int, completion: (DispatchData?, NWConnection.ContentContext?, Bool, NWError?) -> Void)`](https://developer.apple.com/documentation/network/nwconnection/receivediscontiguous\(minimumincompletelength:maximumlength:completion:\))
[`func receiveMessageDiscontiguous(completion: (DispatchData?, NWConnection.ContentContext?, Bool, NWError?) -> Void)`](https://developer.apple.com/documentation/network/nwconnection/receivemessagediscontiguous\(completion:\))
## [Relationships](https://developer.apple.com/documentation/network/nwconnection#relationships)
### [Conforms To](https://developer.apple.com/documentation/network/nwconnection#conforms-to)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)


## [See Also](https://developer.apple.com/documentation/network/nwconnection#see-also)
### [Connections and Listeners](https://developer.apple.com/documentation/network/nwconnection#Connections-and-Listeners)
[`class NWListener`](https://developer.apple.com/documentation/network/nwlistener)
An object you use to listen for incoming network connections.
[`class NWBrowser`](https://developer.apple.com/documentation/network/nwbrowser)
An object you use to browse for available network services.
[`class NWConnectionGroup`](https://developer.apple.com/documentation/network/nwconnectiongroup)
An object you use to communicate with a group of endpoints, such as an IP multicast group on a local network.
[`class NWEthernetChannel`](https://developer.apple.com/documentation/network/nwethernetchannel)
An object you use to send and receive custom Ethernet frames.
Current page is NWConnection 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fnetwork%2Fnwconnection).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
