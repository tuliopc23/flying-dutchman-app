Source: https://developer.apple.com/documentation/UIKit/requesting-access-to-protected-resources

[ Skip Navigation ](https://developer.apple.com/documentation/UIKit/requesting-access-to-protected-resources#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/UIKit/requesting-access-to-protected-resources#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/UIKit/requesting-access-to-protected-resources)
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
[ Open Menu ](https://developer.apple.com/documentation/UIKit/requesting-access-to-protected-resources)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/UIKit/requesting-access-to-protected-resources)


[](https://developer.apple.com/documentation/UIKit/requesting-access-to-protected-resources)
## [ UIKit  ](https://developer.apple.com/documentation/uikit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 46 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 46 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 46 symbols inside <root> [Adopting Liquid Glass](https://developer.apple.com/documentation/technologyoverviews/adopting-liquid-glass)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 46 symbols inside <root> [UIKit updates](https://developer.apple.com/documentation/updates/uikit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 46 symbols inside <root> [About App Development with UIKit](https://developer.apple.com/documentation/uikit/about-app-development-with-uikit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
5 of 46 symbols inside <root> containing 3 symbols[Protecting the User’s Privacy](https://developer.apple.com/documentation/uikit/protecting-the-user-s-privacy)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 3 symbols inside 1309780962 
Supporting Privacy
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 3 symbols inside 1309780962 [Requesting access to protected resources](https://developer.apple.com/documentation/uikit/requesting-access-to-protected-resources)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 3 symbols inside 1309780962 [Encrypting Your App’s Files](https://developer.apple.com/documentation/uikit/encrypting-your-app-s-files)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 46 symbols inside <root>
App structure
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
7 of 46 symbols inside <root> containing 26 symbols[App and environment](https://developer.apple.com/documentation/uikit/app-and-environment)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
8 of 46 symbols inside <root> containing 15 symbols[Documents, data, and pasteboard](https://developer.apple.com/documentation/uikit/documents-data-and-pasteboard)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
9 of 46 symbols inside <root> containing 11 symbols[Resource management](https://developer.apple.com/documentation/uikit/resource-management)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
10 of 46 symbols inside <root> containing 12 symbols[App extensions](https://developer.apple.com/documentation/uikit/app-extensions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
11 of 46 symbols inside <root> containing 8 symbols[Interprocess communication](https://developer.apple.com/documentation/uikit/interprocess-communication)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
12 of 46 symbols inside <root> containing 27 symbols[Mac Catalyst](https://developer.apple.com/documentation/uikit/mac-catalyst)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
13 of 46 symbols inside <root>
User interface
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
14 of 46 symbols inside <root> containing 70 symbols[Views and controls](https://developer.apple.com/documentation/uikit/views-and-controls)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
15 of 46 symbols inside <root> containing 80 symbols[View controllers](https://developer.apple.com/documentation/uikit/view-controllers)
49 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ UIKit ](https://developer.apple.com/documentation/uikit)
  * [ Protecting the User’s Privacy ](https://developer.apple.com/documentation/uikit/protecting-the-user-s-privacy)
  * [ Requesting access to protected resources ](https://developer.apple.com/documentation/UIKit/requesting-access-to-protected-resources)
  *     * [ Protecting the User’s Privacy ](https://developer.apple.com/documentation/uikit/protecting-the-user-s-privacy)
    * Requesting access to protected resources 


Article
# Requesting access to protected resources
Provide a purpose string that explains to a person why you need access to protected resources on their device.
## [Overview](https://developer.apple.com/documentation/UIKit/requesting-access-to-protected-resources#overview)
Modern devices collect and store a wealth of sensitive information about people who use them. Many apps rely on this kind of data, and the device hardware that generates it, to do useful work. For example, a navigation app needs a person’s GPS coordinates to locate the person on a map. But not all apps need access to all data. The same navigation app doesn’t need access to a person’s health history, camera interface, or Bluetooth peripherals.
Ensure your app accesses only what it needs to do its job. To support this principle, Apple’s operating systems restrict access to protected data and resources by default. Apps can request access on a case-by-case basis, providing an explanation for why they need access. The person who uses the app decides whether to grant or deny the request.
Tip
In addition to asking people for permission to access a resource, in some cases, you also need to separately declare your intent to do so by adding an entitlement to your app, as described in [`Entitlements`](https://developer.apple.com/documentation/BundleResources/Entitlements).
### [Provide a purpose string](https://developer.apple.com/documentation/UIKit/requesting-access-to-protected-resources#Provide-a-purpose-string)
The first time your app attempts to access a protected resource, the system prompts the person using the app for permission. In the following example, an iOS app called FoodDeliveryApp, which provides a food delivery service, generates a prompt requesting access to the person’s location:
![A screenshot of an iOS alert asking the user whether to allow FoodDeliveryApp access to their location data. The alert includes a purpose string message from the app’s developer, and includes the Allow Once, Allow While Using App, and Don't Allow options.](https://docs-assets.developer.apple.com/published/9bbda26c5bf077e001c92ca09aa71623/requesting-access-location-prompt%402x.png)
If the person grants permission, the system remembers the person’s choice and doesn’t prompt again. If the person denies permission, the access attempt that initiates the prompt, and any further attempts, fail in a resource-specific way. For the particular case of access to location data, the person can choose to allow access for one session only by tapping Allow Once.
The system automatically generates the prompt’s title, which includes the name of your app. You supply a message called a _purpose string_ or a _usage description_ — in this case, “Your location allows you to view restaurants in delivery range of your address.” — to indicate the reason that your app needs the access. Accurately and concisely explaining to the person why your app needs access to sensitive data, typically in one complete sentence, lets the person make an informed decision and improves the chances that they grant access.
To provide a purpose string, follow these steps in Xcode:
  1. Navigate to the Signing and Capabilities editor for your app.
  2. Click the Add (+) button to add a capability.
  3. Choose the protected resource you want to add; in this case, it’s “Location (When in Use)”.
  4. Enter the purpose string in the text field.


![A screenshot of the Xcode capability editor, showing the added NSLocationWhenInUseUsageDescription key and associated string value that matches the message in the previous figure.](https://docs-assets.developer.apple.com/published/75fb0a53e382312c6382f78a91a14342/requesting-access-capabilities-editor%402x.png)
Always provide a valid purpose string in the Signing and Capabilities editor if your app uses a protected resource. If you don’t, attempts to access the resource fail, and might cause your app to crash. Xcode detects when your app crashes for this reason and reports an issue, telling you to add the purpose string to your app. Click the Add button to provide the purpose string.
![A screenshot of Xcode. The debugger is active, showing that the app crashed because it needs to add a purpose string to access a protected resource.](https://docs-assets.developer.apple.com/published/658f95096c9c4e02cd99895dd1fd6b3e/requesting-access-fixme%402x.png)
Xcode adds a build setting to your app that configures the purpose string as the value for a [`Information Property List`](https://developer.apple.com/documentation/BundleResources/Information-Property-List); in this example, the key is [`NSLocationWhenInUseUsageDescription`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/NSLocationWhenInUseUsageDescription), so the build setting is `INFOPLIST_KEY_NSLocationWhenInUseUsageDescription`. For more information on configuring information property list values using build settings, see [Managing your app’s information property list values](https://developer.apple.com/documentation/BundleResources/managing-your-app-s-information-property-list).
If your app supports multiple locales, in addition to providing a purpose string in the Signing and Capabilities editor, localize the purpose string for each locale you support. Create a string catalog file called `InfoPlist.xcstrings`, and build your app to populate the string catalog with keys for the usage description strings in your app. Add the translations for your usage description strings to the localizations in the string catalog. For more information, see [Localizing and varying text with a string catalog](https://developer.apple.com/documentation/Xcode/localizing-and-varying-text-with-a-string-catalog).
### [Adhere to the requirements for purpose strings](https://developer.apple.com/documentation/UIKit/requesting-access-to-protected-resources#Adhere-to-the-requirements-for-purpose-strings)
To give people useful, concise information about why you’re requesting access to protected resources, make sure each purpose string you provide is valid by checking the following:
  * The purpose string isn’t blank and doesn’t consist solely of whitespace characters.
  * The purpose string is shorter than 4,000 bytes. Typical purpose strings are one complete sentence, but you can provide additional information to help a person make the right decision about sharing personal information.
  * The purpose string has the proper type that the corresponding key requires, typically a string.
  * The purpose string provides a description that’s accurate, meaningful, and specific about why the app needs to access the protected resource.


Adhere to these requirements for every purpose string in your app, including localized purpose strings.
App Review checks for the use of protected resources, and rejects apps that contain code accessing those resources without a purpose string. For example, an app accessing location might receive the following information from App Review about the requirement that an [`NSLocationWhenInUseUsageDescription`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/NSLocationWhenInUseUsageDescription) key be present:
```
ITMS-90683: Missing purpose string in Info.plist. 
Your app’s code references one or more APIs that access sensitive user 
data, or the app has one or more entitlements that permit such access. 
The Info.plist file for the "{app-bundle-path}" bundle should contain a 
NSLocationWhenInUseUsageDescription key with a user-facing purpose string 
explaining clearly and completely why your app needs the data.
If you’re using external libraries or SDKs, they may reference APIs that 
require a purpose string. While your app might not use these APIs, a 
purpose string is still required. For details, visit: 
https://developer.apple.com/documentation/uikit/protecting_the_user_s_privacy/requesting_access_to_protected_resources.

```

To resolve this issue, provide a purpose string that explains why the app needs access to this sensitive information, or remove the code that’s accessing the resource.
Note
If you’re using external libraries or SDKs, they may reference APIs that require a purpose string. Although your app might not use these APIs, a purpose string is still necessary for App Review. You can contact the developer of the library or SDK to request information about which protected resources the developer uses and their purpose, or request that the developer release a version of their code that doesn’t contain the APIs. You’re responsible for all access of protected resources, including external SDK and library access.
### [Check for authorization](https://developer.apple.com/documentation/UIKit/requesting-access-to-protected-resources#Check-for-authorization)
Many system frameworks that provide access to protected resources have dedicated APIs for checking and requesting authorization to use those resources. This model allows you to adjust your app’s behavior depending on the current access it has. For example, if a person denies your app permission to do something, you can remove related elements from your user interface.
Because a person can change authorization at any time using Settings, always check the authorization status of a feature before accessing it. In cases without a dedicated API, prepare your app to gracefully handle access failures.
### [Reset authorization access](https://developer.apple.com/documentation/UIKit/requesting-access-to-protected-resources#Reset-authorization-access)
When your app attempts to access a protected resource after its first attempt, the system remembers the person’s permission choice and doesn’t prompt again. To prompt the person again, you need to reset access to these resources on your device or system.
To reset permission access to a protected resource in iOS apps, tap Settings > General > Transfer or Reset iPhone > Reset > Reset Location & Privacy on your device.
Important
Using Reset Location & Privacy resets location and privacy settings for all services on your device.
To reset permissions for a particular service in macOS apps, run the `tccutil reset <service name>` command in Terminal. For example, to reset all permissions for AppleEvents, type:
```
$ tccutil reset AppleEvents

```

This command resets authorization access for all apps using the protected resource. You can similarly specify Camera, Calendar, Reminders, or other services to reset them individually.
## [See Also](https://developer.apple.com/documentation/UIKit/requesting-access-to-protected-resources#see-also)
### [Supporting Privacy](https://developer.apple.com/documentation/UIKit/requesting-access-to-protected-resources#Supporting-Privacy)
[Encrypting Your App’s Files](https://developer.apple.com/documentation/uikit/encrypting-your-app-s-files)
Protect the user’s data in iOS by encrypting it on disk.
Current page is Requesting access to protected resources 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FUIKit%2Frequesting-access-to-protected-resources).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
