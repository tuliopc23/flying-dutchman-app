Source: https://developer.apple.com/documentation/healthkit

[ Skip Navigation ](https://developer.apple.com/documentation/healthkit#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/healthkit#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/healthkit)
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
[ Open Menu ](https://developer.apple.com/documentation/healthkit)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/healthkit)


[](https://developer.apple.com/documentation/healthkit)
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
Framework
# HealthKit
Access and share health and fitness data while maintaining the user’s privacy and control.
iOS 8.0+iPadOS 8.0+Mac Catalyst 17.0+macOS 14.0+visionOS 1.0+watchOS 2.0+
## [Overview](https://developer.apple.com/documentation/healthkit#overview)
HealthKit provides a central repository for health and fitness data on iPhone and Apple Watch. With the user’s permission, apps communicate with the HealthKit store to access and share this data.
![An image showing the Health app summary screen.](https://docs-assets.developer.apple.com/published/5dc94eee75b3c9209adc58b2bb39f5ef/health-summary%402x.png)
Creating a complete, personalized health and fitness experience includes a variety of tasks:
  * Collecting and storing health and fitness data
  * Analyzing and visualizing the data
  * Enabling social interactions


HealthKit apps take a collaborative approach to building this experience. Your app doesn’t need to provide all of these features. Instead, you can focus just on the subset of tasks that most interests you.
For example, users can select their favorite weight-tracking, step-counting, and health challenge app, each calibrated to their personal needs. Because HealthKit apps freely exchange data (with user permission), the combined suite provides a more customized experience than any single app on its own. For example, when a group of friends joins a daily step-counting challenge, each person can use their preferred hardware device and app to track their steps, while everyone in the group uses the same social app for the challenge.
HealthKit is also designed to manage and merge data from multiple sources. For example, users can view and manage all of their data in the Health App, including adding data, deleting data, and changing an app’s permissions. Therefore, your app needs to handle these changes, even when they occur outside your app.
Note
Because health data may contain sensitive, personal information, apps must receive permission from the user to read data from or write data to the HealthKit store. They must also take steps to protect that data at all times. For more information, see [Protecting user privacy](https://developer.apple.com/documentation/healthkit/protecting-user-privacy).
## [Topics](https://developer.apple.com/documentation/healthkit#topics)
### [Essentials](https://developer.apple.com/documentation/healthkit#Essentials)
[About the HealthKit framework](https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework)
Learn about the architecture and design of the HealthKit framework.
[API Reference Setting up HealthKit](https://developer.apple.com/documentation/healthkit/setting-up-healthkit)
Set up and configure your HealthKit store.
[Authorizing access to health data](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data)
Request permission to read and share data in your app.
[Protecting user privacy](https://developer.apple.com/documentation/healthkit/protecting-user-privacy)
Respect and safeguard your user’s privacy.
[HealthKit updates](https://developer.apple.com/documentation/Updates/HealthKit)
Learn about important changes to HealthKit.
[HealthKitUI](https://developer.apple.com/documentation/healthkitui)
Display user interface that enables a person to view and interact with their health data.
### [Health data](https://developer.apple.com/documentation/healthkit#Health-data)
[Saving data to HealthKit](https://developer.apple.com/documentation/healthkit/saving-data-to-healthkit)
Create and share HealthKit samples.
[Reading data from HealthKit](https://developer.apple.com/documentation/healthkit/reading-data-from-healthkit)
Use queries to request sample data from HealthKit.
[`class HKHealthStore`](https://developer.apple.com/documentation/healthkit/hkhealthstore)
The access point for all data managed by HealthKit.
[Creating a Mobility Health App](https://developer.apple.com/documentation/healthkit/creating-a-mobility-health-app)
Create a health app that allows a clinical care team to send and receive mobility data.
[API Reference Data types](https://developer.apple.com/documentation/healthkit/data-types)
Specify the kind of data used in HealthKit.
[API Reference Samples](https://developer.apple.com/documentation/healthkit/samples)
Create and save health and fitness samples.
[API Reference Queries](https://developer.apple.com/documentation/healthkit/queries)
Query health and fitness data.
[Visualizing HealthKit State of Mind in visionOS](https://developer.apple.com/documentation/healthkit/visualizing-healthkit-state-of-mind-in-visionos)
Incorporate HealthKit State of Mind into your app and visualize the data in visionOS.
[Logging symptoms associated with a medication](https://developer.apple.com/documentation/healthkit/logging-symptoms-associated-with-a-medication)
Fetch medications and dose events from the HealthKit store, and create symptom samples to associate with them.
### [Workout data](https://developer.apple.com/documentation/healthkit#Workout-data)
[API Reference Workouts and activity rings](https://developer.apple.com/documentation/healthkit/workouts-and-activity-rings)
Manage workouts, workout sessions, and activity summaries.
### [Errors](https://developer.apple.com/documentation/healthkit#Errors)
[`struct HKError`](https://developer.apple.com/documentation/healthkit/hkerror)
An error returned from a HealthKit method.
[`let HKErrorDomain: String`](https://developer.apple.com/documentation/healthkit/hkerrordomain)
The domain for all HealthKit errors.
[`enum Code`](https://developer.apple.com/documentation/healthkit/hkerror/code)
Error codes returned by HealthKit.
### [Reference](https://developer.apple.com/documentation/healthkit#Reference)
[API Reference HealthKit Enumerations](https://developer.apple.com/documentation/healthkit/healthkit-enumerations)
[API Reference HealthKit Classes](https://developer.apple.com/documentation/healthkit/healthkit-classes)
[API Reference HealthKit Constants](https://developer.apple.com/documentation/healthkit/healthkit-constants)
[API Reference HealthKit Data Types](https://developer.apple.com/documentation/healthkit/healthkit-data-types)
[API Reference HealthKit Functions](https://developer.apple.com/documentation/healthkit/healthkit-functions)
[API Reference Macros](https://developer.apple.com/documentation/healthkit/healthkit-macros)
[API Reference HealthKit Variables](https://developer.apple.com/documentation/healthkit/healthkit-variables)
Current page is HealthKit 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fhealthkit).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
