Source: https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack

[ Skip Navigation ](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack)
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
[ Open Menu ](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack)


[](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack)
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
1 of 2 symbols inside -615135069 
Legacy Stack Setup
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 2 symbols inside -615135069 [Setting up a Core Data stack manually](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack-manually)
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
39 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Core Data ](https://developer.apple.com/documentation/coredata)
  * [ Setting up a Core Data stack ](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack)
  *     * Setting up a Core Data stack 


Article
# Setting up a Core Data stack
Set up the classes that manage and persist your app’s objects.
## [Overview](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack#overview)
After you create a data model file as described in [Creating a Core Data model](https://developer.apple.com/documentation/coredata/creating-a-core-data-model), set up the classes that collaboratively support your app’s model layer. These classes are collectively referred to as the Core Data stack.
![Diagram showing that a persistent container instance contains references to a a managed object model, a managed object context, and a persistent store coordinator that connects to your app’s stores.](https://docs-assets.developer.apple.com/published/5ae3a13612ee984aac0a82870723ef9d/media-3122928%402x.png)
  * An instance of [`NSManagedObjectModel`](https://developer.apple.com/documentation/coredata/nsmanagedobjectmodel) represents your app’s model file describing your app’s types, properties, and relationships.
  * An instance of [`NSManagedObjectContext`](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext) tracks changes to instances of your app’s types.
  * An instance of [`NSPersistentStoreCoordinator`](https://developer.apple.com/documentation/coredata/nspersistentstorecoordinator) saves and fetches instances of your app’s types from stores.
  * An instance of [`NSPersistentContainer`](https://developer.apple.com/documentation/coredata/nspersistentcontainer) sets up the model, context, and store coordinator all at once.


### [Initialize a Persistent Container](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack#Initialize-a-Persistent-Container)
Typically, you initialize a Core Data stack as a singleton:
```
// Define an observable class to encapsulate all Core Data-related functionality.
class CoreDataStack: ObservableObject {
    static let shared = CoreDataStack()
    
    // Create a persistent container as a lazy variable to defer instantiation until its first use.
    lazy var persistentContainer: NSPersistentContainer = {
        
        // Pass the data model filename to the container’s initializer.
        let container = NSPersistentContainer(name: "DataModel")
        
        // Load any persistent stores, which creates a store if none exists.
        container.loadPersistentStores { _, error in
            if let error {
                // Handle the error appropriately. However, it's useful to use
                // `fatalError(_:file:line:)` during development.
                fatalError("Failed to load persistent stores: \(error.localizedDescription)")
            }
        }
        return container
    }()
        
    private init() { }
}

```

Once created, the persistent container holds references to the model, context, and store coordinator instances in its [`managedObjectModel`](https://developer.apple.com/documentation/coredata/nspersistentcontainer/managedobjectmodel), [`viewContext`](https://developer.apple.com/documentation/coredata/nspersistentcontainer/viewcontext), and [`persistentStoreCoordinator`](https://developer.apple.com/documentation/coredata/nspersistentcontainer/persistentstorecoordinator) properties, respectively.
You can now use the Core Data stack througout your app.
### [Inject the managed object context](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack#Inject-the-managed-object-context)
Create an instance of the Core Data stack and inject its managed object context into your app environment:
```
@main
struct ShoppingListApp: App {
    // Create an observable instance of the Core Data stack.
    @StateObject private var coreDataStack = CoreDataStack.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            // Inject the persistent container's managed object context
            // into the environment.
                .environment(\.managedObjectContext,
                              coreDataStack.persistentContainer.viewContext)
        }
    }
}

```

Use an environment property wrapper to access the managed object context in your views:
```
//#-code-listing(AccessManagedObjectContext) [Access the managed object context]
struct ContentView: View {
    // Get a reference to the managed object context from the environment.
    @Environment(\.managedObjectContext) private var viewContext


    // Remaining implementation of the user interface.
}

```

### [Add functionality to the stack](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack#Add-functionality-to-the-stack)
Your Core Data stack is a convenient place to put related code, such as methods to save changes and delete managed objects in the persistent store:
```
extension CoreDataStack {
    // Add a convenience method to commit changes to the store.
    func save() {
        // Verify that the context has uncommitted changes.
        guard persistentContainer.viewContext.hasChanges else { return }
        
        do {
            // Attempt to save changes.
            try persistentContainer.viewContext.save()
        } catch {
            // Handle the error appropriately.
            print("Failed to save the context:", error.localizedDescription)
        }
    }
    
    func delete(item: ShoppingItem) {
        persistentContainer.viewContext.delete(item)
        save()
    }
}

```

The `save` method improves performance by saving the context only when there are changes.
## [Topics](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack#topics)
### [Legacy Stack Setup](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack#Legacy-Stack-Setup)
[Setting up a Core Data stack manually](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack-manually)
Create the individual components that Core Data requires manually, to support earlier versions of Apple operating systems.
## [See Also](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack#see-also)
### [Essentials](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack#Essentials)
[Creating a Core Data model](https://developer.apple.com/documentation/coredata/creating-a-core-data-model)
Define your app’s object structure with a data model file.
[API Reference Core Data stack](https://developer.apple.com/documentation/coredata/core-data-stack)
Manage and persist your app’s model layer.
[Handling Different Data Types in Core Data](https://developer.apple.com/documentation/coredata/handling-different-data-types-in-core-data)
Create, store, and present records for a variety of data types.
[Linking Data Between Two Core Data Stores](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores)
Organize data in two different stores and implement a link between them.
Current page is Setting up a Core Data stack 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fcoredata%2Fsetting-up-a-core-data-stack).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
