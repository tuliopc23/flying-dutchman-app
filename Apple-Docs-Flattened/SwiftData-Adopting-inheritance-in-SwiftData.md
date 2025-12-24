Source: https://developer.apple.com/documentation/swiftdata/adopting-inheritance-in-swiftdata

[ Skip Navigation ](https://developer.apple.com/documentation/swiftdata/adopting-inheritance-in-swiftdata#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/swiftdata/adopting-inheritance-in-swiftdata#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/swiftdata/adopting-inheritance-in-swiftdata)
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
[ Open Menu ](https://developer.apple.com/documentation/swiftdata/adopting-inheritance-in-swiftdata)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/swiftdata/adopting-inheritance-in-swiftdata)
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
  * [ Adopting inheritance in SwiftData ](https://developer.apple.com/documentation/swiftdata/adopting-inheritance-in-swiftdata)
  *     * Adopting inheritance in SwiftData 


Article
# Adopting inheritance in SwiftData
Add flexibility to your models using class inheritance.
## [Overview](https://developer.apple.com/documentation/swiftdata/adopting-inheritance-in-swiftdata#Overview)
SwiftData supports class inheritance, an object-oriented programming feature that enables you to expand the kinds of use cases your models can support by creating new subclasses that add properties and capabilities to an existing base class.
Like other Swift subclasses, SwiftData models can inherit the properties and capabilities of a parent or superclass. In SwiftData this allows you to add new properties and behaviors that extend the capabilities of your models by creating a hierarchical relationship between them that you can operating on using query, predicate, and history operations. This enables you to build in more flexibility into your app as your models become more specialized and able to serve more diverse use cases.
An example of such an app might one that tracks trips: both personal trips, such as family vacations, and business trips. At a high level, a trip might be captured in a very concise model, like the one shown here.
```
@Model LivingAccommodation { ... }


@Model class Trip {
    @Attribute(.preserveValueOnDeletion)
    var name: String
    var destination: String
    
    @Attribute(.preserveValueOnDeletion)
    var startDate: Date
    
    @Attribute(.preserveValueOnDeletion)
    var endDate: Date


    @Relationship(deleteRule: .cascade, inverse: \BucketListItem.trip)
    var bucketList: [BucketListItem] = [BucketListItem]()


    @Relationship(deleteRule: .cascade, inverse: \LivingAccommodation.trip)
    var livingAccommodation: LivingAccommodation?
    
    var isBusinessTrip: Boolean = false
}



```

A name, a destination, start and end dates, living accommodations, and `true` or `false` values that indicate a business or personal trip: this is functional, but as the capabilities for a trip tracking app grow, it might expand to track more kinds of information, and this is where inheritance can provide more flexibility.
## [Design for specialization](https://developer.apple.com/documentation/swiftdata/adopting-inheritance-in-swiftdata#Design-for-specialization)
As described above, inheritance allows you to develop models that share fundamental properties but that diverge as use cases become more specialized. For example, a more expansive view of business and personal trips may include the addition of new elements depending upon the specific use case. The following table shows a few more elements that these trips this might record.
Personal Trip | Business Trip  
---|---  
attractionsToVisit | expenseCode  
familyMembers | businessMeals  
frequentFlyerCodes | milageRate  
venuePasses | milesDriven  
| conferenceSessions  
Subclasses that build upon the base `Trip` model make use of its properties and any common behavior, but keep these new behaviors isolated. For example, a `PersonalTrip` doesn’t have to have a state or behavior for calculating the cumulative miles traveled in a reimbursement calculation: that’s more relevant to a `BusinessTrip`.
Given the outline of personal and business trip specialization above, you’d create model subclasses for SwiftData subclasses as you would in Swift, but with the addition of the `@Model` macro, to indicate the new class is a model to SwiftData. A refactoring of our trip classes into a parent (base) class and two subclasses could resemble these classes:
```
import SwiftData


@Model BucketListActivity { ... }


@Model class Trip {
    @Attribute(.preserveValueOnDeletion)
    var name: String
    var destination: String
    
    @Attribute(.preserveValueOnDeletion)
    var startDate: Date
    
    @Attribute(.preserveValueOnDeletion)
    var endDate: Date


    @Relationship(deleteRule: .cascade, inverse: \BucketListItem.trip)
    var bucketList: [BucketListItem] = [BucketListItem]()


    @Relationship(deleteRule: .cascade, inverse: \LivingAccommodation.trip)
    var livingAccommodation: LivingAccommodation?
}

```

Here, an expanded `Trip` base class no longer uses the Boolean value that previously indicated the kind of trip. The following `BusinessTrip` and `PersonalTrip` subclasses describe additional properties and behaviors that could define these specialized trip types and create a hierarchical relationship between the parent and the subclasses.
```


@available(iOS 26, *)
@Model class BusinessTrip: Trip {
    var purpose: String
    var itinerary: MeetingItinerary
    var expenseCode: String
    var perDiemRate: Double
    var mileageRate: Double
    
    @Relationship(deleteRule: .cascade, inverse: \DailyMilageRecord.trip)
    var milesDriven: [DailyMilageRecord]
    
    @Relationship(deleteRule: .cascade, inverse: \BusinessMeal.trip)
    var businessMeals: [BusinessMeal]
    
    @Relationship(deleteRule: .cascade, inverse: \ConferenceSession.trip)
    var sessionsAttended: [ConferenceSession]
}

```

The `PersonalTrip` subclass may have a very different set of properties, its design and use case shares very little with a business trip, beside the name, place, optional transportation, and duration, as shown here.
```


@Model Attraction { ... }
@Model FamilyMember { ... }


@available(iOS 26, *)
@Model class PersonalTrip: Trip {
    enum Reason: String, CaseIterable, Codable, Identifiable {
        case family
        case reunion
        case wellness
        case unknown
        
        var id: Self { self }
    }


    var reason: Reason
    @Relationship(deleteRule: .cascade, inverse: \BucketListActivities.trip)
    var bucketList: [BucketListActivity]
    var attractionsToVisit: [Attraction]
    var familyMembers: [FamilyMember]
}

```

## [Determine whether inheritance is right for your use case](https://developer.apple.com/documentation/swiftdata/adopting-inheritance-in-swiftdata#Determine-whether-inheritance-is-right-for-your-use-case)
Inheritance is useful when defining class hierarchies where you need to specialize a model representation that derives from a common base. For example `Trip`, `PersonalTrip`, and `BusinessTrip` form a natural hierarchy: a business trip and a personal trip extend the basic concept of a “trip” and create, in the language of Object Oriented design, an “IS-A” relationship. A `BusinessTrip` IS-A `Trip`. and a `PersonalTrip` also IS-A `Trip`.
Avoid using inheritance in scenarios where the specialized subclass would center on common properties, such as a trip’s name, or starting or ending dates; subclassing at this level of granularity, the class hierarchy would contain many subdomains that only share a single property. In these cases if common properties need some kind of specialized behavior, protocol conformance is a better tool.
Avoid using inheritance if your querying model would depend on fetching all of the model data all the time and then filtering the results, — this is known as a _deep query_. It’s possible the specialization (here the difference between personal and business trips) is something that a Boolean type could represent as it did in the initial `Trip` model where a Boolean value differentiated the type of trip. Another method to keep models “flatter,” reduce the number of properties, and avoid inheritance is to add an enumeration type that has a value which captures the type of trip and it’s value, here the personal trip’s reason or the business trip’s per diem value instead of an `isBusinessTrip` Boolean property, as shown here:
```
    enum Category: Codable {
        case personal(Reason)​​​​​​​​​​​​
        case business(perdiem: Double)​​​​​​​​​​​​
    }

```

As your model’s and use cases expand, adding more properties may become impractical or difficult to maintain.
Conversely, if your app’s query strategy _only_ focuses on the specialization — specific properties that define a business trip or a personal trip and never on the properties of the base trip model — known as a _shallow query_ — then using two models might be a better approach, even though each individual model might contain some apparent duplication.
Lastly, If the query strategy for your app involves allowing a person to perform elements of both deep and shallow searches, in order find and return information from both a base and the subclasses, then inheritance may be a good fit for your app’s model and use case.
## [Fetch and Query Data](https://developer.apple.com/documentation/swiftdata/adopting-inheritance-in-swiftdata#Fetch-and-Query-Data)
Note
These are abbreviated examples that show only the code relevant to fetches, queries, and predicates.
Combining inheritance and customized predicates it’s possible to create any number of customized searching and filtering mechanisms that can select from any of the properties available in your parent or subclasses.
For example, to search for text in both `BusinessTrip` and `PersonalTrip` types, perform a deep search on properties using the base class `Trip`, as this the outline demonstrates:
```
struct TripListView: View {
    @Environment(\.modelContext) private var modelContext
    // All trips, in ascending order, by start date.
    @Query(sort: \Trip.startDate, order: .forward)
    var trips: [Trip]
    
    init(searchText: String) {
        let searchPredicate = #Predicate<Trip> {
            searchText.isEmpty ? true : $0.name.localizedStandardContains(searchText) || $0.destination.localizedStandardContains(searchText)
        }
        // Filter the trips array using predicate, which searches the trip name and destination for the provided `searchText`.
        _trips = Query(filter: searchPredicate, sort: \.startDate, order: .forward) 
    }
    
    var body: some View {
        /* View body contents */
    }
}

```

Selecting trips based on type, or all trips is a similar predicate: this example uses a simple enumeration and a switch to indicate which kind of trips to select.
```
enum TripKind: String, CaseIterable {
    case all = "All"
    case personal = "Personal"
    case business = "Business"
}




struct TripListView: View {
        @Environment(\.modelContext) private var modelContext
        /// All trips, in ascending order, by start date.
        @Query(sort: \Trip.startDate, order: .forward)
        var trips: [Trip]
    
        init(tripKind: Binding<ContentView.TripKind>) {            
            // Create a predicate, selected by the provided enumeration 
            // case, that examines the object's class to determine if it's 
            // a `BusinessTrip`, `PersonalTrip`, or `Trip`.
            let classPredicate: Predicate<Trip>? = {
                switch tripKind.wrappedValue {
                // Returns a `nil` predicate representing all trips.
                case .all:
                    return nil 
                // Returns a predicate that matches on `PersonalTrip` objects.
                case .personal:
                    return #Predicate { $0 is PersonalTrip }
                // Returns a predicate that matches on `BusinessTrip` objects.
                case .business:
                    return #Predicate { $0 is BusinessTrip }
                }
            }()
            
                        
           // Filter the trips array using predicate, which matches on trips of a specific class.
           _trips = Query(filter: classPredicate, sort: \.startDate, order: .forward) 
        }
    
        var body: some View {
            // View body contents that displays the matching trips. 
        }
 }
 

```

The following example demonstrates how to combine both of these predicates to search for text in the trip’s’ `name` and `destination` properties, as well as by trips or by type of trip, if specified:
```


enum TripKind: String, CaseIterable {
    case all = "All"
    case personal = "Personal"
    case business = "Business"
}




struct TripListView: View {
    @Environment(\.modelContext) private var modelContext
    /// All trips, ordered by start date.
    @Query(sort: \Trip.startDate, order: .forward)
    var trips: [Trip]


    init(searchString: String, tripKind: Binding<ContentView.TripKind>) {     
        // Create a predicate that examines the object's class to determine
        // if it's a `BusinessType`, `Personal`, or `Trip` ("all trips").
        let classPredicate: Predicate<Trip>? = {
            switch tripKind.wrappedValue {
            // Returns a `nil` predicate representing all trips.
            case .all:
                return nil 
            // Returns a predicate that matches on `PersonalTrip` objects.
            case .personal:
                return #Predicate { $0 is PersonalTrip }
            // Returns a predicate that matches on `BusinessTrip` objects.
            case .business:
                return #Predicate { $0 is BusinessTrip }
            }
        }()
        
        // If there's search text, create a predicate than can search the trip's name and destination.        
        let searchPredicate = #Predicate<Trip> {
            searchText.isEmpty ? true : $0.name.localizedStandardContains(searchText) || $0.destination.localizedStandardContains(searchText)
        }   
    
        let fullPredicate: Predicate<Trip>
        if let classPredicate {
            fullPredicate = #Predicate { classPredicate.evaluate($0) && searchPredicate.evaluate($0) }
        } else {
            fullPredicate = searchPredicate
        }                                                          
        // Filter trips on other `searchText` or trip type, or both.
        _trips = Query(filter: fullPredicate, sort: \.startDate, order: .forward) 
    }


    var body: some View {
        // View body contents that displays the matching trips. 
    }
}

```

## [See Also](https://developer.apple.com/documentation/swiftdata/adopting-inheritance-in-swiftdata#see-also)
### [Essentials](https://developer.apple.com/documentation/swiftdata/adopting-inheritance-in-swiftdata#Essentials)
[Preserving your app’s model data across launches](https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches)
Describe your model classes to SwiftData using the framework’s macros, and store instances of those models so they exist beyond the app’s runtime.
[Adding and editing persistent data in your app](https://developer.apple.com/documentation/swiftdata/adding-and-editing-persistent-data-in-your-app)
Create a data entry form for collecting and changing data managed by SwiftData.
[Adopting SwiftData for a Core Data app](https://developer.apple.com/documentation/CoreData/adopting-swiftdata-for-a-core-data-app)
Persist data in your app intuitively with the Swift native persistence framework.
[SwiftData updates](https://developer.apple.com/documentation/Updates/SwiftData)
Learn about important changes to SwiftData.
Current page is Adopting inheritance in SwiftData 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fswiftdata%2Fadopting-inheritance-in-swiftdata).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
