Source: https://developer.apple.com/documentation/network/nwbrowser

[ Skip Navigation ](https://developer.apple.com/documentation/network/nwbrowser#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/network/nwbrowser#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/network/nwbrowser)
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
[ Open Menu ](https://developer.apple.com/documentation/network/nwbrowser)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/network/nwbrowser)
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
1 of 19 symbols inside 36008045 
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
2 of 19 symbols inside 36008045 [NSBonjourServices](https://developer.apple.com/documentation/bundleresources/information-property-list/nsbonjourservices)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
3 of 19 symbols inside 36008045 [NSLocalNetworkUsageDescription](https://developer.apple.com/documentation/bundleresources/information-property-list/nslocalnetworkusagedescription)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 19 symbols inside 36008045 
Browsing for Services
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
5 of 19 symbols inside 36008045 [init(for: NWBrowser.Descriptor, using: NWParameters)](https://developer.apple.com/documentation/network/nwbrowser/init\(for:using:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
6 of 19 symbols inside 36008045 containing 5 symbols[NWBrowser.Descriptor](https://developer.apple.com/documentation/network/nwbrowser/descriptor-swift.enum)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
7 of 19 symbols inside 36008045 [func start(queue: DispatchQueue)](https://developer.apple.com/documentation/network/nwbrowser/start\(queue:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
8 of 19 symbols inside 36008045 [var browseResultsChangedHandler: ((Set<NWBrowser.Result>, Set<NWBrowser.Result.Change>) -> Void)?](https://developer.apple.com/documentation/network/nwbrowser/browseresultschangedhandler)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
9 of 19 symbols inside 36008045 containing 8 symbols[NWBrowser.Result](https://developer.apple.com/documentation/network/nwbrowser/result)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
10 of 19 symbols inside 36008045 [var browseResults: Set<NWBrowser.Result>](https://developer.apple.com/documentation/network/nwbrowser/browseresults)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
11 of 19 symbols inside 36008045 
Managing Browsers
130 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Network ](https://developer.apple.com/documentation/network)
  * [ NWBrowser ](https://developer.apple.com/documentation/network/nwbrowser)
  *     * NWBrowser 


Class
# NWBrowser
An object you use to browse for available network services.
iOS 13.0+iPadOS 13.0+Mac Catalyst 13.0+macOS 10.15+tvOS 13.0+visionOS 1.0+watchOS 6.0+
```
final class NWBrowser
```

## [Topics](https://developer.apple.com/documentation/network/nwbrowser#topics)
### [Essentials](https://developer.apple.com/documentation/network/nwbrowser#Essentials)
[`NSBonjourServices`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/NSBonjourServices)
Bonjour service types browsed by the app.
[`NSLocalNetworkUsageDescription`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/NSLocalNetworkUsageDescription)
A message that tells people why the app is requesting access to the local network.
### [Browsing for Services](https://developer.apple.com/documentation/network/nwbrowser#Browsing-for-Services)
[`init(for: NWBrowser.Descriptor, using: NWParameters)`](https://developer.apple.com/documentation/network/nwbrowser/init\(for:using:\))
Initializes a browser with a type of service to discover.
[`enum Descriptor`](https://developer.apple.com/documentation/network/nwbrowser/descriptor-swift.enum)
A service description used to discover Bonjour services.
[`func start(queue: DispatchQueue)`](https://developer.apple.com/documentation/network/nwbrowser/start\(queue:\))
Starts browsing for services, and sets the queue on which all browser events will be delivered.
[`var browseResultsChangedHandler: ((Set<NWBrowser.Result>, Set<NWBrowser.Result.Change>) -> Void)?`](https://developer.apple.com/documentation/network/nwbrowser/browseresultschangedhandler)
A handler that delivers updates about discovered services.
[`struct Result`](https://developer.apple.com/documentation/network/nwbrowser/result)
A set of discovered services and changes from the last result.
[`var browseResults: Set<NWBrowser.Result>`](https://developer.apple.com/documentation/network/nwbrowser/browseresults)
The list of discovered services.
### [Managing Browsers](https://developer.apple.com/documentation/network/nwbrowser#Managing-Browsers)
[`var stateUpdateHandler: ((NWBrowser.State) -> Void)?`](https://developer.apple.com/documentation/network/nwbrowser/stateupdatehandler)
A handler that receives browser state updates.
[`enum State`](https://developer.apple.com/documentation/network/nwbrowser/state-swift.enum)
States indicating whether a browser is able to discover services.
[`var state: NWBrowser.State`](https://developer.apple.com/documentation/network/nwbrowser/state-swift.property)
The current state of the browser.
[`func cancel()`](https://developer.apple.com/documentation/network/nwbrowser/cancel\(\))
Stops browsing for services.
### [Inspecting Browsers](https://developer.apple.com/documentation/network/nwbrowser#Inspecting-Browsers)
[`let descriptor: NWBrowser.Descriptor`](https://developer.apple.com/documentation/network/nwbrowser/descriptor-swift.property)
The service descriptor with which the browser was initialized.
[`let parameters: NWParameters`](https://developer.apple.com/documentation/network/nwbrowser/parameters)
The parameters with which the browser was initialized.
[`var queue: DispatchQueue?`](https://developer.apple.com/documentation/network/nwbrowser/queue)
The queue on which browser events are delivered.
## [Relationships](https://developer.apple.com/documentation/network/nwbrowser#relationships)
### [Conforms To](https://developer.apple.com/documentation/network/nwbrowser#conforms-to)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)


## [See Also](https://developer.apple.com/documentation/network/nwbrowser#see-also)
### [Connections and Listeners](https://developer.apple.com/documentation/network/nwbrowser#Connections-and-Listeners)
[`class NWConnection`](https://developer.apple.com/documentation/network/nwconnection)
A bidirectional data connection between a local endpoint and a remote endpoint.
[`class NWListener`](https://developer.apple.com/documentation/network/nwlistener)
An object you use to listen for incoming network connections.
[`class NWConnectionGroup`](https://developer.apple.com/documentation/network/nwconnectiongroup)
An object you use to communicate with a group of endpoints, such as an IP multicast group on a local network.
[`class NWEthernetChannel`](https://developer.apple.com/documentation/network/nwethernetchannel)
An object you use to send and receive custom Ethernet frames.
Current page is NWBrowser 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fnetwork%2Fnwbrowser).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
