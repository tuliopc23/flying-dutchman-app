Source: https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences

[ Skip Navigation ](https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences)
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
[ Open Menu ](https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences)
## [ App Intents  ](https://developer.apple.com/documentation/appintents)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 63 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 63 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 63 symbols inside <root> [App Intents updates](https://developer.apple.com/documentation/updates/appintents)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 63 symbols inside <root> [Making actions and content discoverable and widely available](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 63 symbols inside <root> [Creating your first app intent](https://developer.apple.com/documentation/appintents/creating-your-first-app-intent)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 63 symbols inside <root> [Adopting App Intents to support system experiences](https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 63 symbols inside <root> [Accelerating app interactions with App Intents](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 63 symbols inside <root>
Siri and Apple Intelligence
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 63 symbols inside <root> [Integrating actions with Siri and Apple Intelligence](https://developer.apple.com/documentation/appintents/integrating-actions-with-siri-and-apple-intelligence)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
9 of 63 symbols inside <root> containing 2 symbols[Making onscreen content available to Siri and Apple Intelligence](https://developer.apple.com/documentation/appintents/making-onscreen-content-available-to-siri-and-apple-intelligence)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
10 of 63 symbols inside <root> containing 69 symbols[App intent domains](https://developer.apple.com/documentation/appintents/app-intent-domains)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
11 of 63 symbols inside <root> [Making your app’s functionality available to Siri](https://developer.apple.com/documentation/appintents/making-your-app-s-functionality-available-to-siri)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 63 symbols inside <root>
Visual intelligence
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
13 of 63 symbols inside <root> [Integrating your app with visual intelligence](https://developer.apple.com/documentation/visualintelligence/integrating-your-app-with-visual-intelligence)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
14 of 63 symbols inside <root> [Visual Intelligence](https://developer.apple.com/documentation/visualintelligence)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
15 of 63 symbols inside <root> containing 8 symbols[IntentValueQuery](https://developer.apple.com/documentation/appintents/intentvaluequery)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
16 of 63 symbols inside <root>
Interactive Snippets
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
17 of 63 symbols inside <root> [Displaying static and interactive snippets](https://developer.apple.com/documentation/appintents/displaying-static-and-interactive-snippets)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
18 of 63 symbols inside <root> containing 4 symbols[SnippetIntent](https://developer.apple.com/documentation/appintents/snippetintent)
63 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ App Intents ](https://developer.apple.com/documentation/appintents)
  * [ Adopting App Intents to support system experiences ](https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences)
  *     * Adopting App Intents to support system experiences 


Sample Code
# Adopting App Intents to support system experiences
Create app intents and entities to incorporate system experiences such as Spotlight, visual intelligence, and Shortcuts.
[ Download ](https://docs-assets.developer.apple.com/published/ea2226a454ce/AdoptingAppIntentsToSupportSystemExperiences.zip)
iOS 26.0+iPadOS 26.0+macOS 26.0+Xcode 26.0+
## [Overview](https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences#Overview)
The app in this sample offers actions in the Shortcuts app that people can use to create custom shortcuts. It includes an App Shortcut to find the closest landmark and find tickets to visit the landmark, all without opening the app. Additionally, the app makes its data available to system experiences like Spotlight, Siri and Apple Intelligence, and visual intelligence.
By adopting the App Intents framework, the app provides functionality across the system, enabling people to:
  * In Shortcuts, find and run the app’s app intents.
  * In Shortcuts, create custom shortcuts or view the provided “Find Closest” App Shortcut.
  * In Shortcuts, place custom shortcuts or the App Shortcut on the Home Screen as a bookmark.
  * In Spotlight, search for a landmark or the “Find Closest” App Shortcut.
  * With visual intelligence, circle an object in the visual intelligence camera or onscreen and view matching results from the app.
  * With the Action button, trigger a custom shortcut or the App Shortcut.
  * From Siri suggestions, use custom shortcuts or the App Shortcut.
  * In the app, view information about a landmark, then ask Siri something like “What’s a summary of the history of this place?” or similar to receive a content summary, and more.


### [Describe actions as app intents and entities](https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences#Describe-actions-as-app-intents-and-entities)
The app contains many actions and makes them available to the system as app intents, so people can use them to create custom shortcuts and invoke across system experiences. For example, the app offers key actions like finding the closest landmark or opening a landmark in the app. This app intent opens a landmark in the app:
```
import AppIntents


struct OpenLandmarkIntent: OpenIntent {
    static let title: LocalizedStringResource = "Open Landmark"


    @Parameter(title: "Landmark", requestValueDialog: "Which landmark?")
    var target: LandmarkEntity


    func perform() async throws -> some IntentResult {
        return .result()
    }
}

```

To use your data as input and output of app intents and make the data available to the system, you use app entities. App entities often limit the information a model object you persist to storage to what the system needs. They also add required information to understand the data or to use it in system experiences. For example, the `LandmarkEntity` of the sample app provides required `typeDisplayRepresentation` and `displayRepresentation` properties but doesn’t include every property of the `Landmark` model object:
```
struct LandmarkEntity: IndexedEntity {
    static var typeDisplayRepresentation: TypeDisplayRepresentation {
        return TypeDisplayRepresentation(
            name: LocalizedStringResource("Landmark", table: "AppIntents", comment: "The type name for the landmark entity"),
            numericFormat: "\(placeholder: .int) landmarks"
        )
    }


    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(
            title: "\(name)",
            subtitle: "\(continent)",
            image: .init(data: try! self.thumbnailRepresentationData)
        )
    }


    static let defaultQuery = LandmarkEntityQuery()


    var id: Int { landmark.id }


    @ComputedProperty(indexingKey: \.displayName)
    var name: String { landmark.name }


    // Maps the description variable to the Spotlight indexing key `contentDescription`.
    @ComputedProperty(indexingKey: \.contentDescription)
    var description: String { landmark.description }


    @ComputedProperty
    var continent: String { landmark.continent }


    @DeferredProperty
    var crowdStatus: Int {
        get async throws { // swiftlint:disable:this implicit_getter
            await modelData.getCrowdStatus(self)
        }
    }


    var landmark: Landmark
    var modelData: ModelData


    init(landmark: Landmark, modelData: ModelData) {
        self.modelData = modelData
        self.landmark = landmark
    }
}

```

For more information about describing actions as app intents and app entities, refer to [Making actions and content discoverable and widely available](https://developer.apple.com/documentation/AppIntents/Making-actions-and-content-discoverable-and-widely-available) and [Creating your first app intent](https://developer.apple.com/documentation/AppIntents/Creating-your-first-app-intent).
### [Offer interactive snippets](https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences#Offer-interactive-snippets)
The app’s “Find Closest” App Shortcut performs an app intent that finds the closest nearby landmark without opening the app, and allows people to find tickets to visit it. Instead of taking them to the app, the app intent displays interactive snippets that appear as overlays at the top of the screen. To display the interactive snippet, the app’s `ClosestLandmarkIntent` returns a [`SnippetIntent`](https://developer.apple.com/documentation/AppIntents/SnippetIntent) that presents the interactive snippet in its `perform()` method:
```
import AppIntents
import SwiftUI


struct ClosestLandmarkIntent: AppIntent {
    static let title: LocalizedStringResource = "Find Closest Landmark"


    @Dependency var modelData: ModelData


    func perform() async throws -> some ReturnsValue<LandmarkEntity> & ShowsSnippetIntent & ProvidesDialog {
        let landmark = await self.findClosestLandmark()


        return .result(
            value: landmark,
            dialog: IntentDialog(
                full: "The closest landmark is \(landmark.name).",
                supporting: "\(landmark.name) is located in \(landmark.continent)."
            ),
            snippetIntent: LandmarkSnippetIntent(landmark: landmark)
        )
    }
}

```

For more information about displaying interactive snippets, refer to [Displaying static and interactive snippets](https://developer.apple.com/documentation/AppIntents/displaying-static-and-interactive-snippets).
### [Make your entity available to Siri and Apple Intelligence](https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences#Make-your-entity-available-to-Siri-and-Apple-Intelligence)
To allow Siri to access the landmark information that’s visible onscreen in the app, its `LandmarkEntity` implements the [`Transferable`](https://developer.apple.com/documentation/CoreTransferable/Transferable) protocol and provides plain-text, image, and PDF representations that Siri can understand and forward to other services, including third-party services:
```
extension LandmarkEntity: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        FileRepresentation(exportedContentType: .pdf) { @MainActor landmark in
            let url = URL.documentsDirectory.appending(path: "\(landmark.name).pdf")


            let renderer = ImageRenderer(content: VStack {
                Image(landmark.landmark.backgroundImageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(landmark.name)
                Text("Continent: \(landmark.continent)")
                Text(landmark.description)
            }.frame(width: 600))


            renderer.render { size, renderer in
                var box = CGRect(x: 0, y: 0, width: size.width, height: size.height)


                guard let pdf = CGContext(url as CFURL, mediaBox: &box, nil) else {
                    return
                }
                pdf.beginPDFPage(nil)
                renderer(pdf)
                pdf.endPDFPage()
                pdf.closePDF()
            }


            return .init(url)
        }


        DataRepresentation(exportedContentType: .image) {
            try $0.imageRepresentationData
        }


        DataRepresentation(exportedContentType: .plainText) {
            """
            Landmark: \($0.name)
            Description: \($0.description)
            """.data(using: .utf8)!
        }
    }
}

```

When the landmark becomes visible onscreen, the app uses the user activity annotation API to give the system access to the data:
```
HStack(alignment: .bottom) {
    Text(landmark.name)
        .font(.title)
        .fontWeight(.bold)
        .userActivity(
            "com.landmarks.ViewingLandmark"
        ) {
            $0.title = "Viewing \(landmark.name)"
            $0.appEntityIdentifier = EntityIdentifier(for: try! modelData.landmarkEntity(id: landmark.id))
        }
}

```

For more information about making onscreen content available to Siri and Apple Intelligence, refer to [Making onscreen content available to Siri and Apple Intelligence](https://developer.apple.com/documentation/AppIntents/Making-onscreen-content-available-to-siri-and-apple-intelligence).
### [Add entities to the Spotlight index](https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences#Add-entities-to-the-Spotlight-index)
The app describes its data as app entities, so the system can use it when it performs app intents. Additionally, the app donates the entities into the semantic search index, making it possible to find the app entities in Spotlight. The following example shows how the app’s `LandmarkEntity` conforms to [`IndexedEntity`](https://developer.apple.com/documentation/AppIntents/IndexedEntity) and uses Swift macros to add the indexing keys that Spotlight needs.
```
struct LandmarkEntity: IndexedEntity {
    // ...


    // Maps the description to the Spotlight indexing key `contentDescription`.
    @ComputedProperty(indexingKey: \.contentDescription)
    var description: String { landmark.description }


    @ComputedProperty
    var continent: String { landmark.continent }


    // ...
}

```

In a utility function, the app donates the landmark entities to the Spotlight index:
```
static func donateLandmarks(modelData: ModelData) async throws {
    let landmarkEntities = await modelData.landmarkEntities
    try await CSSearchableIndex.default().indexAppEntities(landmarkEntities)
}

```

For more information, refer to [Making app entities available in Spotlight](https://developer.apple.com/documentation/AppIntents/making-app-entities-available-in-spotlight).
### [Integrate search results with visual intelligence](https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences#Integrate-search-results-with-visual-intelligence)
With visual intelligence, people circle items onscreen or in visual intelligence camera to search for matching results across apps that support visual intelligence. To support visual intelligence search, the sample app implements an [`IntentValueQuery`](https://developer.apple.com/documentation/AppIntents/IntentValueQuery) to find matching landmarks:
```
@UnionValue
enum VisualSearchResult {
    case landmark(LandmarkEntity)
    case collection(CollectionEntity)
}


struct LandmarkIntentValueQuery: IntentValueQuery {


    @Dependency var modelData: ModelData


    func values(for input: SemanticContentDescriptor) async throws -> [VisualSearchResult] {


        guard let pixelBuffer: CVReadOnlyPixelBuffer = input.pixelBuffer else {
            return []
        }


        let landmarks = try await modelData.search(matching: pixelBuffer)


        return landmarks
    }
}


extension ModelData {
    /**
     This method contains the search functionality that takes the pixel buffer that visual intelligence provides
     and uses it to find matching app entities. To keep this example app easy to understand, this function always
     returns the same landmark entity.
    */
    func search(matching pixels: CVReadOnlyPixelBuffer) throws -> [VisualSearchResult] {
        let landmarks = landmarkEntities.filter {
            $0.id != 1005
        }.map {
            VisualSearchResult.landmark($0)
        }.shuffled()


        let collections = userCollections
            .filter {
                $0.landmarks.contains(where: { $0.id == 1005 })
            }
            .map {
                CollectionEntity(collection: $0, modelData: self)
            }
            .map {
                VisualSearchResult.collection($0)
            }


        return [try! .landmark(landmarkEntity(id: 1005))]
            + collections
            + landmarks
    }
}

```

For more information about integrating your app with visual intelligence, refer to [Visual Intelligence](https://developer.apple.com/documentation/VisualIntelligence).
## [See Also](https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences#see-also)
### [Essentials](https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences#Essentials)
[App Intents updates](https://developer.apple.com/documentation/Updates/AppIntents)
Learn about important changes in App Intents.
[Making actions and content discoverable and widely available](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available)
Adopt App Intents to make your app discoverable with Spotlight, controls, widgets, and the Action button.
[Creating your first app intent](https://developer.apple.com/documentation/appintents/creating-your-first-app-intent)
Create your first app intent that makes your app available in system experiences like Spotlight or the Shortcuts app.
[Accelerating app interactions with App Intents](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents)
Enable people to use your app’s features quickly through Siri, Spotlight, and Shortcuts.
Current page is Adopting App Intents to support system experiences 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fappintents%2Fadopting-app-intents-to-support-system-experiences).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
