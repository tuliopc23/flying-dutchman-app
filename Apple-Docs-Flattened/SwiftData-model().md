Source: https://developer.apple.com/documentation/SwiftData/Model()

[ Skip Navigation ](https://developer.apple.com/documentation/SwiftData/Model\(\)#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/SwiftData/Model\(\)#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/SwiftData/Model\(\))
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
[ Open Menu ](https://developer.apple.com/documentation/SwiftData/Model\(\))
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/SwiftData/Model\(\))
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
  * [ Model() ](https://developer.apple.com/documentation/SwiftData/Model\(\))
  *     * Model() 


Macro
# Model()
Converts a Swift class into a stored model that’s managed by SwiftData.
iOS 17.0+iPadOS 17.0+Mac Catalyst 17.0+macOS 14.0+tvOS 17.0+visionOS 1.0+watchOS 10.0+Swift 5.9+
```
@attached(member, conformances: [Observable](https://developer.apple.com/documentation/Observation/Observable), [PersistentModel](https://developer.apple.com/documentation/swiftdata/persistentmodel), [Sendable](https://developer.apple.com/documentation/Swift/Sendable), names: named(_$backingData), named(persistentBackingData), named(schemaMetadata), named(init), named(_$observationRegistrar), named(_SwiftDataNoType), named(access), named(withMutation)) @attached(memberAttribute) @attached(extension, conformances: [Observable](https://developer.apple.com/documentation/Observation/Observable), [PersistentModel](https://developer.apple.com/documentation/swiftdata/persistentmodel), [Sendable](https://developer.apple.com/documentation/Swift/Sendable)) macro Model()
```

## [ Mentioned in ](https://developer.apple.com/documentation/SwiftData/Model\(\)#mentions)
[](https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches)
## [Overview](https://developer.apple.com/documentation/SwiftData/Model\(\)#overview)
Annotate your model classes with the `@Model` macro to make them persistable. At build time, the macro expands to provide conformance to the [`PersistentModel`](https://developer.apple.com/documentation/swiftdata/persistentmodel) and [`Observable`](https://developer.apple.com/documentation/Observation/Observable) protocols.
```
@Model
class RemoteImage {
    var sourceURL: URL
    var data: Data
    
    init(sourceURL: URL, data: Data = Data()) {
        self.sourceURL = sourceURL
        self.data = data
    }
}

```

For more information about defining models, see [Preserving your app’s model data across launches](https://developer.apple.com/documentation/swiftdata/preserving-your-apps-model-data-across-launches).
## [See Also](https://developer.apple.com/documentation/SwiftData/Model\(\)#see-also)
### [Model definition](https://developer.apple.com/documentation/SwiftData/Model\(\)#Model-definition)
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
Current page is Model() 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FSwiftData%2FModel\(\)).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
