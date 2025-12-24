Source: https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches

[ Skip Navigation ](https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches)
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
[ Open Menu ](https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches)
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
  * [ SwiftData ](https://developer.apple.com/documentation/swiftdata)
  * [ Preserving your app’s model data across launches ](https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches)
  *     * Preserving your app’s model data across launches 


Article
# Preserving your app’s model data across launches
Describe your model classes to SwiftData using the framework’s macros, and store instances of those models so they exist beyond the app’s runtime.
## [Overview](https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches#overview)
Most apps define a number of custom types that model the data it creates or consumes. For example, a travel app might define classes that represent trips, flights, and booked accommodations. Using SwiftData, you can quickly and efficiently persist that data so it’s available across app launches, and leverage the framework’s integration with SwiftUI to refetch that data and display it onscreen.
By design, SwiftData supplements your existing model classes. The framework provides tools such as macros and property wrappers that enable you to expressively describe your app’s schema in Swift code, removing any reliance on external dependencies such as model and migration mapping files.
### [Turn classes into models to make them persistable](https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches#Turn-classes-into-models-to-make-them-persistable)
To let SwiftData save instances of a model class, import the framework and annotate that class with the [`Model()`](https://developer.apple.com/documentation/swiftdata/model\(\)) macro. The macro updates the class with conformance to the [`PersistentModel`](https://developer.apple.com/documentation/swiftdata/persistentmodel) protocol, which SwiftData uses to examine the class and generate an internal schema. Additionally, the macro enables change tracking for the class by adding conformance to the [`Observable`](https://developer.apple.com/documentation/Observation/Observable) protocol.
```
import SwiftData


// Annotate new or existing model classes with the @Model macro.
@Model
class Trip {
    var name: String
    var destination: String
    var startDate: Date
    var endDate: Date
    var accommodation: Accommodation?
}

```

By default, SwiftData includes all noncomputed properties of a class as long as they use compatible types. The framework supports primitive types such as [`Bool`](https://developer.apple.com/documentation/Swift/Bool), [`Int`](https://developer.apple.com/documentation/Swift/Int), and [`String`](https://developer.apple.com/documentation/Swift/String), as well as complex value types such as structures, enumerations, and other value types that conform to the [`Codable`](https://developer.apple.com/documentation/Swift/Codable) protocol.
The code you write to define your model classes now serves as the source of truth for your app’s model layer, and the framework uses that to keep the persisted data in a consistent state.
### [Customize the persistence behavior of model attributes](https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches#Customize-the-persistence-behavior-of-model-attributes)
An _attribute_ is a property of a model class that SwiftData manages. In most cases, the framework’s default behavior for attributes is sufficient. However, if you need to alter how SwiftData handles the persistence of a particular attribute, use one of the provided schema macros. For example, you may want to avoid conflicts in your model data by specifying that an attribute’s value is unique across all instances of that model.
To customize an attribute’s behavior, annotate the property with the [`Attribute(_:originalName:hashModifier:)`](https://developer.apple.com/documentation/swiftdata/attribute\(_:originalname:hashmodifier:\)) macro and specify values for the options that drive the desired behavior:
```
@Attribute(.unique) var name: String

```

Aside from enforcing unique constraints, `@Attribute` supports, among others, preserving deleted values, Spotlight indexing, and encryption. You can also use the `@Attribute` macro to correctly handle renamed attributes if you want to preserve the original name in the underlying model data.
When a model contains an attribute whose type is also a model (or a collection of models), SwiftData implicitly manages the relationship between those models for you. By default, the framework sets relationship attributes to `nil` after you delete a related model instance. To specify a different deletion rule, annotate the property with the [`Relationship(_:deleteRule:minimumModelCount:maximumModelCount:originalName:inverse:hashModifier:)`](https://developer.apple.com/documentation/swiftdata/relationship\(_:deleterule:minimummodelcount:maximummodelcount:originalname:inverse:hashmodifier:\)) macro. For example, you may want to delete any related accommodations when deleting a trip. For more information about delete rules, see [`Schema.Relationship.DeleteRule`](https://developer.apple.com/documentation/swiftdata/schema/relationship/deleterule-swift.enum).
```
@Relationship(.cascade) var accommodation: Accommodation?

```

SwiftData persists all noncomputed attributes of a model by default, but you may not always want this to happen. For example, one or more properties on a class may only ever contain temporary data that doesn’t need saving, such as the current weather at an upcoming trip’s destination. In such scenarios, annotate those properties with the [`Transient()`](https://developer.apple.com/documentation/swiftdata/transient\(\)) macro and SwiftData won’t write their values to disk.
```
@Transient var destinationWeather = Weather.current()

```

### [Configure the model storage](https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches#Configure-the-model-storage)
Before SwiftData can examine your models and generate the required schema, you need to tell it — at runtime — which models to persist, and optionally, the configuration to use for the underlying storage. For example, you may want the storage to exist only in memory when running tests, or to use a specific CloudKit container when syncing model data across devices.
To set up the default storage, use the [`modelContainer(for:inMemory:isAutosaveEnabled:isUndoEnabled:onSetup:)`](https://developer.apple.com/documentation/SwiftUI/View/modelContainer\(for:inMemory:isAutosaveEnabled:isUndoEnabled:onSetup:\)-18hhy) view modifier (or the scene equivalent) and specify the array of model types to persist. If you use the view modifier, add it at the very top of the view hierarchy so all nested views inherit the properly configured environment:
```
import SwiftUI
import SwiftData


@main
struct TripsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [
                    Trip.self,
                    Accommodation.self
                ])
        }
    }
}

```

If you’re not using SwiftUI, create a model container manually using the appropriate initializer:
```
import SwiftData


let container = try ModelContainer([
    Trip.self, 
    Accommodation.self
])

```

Tip
If a model type contains a relationship, you may omit the destination model type from the array. SwiftData automatically traverses a model’s relationships and includes any destination model types for you.
Alternatively, use [`ModelConfiguration`](https://developer.apple.com/documentation/swiftdata/modelconfiguration) to create custom storage. The type provides a number of options to configure including whether:
  * the storage exists only in memory.
  * the storage is read-only.
  * the app uses a specific App Group to store its model data.


```
let configuration = ModelConfiguration(isStoredInMemoryOnly: true, allowsSave: false)


let container = try ModelContainer(
    for: Trip.self, Accommodation.self, 
    configurations: configuration
)

```

Important
Automatic iCloud sync relies on the presence of the CloudKit entitlement, and SwiftData uses the first container it finds in that entitlement. If your app needs a particular container, use an instance of `ModelConfiguration` to specify that container.
### [Save models for later use](https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches#Save-models-for-later-use)
To manage instances of your model classes at runtime, use a _model context_ — the object responsible for the in-memory model data and coordination with the model container to successfully persist that data. To get a context for your model container that’s bound to the main actor, use the [`modelContext`](https://developer.apple.com/documentation/SwiftUI/EnvironmentValues/modelContext) environment variable:
```
import SwiftUI
import SwiftData


struct ContentView: View {
    @Environment(\.modelContext) private var context
}

```

Outside of a view, or if you’re not using SwiftUI, access the same actor-bound context directly using the model container:
```
let context = container.mainContext

```

In both instances, the returned context periodically checks whether it contains unsaved changes, and if so, implicitly saves those changes on your behalf. For contexts you create manually, set the [`autosaveEnabled`](https://developer.apple.com/documentation/swiftdata/modelcontext/autosaveenabled) property to `true` to get the same behavior.
To enable SwiftData to persist a model instance and begin tracking changes to it, insert the instance into the context:
```
var trip = Trip(name: name, 
                destination: destination, 
                startDate: startDate, 
                endDate: endDate)


context.insert(trip)

```

Following the insert, you can save immediately by invoking the context’s [`save()`](https://developer.apple.com/documentation/swiftdata/modelcontext/save\(\)) method, or rely on the context’s implicit save behavior instead. Contexts automatically track changes to their known model instances and include those changes in subsequent saves. In addition to saving, you can use a context to fetch, enumerate, and delete model instances. For more information, see [`ModelContext`](https://developer.apple.com/documentation/swiftdata/modelcontext).
### [Fetch models for display or additional processing](https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches#Fetch-models-for-display-or-additional-processing)
After you begin persisting model data, you’ll likely want to retrieve that data, materialized as model instances, and display those instances in a view or take some other action on them. SwiftData provides the [`Query`](https://developer.apple.com/documentation/swiftdata/query) property wrapper and the [`FetchDescriptor`](https://developer.apple.com/documentation/swiftdata/fetchdescriptor) type for performing fetches.
To fetch model instances, and optionally apply search criteria and a preferred sort order, use `@Query` in your SwiftUI view. The `@Model` macro adds `Observable` conformance to your model classes, enabling SwiftUI to refresh the containing view whenever changes occur to any of the fetched instances.
```
import SwiftUI
import SwiftData


struct ContentView: View {
    @Query(sort: \.startDate, order: .reverse) var allTrips: [Trip]
    
    var body: some View {
        List {
            ForEach(allTrips) {
                TripView(for: $0)
            }
        }
    }
}

```

Outside of a view, or if you’re not using SwiftUI, use one of the two fetch methods on [`ModelContext`](https://developer.apple.com/documentation/swiftdata/modelcontext). Each method expects an instance of [`FetchDescriptor`](https://developer.apple.com/documentation/swiftdata/fetchdescriptor) containing a predicate and a sort order. The fetch descriptor allows for additional configuration that influences batching, offsets, and prefetching, among others.
```
let context = container.mainContext


let upcomingTrips = FetchDescriptor<Trip>(
    predicate: #Predicate { $0.startDate > Date.now },
    sortBy: [
        .init(\.startDate)
    ]
)
upcomingTrips.fetchLimit = 50
upcomingTrips.includePendingChanges = true


let results = context.fetch(upcomingTrips)

```

For more information about predicates, see [`Predicate`](https://developer.apple.com/documentation/Foundation/Predicate).
## [See Also](https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches#see-also)
### [Essentials](https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches#Essentials)
[Adding and editing persistent data in your app](https://developer.apple.com/documentation/swiftdata/adding-and-editing-persistent-data-in-your-app)
Create a data entry form for collecting and changing data managed by SwiftData.
[Adopting SwiftData for a Core Data app](https://developer.apple.com/documentation/CoreData/adopting-swiftdata-for-a-core-data-app)
Persist data in your app intuitively with the Swift native persistence framework.
[SwiftData updates](https://developer.apple.com/documentation/Updates/SwiftData)
Learn about important changes to SwiftData.
[Adopting inheritance in SwiftData](https://developer.apple.com/documentation/swiftdata/adopting-inheritance-in-swiftdata)
Add flexibility to your models using class inheritance.
Current page is Preserving your app’s model data across launches 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fswiftdata%2Fpreserving-your-apps-model-data-across-launches).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
