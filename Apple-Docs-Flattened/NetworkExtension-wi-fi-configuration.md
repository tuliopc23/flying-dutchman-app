Source: https://developer.apple.com/documentation/networkextension/wi-fi-configuration

[ Skip Navigation ](https://developer.apple.com/documentation/networkextension/wi-fi-configuration#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/networkextension/wi-fi-configuration#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/networkextension/wi-fi-configuration)
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
[ Open Menu ](https://developer.apple.com/documentation/networkextension/wi-fi-configuration)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/networkextension/wi-fi-configuration)


[](https://developer.apple.com/documentation/networkextension/wi-fi-configuration)
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
1 of 7 symbols inside 1226000229 
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
2 of 7 symbols inside 1226000229 [Hotspot Configuration Entitlement](https://developer.apple.com/documentation/bundleresources/entitlements/com.apple.developer.networking.hotspotconfiguration)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 7 symbols inside 1226000229 
Wi-Fi network configuration
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
4 of 7 symbols inside 1226000229 containing 16 symbols[NEHotspotConfigurationManager](https://developer.apple.com/documentation/networkextension/nehotspotconfigurationmanager)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
5 of 7 symbols inside 1226000229 containing 13 symbols[NEHotspotConfiguration](https://developer.apple.com/documentation/networkextension/nehotspotconfiguration)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
6 of 7 symbols inside 1226000229 containing 15 symbols[NEHotspotEAPSettings](https://developer.apple.com/documentation/networkextension/nehotspoteapsettings)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
7 of 7 symbols inside 1226000229 containing 8 symbols[NEHotspotHS20Settings](https://developer.apple.com/documentation/networkextension/nehotspoths20settings)
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
39 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Collection
  * [ Network Extension ](https://developer.apple.com/documentation/networkextension)
  * [ Wi-Fi configuration ](https://developer.apple.com/documentation/networkextension/wi-fi-configuration)
  *     * Wi-Fi configuration 


API Collection
# Wi-Fi configuration
Add persistent Wi-Fi configurations, or temporarily move the device to a specific Wi-Fi network.
## [Overview](https://developer.apple.com/documentation/networkextension/wi-fi-configuration#overview)
Using [`NEHotspotConfigurationManager`](https://developer.apple.com/documentation/networkextension/nehotspotconfigurationmanager), you can programmatically create two different types of Wi-Fi configurations:
  * Persistent configurations, which are equivalent to the user joining a Wi-Fi network using the Settings app
  * Join-once configurations, which temporarily move the device to a specific Wi-Fi network


The user must explicitly authorize both of these operations.
This API can help with a wide variety of tasks. For example, you can use it to help a user join a specific Wi-Fi network, like the hotspot at a local coffee shop, or to set up an accessory that uses Wi-Fi.
[`NEHotspotConfigurationManager`](https://developer.apple.com/documentation/networkextension/nehotspotconfigurationmanager) supports a variety of authentication models:
  * SSID with no authentication
  * SSID with password-based authentication (WEP, WPA, and WPA2)
  * SSID with EAP authentication
  * Hotspot 2.0 with EAP authentication


[`NEHotspotConfigurationManager`](https://developer.apple.com/documentation/networkextension/nehotspotconfigurationmanager) is only supported on iOS. For macOS, use the [Core WLAN](https://developer.apple.com/documentation/CoreWLAN) framework, which provides a full-featured Wi-Fi configuration and management API.
## [Topics](https://developer.apple.com/documentation/networkextension/wi-fi-configuration#topics)
### [Essentials](https://developer.apple.com/documentation/networkextension/wi-fi-configuration#Essentials)
[`Hotspot Configuration Entitlement`](https://developer.apple.com/documentation/BundleResources/Entitlements/com.apple.developer.networking.HotspotConfiguration)
A Boolean value indicating whether your app can use the hotspot manager to configure Wi-Fi networks.
### [Wi-Fi network configuration](https://developer.apple.com/documentation/networkextension/wi-fi-configuration#Wi-Fi-network-configuration)
[`class NEHotspotConfigurationManager`](https://developer.apple.com/documentation/networkextension/nehotspotconfigurationmanager)
A manager that applies and removes hotspot configurations of Wi-Fi networks.
[`class NEHotspotConfiguration`](https://developer.apple.com/documentation/networkextension/nehotspotconfiguration)
Configuration settings for a Wi-Fi network.
[`class NEHotspotEAPSettings`](https://developer.apple.com/documentation/networkextension/nehotspoteapsettings)
Extensible Authentication Protocol settings for configuring WPA and WPA2 enterprise Wi-Fi networks.
[`class NEHotspotHS20Settings`](https://developer.apple.com/documentation/networkextension/nehotspoths20settings)
Settings for configuring Hotspot 2.0 Wi-Fi networks.
## [See Also](https://developer.apple.com/documentation/networkextension/wi-fi-configuration#see-also)
### [Wi-Fi management](https://developer.apple.com/documentation/networkextension/wi-fi-configuration#Wi-Fi-management)
[Configuring a Wi-Fi accessory to join a network](https://developer.apple.com/documentation/networkextension/configuring-a-wi-fi-accessory-to-join-a-network)
Associate an iOS device with an accessory’s network to deliver network configuration information.
[API Reference Hotspot helper](https://developer.apple.com/documentation/networkextension/hotspot-helper)
Integrate your app with the iOS hotspot network subsystem.
Current page is Wi-Fi configuration 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fnetworkextension%2Fwi-fi-configuration).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
