Source: https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores

[ Skip Navigation ](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores)
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
[ Open Menu ](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores)


[](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores)
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
  * [ Core Data ](https://developer.apple.com/documentation/coredata)
  * [ Linking Data Between Two Core Data Stores ](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores)
  *     * Linking Data Between Two Core Data Stores 


Sample Code
# Linking Data Between Two Core Data Stores
Organize data in two different stores and implement a link between them.
[ Download ](https://docs-assets.developer.apple.com/published/c9a68b653b7d/LinkingDataBetweenTwoCoreDataStores.zip)
iOS 13.2+iPadOS 13.2+Mac Catalyst 13.2+Xcode 11.4+
## [Overview](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores#Overview)
Sometimes your app needs to work with multiple Core Data stores. For example, if you need to label data in a read-only store, you must write the labeling result to a different store. If you need to synchronize part of a large data set to iCloud, your app can organize the data in two stores to mirror one to CloudKit and keep the other on the local device.
This sample app shows how to manage and link data from two different stores with one Core Data stack. The app organizes the records of books and user feedback on the books into two separate stores. It connects two entities from the stores with a fetched property, which enables the app to access a book’s feedback directly. When users add or remove a feedback record and save the change, the app updates the fetched property by refreshing the book object.
### [Configure the Data Model](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores#Configure-the-Data-Model)
The sample app creates a `Book` entity and a `Feedback` entity in the Core Data model, and then creates one `Configuration` for each store, named `Book` and `Feedback` as well, to contain the store’s entity.
To link the entities, the sample app adds a fetched property, `feedbackList`, in the `Book` entity, which is displayed in the entity’s Fetched Properties section in Xcode. The fetched property’s target is set to the `Feedback` entity and its predicate is `bookUUID == $FETCH_SOURCE.uuid`, where `bookUUID` is a key path of the target and `$FETCH_SOURCE` will be replaced with the source of the fetched property, which is the `Book` object in this sample. With this setup, when the app refreshes a `Book` object and accesses its `feedbackList` property, Core Data executes an `NSFetchRequest` with the predicate on the `Feedback` entity, and returns the result to the property.
### [Set Up the Core Data Stack](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores#Set-Up-the-Core-Data-Stack)
The sample app creates one `NSPersistentStoreDescription` object for each store with the store’s URL and model configuration, then uses `NSPersistentContainer` to load the stores.
```
let container = NSPersistentContainer(name: "CoreDataFetchedProperty")
let defaultDirectoryURL = NSPersistentContainer.defaultDirectoryURL()


let bookStoreURL = defaultDirectoryURL.appendingPathComponent("Books.sqlite")
let bookStoreDescription = NSPersistentStoreDescription(url: bookStoreURL)
bookStoreDescription.configuration = "Book"


let feedbackStoreURL = defaultDirectoryURL.appendingPathComponent("Feedback.sqlite")
let feedbackStoreDescription = NSPersistentStoreDescription(url: feedbackStoreURL)
feedbackStoreDescription.configuration = "Feedback"


container.persistentStoreDescriptions = [bookStoreDescription, feedbackStoreDescription]
container.loadPersistentStores(completionHandler: { (_, error) in
    guard let error = error as NSError? else { return }
    fatalError("###\(#function): Failed to load persistent stores:\(error)")
})

```

With this setup, when the app fetches or changes data, Core Data automatically routes the request to the right store based on where the entities are.
### [Implement the Fetched Property](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores#Implement-the-Fetched-Property)
Xcode currently doesn’t generate code for fetched properties, so the sample app adds the following extension to provide the accessor for `feedbackList`.
```
extension Book {
    var feedbackList: [Feedback]? { // The accessor of the feedbackList property.
        return value(forKey: "feedbackList") as? [Feedback]
    }
}

```

With the `feedbackList` accessor, the app can access the fetched property directly.
```
guard let feedback = book.feedbackList?[indexPath.row] else { return cell }
let rating = Int(feedback.rating)
let comment = feedback.comment ?? ""

```

Unlike a relationship, a fetched property can’t be used in a predicate for `NSFetchRequest`. It isn’t automatically updated when the managed context is saved either. When the sample app saves changes on the `Feedback` entity, the app must refresh the `book` object to update the `book.feedbackList` property.
```
context.refresh(book, mergeChanges: true)

```

## [See Also](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores#see-also)
### [Essentials](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores#Essentials)
[Creating a Core Data model](https://developer.apple.com/documentation/coredata/creating-a-core-data-model)
Define your app’s object structure with a data model file.
[Setting up a Core Data stack](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack)
Set up the classes that manage and persist your app’s objects.
[API Reference Core Data stack](https://developer.apple.com/documentation/coredata/core-data-stack)
Manage and persist your app’s model layer.
[Handling Different Data Types in Core Data](https://developer.apple.com/documentation/coredata/handling-different-data-types-in-core-data)
Create, store, and present records for a variety of data types.
Current page is Linking Data Between Two Core Data Stores 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fcoredata%2Flinking-data-between-two-core-data-stores).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
