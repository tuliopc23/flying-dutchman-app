Source: https://developer.apple.com/documentation/SwiftData

[ Skip Navigation ](https://developer.apple.com/documentation/SwiftData#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/SwiftData#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/SwiftData)
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
[ Open Menu ](https://developer.apple.com/documentation/SwiftData)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/SwiftData)
## [ SwiftData  ](https://developer.apple.com/documentation/swiftdata)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 56 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 56 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 56 symbols inside <root> [Preserving your app’s model data across launches](https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 56 symbols inside <root> [Adding and editing persistent data in your app](https://developer.apple.com/documentation/swiftdata/adding-and-editing-persistent-data-in-your-app)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 56 symbols inside <root> [Adopting SwiftData for a Core Data app](https://developer.apple.com/documentation/coredata/adopting-swiftdata-for-a-core-data-app)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 56 symbols inside <root> [SwiftData updates](https://developer.apple.com/documentation/updates/swiftdata)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 56 symbols inside <root> [Adopting inheritance in SwiftData](https://developer.apple.com/documentation/swiftdata/adopting-inheritance-in-swiftdata)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 56 symbols inside <root>
Model definition
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
#
8 of 56 symbols inside <root> [macro Model()](https://developer.apple.com/documentation/swiftdata/model\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
#
9 of 56 symbols inside <root> [macro Attribute(Schema.Attribute.Option..., originalName: String?, hashModifier: String?)](https://developer.apple.com/documentation/swiftdata/attribute\(_:originalname:hashmodifier:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
#
10 of 56 symbols inside <root> [macro Unique<T>([PartialKeyPath<T>]...)](https://developer.apple.com/documentation/swiftdata/unique\(_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
#
11 of 56 symbols inside <root> [macro Index<T>([PartialKeyPath<T>]...)](https://developer.apple.com/documentation/swiftdata/index\(_:\)-74ia2)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
#
12 of 56 symbols inside <root> [macro Index<T>(Schema.Index<T>.Types<T>...)](https://developer.apple.com/documentation/swiftdata/index\(_:\)-7d4z0)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
13 of 56 symbols inside <root> [Defining data relationships with enumerations and model classes](https://developer.apple.com/documentation/swiftdata/defining-data-relationships-with-enumerations-and-model-classes)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
#
14 of 56 symbols inside <root> [macro Relationship(Schema.Relationship.Option..., deleteRule: Schema.Relationship.DeleteRule, minimumModelCount: Int?, maximumModelCount: Int?, originalName: String?, inverse: AnyKeyPath?, hashModifier: String?)](https://developer.apple.com/documentation/swiftdata/relationship\(_:deleterule:minimummodelcount:maximummodelcount:originalname:inverse:hashmodifier:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
#
15 of 56 symbols inside <root> [macro Transient()](https://developer.apple.com/documentation/swiftdata/transient\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
16 of 56 symbols inside <root>
Model life cycle
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
17 of 56 symbols inside <root> containing 21 symbols[ModelContainer](https://developer.apple.com/documentation/swiftdata/modelcontainer)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
18 of 56 symbols inside <root> containing 47 symbols[ModelContext](https://developer.apple.com/documentation/swiftdata/modelcontext)
56 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Framework
# SwiftData
Write your model code declaratively to add managed persistence and efficient model fetching.
iOS 17.0+iPadOS 17.0+Mac Catalyst 17.0+macOS 14.0+tvOS 17.0+visionOS 1.0+watchOS 10.0+
## [Overview](https://developer.apple.com/documentation/SwiftData#Overview)
Combining Core Data’s proven persistence technology and Swift’s modern concurrency features, SwiftData enables you to add persistence to your app quickly, with minimal code and no external dependencies. Using modern language features like macros, SwiftData enables you to write code that is fast, efficient, and safe, enabling you to describe the entire model layer (or object graph) for your app. The framework handles storing the underlying model data, and optionally, syncing that data across multiple devices.
SwiftData has uses beyond persisting locally created content. For example, an app that fetches data from a remote web service might use SwiftData to implement a lightweight caching mechanism and provide limited offline functionality.
![A white Swift logo containing ones and zeros on a blueprint-style background.](https://docs-assets.developer.apple.com/published/aa99d190da3e4c58796b4201d5e7b4c7/swiftdata-hero%402x.png)
SwiftData is unintrusive by design and supplements your app’s existing model classes. Attach the [`Model()`](https://developer.apple.com/documentation/swiftdata/model\(\)) macro to any model class to make it persistable. Customize the behavior of that model’s properties with the [`Attribute(_:originalName:hashModifier:)`](https://developer.apple.com/documentation/swiftdata/attribute\(_:originalname:hashmodifier:\)) and [`Relationship(_:deleteRule:minimumModelCount:maximumModelCount:originalName:inverse:hashModifier:)`](https://developer.apple.com/documentation/swiftdata/relationship\(_:deleterule:minimummodelcount:maximummodelcount:originalname:inverse:hashmodifier:\)) macros. Use the [`ModelContext`](https://developer.apple.com/documentation/swiftdata/modelcontext) class to insert, update, and delete instances of that model, and to write unsaved changes to disk.
To display models in a SwiftUI view, use the [`Query()`](https://developer.apple.com/documentation/swiftdata/query\(\)) macro and specify a predicate or fetch descriptor. SwiftData performs the fetch when the view appears, and tells SwiftUI about any subsequent changes to the fetched models so the view can update accordingly. You can access the model context in any SwiftUI view using the [`modelContext`](https://developer.apple.com/documentation/SwiftUI/EnvironmentValues/modelContext) environment value, and specify a particular model container or context for a view with the [`modelContainer(_:)`](https://developer.apple.com/documentation/SwiftUI/View/modelContainer\(_:\)) and [`modelContext(_:)`](https://developer.apple.com/documentation/SwiftUI/View/modelContext\(_:\)) view modifiers.
## [Topics](https://developer.apple.com/documentation/SwiftData#topics)
### [Essentials](https://developer.apple.com/documentation/SwiftData#Essentials)
[Preserving your app’s model data across launches](https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches)
Describe your model classes to SwiftData using the framework’s macros, and store instances of those models so they exist beyond the app’s runtime.
[Adding and editing persistent data in your app](https://developer.apple.com/documentation/swiftdata/adding-and-editing-persistent-data-in-your-app)
Create a data entry form for collecting and changing data managed by SwiftData.
[Adopting SwiftData for a Core Data app](https://developer.apple.com/documentation/CoreData/adopting-swiftdata-for-a-core-data-app)
Persist data in your app intuitively with the Swift native persistence framework.
[SwiftData updates](https://developer.apple.com/documentation/Updates/SwiftData)
Learn about important changes to SwiftData.
[Adopting inheritance in SwiftData](https://developer.apple.com/documentation/swiftdata/adopting-inheritance-in-swiftdata)
Add flexibility to your models using class inheritance.
### [Model definition](https://developer.apple.com/documentation/SwiftData#Model-definition)
[`macro Model()`](https://developer.apple.com/documentation/swiftdata/model\(\))
Converts a Swift class into a stored model that’s managed by SwiftData.
[`macro Attribute(Schema.Attribute.Option..., originalName: String?, hashModifier: String?)`](https://developer.apple.com/documentation/swiftdata/attribute\(_:originalname:hashmodifier:\))
Specifies the custom behavior that SwiftData applies to the annotated property when managing the owning class.
[`macro Unique<T>([PartialKeyPath<T>]...)`](https://developer.apple.com/documentation/swiftdata/unique\(_:\))
Specifies the key-paths that SwiftData uses to enforce the uniqueness of model instances.
[`macro Index<T>([PartialKeyPath<T>]...)`](https://developer.apple.com/documentation/swiftdata/index\(_:\)-74ia2)
Specifies the key-paths that SwiftData uses to create one or more binary indices for the associated model.
[`macro Index<T>(Schema.Index<T>.Types<T>...)`](https://developer.apple.com/documentation/swiftdata/index\(_:\)-7d4z0)
Specifies the key-paths that SwiftData uses to create one or more indicies for the associated model, where each index is either binary or R-tree.
[Defining data relationships with enumerations and model classes](https://developer.apple.com/documentation/swiftdata/defining-data-relationships-with-enumerations-and-model-classes)
Create relationships for static and dynamic data stored in your app.
[`macro Relationship(Schema.Relationship.Option..., deleteRule: Schema.Relationship.DeleteRule, minimumModelCount: Int?, maximumModelCount: Int?, originalName: String?, inverse: AnyKeyPath?, hashModifier: String?)`](https://developer.apple.com/documentation/swiftdata/relationship\(_:deleterule:minimummodelcount:maximummodelcount:originalname:inverse:hashmodifier:\))
Specifies the options that SwiftData needs to manage the annotated property as a relationship between two models.
[`macro Transient()`](https://developer.apple.com/documentation/swiftdata/transient\(\))
Tells SwiftData not to persist the annotated property when managing the owning class.
### [Model life cycle](https://developer.apple.com/documentation/SwiftData#Model-life-cycle)
[`class ModelContainer`](https://developer.apple.com/documentation/swiftdata/modelcontainer)
An object that manages an app’s schema and model storage configuration.
[`class ModelContext`](https://developer.apple.com/documentation/swiftdata/modelcontext)
An object that enables you to fetch, insert, and delete models, and save any changes to disk.
[Fetching and filtering time-based model changes](https://developer.apple.com/documentation/swiftdata/fetching-and-filtering-time-based-model-changes)
Track all inserts, updates, and deletes that occur in a data store and process them as a series of chronological transactions.
[`struct HistoryDescriptor`](https://developer.apple.com/documentation/swiftdata/historydescriptor)
A type that describes the criteria, and, optionally, sort order, to use when fetching history data
[Deleting persistent data from your app](https://developer.apple.com/documentation/swiftdata/deleting-persistent-data-from-your-app)
Explore different ways to use SwiftData to delete persistent data.
[Reverting data changes using the undo manager](https://developer.apple.com/documentation/swiftdata/reverting-data-changes-using-the-undo-manager)
Automatically record data change operations that people perform in your SwiftUI app, and let them undo and redo those changes.
[Syncing model data across a person’s devices](https://developer.apple.com/documentation/swiftdata/syncing-model-data-across-a-persons-devices)
Add the required capabilities and define a compatible schema to enable SwiftData to automatically sync your app’s model data using iCloud.
[API Reference Concurrency support](https://developer.apple.com/documentation/swiftdata/concurrencysupport)
Types you use to access model attributes and perform storage-related tasks in a safe and isolated way.
### [Model fetch](https://developer.apple.com/documentation/SwiftData#Model-fetch)
[Filtering and sorting persistent data](https://developer.apple.com/documentation/swiftdata/filtering-and-sorting-persistent-data)
Manage data store presentation using predicates and dynamic queries.
[`macro Query()`](https://developer.apple.com/documentation/swiftdata/query\(\))
Fetches all instances of the attached model type.
[API Reference Additional query macros](https://developer.apple.com/documentation/swiftdata/additionalquerymacros)
Supplementary macros that enable you to narrow query results and tell SwiftData how to sort and order those results.
[`struct Query`](https://developer.apple.com/documentation/swiftdata/query)
A type that fetches models using the specified criteria, and manages those models so they remain in sync with the underlying data.
[`struct FetchDescriptor`](https://developer.apple.com/documentation/swiftdata/fetchdescriptor)
A type that describes the criteria, sort order, and any additional configuration to use when performing a fetch.
### [Model storage](https://developer.apple.com/documentation/SwiftData#Model-storage)
[Maintaining a local copy of server data](https://developer.apple.com/documentation/swiftdata/maintaining-a-local-copy-of-server-data)
Create and update a persistent store to cache read-only network data.
[`class DefaultStore`](https://developer.apple.com/documentation/swiftdata/defaultstore)
A data store that uses Core Data as its undelying storage mechanism.
[`protocol DataStore`](https://developer.apple.com/documentation/swiftdata/datastore)
An interface that enables SwiftData to read and write model data without knowledge of the underlying storage mechanism.
[`protocol DataStoreBatching`](https://developer.apple.com/documentation/swiftdata/datastorebatching)
An interface that enables a custom data store to support batch requests.
[`protocol HistoryProviding`](https://developer.apple.com/documentation/swiftdata/historyproviding)
An interface that enables a custom data store to provide the history of changes for its persisted models.
[Building a document-based app using SwiftData](https://developer.apple.com/documentation/SwiftUI/Building-a-document-based-app-using-SwiftData)
Code along with the WWDC presenter to transform an app with SwiftData.
[`struct ModelDocument`](https://developer.apple.com/documentation/swiftdata/modeldocument)
A document type that uses SwiftData to manage its storage.
### [History life cycle](https://developer.apple.com/documentation/SwiftData#History-life-cycle)
[`enum HistoryChange`](https://developer.apple.com/documentation/swiftdata/historychange)
Values that describe data history transactions.
[`protocol HistoryDelete`](https://developer.apple.com/documentation/swiftdata/historydelete)
An interface that enables a custom data store to delete items from the history of changes to its persisted models.
[`protocol HistoryInsert`](https://developer.apple.com/documentation/swiftdata/historyinsert)
[`protocol HistoryToken`](https://developer.apple.com/documentation/swiftdata/historytoken)
[`protocol HistoryTransaction`](https://developer.apple.com/documentation/swiftdata/historytransaction)
[`protocol HistoryUpdate`](https://developer.apple.com/documentation/swiftdata/historyupdate)
[`struct HistoryTombstone`](https://developer.apple.com/documentation/swiftdata/historytombstone)
[`struct DefaultHistoryInsert`](https://developer.apple.com/documentation/swiftdata/defaulthistoryinsert)
[`struct DefaultHistoryUpdate`](https://developer.apple.com/documentation/swiftdata/defaulthistoryupdate)
[`struct DefaultHistoryDelete`](https://developer.apple.com/documentation/swiftdata/defaulthistorydelete)
[`struct DefaultHistoryToken`](https://developer.apple.com/documentation/swiftdata/defaulthistorytoken)
[`struct DefaultHistoryTransaction`](https://developer.apple.com/documentation/swiftdata/defaulthistorytransaction)
### [Codeable support](https://developer.apple.com/documentation/SwiftData#Codeable-support)
[`enum DataStoreSnapshotCodingKey`](https://developer.apple.com/documentation/swiftdata/datastoresnapshotcodingkey)
The key space to use when implementing custom coders and decoders for data store snapshots,
### [Errors](https://developer.apple.com/documentation/SwiftData#Errors)
[`struct SwiftDataError`](https://developer.apple.com/documentation/swiftdata/swiftdataerror)
A type that describes a SwiftData error.
[`enum DataStoreError`](https://developer.apple.com/documentation/swiftdata/datastoreerror)
A type that describes a data store error.
Current page is SwiftData 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FSwiftData).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
