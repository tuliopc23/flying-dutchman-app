Source: https://developer.apple.com/documentation/coredata/core-data-stack

[ Skip Navigation ](https://developer.apple.com/documentation/coredata/core-data-stack#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/coredata/core-data-stack#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/coredata/core-data-stack)
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
[ Open Menu ](https://developer.apple.com/documentation/coredata/core-data-stack)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/coredata/core-data-stack)


[](https://developer.apple.com/documentation/coredata/core-data-stack)
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
1 of 25 symbols inside -74198933 
Stack Setup
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
2 of 25 symbols inside -74198933 containing 19 symbols[NSPersistentContainer](https://developer.apple.com/documentation/coredata/nspersistentcontainer)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 25 symbols inside -74198933 
Object Modeling
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
4 of 25 symbols inside -74198933 containing 35 symbols[NSManagedObjectModel](https://developer.apple.com/documentation/coredata/nsmanagedobjectmodel)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
5 of 25 symbols inside -74198933 containing 30 symbols[NSEntityDescription](https://developer.apple.com/documentation/coredata/nsentitydescription)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
6 of 25 symbols inside -74198933 containing 18 symbols[NSPropertyDescription](https://developer.apple.com/documentation/coredata/nspropertydescription)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
7 of 25 symbols inside -74198933 containing 16 symbols[NSAttributeDescription](https://developer.apple.com/documentation/coredata/nsattributedescription)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
8 of 25 symbols inside -74198933 containing 2 symbols[NSDerivedAttributeDescription](https://developer.apple.com/documentation/coredata/nsderivedattributedescription)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
9 of 25 symbols inside -74198933 containing 13 symbols[NSRelationshipDescription](https://developer.apple.com/documentation/coredata/nsrelationshipdescription)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 25 symbols inside -74198933 
Object Management
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
11 of 25 symbols inside -74198933 containing 83 symbols[NSManagedObjectContext](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
12 of 25 symbols inside -74198933 containing 60 symbols[NSManagedObject](https://developer.apple.com/documentation/coredata/nsmanagedobject)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
13 of 25 symbols inside -74198933 containing 5 symbols[NSManagedObjectID](https://developer.apple.com/documentation/coredata/nsmanagedobjectid)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
14 of 25 symbols inside -74198933 
Store Coordination
62 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Collection
  * [ Core Data ](https://developer.apple.com/documentation/coredata)
  * [ Core Data stack ](https://developer.apple.com/documentation/coredata/core-data-stack)
  *     * Core Data stack 


API Collection
# Core Data stack
Manage and persist your app’s model layer.
## [Overview](https://developer.apple.com/documentation/coredata/core-data-stack#overview)
Core Data provides a set of classes that collaboratively support your app’s model layer:
  * An instance of [`NSManagedObjectModel`](https://developer.apple.com/documentation/coredata/nsmanagedobjectmodel) describes your app’s types, including their properties and relationships.
  * An instance of [`NSManagedObjectContext`](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext) tracks changes to instances of your app’s types.
  * An instance of [`NSPersistentStoreCoordinator`](https://developer.apple.com/documentation/coredata/nspersistentstorecoordinator) saves and fetches instances of your app’s types from stores.


![Diagram showing that a persistent container instance contains references to a managed object model, a managed object context, and a persistent store coordinator that connects to your app’s stores.](https://docs-assets.developer.apple.com/published/5d911adb8af302c1be92e9a1ceb1bef7/media-3118356%402x.png)
You use an [`NSPersistentContainer`](https://developer.apple.com/documentation/coredata/nspersistentcontainer) instance to set up the model, context, and store coordinator simultaneously.
## [Topics](https://developer.apple.com/documentation/coredata/core-data-stack#topics)
### [Stack Setup](https://developer.apple.com/documentation/coredata/core-data-stack#Stack-Setup)
[`class NSPersistentContainer`](https://developer.apple.com/documentation/coredata/nspersistentcontainer)
A container that encapsulates the Core Data stack in your app.
### [Object Modeling](https://developer.apple.com/documentation/coredata/core-data-stack#Object-Modeling)
[`class NSManagedObjectModel`](https://developer.apple.com/documentation/coredata/nsmanagedobjectmodel)
A programmatic representation of the `.xcdatamodeld` file describing your objects.
[`class NSEntityDescription`](https://developer.apple.com/documentation/coredata/nsentitydescription)
A description of a Core Data entity.
[`class NSPropertyDescription`](https://developer.apple.com/documentation/coredata/nspropertydescription)
A description of a single property belonging to an entity.
[`class NSAttributeDescription`](https://developer.apple.com/documentation/coredata/nsattributedescription)
A description of a single attribute belonging to an entity.
[`class NSDerivedAttributeDescription`](https://developer.apple.com/documentation/coredata/nsderivedattributedescription)
A description of an attribute that derives its value by performing a calculation on a related attribute.
[`class NSRelationshipDescription`](https://developer.apple.com/documentation/coredata/nsrelationshipdescription)
A description of a relationship between two entities.
### [Object Management](https://developer.apple.com/documentation/coredata/core-data-stack#Object-Management)
[`class NSManagedObjectContext`](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext)
An object space to manipulate and track changes to managed objects.
[`class NSManagedObject`](https://developer.apple.com/documentation/coredata/nsmanagedobject)
The base class that all Core Data model objects inherit from.
[`class NSManagedObjectID`](https://developer.apple.com/documentation/coredata/nsmanagedobjectid)
A compact, universal identifier for a managed object.
### [Store Coordination](https://developer.apple.com/documentation/coredata/core-data-stack#Store-Coordination)
[`class NSPersistentStoreCoordinator`](https://developer.apple.com/documentation/coredata/nspersistentstorecoordinator)
An object that enables an app’s contexts and the underlying persistent stores to work together.
[`class NSPersistentStore`](https://developer.apple.com/documentation/coredata/nspersistentstore)
The abstract base class for all Core Data persistent stores.
[`class NSPersistentStoreDescription`](https://developer.apple.com/documentation/coredata/nspersistentstoredescription)
A description object used to create and load a persistent store.
[`class NSPersistentStoreRequest`](https://developer.apple.com/documentation/coredata/nspersistentstorerequest)
Criteria used to retrieve data from or save data to a persistent store.
[`class NSPersistentStoreResult`](https://developer.apple.com/documentation/coredata/nspersistentstoreresult)
The abstract base class for results returned from a persistent store coordinator.
[`class NSPersistentStoreAsynchronousResult`](https://developer.apple.com/documentation/coredata/nspersistentstoreasynchronousresult)
A concrete class used to represent the results of an asynchronous request.
[`class NSSaveChangesRequest`](https://developer.apple.com/documentation/coredata/nssavechangesrequest)
An encapsulation of a collection of changes to be made by an object store in response to a save operation on a managed object context.
[`class NSAtomicStore`](https://developer.apple.com/documentation/coredata/nsatomicstore)
An abstract superclass that you subclass to create a Core Data atomic store.
[`class NSAtomicStoreCacheNode`](https://developer.apple.com/documentation/coredata/nsatomicstorecachenode)
A concrete class that you use to represent basic nodes in a Core Data atomic store.
[`class NSIncrementalStore`](https://developer.apple.com/documentation/coredata/nsincrementalstore)
An abstract superclass defining the API through which Core Data communicates with a store.
[`class NSIncrementalStoreNode`](https://developer.apple.com/documentation/coredata/nsincrementalstorenode)
A concrete class used to represent basic nodes in a Core Data incremental store.
## [See Also](https://developer.apple.com/documentation/coredata/core-data-stack#see-also)
### [Essentials](https://developer.apple.com/documentation/coredata/core-data-stack#Essentials)
[Creating a Core Data model](https://developer.apple.com/documentation/coredata/creating-a-core-data-model)
Define your app’s object structure with a data model file.
[Setting up a Core Data stack](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack)
Set up the classes that manage and persist your app’s objects.
[Handling Different Data Types in Core Data](https://developer.apple.com/documentation/coredata/handling-different-data-types-in-core-data)
Create, store, and present records for a variety of data types.
[Linking Data Between Two Core Data Stores](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores)
Organize data in two different stores and implement a link between them.
Current page is Core Data stack 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fcoredata%2Fcore-data-stack).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
