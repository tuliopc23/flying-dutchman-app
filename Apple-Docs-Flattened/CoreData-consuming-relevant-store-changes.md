Source: https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes

[ Skip Navigation ](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes)
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
[ Open Menu ](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes)


[](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes)
## [ Core Data  ](https://developer.apple.com/documentation/coredata)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
35 of 37 symbols inside <root> containing 7 symbols[Manual migrations](https://developer.apple.com/documentation/coredata/manual-migrations)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
18 of 37 symbols inside <root> containing 5 symbols[Mirroring a Core Data store with CloudKit](https://developer.apple.com/documentation/coredata/mirroring-a-core-data-store-with-cloudkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
19 of 37 symbols inside <root> [Synchronizing a local store to the cloud](https://developer.apple.com/documentation/coredata/synchronizing-a-local-store-to-the-cloud)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
20 of 37 symbols inside <root> containing 16 symbols[NSPersistentCloudKitContainer](https://developer.apple.com/documentation/coredata/nspersistentcloudkitcontainer)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
21 of 37 symbols inside <root> containing 4 symbols[NSPersistentCloudKitContainerOptions](https://developer.apple.com/documentation/coredata/nspersistentcloudkitcontaineroptions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
22 of 37 symbols inside <root> [Sharing Core Data objects between iCloud users](https://developer.apple.com/documentation/coredata/sharing-core-data-objects-between-icloud-users)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
23 of 37 symbols inside <root>
Change processing
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
24 of 37 symbols inside <root> [Accessing data when the store changes](https://developer.apple.com/documentation/coredata/accessing-data-when-the-store-changes)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
25 of 37 symbols inside <root> [Consuming relevant store changes](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
26 of 37 symbols inside <root> containing 8 symbols[Persistent history](https://developer.apple.com/documentation/coredata/persistent-history)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
27 of 37 symbols inside <root>
Background tasks
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
28 of 37 symbols inside <root> [Using Core Data in the background](https://developer.apple.com/documentation/coredata/using-core-data-in-the-background)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
29 of 37 symbols inside <root> [Loading and displaying a large data feed](https://developer.apple.com/documentation/swiftui/loading-and-displaying-a-large-data-feed)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
30 of 37 symbols inside <root> containing 5 symbols[Conflict resolution](https://developer.apple.com/documentation/coredata/conflict-resolution)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
31 of 37 symbols inside <root> containing 9 symbols[Batch processing](https://developer.apple.com/documentation/coredata/batch-processing)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
32 of 37 symbols inside <root>
Data model migration
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
33 of 37 symbols inside <root> [Migrating your data model automatically](https://developer.apple.com/documentation/coredata/migrating-your-data-model-automatically)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
34 of 37 symbols inside <root> containing 7 symbols[Staged migrations](https://developer.apple.com/documentation/coredata/staged-migrations)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
35 of 37 symbols inside <root> containing 7 symbols[Manual migrations](https://developer.apple.com/documentation/coredata/manual-migrations)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
36 of 37 symbols inside <root>
Related types
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
37 of 37 symbols inside <root> containing 60 symbols[Core Data Constants](https://developer.apple.com/documentation/coredata/core-data-constants)
37 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Core Data ](https://developer.apple.com/documentation/coredata)
  * [ Consuming relevant store changes ](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes)
  *     * Consuming relevant store changes 


Article
# Consuming relevant store changes
Filter store transactions for changes relevant to the current view.
## [Overview](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes#overview)
Use persistent history tracking to determine what changes have occurred in the store, and to update your view context only as needed.
For example, consider an app that sometimes shows a list of shopping items, and sometimes shows a list of stores. As the user views the `ShoppingItem` objects from the view context, a background context may download additional `Store` data from a remote source. If the import happens through a batch operation, the save to the store doesn’t generate an [`NSManagedObjectContextDidSave`](https://developer.apple.com/documentation/Foundation/NSNotification/Name-swift.struct/NSManagedObjectContextDidSave) notification, and the view misses these relevant updates. Alternatively, the background context may save changes to the store that don’t affect the current view—for example, inserting, modifying, or deleting `Store` objects. These changes _do_ generate context save events, so your view context processes them even though it doesn’t need to.
Persistent history solves the problem by keeping track of every transaction on the store. You can filter this history for relevant changes and decide how or whether to update a view.
### [Enable history tracking for your local store](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes#Enable-history-tracking-for-your-local-store)
When you create a persistent container, set the [`NSPersistentHistoryTrackingKey`](https://developer.apple.com/documentation/coredata/nspersistenthistorytrackingkey) option on the store description to [`true`](https://developer.apple.com/documentation/Swift/true) to enable history tracking.
```
// Pass the data model filename to the container’s initializer.
let container = PersistentContainer(name: "DataModel")


// Get the persistent store description.
let description = container.persistentStoreDescriptions.first


// Set the persistent history tracking key option.
description?.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)

```

Core Data tracks all changes to your local store.
### [Listen for remote changes](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes#Listen-for-remote-changes)
In the persistent container, set the [`NSPersistentStoreRemoteChangeNotificationPostOptionKey`](https://developer.apple.com/documentation/coredata/nspersistentstoreremotechangenotificationpostoptionkey) option to [`true`](https://developer.apple.com/documentation/Swift/true) to enable listening for remote change notifications.
```
description?.setOption(true as NSNumber, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)

```

In your view, add an observer to listen for remote change notifications.
```
.onReceive(NotificationCenter.default.publisher(for: .NSPersistentStoreRemoteChange)
    .receive(on: DispatchQueue.main)) { _ in
        fetchRemoteChanges()
        
        viewContext.perform {
            do {
                try viewContext.save()
            } catch {
                print("Failed to save changes: \(error.localizedDescription)")
            }
        }
    }

```

### [Provide details about a transaction’s source](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes#Provide-details-about-a-transactions-source)
Each history transaction automatically includes the originating [`storeID`](https://developer.apple.com/documentation/coredata/nspersistenthistorytransaction/storeid), [`bundleID`](https://developer.apple.com/documentation/coredata/nspersistenthistorytransaction/bundleid) and [`processID`](https://developer.apple.com/documentation/coredata/nspersistenthistorytransaction/processid). You can supply additional information about the source of a change by setting each managed object context’s [`name`](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext/name) and [`transactionAuthor`](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext/transactionauthor).
Provide a unique [`name`](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext/name) for each context to identify it in the persistent history. The context’s [`name`](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext/name) becomes the persistent history transaction’s [`contextName`](https://developer.apple.com/documentation/coredata/nspersistenthistorytransaction/contextname). You only need to set this once per context.
```
class PersistentContainer: NSPersistentContainer {
    override init(name: String, managedObjectModel model: NSManagedObjectModel) {
        super.init(name: name, managedObjectModel: model)
        
        // Set the context's name.
        viewContext.name = "viewContext"
    }
}

```

You can also set a [`transactionAuthor`](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext/transactionauthor) before each context save to differentiate among multiple call sites that modify the same context. The context’s [`transactionAuthor`](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext/transactionauthor) becomes the [`author`](https://developer.apple.com/documentation/coredata/nspersistenthistorytransaction/author) of subsequent persistent history transactions.
```
let newItem = ShoppingItem(context: viewContext)


// Set newItem properties.


// Set the transaction author.
viewContext.transactionAuthor = "addItem"


// Perform a save.
viewContext.perform {
    do {
        try viewContext.save()
        
        // Reset the transaction author to prevent misattribution of
        // future transactions.
        viewContext.transactionAuthor = nil
    } catch {
        print("Failed to save changes:", error.localizedDescription)
    }
}

```

Reset the context’s [`transactionAuthor`](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext/transactionauthor) to `nil` after saving the context to prevent misattribution of future transactions.
### [Keep track of the most recent history](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes#Keep-track-of-the-most-recent-history)
Create an instance of [`NSPersistentHistoryToken`](https://developer.apple.com/documentation/coredata/nspersistenthistorytoken) to keep track of the most recent history.
```
var lastToken: NSPersistentHistoryToken?

```

Save the token to disk so you can track history across app launches and fetch history based on the token.
```
var lastToken: NSPersistentHistoryToken? = nil {
    didSet {
        // Encode the token.
        guard let lastToken,
              let data = try? NSKeyedArchiver.archivedData(withRootObject: lastToken,
                                                           requiringSecureCoding: true) else {
            return
        }
        
        do {
            // Write the token to disk.
            try data.write(to: tokenFileURL)
        } catch {
            print("Failed to write token data:", error.localizedDescription)
        }
    }
}


lazy var tokenFileURL: URL = {
    // Get the URL to the persistent store directory.
    let url = NSPersistentContainer.defaultDirectoryURL().appendingPathComponent("ShoppingList",
                                                                                 isDirectory: true)
    
    // Create the directory if it doesn't already exist.
    if FileManager.default.fileExists(atPath: url.path) == false {
        do {
            try FileManager.default.createDirectory(at: url,
                                                    withIntermediateDirectories: true)
        } catch {
            print("Failed to create persistent container URL:", error.localizedDescription)
        }
    }
    
    // Append the name of the token data file and return the URL.
    return url.appendingPathComponent("token.data", isDirectory: false)
}()

```

### [Request history](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes#Request-history)
To request history, use the [`fetchHistory(after:)`](https://developer.apple.com/documentation/coredata/nspersistenthistorychangerequest/fetchhistory\(after:\)-3rmfm) type method on [`NSPersistentHistoryChangeRequest`](https://developer.apple.com/documentation/coredata/nspersistenthistorychangerequest).
Important
Execute the fetch request on a background context to avoid blocking the main thread.
The following example shows a request to fetch new history since the last time you fetched history and convert the [`NSPersistentHistoryResult`](https://developer.apple.com/documentation/coredata/nspersistenthistoryresult) to an array of [`NSPersistentHistoryTransaction`](https://developer.apple.com/documentation/coredata/nspersistenthistorytransaction):
```
// Create a fetch history request with the last token.
let fetchHistoryRequest = NSPersistentHistoryChangeRequest.fetchHistory(after: lastToken)


// Get a background context.
let backgroundContext = persistentContainer.newBackgroundContext()


// Perform the fetch.
guard let historyResult = await backgroundContext.perform({
    let historyResult = try? backgroundContext.execute(fetchHistoryRequest) as? NSPersistentHistoryResult
    return historyResult?.result
}) else {
    fatalError("Failed to fetch history")
}


// Cast the result as an array of history transactions.
guard let historyTransactions = historyResult as? [NSPersistentHistoryTransaction] else {
    fatalError("Failed to convert history result to history transactions")
}

```

Alternatively you can use [`fetchHistory(after:)`](https://developer.apple.com/documentation/coredata/nspersistenthistorychangerequest/fetchhistory\(after:\)-qi5b) to get history after a particular date, or after a particular a transaction.
### [Read history transactions](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes#Read-history-transactions)
Each transaction represents a set of changes. Iterate through the array of transactions to learn their details. The following code loops through the results of the `fetchHistoryRequest` to inspect the properties of each transaction.
```
for transaction in history.reversed() {
    // Token, date, and transaction number.
    let token = transaction.token
    let timestamp = transaction.timestamp
    let transactionNumber = transaction.transactionNumber
    
    // Transaction source details.
    let store = transaction.storeID
    let bundle = transaction.bundleID
    let process = transaction.processID
    let context = transaction.contextName ?? "Unknown context"
    let author = transaction.author ?? "Unknown author"
    
    // Get the transaction's changes.
    guard let changes = transaction.changes else { continue }
}

```

A transaction’s [`changes`](https://developer.apple.com/documentation/coredata/nspersistenthistorytransaction/changes) array includes information about multiple changes. A single [`NSPersistentHistoryChange`](https://developer.apple.com/documentation/coredata/nspersistenthistorychange) represents the insertion, update, or deletion of an object.
Iterate through a transaction’s changes to identify each object that changed, the type of change that occurred, and any details about the change.
In the case of an update, the [`updatedProperties`](https://developer.apple.com/documentation/coredata/nspersistenthistorychange/updatedproperties) set includes any updated attributes and relationships. In the case of a deletion, the [`tombstone`](https://developer.apple.com/documentation/coredata/nspersistenthistorychange/tombstone) dictionary includes key-value pairs for any attributes marked for preservation after deletion.
```
for change in changes {
    let objectID = change.changedObjectID
    let changeID = change.changeID
    let transaction = change.transaction
    let changeType = change.changeType
    var changedAttributes = [String]()
    
    // Iterate over the change type to get updated or deleted attributes.
    switch changeType {
    case .update:
        guard let updatedProperties = change.updatedProperties else { break }
        for property in updatedProperties {
            changedAttributes.append(property.name)
        }
    case .delete:
        guard let tombstone = change.tombstone else { break }
        changedAttributes.append(tombstone["name"] as? String ?? "Unknown name")
    default:
        break
    }
}

```

### [Filter for relevant transactions](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes#Filter-for-relevant-transactions)
Filter the history to narrow it to changes that affect the current view. The following code filters for changes to `ShoppingItem` instances, and it updates the last transaction token as it goes.
```
var filteredTransactions = [NSPersistentHistoryTransaction]()
for transaction in transactions {
    guard let changes = transaction.changes else { continue }
    
    let filteredChanges = changes.filter { change -> Bool in
        ShoppingItem.entity().name == change.changedObjectID.entity.name
    }
    
    if filteredChanges.isEmpty == false {
        filteredTransactions.append(transaction)
    }
    
    lastToken = transaction.token
}

```

Relevant changes may include all changes to a given entity, or more selectively, only changes to those properties that are visible on the screen.
### [Merge relevant transactions](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes#Merge-relevant-transactions)
To merge the relevant changes into your view context, first obtain a notification by calling [`objectIDNotification()`](https://developer.apple.com/documentation/coredata/nspersistenthistorytransaction/objectidnotification\(\)) on the transaction. Then, pass the notification to [`mergeChanges(fromContextDidSave:)`](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext/mergechanges\(fromcontextdidsave:\)).
```
if filteredTransactions.isEmpty == false {
    // Iterate over filtered transactions and merge the changes in the
    // object ID notification that you specify.
    for transaction in filteredTransactions {
        await persistentContainer.viewContext.perform {
            self.persistentContainer.viewContext.mergeChanges(
                fromContextDidSave: transaction.objectIDNotification()
            )
        }
    }
}

```

### [Access attributes of deleted objects](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes#Access-attributes-of-deleted-objects)
After you delete an object from the store, its [`objectID`](https://developer.apple.com/documentation/coredata/nsmanagedobject/objectid) is no longer relevant. Identify a deleted object by recording select properties in its tombstone.
In the Core Data model editor, select an attribute. In the data model editor, select the Preserve After Deletion checkbox.
![Screenshot showing the data model inspector, with the Preserve After Deletion checkbox selected under Advanced. ](https://docs-assets.developer.apple.com/published/5e1c938af187bf038cd4f9a9e391f4fa/media-3233383%402x.png)
In the persistent history, [`NSPersistentHistoryChangeType.delete`](https://developer.apple.com/documentation/coredata/nspersistenthistorychangetype/delete) changes include a [`tombstone`](https://developer.apple.com/documentation/coredata/nspersistenthistorychange/tombstone) dictionary with key-value pairs for any attributes marked for preservation after deletion.
```
var deletedAttributes = [String]()


for transaction in history.reversed() {
    guard let changes = transaction.changes else { continue }
    
    for change in changes where change.changeType == .delete {
        if let tombstone = change.tombstone {
            deletedAttributes.append(tombstone["name"] as? String ?? "Unknown attribute")
        }
    }
}

```

### [Purge History](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes#Purge-History)
Because persistent history tracking transactions take up space on disk, determine a clean-up strategy to remove them when you no longer need them. Before you purge history, ensure that your app and its clients have consumed the history they need.
Similar to fetching history, you can use [`deleteHistory(before:)`](https://developer.apple.com/documentation/coredata/nspersistenthistorychangerequest/deletehistory\(before:\)-5kghb) to delete history older than a token, a transaction, or a date. For example, you can delete all transactions older than seven days:
```
// Get the point in time seven days ago.
let sevenDaysAgo = Calendar.current.date(byAdding: .day,
                                         value: -7,
                                         to: Date())!


// Create a purge history request to delete history before seven days ago.
let purgeHistoryRequest = NSPersistentHistoryChangeRequest.deleteHistory(before: sevenDaysAgo)


// Get a background context.
let backgroundContext = persistentContainer.newBackgroundContext()


// Execute the request.
await backgroundContext.perform {
    do {
        try backgroundContext.execute(purgeHistoryRequest)
    } catch {
        print("Failed to purge history:", error.localizedDescription)
    }
}

```

Important
If you attempt to fetch purged history, Core Data throws an expired token error.
## [See Also](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes#see-also)
### [Change processing](https://developer.apple.com/documentation/coredata/consuming-relevant-store-changes#Change-processing)
[Accessing data when the store changes](https://developer.apple.com/documentation/coredata/accessing-data-when-the-store-changes)
Guarantee that a context won’t see store changes until you tell it to look.
[API Reference Persistent history](https://developer.apple.com/documentation/coredata/persistent-history)
Use persistent history tracking to determine what changes have occurred in the store since the enabling of persistent history tracking.
Current page is Consuming relevant store changes 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fcoredata%2Fconsuming-relevant-store-changes).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
