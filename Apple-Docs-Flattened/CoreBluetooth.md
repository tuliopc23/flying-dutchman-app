Source: https://developer.apple.com/documentation/corebluetooth

[ Skip Navigation ](https://developer.apple.com/documentation/corebluetooth#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/corebluetooth#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/corebluetooth)
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
[ Open Menu ](https://developer.apple.com/documentation/corebluetooth)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/corebluetooth)


[](https://developer.apple.com/documentation/corebluetooth)
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
rP
9 of 41 symbols inside <root> containing 19 symbols[CBPeripheralManagerDelegate](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanagerdelegate)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
10 of 41 symbols inside <root> containing 2 symbols[CBAttribute](https://developer.apple.com/documentation/corebluetooth/cbattribute)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
11 of 41 symbols inside <root> containing 7 symbols[CBAttributePermissions](https://developer.apple.com/documentation/corebluetooth/cbattributepermissions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 41 symbols inside <root>
Data Transfer
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
13 of 41 symbols inside <root> [Transferring Data Between Bluetooth Low Energy Devices](https://developer.apple.com/documentation/corebluetooth/transferring-data-between-bluetooth-low-energy-devices)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
14 of 41 symbols inside <root>
Services
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
15 of 41 symbols inside <root> containing 6 symbols[CBService](https://developer.apple.com/documentation/corebluetooth/cbservice)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
16 of 41 symbols inside <root> containing 5 symbols[CBMutableService](https://developer.apple.com/documentation/corebluetooth/cbmutableservice)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
17 of 41 symbols inside <root> containing 9 symbols[CBCharacteristic](https://developer.apple.com/documentation/corebluetooth/cbcharacteristic)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
18 of 41 symbols inside <root> containing 9 symbols[CBMutableCharacteristic](https://developer.apple.com/documentation/corebluetooth/cbmutablecharacteristic)
41 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Framework
# Core Bluetooth
Communicate with Bluetooth low energy and BR/EDR (“Classic”) Devices.
iOS 5.0+iPadOS 5.0+Mac Catalyst 13.0+macOS 10.10+tvOS 9.0+visionOS 1.0+watchOS 4.0+
## [Overview](https://developer.apple.com/documentation/corebluetooth#overview)
The Core Bluetooth framework provides the classes needed for your apps to communicate with Bluetooth-equipped low energy (LE) and Basic Rate / Enhanced Data Rate (BR/EDR) wireless technology.
Don’t subclass any of the classes of the Core Bluetooth framework. Overriding these classes isn’t supported and results in undefined behavior.
Core Bluetooth background execution modes aren’t supported in iPad apps running on macOS.
In iOS 26 and later, your app can continue certain activities in the background if the app starts a Live Activity before it goes to the background. If your app has an instantiated [`CBManager`](https://developer.apple.com/documentation/corebluetooth/cbmanager) and starts a Live Activity, it can use the same privileges while in the background that it uses when it is in the foreground. This means activities like scanning without providing service UUID’s and scanning with duplicates filter disabled will be allowed while in the background. For more information about creating Live Activities, see [ActivityKit](https://developer.apple.com/documentation/ActivityKit).
Important
Your app will crash if its `Info.plist` doesn’t include usage description keys for the types of data it needs to access. To access Core Bluetooth APIs on apps linked on or after iOS 13, include the [`NSBluetoothAlwaysUsageDescription`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/NSBluetoothAlwaysUsageDescription) key. In iOS 12 and earlier, include [`NSBluetoothPeripheralUsageDescription`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/NSBluetoothPeripheralUsageDescription) to access Bluetooth peripheral data.
## [Topics](https://developer.apple.com/documentation/corebluetooth#topics)
### [Centrals](https://developer.apple.com/documentation/corebluetooth#Centrals)
[`class CBCentral`](https://developer.apple.com/documentation/corebluetooth/cbcentral)
A remote device connected to a local app, which is acting as a peripheral.
[`class CBCentralManager`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanager)
An object that scans for, discovers, connects to, and manages peripherals.
[`protocol CBCentralManagerDelegate`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanagerdelegate)
A protocol that provides updates for the discovery and management of peripheral devices.
### [Peripherals](https://developer.apple.com/documentation/corebluetooth#Peripherals)
[`class CBPeripheral`](https://developer.apple.com/documentation/corebluetooth/cbperipheral)
A remote peripheral device.
[`protocol CBPeripheralDelegate`](https://developer.apple.com/documentation/corebluetooth/cbperipheraldelegate)
A protocol that provides updates on the use of a peripheral’s services.
[`class CBPeripheralManager`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanager)
An object that manages and advertises peripheral services exposed by this app.
[`protocol CBPeripheralManagerDelegate`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanagerdelegate)
A protocol that provides updates for local peripheral state and interactions with remote central devices.
[`class CBAttribute`](https://developer.apple.com/documentation/corebluetooth/cbattribute)
A representation of common aspects of services offered by a peripheral.
[`struct CBAttributePermissions`](https://developer.apple.com/documentation/corebluetooth/cbattributepermissions)
Values that represent the read, write, and encryption permissions for a characteristic’s value.
### [Data Transfer](https://developer.apple.com/documentation/corebluetooth#Data-Transfer)
[Transferring Data Between Bluetooth Low Energy Devices](https://developer.apple.com/documentation/corebluetooth/transferring-data-between-bluetooth-low-energy-devices)
Create a Bluetooth low energy central and peripheral device, and allow them to discover each other and exchange data.
### [Services](https://developer.apple.com/documentation/corebluetooth#Services)
[`class CBService`](https://developer.apple.com/documentation/corebluetooth/cbservice)
A collection of data and associated behaviors that accomplish a function or feature of a device.
[`class CBMutableService`](https://developer.apple.com/documentation/corebluetooth/cbmutableservice)
A service with writeable property values.
[`class CBCharacteristic`](https://developer.apple.com/documentation/corebluetooth/cbcharacteristic)
A characteristic of a remote peripheral’s service.
[`class CBMutableCharacteristic`](https://developer.apple.com/documentation/corebluetooth/cbmutablecharacteristic)
A characteristic of a local peripheral’s service.
[`class CBDescriptor`](https://developer.apple.com/documentation/corebluetooth/cbdescriptor)
An object that provides further information about a remote peripheral’s characteristic.
[`class CBMutableDescriptor`](https://developer.apple.com/documentation/corebluetooth/cbmutabledescriptor)
An object that provides additional information about a local peripheral’s characteristic.
### [Supporting Types](https://developer.apple.com/documentation/corebluetooth#Supporting-Types)
[`class CBManager`](https://developer.apple.com/documentation/corebluetooth/cbmanager)
The abstract base class that manages central and peripheral objects.
[`class CBATTRequest`](https://developer.apple.com/documentation/corebluetooth/cbattrequest)
A request that uses the Attribute Protocol (ATT).
[`class CBPeer`](https://developer.apple.com/documentation/corebluetooth/cbpeer)
An object that represents a remote device.
[`class CBUUID`](https://developer.apple.com/documentation/corebluetooth/cbuuid)
A universally unique identifier, as defined by Bluetooth standards.
### [Bluetooth Classic Support](https://developer.apple.com/documentation/corebluetooth#Bluetooth-Classic-Support)
[Using Core Bluetooth Classic](https://developer.apple.com/documentation/corebluetooth/using-core-bluetooth-classic)
Discover and communicate with a Bluetooth Classic device by using the Core Bluetooth APIs.
### [Errors](https://developer.apple.com/documentation/corebluetooth#Errors)
[`struct CBError`](https://developer.apple.com/documentation/corebluetooth/cberror-swift.struct)
An error that Core Bluetooth returns during Bluetooth transactions.
[`let CBErrorDomain: String`](https://developer.apple.com/documentation/corebluetooth/cberrordomain)
The domain for Core Bluetooth errors.
[`enum Code`](https://developer.apple.com/documentation/corebluetooth/cberror-swift.struct/code)
The codes for errors that Core Bluetooth returns during Bluetooth transactions.
[`struct CBATTError`](https://developer.apple.com/documentation/corebluetooth/cbatterror-swift.struct)
An error that Core Bluetooth returns while using Attribute Protocol (ATT).
[`let CBATTErrorDomain: String`](https://developer.apple.com/documentation/corebluetooth/cbatterrordomain)
The domain for Core Bluetooth ATT errors.
[`enum Code`](https://developer.apple.com/documentation/corebluetooth/cbatterror-swift.struct/code)
The possible errors returned by a GATT server (a remote peripheral) during Bluetooth low energy ATT transactions.
[`struct CBATTError`](https://developer.apple.com/documentation/corebluetooth/cbatterror-swift.struct)
An error that Core Bluetooth returns while using Attribute Protocol (ATT).
### [Deprecated](https://developer.apple.com/documentation/corebluetooth#Deprecated)
[`enum CBCentralManagerState`](https://developer.apple.com/documentation/corebluetooth/cbcentralmanagerstate)
Values that represent the current state of a central manager object.
Deprecated
[`enum CBPeripheralManagerState`](https://developer.apple.com/documentation/corebluetooth/cbperipheralmanagerstate)
Values that represent the current state of the peripheral manager.
Deprecated
[API Reference Deprecated Constants](https://developer.apple.com/documentation/corebluetooth/deprecated-constants)
This document describes the constants found in the Core Bluetooth framework.
### [Variables](https://developer.apple.com/documentation/corebluetooth#Variables)
[`let CBUUIDCharacteristicObservationScheduleString: String`](https://developer.apple.com/documentation/corebluetooth/cbuuidcharacteristicobservationschedulestring)
## [See Also](https://developer.apple.com/documentation/corebluetooth#see-also)
### [Related Documentation](https://developer.apple.com/documentation/corebluetooth#Related-Documentation)
[Core Bluetooth Programming Guide](https://developer.apple.com/library/archive/documentation/NetworkingInternetWeb/Conceptual/CoreBluetooth_concepts/AboutCoreBluetooth/Introduction.html#//apple_ref/doc/uid/TP40013257)
Current page is Core Bluetooth 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fcorebluetooth).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
