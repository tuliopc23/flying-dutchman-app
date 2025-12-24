Source: https://developer.apple.com/documentation/healthkit/saving-data-to-healthkit

[ Skip Navigation ](https://developer.apple.com/documentation/healthkit/saving-data-to-healthkit#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/healthkit/saving-data-to-healthkit#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/healthkit/saving-data-to-healthkit)
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
[ Open Menu ](https://developer.apple.com/documentation/healthkit/saving-data-to-healthkit)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/healthkit/saving-data-to-healthkit)


[](https://developer.apple.com/documentation/healthkit/saving-data-to-healthkit)
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
  * [ Saving data to HealthKit ](https://developer.apple.com/documentation/healthkit/saving-data-to-healthkit)
  *     * Saving data to HealthKit 


Article
# Saving data to HealthKit
Create and share HealthKit samples.
## [Overview](https://developer.apple.com/documentation/healthkit/saving-data-to-healthkit#overview)
Your app can create new samples and add them to the HealthKit store. Although all sample types follow a similar procedure, each type has its own variations:
  1. Look up the type identifier for your data. For example, to record the user’s weight, you use the [`bodyMass`](https://developer.apple.com/documentation/healthkit/hkquantitytypeidentifier/bodymass) type identifier. For the complete list of type identifiers, see [Data types](https://developer.apple.com/documentation/healthkit/data-types).
  2. Use the convenience methods on the [`HKObjectType`](https://developer.apple.com/documentation/healthkit/hkobjecttype) class to create the correct object type for your data. For example, to save the user’s weight, you’d create an [`HKQuantityType`](https://developer.apple.com/documentation/healthkit/hkquantitytype) object using the [`quantityType(forIdentifier:)`](https://developer.apple.com/documentation/healthkit/hkobjecttype/quantitytype\(foridentifier:\)) method. For a list of convenience methods, see [`HKObjectType`](https://developer.apple.com/documentation/healthkit/hkobjecttype).
  3. Instantiate an object of the matching [`HKSample`](https://developer.apple.com/documentation/healthkit/hksample) subclass using the object type.
  4. Save the object to the HealthKit store using the [`save(_:withCompletion:)`](https://developer.apple.com/documentation/healthkit/hkhealthstore/save\(_:withcompletion:\)-6fmtg) method.


Each [`HKSample`](https://developer.apple.com/documentation/healthkit/hksample) subclass has its own convenience methods for instantiating sample objects, which modify the steps described in the list above.
![An illustration showing how a quality sample relates to its identifier, type, and quantity.](https://docs-assets.developer.apple.com/published/4eca8a6c5bfd4d688c10ba510d59385c/media-2943340%402x.png)
For quantity samples, create an instance of the [`HKQuantity`](https://developer.apple.com/documentation/healthkit/hkquantity) class. The quantity’s units must correspond to the allowable units described in the type identifier’s documentation. For example, the [`height`](https://developer.apple.com/documentation/healthkit/hkquantitytypeidentifier/height) documentation states that it uses length units. Therefore, your quantity must use centimeters, meters, feet, inches, or another compatible unit. For more information, see [`HKQuantitySample`](https://developer.apple.com/documentation/healthkit/hkquantitysample).
![An illustration showing how a category sample relates to its identifier, type, and value.](https://docs-assets.developer.apple.com/published/ff590914b31e464e30b64cf30413ee43/media-2943344%402x.png)
For category samples, the sample’s value must correspond to the enum described in the type identifier’s documentation. For example, the [`sleepAnalysis`](https://developer.apple.com/documentation/healthkit/hkcategorytypeidentifier/sleepanalysis) documentation states that it uses the [`HKCategoryValueSleepAnalysis`](https://developer.apple.com/documentation/healthkit/hkcategoryvaluesleepanalysis) enum. Therefore, you must pass a value from this enum when creating this sample. For more information, see [`HKCategorySample`](https://developer.apple.com/documentation/healthkit/hkcategorysample).
![An illustration showing how a correlation sample relates to its identifier, type, and contained objects.](https://docs-assets.developer.apple.com/published/d4efeeeba2c6d6eb376574444efdab63/media-2943342%402x.png)
For correlations, you must first create all the sample objects that the correlation will contain. The correlation’s type identifier describes both the type and the number of objects that can be contained. Don’t save the contained objects into the HealthKit store. They’re stored as part of the correlation. For more information, see [`HKCorrelation`](https://developer.apple.com/documentation/healthkit/hkcorrelation).
Important
In iOS 17.2 and later, the Journal app encourages people to reflect on their day-to-day experiences, including physical accomplishments, workouts, and emotions and moods. If your app saves data to HealthKit, high-level summaries of that data can appear as suggestions in the Journal app, or in other apps that use the [Journaling Suggestions](https://developer.apple.com/documentation/JournalingSuggestions) framework.
### [Balance performance and details](https://developer.apple.com/documentation/healthkit/saving-data-to-healthkit#Balance-performance-and-details)
When saving data to the HealthKit store, you often need to choose between using a single sample to represent the data or splitting the data across multiple, smaller samples. A single, long sample is better from a performance perspective; however, multiple smaller samples gives the user a more detailed look into how their data changes over time. Ideally, you want to find a sample size that’s granular enough to provide the user with useful historical data and you should avoid saving samples that are 24 hours long or longer.
When recording a workout, you can use high frequency data (a minute or less per sample) to provide intensity charts and otherwise analyze the user’s performance over the workout. For less intensive activity, like daily step counts, samples of an hour or less often work best. This lets you produce meaningful daily and hourly graphs.
Most sample types have restrictions on duration. If you attempt to save a sample that doesn’t meet those restrictions, it fails to save. For more details on checking the duration restrictions, refer to [`HKSampleType`](https://developer.apple.com/documentation/healthkit/hksampletype).
### [Work with data in the Health app](https://developer.apple.com/documentation/healthkit/saving-data-to-healthkit#Work-with-data-in-the-Health-app)
The Health app gives users access to all of the data in their HealthKit store. Users can view, add, delete, and manage their data.
Specifically, users can:
  * See a dashboard containing their current health data.
  * Access all the data stored in HealthKit. Users can view the data by type, by app, or by device.
  * Manage each app’s permission to read and write from the HealthKit store.


As a result, the Health app has a few important impacts on developing HealthKit apps. First, remember that users can always modify their data outside your app or even change your permission to access their data. As a result, your app should always query for the current data in the HealthKit store or perform background queries to track changes to the store.
Second, you can also use the Health app to view the data your app is saving to the HealthKit store. This can be particularly useful during early testing, to verify that your app is saving everything as expected.
## [See Also](https://developer.apple.com/documentation/healthkit/saving-data-to-healthkit#see-also)
### [Health data](https://developer.apple.com/documentation/healthkit/saving-data-to-healthkit#Health-data)
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
Current page is Saving data to HealthKit 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fhealthkit%2Fsaving-data-to-healthkit).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
