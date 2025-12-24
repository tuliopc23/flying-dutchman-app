Source: https://developer.apple.com/documentation/coredata

[ Skip Navigation ](https://developer.apple.com/documentation/coredata#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/coredata#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/coredata)
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
[ Open Menu ](https://developer.apple.com/documentation/coredata)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/coredata)


[](https://developer.apple.com/documentation/coredata)
## [ Core Data  ](https://developer.apple.com/documentation/coredata)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 37 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 37 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 37 symbols inside <root> [Creating a Core Data model](https://developer.apple.com/documentation/coredata/creating-a-core-data-model)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 37 symbols inside <root> containing 2 symbols[Setting up a Core Data stack](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
4 of 37 symbols inside <root> containing 25 symbols[Core Data stack](https://developer.apple.com/documentation/coredata/core-data-stack)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 37 symbols inside <root> [Handling Different Data Types in Core Data](https://developer.apple.com/documentation/coredata/handling-different-data-types-in-core-data)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 37 symbols inside <root> [Linking Data Between Two Core Data Stores](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 37 symbols inside <root>
Data modeling
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 37 symbols inside <root> containing 5 symbols[Modeling data](https://developer.apple.com/documentation/coredata/modeling-data)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
9 of 37 symbols inside <root> containing 13 symbols[Core Data model](https://developer.apple.com/documentation/coredata/core-data-model)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 37 symbols inside <root>
Fetch requests
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
11 of 37 symbols inside <root> containing 35 symbols[NSFetchRequest](https://developer.apple.com/documentation/coredata/nsfetchrequest)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
12 of 37 symbols inside <root> containing 6 symbols[NSAsynchronousFetchRequest](https://developer.apple.com/documentation/coredata/nsasynchronousfetchrequest)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
13 of 37 symbols inside <root> containing 3 symbols[NSAsynchronousFetchResult](https://developer.apple.com/documentation/coredata/nsasynchronousfetchresult)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
14 of 37 symbols inside <root> containing 25 symbols[NSFetchedResultsController](https://developer.apple.com/documentation/coredata/nsfetchedresultscontroller)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
15 of 37 symbols inside <root>
SwiftData migration and coexistence
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
16 of 37 symbols inside <root> [Adopting SwiftData for a Core Data app](https://developer.apple.com/documentation/coredata/adopting-swiftdata-for-a-core-data-app)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
17 of 37 symbols inside <root>
CloudKit mirroring
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
18 of 37 symbols inside <root> containing 5 symbols[Mirroring a Core Data store with CloudKit](https://developer.apple.com/documentation/coredata/mirroring-a-core-data-store-with-cloudkit)
37 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Framework
# Core Data
Persist or cache data on a single device, or sync data to multiple devices with CloudKit.
iOS 3.0+iPadOS 3.0+Mac Catalyst 13.0+macOS 10.4+tvOS 9.0+visionOS 1.0+watchOS 2.0+
## [Overview](https://developer.apple.com/documentation/coredata#overview)
Use Core Data to save your application’s permanent data for offline use, to cache temporary data, and to add undo functionality to your app on a single device. To sync data across multiple devices in a single iCloud account, Core Data automatically mirrors your schema to a CloudKit container.
Through Core Data’s Data Model editor, you define your data’s types and relationships, and generate respective class definitions. Core Data can then manage object instances at runtime to provide the following features.
### [Persistence](https://developer.apple.com/documentation/coredata#Persistence)
Core Data abstracts the details of mapping your objects to a store, making it easy to save data from Swift and Objective-C without administering a database directly.
![Flow diagram showing an app saving data to and loading data from a persistent store.](https://docs-assets.developer.apple.com/published/75428f775be2ff5c6fe139221ff330d4/media-3119932%402x.png)
### [Undo and redo of individual and batched changes](https://developer.apple.com/documentation/coredata#Undo-and-redo-of-individual-and-batched-changes)
Core Data’s undo manager tracks changes and can roll them back individually, in groups, or all at once, making it easy to add undo and redo support to your app.
![Figure showing a shake to undo gesture causing an element to be removed from a list.](https://docs-assets.developer.apple.com/published/640964de6db0e195490edb69b0d5aae8/media-3118362%402x.png)
### [Background data tasks](https://developer.apple.com/documentation/coredata#Background-data-tasks)
Perform potentially UI-blocking data tasks, like parsing JSON into objects, in the background. You can then cache or store the results to reduce server roundtrips.
![Flow diagram showing data from an endpoint populating objects in the background before updating the UI.](https://docs-assets.developer.apple.com/published/d71b242e7299eb1f75bd78763df7278c/media-3118359%402x.png)
### [View synchronization](https://developer.apple.com/documentation/coredata#View-synchronization)
Core Data also helps keep your views and data synchronized by providing data sources for table and collection views.
### [Versioning and migration](https://developer.apple.com/documentation/coredata#Versioning-and-migration)
Core Data includes mechanisms for versioning your data model and migrating user data as your app evolves.
## [Topics](https://developer.apple.com/documentation/coredata#topics)
### [Essentials](https://developer.apple.com/documentation/coredata#Essentials)
[Creating a Core Data model](https://developer.apple.com/documentation/coredata/creating-a-core-data-model)
Define your app’s object structure with a data model file.
[Setting up a Core Data stack](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack)
Set up the classes that manage and persist your app’s objects.
[API Reference Core Data stack](https://developer.apple.com/documentation/coredata/core-data-stack)
Manage and persist your app’s model layer.
[Handling Different Data Types in Core Data](https://developer.apple.com/documentation/coredata/handling-different-data-types-in-core-data)
Create, store, and present records for a variety of data types.
[Linking Data Between Two Core Data Stores](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores)
Organize data in two different stores and implement a link between them.
### [Data modeling](https://developer.apple.com/documentation/coredata#Data-modeling)
[Modeling data](https://developer.apple.com/documentation/coredata/modeling-data)
Configure the data model file to contain your app’s object graph.
[API Reference Core Data model](https://developer.apple.com/documentation/coredata/core-data-model)
Describe your app’s object structure.
### [Fetch requests](https://developer.apple.com/documentation/coredata#Fetch-requests)
Core Data retrieves persisted data to be used by your app.
[`class NSFetchRequest`](https://developer.apple.com/documentation/coredata/nsfetchrequest)
A description of search criteria used to retrieve data from a persistent store.
[`class NSAsynchronousFetchRequest`](https://developer.apple.com/documentation/coredata/nsasynchronousfetchrequest)
A fetch request that retrieves results asynchronously and supports progress notification.
[`class NSAsynchronousFetchResult`](https://developer.apple.com/documentation/coredata/nsasynchronousfetchresult)
A fetch result object that encompasses the response from an executed asynchronous fetch request.
[`class NSFetchedResultsController`](https://developer.apple.com/documentation/coredata/nsfetchedresultscontroller)
A controller that you use to manage the results of a Core Data fetch request and to display data to the user.
### [SwiftData migration and coexistence](https://developer.apple.com/documentation/coredata#SwiftData-migration-and-coexistence)
[Adopting SwiftData for a Core Data app](https://developer.apple.com/documentation/coredata/adopting-swiftdata-for-a-core-data-app)
Persist data in your app intuitively with the Swift native persistence framework.
### [CloudKit mirroring](https://developer.apple.com/documentation/coredata#CloudKit-mirroring)
[Mirroring a Core Data store with CloudKit](https://developer.apple.com/documentation/coredata/mirroring-a-core-data-store-with-cloudkit)
Back user interfaces with a local replica of a CloudKit private database.
[Synchronizing a local store to the cloud](https://developer.apple.com/documentation/coredata/synchronizing-a-local-store-to-the-cloud)
Share data between a user’s devices and other iCloud users.
[`class NSPersistentCloudKitContainer`](https://developer.apple.com/documentation/coredata/nspersistentcloudkitcontainer)
A container that encapsulates the Core Data stack in your app, and mirrors select persistent stores to a CloudKit private database.
[`class NSPersistentCloudKitContainerOptions`](https://developer.apple.com/documentation/coredata/nspersistentcloudkitcontaineroptions)
An object that customizes how a store description aligns with a CloudKit database.
[Sharing Core Data objects between iCloud users](https://developer.apple.com/documentation/coredata/sharing-core-data-objects-between-icloud-users)
Use Core Data and CloudKit to synchronize data between devices of an iCloud user and share data between different iCloud users.
### [Change processing](https://developer.apple.com/documentation/coredata#Change-processing)
[Accessing data when the store changes](https://developer.apple.com/documentation/coredata/accessing-data-when-the-store-changes)
Guarantee that a context won’t see store changes until you tell it to look.
[Consuming relevant store changes](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes)
Filter store transactions for changes relevant to the current view.
[API Reference Persistent history](https://developer.apple.com/documentation/coredata/persistent-history)
Use persistent history tracking to determine what changes have occurred in the store since the enabling of persistent history tracking.
### [Background tasks](https://developer.apple.com/documentation/coredata#Background-tasks)
[Using Core Data in the background](https://developer.apple.com/documentation/coredata/using-core-data-in-the-background)
Use Core Data in both a single-threaded and multithreaded app.
[Loading and displaying a large data feed](https://developer.apple.com/documentation/SwiftUI/loading-and-displaying-a-large-data-feed)
Consume data in the background, and lower memory use by batching imports and preventing duplicate records.
[API Reference Conflict resolution](https://developer.apple.com/documentation/coredata/conflict-resolution)
Detect and resolve conflicts that occur when data is changed on multiple threads.
[API Reference Batch processing](https://developer.apple.com/documentation/coredata/batch-processing)
Use batch processes to manage large data changes.
### [Data model migration](https://developer.apple.com/documentation/coredata#Data-model-migration)
Core Data has built-in data migration tools to help synchronize your app’s data with the current data model.
[Migrating your data model automatically](https://developer.apple.com/documentation/coredata/migrating-your-data-model-automatically)
Enable lightweight migrations to keep your data model and the underlying data in a consistent state.
[API Reference Staged migrations](https://developer.apple.com/documentation/coredata/staged-migrations)
Migrate complex data models containing changes that are incompatible with lightweight migrations.
[API Reference Manual migrations](https://developer.apple.com/documentation/coredata/manual-migrations)
Migrate elaborate data models with changes that go beyond the capabilities of both lightweight and staged migrations.
### [Related types](https://developer.apple.com/documentation/coredata#Related-types)
[API Reference Core Data Constants](https://developer.apple.com/documentation/coredata/core-data-constants)
Keys to use with persistent stores and notifications from Core Data.
Current page is Core Data 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fcoredata).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
