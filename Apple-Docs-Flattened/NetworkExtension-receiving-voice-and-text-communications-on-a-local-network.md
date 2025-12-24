Source: https://developer.apple.com/documentation/NetworkExtension/receiving-voice-and-text-communications-on-a-local-network

[ Skip Navigation ](https://developer.apple.com/documentation/NetworkExtension/receiving-voice-and-text-communications-on-a-local-network#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/NetworkExtension/receiving-voice-and-text-communications-on-a-local-network#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/NetworkExtension/receiving-voice-and-text-communications-on-a-local-network)
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
[ Open Menu ](https://developer.apple.com/documentation/NetworkExtension/receiving-voice-and-text-communications-on-a-local-network)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/NetworkExtension/receiving-voice-and-text-communications-on-a-local-network)
## [ Network Extension  ](https://developer.apple.com/documentation/networkextension)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
31 of 32 symbols inside <root>
Enumerations
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
19 of 32 symbols inside <root> containing 12 symbols[DNS proxy provider](https://developer.apple.com/documentation/networkextension/dns-proxy-provider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
20 of 32 symbols inside <root>
Local networking
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
21 of 32 symbols inside <root> containing 5 symbols[Local push connectivity](https://developer.apple.com/documentation/networkextension/local-push-connectivity)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 5 symbols inside -83088631 
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
2 of 5 symbols inside -83088631 containing 25 symbols[NEAppPushManager](https://developer.apple.com/documentation/networkextension/neapppushmanager)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
3 of 5 symbols inside -83088631 containing 12 symbols[NEAppPushProvider](https://developer.apple.com/documentation/networkextension/neapppushprovider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 5 symbols inside -83088631 [Maintaining a Reliable Network Connection](https://developer.apple.com/documentation/networkextension/maintaining-a-reliable-network-connection)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 5 symbols inside -83088631 [Receiving Voice and Text Communications on a Local Network](https://developer.apple.com/documentation/networkextension/receiving-voice-and-text-communications-on-a-local-network)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
22 of 32 symbols inside <root>
App extensions
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
23 of 32 symbols inside <root> containing 2 symbols[NEAppExtensionConfiguration](https://developer.apple.com/documentation/networkextension/neappextensionconfiguration)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
24 of 32 symbols inside <root>
Protocols
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
25 of 32 symbols inside <root> containing 2 symbols[NEAppProxyUDPFlowHandling](https://developer.apple.com/documentation/networkextension/neappproxyudpflowhandling)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
26 of 32 symbols inside <root>
Structures
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
27 of 32 symbols inside <root> containing 8 symbols[NETunnelProviderError](https://developer.apple.com/documentation/networkextension/netunnelprovidererror-swift.struct)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
28 of 32 symbols inside <root> containing 11 symbols[NEVPNError](https://developer.apple.com/documentation/networkextension/nevpnerror-swift.struct)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
29 of 32 symbols inside <root>
Variables
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
V
30 of 32 symbols inside <root> [let NERelayClientErrorDomain: String](https://developer.apple.com/documentation/networkextension/nerelayclienterrordomain)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
31 of 32 symbols inside <root>
Enumerations
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
32 of 32 symbols inside <root> containing 13 symbols[NERelayManagerClientError](https://developer.apple.com/documentation/networkextension/nerelaymanagerclienterror)
37 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Network Extension ](https://developer.apple.com/documentation/networkextension)
  * [ Local push connectivity ](https://developer.apple.com/documentation/networkextension/local-push-connectivity)
  * [ Receiving Voice and Text Communications on a Local Network ](https://developer.apple.com/documentation/NetworkExtension/receiving-voice-and-text-communications-on-a-local-network)
  *     * [ Local push connectivity ](https://developer.apple.com/documentation/networkextension/local-push-connectivity)
    * Receiving Voice and Text Communications on a Local Network 


Sample Code
# Receiving Voice and Text Communications on a Local Network
Provide voice and text communication on a local network isolated from Apple Push Notification service by adopting Local Push Connectivity.
[ Download ](https://docs-assets.developer.apple.com/published/f55c63838213/ReceivingVoiceAndTextCommunicationsOnALocalNetwork.zip)
iOS 26.0+iPadOS 26.0+macOS 11.0+Xcode 17.0+
## [Overview](https://developer.apple.com/documentation/NetworkExtension/receiving-voice-and-text-communications-on-a-local-network#Overview)
This sample app shows how to implement and use Local Push Connectivity within a messaging app. The sample workspace contains two app components:
  * `SimplePush` — An iOS app that uses Local Push Connectivity to provide text messaging and VoIP services.
  * `SimplePushServer` — A lightweight Swift server that simulates the functions of a messaging server by routing messages and calls between clients.


The `SimplePush` app maintains two connections to the server:
  * Notification Channel — A TCP connection the [`NEAppPushProvider`](https://developer.apple.com/documentation/NetworkExtension/NEAppPushProvider) maintains that provides functionality similar to Apple Push Notification service (APNs) when on a local Wi-Fi or private LTE network.
  * Control Channel — A TCP connection the iOS app maintains and uses to send app control data to the server.


To run the sample, you need a Mac to operate as the server, and two iOS devices (such as an iPhone and an iPad, or an iPod touch and an iPhone) that can connect to the server to communicate with each other.
### [Configure the Sample Code Project](https://developer.apple.com/documentation/NetworkExtension/receiving-voice-and-text-communications-on-a-local-network#Configure-the-Sample-Code-Project)
Apps that use Local Push Connectivity require the [App Push Provider entitlement](https://developer.apple.com/contact/request/local-push-connectivity).
After you receive the entitlement, do the following:
  1. Open `SimplePush.xcworkspace` and set the development team in the build settings of all five targets across the three projects. After you’ve set the team, Xcode automatically creates unique bundle identifiers that you use in the following steps.
  2. Sign into your account on the Apple Developer website and register a new App Group and two App IDs: one for the SimplePush app and one for the SimplePushProvider extension. Configure each App ID with the App Groups and Network Extensions capabilities. After you register the IDs, create two provisioning profiles (one for each identifier) that include the App Push Provider entitlement.
  3. Import the newly created provisioning profiles into Xcode.
  4. In the SimplePush project, configure the `SimplePush` and `SimplePushProvider` targets with the imported provisioning profiles, deselect the existing App Group, and select the new App Group identifier you created in step 2.
  5. Update the `pushProviderBundleIdentifier` in `PushConfigurationManager.swift` with the bundle identifier set on the `SimplePushProvider` target.


### [Build and Run the Sample Server](https://developer.apple.com/documentation/NetworkExtension/receiving-voice-and-text-communications-on-a-local-network#Build-and-Run-the-Sample-Server)
Select the `SimplePushServer` build scheme and your Mac as the run destination, then run the project to start the server.
### [Build, Run, and Configure the Sample App](https://developer.apple.com/documentation/NetworkExtension/receiving-voice-and-text-communications-on-a-local-network#Build-Run-and-Configure-the-Sample-App)
With the server running, select the `SimplePush` iOS build scheme and run the project on your iOS device. When `SimplePush` starts, update the app’s settings to connect to the server. Tap the Settings button and enter the following information:
  1. Enter the Server Address, which is the IP address or hostname of the Mac where `SimplePushServer` is running.
  2. Enter one or more of the following network configurations:
     * Wi-Fi — Enter the SSID of your local Wi-Fi network. The `NEAppPushProvider` runs when your device joins the Wi-Fi network with the SSID you’ve specified.
     * Cellular—Enter the Mobile Country Code and Mobile Network Code of your cellular provider. If the device is connected to a Band 48 CBRS cellular network, enter the Tracking Area Code for the network.
     * Ethernet — The `NEAppPushProvider` runs when your device is connected to an Ethernet network and the ethernet network is the primary route on the device.


Important
All cellular networks other than Band 48 CBRS require the device to be supervised for `NEAppPushProvider` to run. For more information, see [Supervision of Apple devices](https://support.apple.com/guide/deployment-reference-ios/enabling-device-supervision-ior7ba06c270/web).
After configuring the settings above, the Local Push Connectivity - Active setting displays “Yes” when `NEAppPushProvider` is running. You must perform the steps above on at least two iOS devices so you can test and observe message exchanges between clients.
## [See Also](https://developer.apple.com/documentation/NetworkExtension/receiving-voice-and-text-communications-on-a-local-network#see-also)
### [Essentials](https://developer.apple.com/documentation/NetworkExtension/receiving-voice-and-text-communications-on-a-local-network#Essentials)
[`class NEAppPushManager`](https://developer.apple.com/documentation/networkextension/neapppushmanager)
An object that configures a push provider and manages its life cycle.
[`class NEAppPushProvider`](https://developer.apple.com/documentation/networkextension/neapppushprovider)
An object that creates and maintains a persistent network connection to a local push server.
[Maintaining a Reliable Network Connection](https://developer.apple.com/documentation/networkextension/maintaining-a-reliable-network-connection)
Implement your Local Push Connectivity app to ensure delivery of notifications.
Current page is Receiving Voice and Text Communications on a Local Network 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FNetworkExtension%2Freceiving-voice-and-text-communications-on-a-local-network).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
