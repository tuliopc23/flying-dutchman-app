Source: https://developer.apple.com/documentation/CoreData/handling-different-data-types-in-core-data

[ Skip Navigation ](https://developer.apple.com/documentation/CoreData/handling-different-data-types-in-core-data#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/CoreData/handling-different-data-types-in-core-data#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/CoreData/handling-different-data-types-in-core-data)
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
[ Open Menu ](https://developer.apple.com/documentation/CoreData/handling-different-data-types-in-core-data)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/CoreData/handling-different-data-types-in-core-data)


[](https://developer.apple.com/documentation/CoreData/handling-different-data-types-in-core-data)
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
  * [ Handling Different Data Types in Core Data ](https://developer.apple.com/documentation/CoreData/handling-different-data-types-in-core-data)
  *     * Handling Different Data Types in Core Data 


Sample Code
# Handling Different Data Types in Core Data
Create, store, and present records for a variety of data types.
[ Download ](https://docs-assets.developer.apple.com/published/73ed48112035/HandlingDifferentDataTypesInCoreData.zip)
iOS 13.2+iPadOS 13.2+Mac Catalyst 13.0+Xcode 11.4+
## [Overview](https://developer.apple.com/documentation/CoreData/handling-different-data-types-in-core-data#Overview)
Many apps need to persist and present different kinds of information. Core Data provides different attributes, including those common for all databases, such as `Date` or `Decimal` type, and non-standard attributes handled with `Transformable` type. It also provides `Transient` and `Derived` attributes so apps can derive one piece of data from the other.
This sample shows how to handle all these data types, by creating and presenting a set of book records. After you launch it, this sample automatically generates the records if they don’t already exist, and shows them in a list. The records are grouped by their published month and can be searched with their canonical form of title.
### [Derive a Non-Persistent Value Using a Transient Attribute](https://developer.apple.com/documentation/CoreData/handling-different-data-types-in-core-data#Derive-a-Non-Persistent-Value-Using-a-Transient-Attribute)
A `Transient` attribute is derived from one or multiple stored attributes in the same entity. As its name implies, a `Transient` attribute isn’t persisted to the store, so an app can use it to provide a new attribute based on the stored ones, without consuming extra storage space.
To make an attribute `Transient`, select the Core Data model in Xcode Project Navigator, navigate to the Core Data entity, select the attribute in the attributes list, and check the `Transient` box in the Data Model Inspector.
In this sample, `publishMonthID` is a `Transient` attribute derived from `publishDate`. To implement the derivation, this sample provides a custom accessor for `publishDate` and `publishMonthID`. The `setter` method of `publishDate` nullifies `primitivePublishMonthID`, which allows the `getter` method of `publishMonthID` to recalculate the value based on the current `publishDate`.
```
@objc public var publishDate: Date? {
    get {
        willAccessValue(forKey: Name.publishDate)
        defer { didAccessValue(forKey: Name.publishDate) }
        return primitivePublishDate
    }
    set {
        willChangeValue(forKey: Name.publishDate)
        defer { didChangeValue(forKey: Name.publishDate) }
        primitivePublishDate = newValue
        primitivePublishMonthID = nil
    }
}

```

The `getter` method of `publishMonthID` recalculates the value if `primitivePublishMonthID` is nil.
```
@objc public var publishMonthID: String? {
    willAccessValue(forKey: Name.publishMonthID)
    defer { didAccessValue(forKey: Name.publishMonthID) }
    
    guard primitivePublishMonthID == nil, let date = primitivePublishDate else {
        return primitivePublishMonthID
    }
    let calendar = Calendar(identifier: .gregorian)
    let components = calendar.dateComponents([.year, .month], from: date)
    if let year = components.year, let month = components.month {
        primitivePublishMonthID = "\(year * 1000 + month)"
    }
    return primitivePublishMonthID
}

```

With these two methods, `publishMonthID` is associated with `publishDate` and always stays current.
In the case where `publishMonthID` is [`key-value observed`](https://developer.apple.com/documentation/Swift/using-key-value-observing-in-swift), the following code ensures that the observations are triggered when `publishDate` changes.
```
class func keyPathsForValuesAffectingPublishMonthID() -> Set<String> {
    return [Name.publishDate]
}

```

### [Derive One Value From Another Using a Derived Attribute](https://developer.apple.com/documentation/CoreData/handling-different-data-types-in-core-data#Derive-One-Value-From-Another-Using-a-Derived-Attribute)
This sample uses a `Derived` attribute, `canonicalTitle`, to support searching the canonical form of book titles. `canonicalTitle` is configured as the canonical form of `title` by setting the following expression as the value of the `Derivation` field shown Xcode’s Data Model Inspector.
```
canonical:(title)

```

`Derived` attributes are used in cases where performance is more critical than storage space. In this sample, the app gets the same result by setting up a predicate with `CONTAINS[cd]` ( where `cd` means case- and diacritic-insensitive ) to search `title` directly. By searching `canonicalTitle` which is persisted, the app performs more quickly because it doesn’t need to do diacritic-insensitive comparison for every book title.
`Derived` attributes are only updated when the user saves the managed context. Concretely, `canonicalTitle` won’t change if the sample app changes the `title` attribute without saving it.
### [Configure and Implement a Non-Standard Data Type](https://developer.apple.com/documentation/CoreData/handling-different-data-types-in-core-data#Configure-and-Implement-a-Non-Standard-Data-Type)
`Transformable` attributes store objects with a non-standard type, or a type that isn’t in the attribute type list in Xcode’s Data Model Inspector. To implement a `Transformable` attribute, configure it by setting its type to `Transformable` and specifying the transformer and custom class name in Data Model Inspector, then register a transformer with code before an app loads its Core Data stack.
```
// Register the transformer at the very beginning.
// .colorToDataTransformer is a name defined with an NSValueTransformerName extension.
ValueTransformer.setValueTransformer(ColorToDataTransformer(), forName: .colorToDataTransformer)

```

Core Data requires the transformer be `NSSecureUnarchiveFromData` or its subclass, and that its `transformedValue(_:)` method converts a `Data` object to an instance of the custom class specified in Data Model Inspector and that `reverseTransformedValue(_:)` does the opposite – converts an instance of the custom class to a `Data` object.
### [Store and Present a Date Type](https://developer.apple.com/documentation/CoreData/handling-different-data-types-in-core-data#Store-and-Present-a-Date-Type)
In a Core Data store, a `Date` attribute is a `double` value that represents a number of seconds since 1970. Using a variety of calendars, time zones, and locales, an app can convert a `Date` value to different date strings, or convert a date string to different `Date` values. When parsing a date string, configure the `DateFormatter` with the right calendar, time zone, and locale. Typically, if the string is generated by the current user, the user-perceived calendar, time zone, and locale will be the current system ones, so an app can use a default `DateFormatter` instance. In other cases, configure `DateFormatter` in the same way the app generated the string.
### [Store and Present a Decimal Type](https://developer.apple.com/documentation/CoreData/handling-different-data-types-in-core-data#Store-and-Present-a-Decimal-Type)
This sample uses a `Decimal` attribute to represent the book price, which is then mapped to a variable of `NSDecimalNumber` type. `NSDecimalNumber` has a convenient method to process a currency value.
```
newBook.price = NSDecimalNumber(mantissa: value, exponent: -2, isNegative: false)

```

`NSDecimalNumber` also provides a convenient way to present a value with locale in mind.
```
cell.price.text = book.price?.description(withLocale: Locale.current)

```

## [See Also](https://developer.apple.com/documentation/CoreData/handling-different-data-types-in-core-data#see-also)
### [Essentials](https://developer.apple.com/documentation/CoreData/handling-different-data-types-in-core-data#Essentials)
[Creating a Core Data model](https://developer.apple.com/documentation/coredata/creating-a-core-data-model)
Define your app’s object structure with a data model file.
[Setting up a Core Data stack](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack)
Set up the classes that manage and persist your app’s objects.
[API Reference Core Data stack](https://developer.apple.com/documentation/coredata/core-data-stack)
Manage and persist your app’s model layer.
[Linking Data Between Two Core Data Stores](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores)
Organize data in two different stores and implement a link between them.
Current page is Handling Different Data Types in Core Data 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FCoreData%2Fhandling-different-data-types-in-core-data).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
