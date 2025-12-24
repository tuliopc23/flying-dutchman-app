Source: https://developer.apple.com/documentation/NetworkExtension/configuring-a-wi-fi-accessory-to-join-a-network

[ Skip Navigation ](https://developer.apple.com/documentation/NetworkExtension/configuring-a-wi-fi-accessory-to-join-a-network#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/NetworkExtension/configuring-a-wi-fi-accessory-to-join-a-network#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/NetworkExtension/configuring-a-wi-fi-accessory-to-join-a-network)
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
[ Open Menu ](https://developer.apple.com/documentation/NetworkExtension/configuring-a-wi-fi-accessory-to-join-a-network)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/NetworkExtension/configuring-a-wi-fi-accessory-to-join-a-network)


[](https://developer.apple.com/documentation/NetworkExtension/configuring-a-wi-fi-accessory-to-join-a-network)
## [ Network Extension  ](https://developer.apple.com/documentation/networkextension)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 32 symbols inside <root>
Wi-Fi management
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 32 symbols inside <root>
Wi-Fi management
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
2 of 32 symbols inside <root> containing 7 symbols[Wi-Fi configuration](https://developer.apple.com/documentation/networkextension/wi-fi-configuration)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 32 symbols inside <root> [Configuring a Wi-Fi accessory to join a network](https://developer.apple.com/documentation/networkextension/configuring-a-wi-fi-accessory-to-join-a-network)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
4 of 32 symbols inside <root> containing 15 symbols[Hotspot helper](https://developer.apple.com/documentation/networkextension/hotspot-helper)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 32 symbols inside <root>
Virtual private networks
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 32 symbols inside <root> [Routing your VPN network traffic](https://developer.apple.com/documentation/networkextension/routing-your-vpn-network-traffic)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
7 of 32 symbols inside <root> containing 10 symbols[Personal VPN](https://developer.apple.com/documentation/networkextension/personal-vpn)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
8 of 32 symbols inside <root> containing 23 symbols[Packet tunnel provider](https://developer.apple.com/documentation/networkextension/packet-tunnel-provider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
9 of 32 symbols inside <root> containing 29 symbols[App proxy provider](https://developer.apple.com/documentation/networkextension/app-proxy-provider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 32 symbols inside <root>
Network relays
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
11 of 32 symbols inside <root> containing 5 symbols[Relays](https://developer.apple.com/documentation/networkextension/relays)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 32 symbols inside <root>
Content filters
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
13 of 32 symbols inside <root> containing 20 symbols[Content filter providers](https://developer.apple.com/documentation/networkextension/content-filter-providers)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
14 of 32 symbols inside <root> [Filtering Network Traffic](https://developer.apple.com/documentation/networkextension/filtering-network-traffic)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
15 of 32 symbols inside <root>
URL filters
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
16 of 32 symbols inside <root> containing 6 symbols[URL filters](https://developer.apple.com/documentation/networkextension/url-filters)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
17 of 32 symbols inside <root>
DNS configurations
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
18 of 32 symbols inside <root> containing 6 symbols[DNS settings](https://developer.apple.com/documentation/networkextension/dns-settings)
32 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Network Extension ](https://developer.apple.com/documentation/networkextension)
  * [ Configuring a Wi-Fi accessory to join a network ](https://developer.apple.com/documentation/NetworkExtension/configuring-a-wi-fi-accessory-to-join-a-network)
  *     * Configuring a Wi-Fi accessory to join a network 


Sample Code
# Configuring a Wi-Fi accessory to join a network
Associate an iOS device with an accessory’s network to deliver network configuration information.
[ Download ](https://docs-assets.developer.apple.com/published/fc33836bc209/ConfiguringAWiFiAccessoryToJoinANetwork.zip)
iOS 14.2+iPadOS 14.2+macOS 11.0+Xcode 12.4+
## [Overview](https://developer.apple.com/documentation/NetworkExtension/configuring-a-wi-fi-accessory-to-join-a-network#Overview)
When you’re building a Wi-Fi accessory, getting it to join the user’s network can be a challenge. The best way to accomplish this is by using [`EAWiFiUnconfiguredAccessoryBrowser`](https://developer.apple.com/documentation/ExternalAccessory/EAWiFiUnconfiguredAccessoryBrowser) in the MFi Wireless Accessory Configuration process. If you can’t use that process, this sample demonstrates an alternative method.
The sample uses a macOS app to act as an accessory and an iOS app running on an iOS device to configure that accessory. The goal for the iOS app is to deliver network information to the accessory so it can join the user’s standard Wi-Fi network. To do that, the iOS app needs to deliver the user’s network SSID and its passphrase to the accessory. After receiving this information, the accessory can use it to associate itself with the same network as the iOS device.
### [Configure the sample code project](https://developer.apple.com/documentation/NetworkExtension/configuring-a-wi-fi-accessory-to-join-a-network#Configure-the-sample-code-project)
After downloading the sample, follow these steps to configure it for use:
  1. The macOS target is `BrandXAccessory`.


  * In macOS, set up internet sharing (see [Share the internet connection on Mac with other network users](https://support.apple.com/guide/mac-help/share-internet-connection-mac-network-users-mchlp1540/mac)).
  * Set the SSID to `AccessoryWiFi` and the passphrase to `embedded1`.
  * Configure Internet Sharing to share your connection from Ethernet to computers using Wi-Fi.


  1. The iOS target is `BrandXAccessorySetup`, and requires the use of a physical device.
  2. When running the iOS target, you need to change the bundle identifier so that Xcode can create a unique provisioning profile with the project entitlements for your team. Do this in the Xcode Signing & Capabilities pane by altering the Bundle Identifier text field.


### [Run the sample code project](https://developer.apple.com/documentation/NetworkExtension/configuring-a-wi-fi-accessory-to-join-a-network#Run-the-sample-code-project)
The macOS app creates a QR code and a network listener. The QR code contains the accessory network information. The iOS app scans the QR code and sends that network information to the `BrandXAccessory` app for network configuration.
  1. Build and run the `BrandXAccessory` app.
  2. Build and run the `BrandXAccessorySetup` app on an iOS device, and associate the device with the user’s network.
  3. In the `BrandXAccessory` app, click Next to embed the accessory network information in a QR code. A QR code appears with the following encoded network information:
     * SSID of the accessory network: AccessoryWiFi
     * Passphrase of the accessory network: embedded1
     * Service URL for `NWConnection`
     * TLS PSK
     * TLS PSK identity
  4. In the iOS app, tap Capture Accessory Network Info to bring up a QR code capture session.
  5. Point the iOS device’s camera at the QR code in the `BrandXAccessory` app to capture, decode, and save the QR data. Tap Next.
  6. In the iOS app, tap Get Network Info to capture the user’s network SSID. Tap Next.
  7. In the iOS app, tap Associate to Accessory Network. `NEHotspotConfiguration` creates a Wi-Fi configuration with the accessory’s network data from the QR code, applies it to the device, and updates the device’s screen when the association finishes. Tap Next.
  8. In the iOS app, tap Confirm Network to confirm the device’s association with the accessory network. Tap Next.
  9. In the `BrandXAccessory` app, click Start Listener so the `NWListener` begins listening for incoming connections from the iOS app.
  10. In the iOS app, tap Enter Network Passphrase and enter the passphrase for the user’s network. Tap Set Passphrase.
  11. In the iOS app, tap Send Network Data. The sample sends the passphrase to the `BrandXAccessory` app, along with the user’s network SSID.
  12. In the `BrandXAccessory` app, the view displays the SSID and passphrase of the user’s network.
  13. In the iOS app, tap Next, and then tap Remove Network Configuration to disassociate from the accessory network and rejoin the user’s network.


## [See Also](https://developer.apple.com/documentation/NetworkExtension/configuring-a-wi-fi-accessory-to-join-a-network#see-also)
### [Wi-Fi management](https://developer.apple.com/documentation/NetworkExtension/configuring-a-wi-fi-accessory-to-join-a-network#Wi-Fi-management)
[API Reference Wi-Fi configuration](https://developer.apple.com/documentation/networkextension/wi-fi-configuration)
Add persistent Wi-Fi configurations, or temporarily move the device to a specific Wi-Fi network.
[API Reference Hotspot helper](https://developer.apple.com/documentation/networkextension/hotspot-helper)
Integrate your app with the iOS hotspot network subsystem.
Current page is Configuring a Wi-Fi accessory to join a network 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FNetworkExtension%2Fconfiguring-a-wi-fi-accessory-to-join-a-network).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
