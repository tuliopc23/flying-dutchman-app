Source: https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework

[ Skip Navigation ](https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework)
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
[ Open Menu ](https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework)


[](https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework)
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
  * [ About the HealthKit framework ](https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework)
  *     * About the HealthKit framework 


Article
# About the HealthKit framework
Learn about the architecture and design of the HealthKit framework.
## [Overview](https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework#overview)
Share health and fitness data between apps using the HealthKit framework. Rather than developers creating custom data types and units, HealthKit constrains data types and units to a predefined list. This ensures that all apps understand what the data means and how they can use it.
Additionally, the framework uses a large number of subclasses, producing deep hierarchies of similar classes. Often, these classes have subtle but important differences between them. For example, you use an [`HKQuantitySample`](https://developer.apple.com/documentation/healthkit/hkquantitysample) object to store data with a numeric value and an [`HKCategorySample`](https://developer.apple.com/documentation/healthkit/hkcategorysample) object to store a value selected from an enumeration.
HealthKit also uses pairs of closely related classes that you need to use together. For example, the [`HKObject`](https://developer.apple.com/documentation/healthkit/hkobject) and [`HKObjectType`](https://developer.apple.com/documentation/healthkit/hkobjecttype) abstract classes have largely parallel hierarchies of concrete subclasses. When working with objects and object types, you must use matching subclasses.
### [HealthKit data](https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework#HealthKit-data)
HealthKit saves a variety of data types in the HealthKit Store: 

Characteristic data
    
Characteristics that typically don’t change, such as the user’s birthdate, blood type, biological sex, and skin type. You can read this data directly from the HealthKit store, using the [`dateOfBirth()`](https://developer.apple.com/documentation/healthkit/hkhealthstore/dateofbirth\(\)), [`bloodType()`](https://developer.apple.com/documentation/healthkit/hkhealthstore/bloodtype\(\)), [`biologicalSex()`](https://developer.apple.com/documentation/healthkit/hkhealthstore/biologicalsex\(\)), and [`fitzpatrickSkinType()`](https://developer.apple.com/documentation/healthkit/hkhealthstore/fitzpatrickskintype\(\)) methods. Your application can’t save characteristic data. The user must enter or modify this data using the Health app. 

Sample data
    
Samples that represent a measurement at a particular point in time. All sample classes are subclasses of the [`HKSample`](https://developer.apple.com/documentation/healthkit/hksample) class, which is a subclass of the [`HKObject`](https://developer.apple.com/documentation/healthkit/hkobject) class. For more information, see [Samples](https://developer.apple.com/documentation/healthkit/samples). 

Workout data
    
Samples that store information about fitness and exercise activities. While [`HKWorkout`](https://developer.apple.com/documentation/healthkit/hkworkout) is a subclass of [`HKSample`](https://developer.apple.com/documentation/healthkit/hksample), it behaves somewhat differently than other sample subclasses. For more information, see Workout data. 

Source data
    
Information about a sample’s source. The [`HKSourceRevision`](https://developer.apple.com/documentation/healthkit/hksourcerevision) object contains information about the app or device that saved the sample. The [`HKDevice`](https://developer.apple.com/documentation/healthkit/hkdevice) object contains information about the hardware device that generated the data. 

Deleted objects
    
An object that represents a sample after something deletes it from the HealthKit store. HealthKit uses an [`HKDeletedObject`](https://developer.apple.com/documentation/healthkit/hkdeletedobject) instance to temporarily store the UUID of deleted samples. You can use deleted objects to respond when the user or another app deletes an object. For more information, see [`HKAnchoredObjectQuery`](https://developer.apple.com/documentation/healthkit/hkanchoredobjectquery) and [`HKDeletedObject`](https://developer.apple.com/documentation/healthkit/hkdeletedobject).
### [Properties of objects and samples](https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework#Properties-of-objects-and-samples)
The [`HKObject`](https://developer.apple.com/documentation/healthkit/hkobject) class is the superclass of all HealthKit sample types. All [`HKObject`](https://developer.apple.com/documentation/healthkit/hkobject) subclasses are immutable. Each object has the following properties: 

UUID
    
A unique identifier for that particular entry. 

Metadata
    
A dictionary containing additional information about the entry. The metadata can contain both predefined and custom keys. The predefined keys facilitate the sharing of data between apps. Custom keys help extend a given HealthKit object type, adding app-specific data to the entry. 

Source Revision
    
The source of the sample. The source can be a device that directly saves data into HealthKit or an app. HealthKit automatically records each object’s source and version when it saves the data to the HealthKit store. This property is available only on objects retrieved from the store. 

Device
    
The hardware device that generated the data stored in this sample.
The [`HKSample`](https://developer.apple.com/documentation/healthkit/hksample) class is a subclass of [`HKObject`](https://developer.apple.com/documentation/healthkit/hkobject). Sample objects represent data at a particular point in time, and all sample objects are subclasses of the [`HKSample`](https://developer.apple.com/documentation/healthkit/hksample) class. They have the following properties: 

Type
    
The sample type, such as a sleep analysis sample, a height sample, or a step count sample. 

Start date
    
The sample’s start time. 

End date
    
The sample’s end time. If the sample represents a single point in time, the end time should equal the start time. If the sample represents data collected over a time interval, the end time should occur after the start time.
Samples are further divided into four concrete subclasses: 

Category samples
    
Data that can you can classify into a finite set of categories. See [`HKCategorySample`](https://developer.apple.com/documentation/healthkit/hkcategorysample). 

Quantity samples
    
Data that you can store as numeric values. Quantity samples are the most common data types in HealthKit. These include the user’s height and weight, as well as other data such as the number of steps taken, the user’s temperature, and their pulse rate. See [`HKQuantitySample`](https://developer.apple.com/documentation/healthkit/hkquantitysample). 

Correlations
    
Composite data containing one or more samples. HealthKit uses correlations to represent food and blood pressure. You should always use a correlation when creating food or blood pressure data. See [`HKCorrelation`](https://developer.apple.com/documentation/healthkit/hkcorrelation). 

Workouts
    
Data representing a physical activity, like running, swimming, or even play. Workouts often have _type_ , _duration_ , _distance_ , and _energy burned_ properties. You can also associate a workout with additional, fine-grained samples. Unlike correlations, the workout doesn’t contain these samples; however, you can query for them using the workout. For more information, see [`HKWorkout`](https://developer.apple.com/documentation/healthkit/hkworkout).
### [Threading](https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework#Threading)
The HealthKit store is thread-safe, and most HealthKit objects are immutable. In general, you can use HealthKit safely in a multithreaded environment.
Note
All the HealthKit API’s completion handlers execute on private background queues. You typically dispatch this data back to the main queue before updating your user interface or changing any other resources that you can only safely modify from the main thread.
For more information about multithreading and concurrent programming, see [Concurrency Programming Guide](https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40008091).
### [Syncing data between devices](https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework#Syncing-data-between-devices)
iPhone, Apple Watch, and visionOS each have their own HealthKit store. iPadOS 17 and later also has its own HealthKit store. It is also available on iPadOS apps running on Vision Pro. HealthKit automatically syncs data between these devices. To save space, old data is periodically purged from Apple Watch. Use [`earliestPermittedSampleDate()`](https://developer.apple.com/documentation/healthkit/hkhealthstore/earliestpermittedsampledate\(\)) to determine the earliest samples available on Apple Watch.
While the HealthKit framework is available on iPadOS 16 and earlier and on MacOS 13 and later, these devices don’t have a copy of the HealthKit store. This means you can include HealthKit code in apps running on these devices, simplifying the creation of multiplatform apps. However, they can’t read or write HealthKit data, and calls to [`isHealthDataAvailable()`](https://developer.apple.com/documentation/healthkit/hkhealthstore/ishealthdataavailable\(\)) return [`false`](https://developer.apple.com/documentation/Swift/false).
## [See Also](https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework#see-also)
### [Essentials](https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework#Essentials)
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
Current page is About the HealthKit framework 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fhealthkit%2Fabout-the-healthkit-framework).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
