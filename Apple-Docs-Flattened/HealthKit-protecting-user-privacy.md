Source: https://developer.apple.com/documentation/healthkit/protecting-user-privacy

[ Skip Navigation ](https://developer.apple.com/documentation/healthkit/protecting-user-privacy#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/healthkit/protecting-user-privacy#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/healthkit/protecting-user-privacy)
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
[ Open Menu ](https://developer.apple.com/documentation/healthkit/protecting-user-privacy)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/healthkit/protecting-user-privacy)


[](https://developer.apple.com/documentation/healthkit/protecting-user-privacy)
## [ HealthKit  ](https://developer.apple.com/documentation/healthkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 31 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 31 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 31 symbols inside <root> [About the HealthKit framework](https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
3 of 31 symbols inside <root> containing 8 symbols[Setting up HealthKit](https://developer.apple.com/documentation/healthkit/setting-up-healthkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 31 symbols inside <root> [Authorizing access to health data](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 31 symbols inside <root> [Protecting user privacy](https://developer.apple.com/documentation/healthkit/protecting-user-privacy)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 31 symbols inside <root> [HealthKit updates](https://developer.apple.com/documentation/updates/healthkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 31 symbols inside <root> [HealthKitUI](https://developer.apple.com/documentation/healthkitui)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 31 symbols inside <root>
Health data
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 31 symbols inside <root> [Saving data to HealthKit](https://developer.apple.com/documentation/healthkit/saving-data-to-healthkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 31 symbols inside <root> [Reading data from HealthKit](https://developer.apple.com/documentation/healthkit/reading-data-from-healthkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
11 of 31 symbols inside <root> containing 58 symbols[HKHealthStore](https://developer.apple.com/documentation/healthkit/hkhealthstore)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 31 symbols inside <root> [Creating a Mobility Health App](https://developer.apple.com/documentation/healthkit/creating-a-mobility-health-app)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
13 of 31 symbols inside <root> containing 145 symbols[Data types](https://developer.apple.com/documentation/healthkit/data-types)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
14 of 31 symbols inside <root> containing 57 symbols[Samples](https://developer.apple.com/documentation/healthkit/samples)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
15 of 31 symbols inside <root> containing 64 symbols[Queries](https://developer.apple.com/documentation/healthkit/queries)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
16 of 31 symbols inside <root> [Visualizing HealthKit State of Mind in visionOS](https://developer.apple.com/documentation/healthkit/visualizing-healthkit-state-of-mind-in-visionos)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
17 of 31 symbols inside <root> [Logging symptoms associated with a medication](https://developer.apple.com/documentation/healthkit/logging-symptoms-associated-with-a-medication)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
18 of 31 symbols inside <root>
Workout data
31 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ HealthKit ](https://developer.apple.com/documentation/healthkit)
  * [ Protecting user privacy ](https://developer.apple.com/documentation/healthkit/protecting-user-privacy)
  *     * Protecting user privacy 


Article
# Protecting user privacy
Respect and safeguard your user’s privacy.
## [Overview](https://developer.apple.com/documentation/healthkit/protecting-user-privacy#overview)
Because health data can be sensitive, HealthKit provides users with fine-grained control over the information that apps can share. The user must explicitly grant each app permission to read and write data to the HealthKit store. Users can grant or deny permission separately for each type of data.
For example, a user could let your app read step count data, but prevent it from reading blood glucose levels. To prevent possible information leaks, an app isn’t aware when the user denies permission to read data. From the app’s point of view, no data of that type exists.
Important
Apps must include usage descriptions, or it will crash when you request authorization to access HealthKit data. Include the [`NSHealthShareUsageDescription`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/NSHealthShareUsageDescription) key to read, and [`NSHealthUpdateUsageDescription`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/NSHealthUpdateUsageDescription) key to write data to Healthkit. For projects created using Xcode 13 or later, set these keys in the Target Properties list on the app’s Info tab. For projects created with Xcode 12 or earlier, set these keys in the apps `Info.plist` file. For more information, see [`Information Property List`](https://developer.apple.com/documentation/BundleResources/Information-Property-List).
### [Access encrypted data](https://developer.apple.com/documentation/healthkit/protecting-user-privacy#Access-encrypted-data)
The user’s device stores all HealthKit data locally. For security, the device encrypts the HealthKit store when the user locks the device. As a result, your app may not be able to read data from the store when it runs in the background. However, your app can still write to the store, even when the phone is locked. HealthKit temporarily caches the data and saves it to the encrypted store as soon as the user unlocks the phone.
### [Specify how your app uses the health data](https://developer.apple.com/documentation/healthkit/protecting-user-privacy#Specify-how-your-app-uses-the-health-data)
In addition, your app must not access the HealthKit APIs unless the use is for health or fitness purposes and this usage is clear in both your marketing text and your user interface. Specifically, the following guidelines apply to all HealthKit apps:
  * Your app may not use information gained through the use of the HealthKit framework for advertising or similar services. Note that you may still serve advertising in an app that uses the HealthKit framework, but you can’t use data from the HealthKit store to serve ads.
  * You must not disclose any information gained through HealthKit to a third party without express permission from the user. Even with permission, you can only share information to a third party if they also provide a health or fitness service to the user.
  * You can’t sell information gained through HealthKit to advertising platforms, data brokers, or information resellers.
  * If the user consents, you may share their HealthKit data with a third party for medical research.
  * You must clearly disclose to the user how you and your app will use their HealthKit data.


### [Provide a privacy policy](https://developer.apple.com/documentation/healthkit/protecting-user-privacy#Provide-a-privacy-policy)
You must also provide a privacy policy for any app that uses the HealthKit framework. You can find guidance on creating a privacy policy at the following sites:
  * Personal Health Record model (for non-HIPAA apps): <http://www.healthit.gov/policy-researchers-implementers/personal-health-record-phr-model-privacy-notice>
  * HIPAA model (for HIPAA covered apps): <https://www.hhs.gov/hipaa/for-professionals/privacy/guidance/model-notices-privacy-practices/index.html>


These models, developed by the Office of the National Coordinator for Health Information Technology (ONC), are designed to improve user experience and comprehension with plain language and approachable designs that explain how your app collects and shares user data. These models aren’t intended to replace a web-based privacy policy, and developers should consult ONC guidance regarding which model is appropriate for a given app. These models are provided for your reference only, and Apple expressly disclaims all liability for your use of such models.
Note
It’s essential that you understand Apple’s requirements for working with HealthKit and the user’s health-related data. To learn about these requirements, see the HealthKit section in [App Store Review Guidelines](https://developer.apple.com/app-store/review/guidelines/) and the relevant sections in the [Apple Developer Program License Agreement](https://developer.apple.com/support/terms/apple-developer-program-license-agreement/). The App Store Review Guidelines are also available from the [App Review](https://developer.apple.com/app-store/review/) page.
For additional technical information about working with sensitive user data, see [Preparing your UI to run in the background](https://developer.apple.com/documentation/UIKit/preparing-your-ui-to-run-in-the-background).
## [See Also](https://developer.apple.com/documentation/healthkit/protecting-user-privacy#see-also)
### [Essentials](https://developer.apple.com/documentation/healthkit/protecting-user-privacy#Essentials)
[About the HealthKit framework](https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework)
Learn about the architecture and design of the HealthKit framework.
[API Reference Setting up HealthKit](https://developer.apple.com/documentation/healthkit/setting-up-healthkit)
Set up and configure your HealthKit store.
[Authorizing access to health data](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data)
Request permission to read and share data in your app.
[HealthKit updates](https://developer.apple.com/documentation/Updates/HealthKit)
Learn about important changes to HealthKit.
[HealthKitUI](https://developer.apple.com/documentation/healthkitui)
Display user interface that enables a person to view and interact with their health data.
Current page is Protecting user privacy 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fhealthkit%2Fprotecting-user-privacy).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
