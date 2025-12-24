Source: https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager

[ Skip Navigation ](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager)
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
[ Open Menu ](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager)


[](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager)
## [ Core Bluetooth  ](https://developer.apple.com/documentation/corebluetooth)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 41 symbols inside <root>
Centrals
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 41 symbols inside <root>
Centrals
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
2 of 41 symbols inside <root> containing 2 symbols[CBCentral](https://developer.apple.com/documentation/corebluetooth/cbcentral)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
3 of 41 symbols inside <root> containing 30 symbols[CBCentralManager](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 30 symbols inside -192671692 
Initializing a Central Manager
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 30 symbols inside -192671692 [convenience init()](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/init\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 30 symbols inside -192671692 [convenience init(delegate: (any CBCentralManagerDelegate)?, queue: dispatch_queue_t?)](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/init\(delegate:queue:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 30 symbols inside -192671692 [init(delegate: (any CBCentralManagerDelegate)?, queue: dispatch_queue_t?, options: [String : Any]?)](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/init\(delegate:queue:options:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
5 of 30 symbols inside -192671692 containing 3 symbols[Central Manager Initialization Options](https://developer.apple.com/documentation/corebluetooth/central-manager-initialization-options)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
6 of 30 symbols inside -192671692 containing 4 symbols[Central Manager State Restoration Options](https://developer.apple.com/documentation/corebluetooth/central-manager-state-restoration-options)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 30 symbols inside -192671692 
Establishing or Canceling Connections with Peripherals
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
8 of 30 symbols inside -192671692 [func connect(CBPeripheral, options: [String : Any]?)](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/connect\(_:options:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
9 of 30 symbols inside -192671692 containing 8 symbols[Peripheral Connection Options](https://developer.apple.com/documentation/corebluetooth/peripheral-connection-options)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
10 of 30 symbols inside -192671692 [func cancelPeripheralConnection(CBPeripheral)](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/cancelperipheralconnection\(_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
11 of 30 symbols inside -192671692 
Retrieving Lists of Peripherals
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
12 of 30 symbols inside -192671692 [func retrieveConnectedPeripherals(withServices: [CBUUID]) -> [CBPeripheral]](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/retrieveconnectedperipherals\(withservices:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
13 of 30 symbols inside -192671692 [func retrievePeripherals(withIdentifiers: [UUID]) -> [CBPeripheral]](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/retrieveperipherals\(withidentifiers:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
14 of 30 symbols inside -192671692 
Scanning or Stopping Scans of Peripherals
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
15 of 30 symbols inside -192671692 [func scanForPeripherals(withServices: [CBUUID]?, options: [String : Any]?)](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/scanforperipherals\(withservices:options:\))
71 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Core Bluetooth ](https://developer.apple.com/documentation/corebluetooth)
  * [ CBCentralManager ](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager)
  *     * CBCentralManager 


Class
# CBCentralManager
An object that scans for, discovers, connects to, and manages peripherals.
iOS 5.0+iPadOS 5.0+Mac Catalyst 13.1+macOS 10.7+tvOS 9.0+visionOS 1.0+watchOS 2.0+
```
class CBCentralManager
```

## [Overview](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager#overview)
[`CBCentralManager`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager) objects manage discovered or connected remote peripheral devices (represented by [`CBPeripheral`](https://developer.apple.com/documentation/corebluetooth/cbperipheral) objects), including scanning for, discovering, and connecting to advertising peripherals.
Before calling the [`CBCentralManager`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager) methods, set the state of the central manager object to powered on, as indicated by the [`CBCentralManagerState.poweredOn`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanagerstate/poweredon) constant. This state indicates that the central device (your iPhone or iPad, for instance) supports Bluetooth low energy and that Bluetooth is on and available for use.
## [Topics](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager#topics)
### [Initializing a Central Manager](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager#Initializing-a-Central-Manager)
[`convenience init()`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/init\(\))
Initializes the central manager without a delegate.
[`convenience init(delegate: (any CBCentralManagerDelegate)?, queue: dispatch_queue_t?)`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/init\(delegate:queue:\))
Initializes the central manager with a specified delegate and dispatch queue.
[`init(delegate: (any CBCentralManagerDelegate)?, queue: dispatch_queue_t?, options: [String : Any]?)`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/init\(delegate:queue:options:\))
Initializes the central manager with specified delegate, dispatch queue, and initialization options.
[API Reference Central Manager Initialization Options](https://developer.apple.com/documentation/corebluetooth/central-manager-initialization-options)
Keys used to pass options when initializing a central manager.
[API Reference Central Manager State Restoration Options](https://developer.apple.com/documentation/corebluetooth/central-manager-state-restoration-options)
Keys used to pass state restoration options to the central manager initializer.
### [Establishing or Canceling Connections with Peripherals](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager#Establishing-or-Canceling-Connections-with-Peripherals)
[`func connect(CBPeripheral, options: [String : Any]?)`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/connect\(_:options:\))
Establishes a local connection to a peripheral.
[API Reference Peripheral Connection Options](https://developer.apple.com/documentation/corebluetooth/peripheral-connection-options)
Keys used to pass options when connecting to a peripheral.
[`func cancelPeripheralConnection(CBPeripheral)`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/cancelperipheralconnection\(_:\))
Cancels an active or pending local connection to a peripheral.
### [Retrieving Lists of Peripherals](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager#Retrieving-Lists-of-Peripherals)
[`func retrieveConnectedPeripherals(withServices: [CBUUID]) -> [CBPeripheral]`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/retrieveconnectedperipherals\(withservices:\))
Returns a list of the peripherals connected to the system whose services match a given set of criteria.
[`func retrievePeripherals(withIdentifiers: [UUID]) -> [CBPeripheral]`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/retrieveperipherals\(withidentifiers:\))
Returns a list of known peripherals by their identifiers.
### [Scanning or Stopping Scans of Peripherals](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager#Scanning-or-Stopping-Scans-of-Peripherals)
[`func scanForPeripherals(withServices: [CBUUID]?, options: [String : Any]?)`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/scanforperipherals\(withservices:options:\))
Scans for peripherals that are advertising services.
[API Reference Peripheral Scanning Options](https://developer.apple.com/documentation/corebluetooth/peripheral-scanning-options)
Keys used to pass options when scanning for peripherals.
[`func stopScan()`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/stopscan\(\))
Asks the central manager to stop scanning for peripherals.
[`var isScanning: Bool`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/isscanning)
A Boolean value that indicates whether the central is currently scanning.
### [Inspecting Feature Support](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager#Inspecting-Feature-Support)
[`class func supports(CBCentralManager.Feature) -> Bool`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/supports\(_:\))
Returns a Boolean that indicates whether the device supports a specific set of features.
[`struct Feature`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/feature)
An option set of device-specific features.
### [Monitoring Properties](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager#Monitoring-Properties)
[`var delegate: (any CBCentralManagerDelegate)?`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/delegate)
The delegate object that you want to receive central manager events.
### [Receiving Connection Events](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager#Receiving-Connection-Events)
[`func registerForConnectionEvents(options: [CBConnectionEventMatchingOption : Any]?)`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager/registerforconnectionevents\(options:\))
Register for an event notification when the central manager makes a connection matching the given options.
[API Reference Peripheral Connection Options](https://developer.apple.com/documentation/corebluetooth/peripheral-connection-options)
Keys used to pass options when connecting to a peripheral.
[`enum CBConnectionEvent`](https://developer.apple.com/documentation/corebluetooth/cbconnectionevent)
A change to the connection state of a peer.
[`struct CBConnectionEventMatchingOption`](https://developer.apple.com/documentation/corebluetooth/cbconnectioneventmatchingoption)
A set of options to use when registering for connection events.
### [Deprecated](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager#Deprecated)
[`enum CBCentralManagerState`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanagerstate)
Values that represent the current state of a central manager object.
Deprecated
## [Relationships](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager#relationships)
### [Inherits From](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager#inherits-from)
  * [`CBManager`](https://developer.apple.com/documentation/corebluetooth/cbmanager)


### [Conforms To](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager#conforms-to)
  * [`CVarArg`](https://developer.apple.com/documentation/Swift/CVarArg)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`NSObjectProtocol`](https://developer.apple.com/documentation/ObjectiveC/NSObjectProtocol)


## [See Also](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager#see-also)
### [Centrals](https://developer.apple.com/documentation/CoreBluetooth/CBCentralManager#Centrals)
[`class CBCentral`](https://developer.apple.com/documentation/corebluetooth/cbcentral)
A remote device connected to a local app, which is acting as a peripheral.
[`protocol CBCentralManagerDelegate`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanagerdelegate)
A protocol that provides updates for the discovery and management of peripheral devices.
Current page is CBCentralManager 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FCoreBluetooth%2FCBCentralManager).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
