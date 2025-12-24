Source: https://developer.apple.com/documentation/healthkit/setting-up-healthkit

[ Skip Navigation ](https://developer.apple.com/documentation/healthkit/setting-up-healthkit#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/healthkit/setting-up-healthkit#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/healthkit/setting-up-healthkit)
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
[ Open Menu ](https://developer.apple.com/documentation/healthkit/setting-up-healthkit)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/healthkit/setting-up-healthkit)


[](https://developer.apple.com/documentation/healthkit/setting-up-healthkit)
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
1 of 8 symbols inside 1183467127 
Entitlements
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
2 of 8 symbols inside 1183467127 [HealthKit Entitlement](https://developer.apple.com/documentation/bundleresources/entitlements/com.apple.developer.healthkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
3 of 8 symbols inside 1183467127 [HealthKit Capabilities Entitlement](https://developer.apple.com/documentation/bundleresources/entitlements/com.apple.developer.healthkit.access)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 8 symbols inside 1183467127 
Information property list keys
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
5 of 8 symbols inside 1183467127 [NSHealthUpdateUsageDescription](https://developer.apple.com/documentation/bundleresources/information-property-list/nshealthupdateusagedescription)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
6 of 8 symbols inside 1183467127 [NSHealthShareUsageDescription](https://developer.apple.com/documentation/bundleresources/information-property-list/nshealthshareusagedescription)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
7 of 8 symbols inside 1183467127 [NSHealthRequiredReadAuthorizationTypeIdentifiers](https://developer.apple.com/documentation/bundleresources/information-property-list/nshealthrequiredreadauthorizationtypeidentifiers)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
8 of 8 symbols inside 1183467127 [NSHealthClinicalHealthRecordsShareUsageDescription](https://developer.apple.com/documentation/bundleresources/information-property-list/nshealthclinicalhealthrecordsshareusagedescription)
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
39 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Collection
  * [ HealthKit ](https://developer.apple.com/documentation/healthkit)
  * [ Setting up HealthKit ](https://developer.apple.com/documentation/healthkit/setting-up-healthkit)
  *     * Setting up HealthKit 


# Setting up HealthKit
Set up and configure your HealthKit store.
## [Overview](https://developer.apple.com/documentation/healthkit/setting-up-healthkit#overview)
Before using HealthKit, you must perform the following steps:
  1. Enable HealthKit in your app.
  2. Ensure HealthKit is available on the current device.
  3. Create your app’s HealthKit store.
  4. Request permission to read and share data.


The following sections describe the first three steps in detail. For more information on requesting authorization, see [Authorizing access to health data](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data). For a practical example of how to set up and use HealthKit, see [Build a workout app for Apple Watch](https://developer.apple.com/documentation/healthkit/build-a-workout-app-for-apple-watch).
### [Enable HealthKit](https://developer.apple.com/documentation/healthkit/setting-up-healthkit#Enable-HealthKit)
Before you can use HealthKit, you must enable the HealthKit capabilities for your app. In Xcode, select the project and add the HealthKit capability. Only select the Clinical Health Records checkbox if your app needs to access the user’s clinical records. App Review may reject apps that enable the Clinical Health Records capability if the app doesn’t actually use the health record data. For more information, see [Accessing Health Records](https://developer.apple.com/documentation/healthkit/accessing-health-records).
![A screenshot of Xcode’s Signing & Capabilities tab showing the HealthKit capabilities. The Clinical Health Records and Background Delivery checkboxes aren’t selected.](https://docs-assets.developer.apple.com/published/7ab4327eb865cf362390b74b0cf8692c/media-3874041%402x.png)
For a detailed discussion about enabling capabilities, see [Configuring HealthKit access](https://developer.apple.com/documentation/Xcode/configuring-healthkit-access).
When you enable the HealthKit capabilities on an iOS app, Xcode adds HealthKit to the list of required device capabilities, which prevents users from purchasing or installing the app on devices that don’t support HealthKit.
If HealthKit isn’t required for the correct operation of your app, delete the `healthkit` entry from the “Required device capabilities” array. Delete this entry from either the Target Properties list on the app’s Info tab or from the app’s `Info.plist` file.
Note
The `healthkit` entry isn’t used by watchOS apps.
For more information on required device capabilities, see the [`UIRequiredDeviceCapabilities`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/UIRequiredDeviceCapabilities).
### [Ensure HealthKit’s availability](https://developer.apple.com/documentation/healthkit/setting-up-healthkit#Ensure-HealthKits-availability)
Call the [`isHealthDataAvailable()`](https://developer.apple.com/documentation/healthkit/hkhealthstore/ishealthdataavailable\(\)) method to confirm that HealthKit is available on the user’s device.
```
if HKHealthStore.isHealthDataAvailable() {
    // Add code to use HealthKit here.
}

```

Call this method before calling any other HealthKit methods. If HealthKit isn’t available on the device (for example, on iPadOS 16 or earlier, or macOS), other HealthKit methods fail with an [`errorHealthDataUnavailable`](https://developer.apple.com/documentation/healthkit/hkerror/errorhealthdataunavailable) error. If HealthKit is restricted (for example, in an enterprise environment), the methods fail with an [`errorHealthDataRestricted`](https://developer.apple.com/documentation/healthkit/hkerror/errorhealthdatarestricted) error.
### [Create the HealthKit store](https://developer.apple.com/documentation/healthkit/setting-up-healthkit#Create-the-HealthKit-store)
If HealthKit is both enabled and available, instantiate an [`HKHealthStore`](https://developer.apple.com/documentation/healthkit/hkhealthstore) object for your app as shown:
```
let healthStore = HKHealthStore()

```

You need only a single HealthKit store per app. These are long-lived objects; you create the store once, and keep a reference for later use.
## [Topics](https://developer.apple.com/documentation/healthkit/setting-up-healthkit#topics)
### [Entitlements](https://developer.apple.com/documentation/healthkit/setting-up-healthkit#Entitlements)
[`HealthKit Entitlement`](https://developer.apple.com/documentation/BundleResources/Entitlements/com.apple.developer.healthkit)
A Boolean value that indicates whether the app may request user authorization to access health and activity data that appears in the Health app.
[`HealthKit Capabilities Entitlement`](https://developer.apple.com/documentation/BundleResources/Entitlements/com.apple.developer.healthkit.access)
Health data types that require additional permission.
### [Information property list keys](https://developer.apple.com/documentation/healthkit/setting-up-healthkit#Information-property-list-keys)
[`NSHealthUpdateUsageDescription`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/NSHealthUpdateUsageDescription)
A message to the user that explains why the app requested permission to save samples to the HealthKit store.
[`NSHealthShareUsageDescription`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/NSHealthShareUsageDescription)
A message that explains to people why the app requests permission to read samples from the HealthKit store.
[`NSHealthRequiredReadAuthorizationTypeIdentifiers`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/NSHealthRequiredReadAuthorizationTypeIdentifiers)
The clinical record data types that your app must get permission to read.
[`NSHealthClinicalHealthRecordsShareUsageDescription`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/NSHealthClinicalHealthRecordsShareUsageDescription)
A message to the user that explains why the app requested permission to read clinical records.
## [See Also](https://developer.apple.com/documentation/healthkit/setting-up-healthkit#see-also)
### [Essentials](https://developer.apple.com/documentation/healthkit/setting-up-healthkit#Essentials)
[About the HealthKit framework](https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework)
Learn about the architecture and design of the HealthKit framework.
[Authorizing access to health data](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data)
Request permission to read and share data in your app.
[Protecting user privacy](https://developer.apple.com/documentation/healthkit/protecting-user-privacy)
Respect and safeguard your user’s privacy.
[HealthKit updates](https://developer.apple.com/documentation/Updates/HealthKit)
Learn about important changes to HealthKit.
[HealthKitUI](https://developer.apple.com/documentation/healthkitui)
Display user interface that enables a person to view and interact with their health data.
Current page is Setting up HealthKit 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fhealthkit%2Fsetting-up-healthkit).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
