Source: https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager

[ Skip Navigation ](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager)
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
[ Open Menu ](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager)


[](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager)
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
rP
4 of 41 symbols inside <root> containing 15 symbols[CBCentralManagerDelegate](https://developer.apple.com/documentation/corebluetooth/cbcentralmanagerdelegate)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 41 symbols inside <root>
Peripherals
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
6 of 41 symbols inside <root> containing 33 symbols[CBPeripheral](https://developer.apple.com/documentation/corebluetooth/cbperipheral)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
7 of 41 symbols inside <root> containing 23 symbols[CBPeripheralDelegate](https://developer.apple.com/documentation/corebluetooth/cbperipheraldelegate)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
8 of 41 symbols inside <root> containing 29 symbols[CBPeripheralManager](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 29 symbols inside -11191838 
Initializing a Peripheral Manager
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 29 symbols inside -11191838 [convenience init()](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/init\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 29 symbols inside -11191838 [convenience init(delegate: (any CBPeripheralManagerDelegate)?, queue: dispatch_queue_t?)](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/init\(delegate:queue:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 29 symbols inside -11191838 [init(delegate: (any CBPeripheralManagerDelegate)?, queue: dispatch_queue_t?, options: [String : Any]?)](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/init\(delegate:queue:options:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
5 of 29 symbols inside -11191838 [var delegate: (any CBPeripheralManagerDelegate)?](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/delegate)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
6 of 29 symbols inside -11191838 containing 3 symbols[Peripheral Manager Initialization Options](https://developer.apple.com/documentation/corebluetooth/peripheral-manager-initialization-options)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 29 symbols inside -11191838 
Monitoring the State of a Peripheral Manager
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
8 of 29 symbols inside -11191838 [class func authorizationStatus() -> CBPeripheralManagerAuthorizationStatus](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/authorizationstatus\(\))Deprecated
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
9 of 29 symbols inside -11191838 containing 7 symbols[CBPeripheralManagerAuthorizationStatus](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanagerauthorizationstatus)Deprecated
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
10 of 29 symbols inside -11191838 containing 9 symbols[CBPeripheralManagerState](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanagerstate)Deprecated
70 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Core Bluetooth ](https://developer.apple.com/documentation/corebluetooth)
  * [ CBPeripheralManager ](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager)
  *     * CBPeripheralManager 


Class
# CBPeripheralManager
An object that manages and advertises peripheral services exposed by this app.
iOS 6.0+iPadOS 6.0+Mac Catalyst 13.1+macOS 10.9+tvOS 9.0+visionOS 1.0+watchOS 2.0+
```
class CBPeripheralManager
```

## [Overview](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager#overview)
Core Bluetooth uses [`CBPeripheralManager`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager) objects to manage published services within the local peripheral’s Generic Attribute Profile (GATT) database and to advertise these services to central devices (represented by [`CBCentral`](https://developer.apple.com/documentation/corebluetooth/cbcentral) objects). While a service is in the database, any connected central can see and connect to it. That said, if your app hasn’t specified the `bluetooth-peripheral` background mode, the contents of its services become disabled when it’s in the background or in a suspended state. In this scenario, any remote central trying to access the service’s characteristic value or characteristic descriptors receives an error.
Before you call [`CBPeripheralManager`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager) methods, the peripheral manager object must be in the powered-on state, as indicated by the [`CBPeripheralManagerState.poweredOn`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanagerstate/poweredon). This state indicates that the device (your iPhone or iPad, for instance) supports Bluetooth low energy and that its Bluetooth is on and available for use.
In watchOS, tvOS, and visionOS, you can’t advertise services using a [`CBPeripheralManager`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager) object because support for doing so is unavailable.
## [Topics](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager#topics)
### [Initializing a Peripheral Manager](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager#Initializing-a-Peripheral-Manager)
[`convenience init()`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/init\(\))
Initializes the peripheral manager without a delegate.
[`convenience init(delegate: (any CBPeripheralManagerDelegate)?, queue: dispatch_queue_t?)`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/init\(delegate:queue:\))
Initializes the peripheral manager with a specified delegate and dispatch queue.
[`init(delegate: (any CBPeripheralManagerDelegate)?, queue: dispatch_queue_t?, options: [String : Any]?)`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/init\(delegate:queue:options:\))
Initializes the peripheral manager with a specified delegate, dispatch queue, and initialization options.
[`var delegate: (any CBPeripheralManagerDelegate)?`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/delegate)
The delegate object specified to receive peripheral events.
[API Reference Peripheral Manager Initialization Options](https://developer.apple.com/documentation/corebluetooth/peripheral-manager-initialization-options)
Keys used to specify options when creating a peripheral manager.
### [Monitoring the State of a Peripheral Manager](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager#Monitoring-the-State-of-a-Peripheral-Manager)
[`class func authorizationStatus() -> CBPeripheralManagerAuthorizationStatus`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/authorizationstatus\(\))
Returns the app’s authorization status for sharing data while in the background.
Deprecated
[`enum CBPeripheralManagerAuthorizationStatus`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanagerauthorizationstatus)
Values representing the current authorization state of the peripheral manager.
Deprecated
[`enum CBPeripheralManagerState`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanagerstate)
Values that represent the current state of the peripheral manager.
Deprecated
### [Adding and Removing Services](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager#Adding-and-Removing-Services)
[`func add(CBMutableService)`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/add\(_:\))
Publishes a service and any of its associated characteristics and characteristic descriptors to the local GATT database.
[`func remove(CBMutableService)`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/remove\(_:\))
Removes a specified published service from the local GATT database.
[`func removeAllServices()`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/removeallservices\(\))
Removes all published services from the local GATT database.
### [Managing Advertising](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager#Managing-Advertising)
[`func startAdvertising([String : Any]?)`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/startadvertising\(_:\))
Advertises peripheral manager data.
[API Reference Advertising Data](https://developer.apple.com/documentation/corebluetooth/advertising-data)
[`func stopAdvertising()`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/stopadvertising\(\))
Stops advertising peripheral manager data.
[`var isAdvertising: Bool`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/isadvertising)
A Boolean value that indicates whether the peripheral is advertising data.
### [Sending Updates of a Characteristic’s Value](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager#Sending-Updates-of-a-Characteristics-Value)
[`func updateValue(Data, for: CBMutableCharacteristic, onSubscribedCentrals: [CBCentral]?) -> Bool`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/updatevalue\(_:for:onsubscribedcentrals:\))
Send an updated characteristic value to one or more subscribed centrals, using a notification or indication.
### [Responding to Read and Write Requests](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager#Responding-to-Read-and-Write-Requests)
[`func respond(to: CBATTRequest, withResult: CBATTError.Code)`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/respond\(to:withresult:\))
Responds to a read or write request from a connected central.
### [Setting Connection Latency](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager#Setting-Connection-Latency)
[`func setDesiredConnectionLatency(CBPeripheralManagerConnectionLatency, for: CBCentral)`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/setdesiredconnectionlatency\(_:for:\))
Sets the desired connection latency for an existing connection to a central device.
[`enum CBPeripheralManagerConnectionLatency`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanagerconnectionlatency)
Values representing the connection latency of the peripheral manager.
### [Using L2CAP Channels](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager#Using-L2CAP-Channels)
[`func publishL2CAPChannel(withEncryption: Bool)`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/publishl2capchannel\(withencryption:\))
Creates a listener for incoming L2CAP channel connections.
[`func unpublishL2CAPChannel(CBL2CAPPSM)`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager/unpublishl2capchannel\(_:\))
Removes a published service from the local system.
## [Relationships](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager#relationships)
### [Inherits From](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager#inherits-from)
  * [`CBManager`](https://developer.apple.com/documentation/corebluetooth/cbmanager)


### [Conforms To](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager#conforms-to)
  * [`CVarArg`](https://developer.apple.com/documentation/Swift/CVarArg)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`NSObjectProtocol`](https://developer.apple.com/documentation/ObjectiveC/NSObjectProtocol)


## [See Also](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager#see-also)
### [Peripherals](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager#Peripherals)
[`class CBPeripheral`](https://developer.apple.com/documentation/corebluetooth/cbperipheral)
A remote peripheral device.
[`protocol CBPeripheralDelegate`](https://developer.apple.com/documentation/corebluetooth/cbperipheraldelegate)
A protocol that provides updates on the use of a peripheral’s services.
[`protocol CBPeripheralManagerDelegate`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanagerdelegate)
A protocol that provides updates for local peripheral state and interactions with remote central devices.
[`class CBAttribute`](https://developer.apple.com/documentation/corebluetooth/cbattribute)
A representation of common aspects of services offered by a peripheral.
[`struct CBAttributePermissions`](https://developer.apple.com/documentation/corebluetooth/cbattributepermissions)
Values that represent the read, write, and encryption permissions for a characteristic’s value.
Current page is CBPeripheralManager 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fcorebluetooth%2Fcbperipheralmanager).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
