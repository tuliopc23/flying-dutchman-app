Source: https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents

[ Skip Navigation ](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents)
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
[ Open Menu ](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents)
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
  * [ Accelerating app interactions with App Intents ](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents)
  *     * Accelerating app interactions with App Intents 


Sample Code
# Accelerating app interactions with App Intents
Enable people to use your app’s features quickly through Siri, Spotlight, and Shortcuts.
[ Download ](https://docs-assets.developer.apple.com/published/069aab226592/AcceleratingAppInteractionsWithAppIntents.zip)
iOS 18.1+iPadOS 18.1+macOS 15.1+visionOS 2.1+watchOS 11.0+Xcode 26.0+
## [Overview](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents#Overview)
The app in this sample code project provides information on trails, allowing people to check on conditions, search for trails that allow activities like skiing, and record which trails they visit. Expressing these features as intents allows people to use them through Siri, Spotlight search, and Shortcuts. Additionally, the project integrates workout tracking on Apple Watch, and shows how to implement Action button support on Apple Watch Ultra. The intents also appear as actions in the Shortcuts app. People can combine these actions to build entirely new features in Shortcuts because the intents provide custom data types that match each other’s inputs.
### [Identify common actions](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents#Identify-common-actions)
The sample app includes two key features that people are likely to use frequently: looking up information on a trail, and recording activity on a trail. To make it easy for people to use these features without even opening the app, the sample code creates intents for them to use with Siri, Spotlight search, and Shortcuts. For example, if someone saves their favorite trails in the app and wants to get the current conditions for those trails, the app implements the `OpenFavorites` structure, which conforms to [`AppIntent`](https://developer.apple.com/documentation/AppIntents/AppIntent). When someone runs this intent, the app opens and navigates to the Favorites view.
```
/// Each intent needs to include metadata, such as a localized title. The title of the intent displays throughout the system.
static let title: LocalizedStringResource = "Open Favorite Trails"


/// An intent can optionally provide a localized description that the Shortcuts app displays.
static let description = IntentDescription("Opens the app and goes to your favorite trails.")


/// Tell the system to bring the app to the foreground when the intent runs.
static let openAppWhenRun: Bool = true


/**
 When the system runs the intent, it calls `perform()`.
 
 Intents run on an arbitrary queue. Intents that manipulate UI need to annotate `perform()` with `@MainActor`
 so that the UI operations run on the main actor.
 */
@MainActor
func perform() async throws -> some IntentResult {
    navigationModel.selectedCollection = trailManager.favoritesCollection
    
    /// Return an empty result, indicating that the intent is complete.
    return .result()
}

```

### [Create App Shortcuts](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents#Create-App-Shortcuts)
People may ask Siri to show their favorite trails, or they may find this suggested action through a Spotlight search. To support both of these options, the app implements an [`AppShortcut`](https://developer.apple.com/documentation/AppIntents/AppShortcut) using `OpenFavorites`. An App Shortcut combines an intent with phrases people may use with Siri to perform the action, and additional metadata, such as an icon, and then uses this information in a Spotlight search. People can invoke the App Shortcut with a suggested phrase, or other similiar words, because the system uses a semantic similarity index to help identify people’s requests — automatically matching phrases that are similar, but not identical.
```
AppShortcut(intent: OpenFavorites(), phrases: [
    "Open Favorites in \(.applicationName)",
    "Show my favorite \(.applicationName)"
],
shortTitle: "Open Favorites",
systemImageName: "star.circle")

```

To register the App Shortcut with the system, the app calls [`updateAppShortcutParameters`](https://developer.apple.com/documentation/AppIntents/AppShortcutsProvider/updateAppShortcutParameters\(\)) on its [`AppShortcutsProvider`](https://developer.apple.com/documentation/AppIntents/AppShortcutsProvider) during the [`init`](https://developer.apple.com/documentation/SwiftUI/App/init\(\)) of the [`App`](https://developer.apple.com/documentation/SwiftUI/App) structure.
To aid the system’s presentation of the App Shortcut, the sample app includes a short title and an SF Symbols name that represent the App Shortcut. Further, the sample app’s `Info.plist` file declares `NSAppIconActionTintColorName` with the app’s primary color and two contrasting colors in an array for the `NSAppIconComplementingColorNames` key. The system uses these colors when displaying the App Shortcuts, such as in Spotlight or the Shortcuts app. The specified values of the color names for these keys come from the app’s asset catalog.
After registering an App Shortcut with the system, people can begin using the intent through Siri without any further configuration. To teach people a phrase to use the intent, the app provides a [`SiriTipView`](https://developer.apple.com/documentation/AppIntents/SiriTipView) in the associated view.
```
SiriTipView(intent: OpenFavorites(), isVisible: $displaySiriTip)

```

The `SiriTipView` takes a binding to a visibility Boolean so that the app hides the view if an individual chooses to dismiss it.
Aside from intents for people to quickly view their favorite trails and track their workouts, the sample app provides extensive search capabilities through intents. The app doesn’t provide App Shortcuts for intents that people use less commonly. Best practice is to provide App Shortcuts for only the most common actions in an app — usually between two and five intents, and not more than ten.
### [Design custom responses](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents#Design-custom-responses)
Even though the app doesn’t provide `GetTrailInfo` as an App Shortcut, people may still interact with it through Siri, such as including the intent in a shortcut they create in the Shortcuts app. For a good user experience, this intent provides its result with a visual response using a custom UI snippet, and as a dialog for Siri to communicate the same information. It does so by conforming the return type of the intent’s [`perform`](https://developer.apple.com/documentation/AppIntents/AppIntent/perform\(\)) function to both [`ProvidesDialog`](https://developer.apple.com/documentation/AppIntents/ProvidesDialog) and [`ShowsSnippetView`](https://developer.apple.com/documentation/AppIntents/ShowsSnippetView).
```
func perform() async throws -> some IntentResult & ReturnsValue<TrailEntity> & ProvidesDialog & ShowsSnippetView {

```

The app provides both visual experiences and voice-only experiences because people may be in a context where they can’t see information in a custom UI (such as when the intent runs on HomePod), or when displaying the custom UI may be inappropriate (such as when the intent runs through CarPlay). This implementation provides a custom UI with a shorter supporting dialog to use when the custom UI is visible, and a different dialog containing additional information if the system can’t show the snippet. The sample uses a transparent background for the custom UI because the system displays it over a translucent background material. Avoiding opaque backgrounds provides the best results.
```
let snippet = TrailInfoView(trail: trailData, includeConditions: true)


/**
 This intent displays a custom view that includes the trail conditions as part of the view. The dialog includes the trail conditions when
 the system can only read the response, but not display it. When the system can display the response, the dialog omits the trail
 conditions.
 */
let dialog = IntentDialog(full: "The latest reported conditions for \(trail.name) indicate: \(trail.currentConditions).",
                          supporting: "Here's the latest information on trail conditions.")


return .result(value: trail, dialog: dialog, view: snippet)

```

This sample app provides custom dialog throughout its intents. `SuggestTrails` validates the parameters that people provide and uses the custom dialog to prompt them for additional information. For example, if the provided location parameter isn’t specific enough, the intent prompts the individual to choose from a list of locations related to their input. The app does this by throwing [`needsDisambiguationError`](https://developer.apple.com/documentation/AppIntents/IntentParameter/needsDisambiguationError\(among:dialog:\)) with a value for the dialog parameter.
```
let dialog = IntentDialog("Multiple locations match \(location). Did you mean one of these locations?")
let disambiguationList = suggestedMatches.sorted(using: KeyPathComparator(\.self, comparator: .localizedStandard))
throw $location.needsDisambiguationError(among: disambiguationList, dialog: dialog)

```

### [Add parameters to an intent](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents#Add-parameters-to-an-intent)
An app intent can optionally require certain parameters to complete its action. For example, the `GetTrailInfo` intent declares a `trail` parameter by decorating the property with the [`IntentParameter`](https://developer.apple.com/documentation/AppIntents/IntentParameter) property wrapper.
```
@Parameter(title: "Trail", description: "The trail to get information for.")
var trail: TrailEntity

```

The system supports parameters using common Foundation types, such as [`String`](https://developer.apple.com/documentation/Swift/String), and those for custom data types in an app. The app makes its trail data available in an app intent through the `TrailEntity` type, which is a structure conforming to the [`AppEntity`](https://developer.apple.com/documentation/AppIntents/AppEntity) protocol.
To allow the system to query the app for `TrailEntity` data, the entity implements the [`Identifiable`](https://developer.apple.com/documentation/Swift/Identifiable) protocol with values that are stable and persistent. `TrailEntity` declares [`defaultQuery`](https://developer.apple.com/documentation/AppIntents/AppEntity/defaultQuery-4khg7), which the system uses to perform queries to receive `TrailEntity` structures.
```
static let defaultQuery = TrailEntityQuery()

```

An `AppEntity` makes its properties available to the system by decorating it with the [`EntityProperty`](https://developer.apple.com/documentation/AppIntents/EntityProperty) property wrapper.
```
/**
 The trail's name. The `EntityProperty` property wrapper makes this property's data available to the system as part of the intent,
 such as when an intent returns a trail in a shortcut.
 
 The system automatically generates the title for this property from the variable name when it displays it in a system UI, like Shortcuts.
 Generated titles are available for both `EntityProperty` and `IntentIntentParameter` property wrappers.
 */
@Property var name: String


/**
 A description of the trail's location, such as a nearby city name, or the national park encompassing it.
 
 If you want the displayed title for the property to be different from the variable name, use a `title` parameter with the
 `EntityProperty` property wrapper.
 */
@Property(title: "Region")
var regionDescription: String



```

### [Provide the app’s data through queries](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents#Provide-the-apps-data-through-queries)
The system queries the app for its trail data through `TrailEntityQuery`, a type conforming to [`EntityQuery`](https://developer.apple.com/documentation/AppIntents/EntityQuery). For example, if someone saves a specific value as the `trail` parameter for `GetTrailInfo`, the system locates the `TrailEntity` by using the `defaultQuery` and requesting the entity by its ID from the `Identifable` protocol. All types conforming to `EntityQuery` need to implement this method.
```
func entities(for identifiers: [TrailEntity.ID]) async throws -> [TrailEntity] {
    Logger.entityQueryLogging.debug("[TrailEntityQuery] Query for IDs \(identifiers)")
    
    return trailManager.trails(with: identifiers)
            .map { TrailEntity(trail: $0) }
}

```

The app also provides a list of common trail suggestions by implementing the optional [`suggestedEntities`](https://developer.apple.com/documentation/AppIntents/EntityQuery/suggestedEntities\(\)) function.
```
func suggestedEntities() async throws -> [TrailEntity] {
    Logger.entityQueryLogging.debug("[TrailEntityQuery] Request for suggested entities")
    
    return trailManager.trails(with: trailManager.favoritesCollection.members)
            .map { TrailEntity(trail: $0) }
}

```

There are several subprotocols to `EntityQuery`, each of which enables different types of functionality. The sample app implements all of them for demonstration purposes, but a real app can use only the ones that meet its needs.
The app implements [`EntityStringQuery`](https://developer.apple.com/documentation/AppIntents/EntityStringQuery) to help people configure `GetTrailInfo`. When people configure this intent in the Shortcuts app, they first see the list of trails from `suggestedEntities`. The Shortcuts app provides a search field, enabling people to search for results that appear in the list of suggested trails. The app provides results for the search term by implementing [`entities(matching:)`](https://developer.apple.com/documentation/AppIntents/EntityStringQuery/entities\(matching:\)).
```
func entities(matching string: String) async throws -> [TrailEntity] {
    Logger.entityQueryLogging.debug("[TrailEntityQuery] String query for term \(string)")
    
    return trailManager.trails { trail in
        trail.name.localizedCaseInsensitiveContains(string)
    }.map { TrailEntity(trail: $0) }
}

```

### [Enable Find intents](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents#Enable-Find-intents)
Apps implementing either the [`EnumerableEntityQuery`](https://developer.apple.com/documentation/AppIntents/EnumerableEntityQuery) or the [`EntityPropertyQuery`](https://developer.apple.com/documentation/AppIntents/EntityPropertyQuery) protocol automatically add a Find intent in the Shortcuts app. These intents enable people to build powerful new features for themselves in Shortcuts, powered by the app’s data — without requiring the app to implement that feature itself. For example, the sample app focuses its UI on providing trail information, but people can also use its data to plan activities for a vacation. The app doesn’t need to build vacation-planning features because it implements these entity query protocols to provide an interface to the data through a Shortcut.
The sample app groups trails into collections based on geographic region, and implements the collections as a type called `TrailCollection` that conforms to `AppEntity`. The list of geographic regions is small, and a `TrailCollection` is a simple structure with the collection name and a list of trail IDs that require little memory. To make this information available through a Find intent, the app implements `FeaturedCollectionEntityQuery` with conformance to `EnumerableEntityQuery`. The app uses `EnumerableEntityQuery` here because the data for the featured trail collections is a small and fixed set of values, and doesn’t require a large amount of memory. The app implements [`allEntities`](https://developer.apple.com/documentation/AppIntents/EnumerableEntityQuery/allEntities\(\)) to return all of the values, which people can filter by name in the Shortcuts app.
```
func allEntities() async throws -> [TrailCollection] {
    Logger.entityQueryLogging.debug("[FeaturedCollectionEntityQuery] Request for all entities")
    return trailManager.featuredTrailCollections
}

```

The app also implements `EntityPropertyQuery` for `TrailEntity`. This query type is ideal for large data sets that may have large numbers of entities, or entities that have higher memory consumption. Implementing this query adds a Find intent to the Shortcuts app, enabling people to run predicate searches on entity properties. For example, someone planning a vacation around seeing waterfalls that are easily accessible can configure the Find intent with criteria for trails containing _fall_ in the trail name, and a trail distance of less than 1 kilometer. An implementation of `EntityPropertyQuery` includes several required functions and properties. `TrailEntityQuery+PropertyQuery.swift` contains the complete implementation.
Designing great intents for integration with the system means that the intents work as standalone intents with their parameters, and also work with other intents the app provides, or with other apps that may be installed. People can create shortcuts that use the output of one intent the app provides and use it as input to another intent the app provides, like the following examples:
  * `SuggestTrails` can use the output of the Find intent for trail collections as input.
  * The Find intent for trails can use the output of `SuggestTrails` to further refine the results.
  * The Find intent for trails can also work alone, searching for matching trail properties from all of the trail data the app provides.


### [Contribute entities to Spotlight](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents#Contribute-entities-to-Spotlight)
The sample app provides its trail data to Spotlight when the app first runs. The app declares a `Trail` structure for this data, containing the app’s internal representation of that data. The app maps its data from the structure to searchable attributes in a [`CSSearchableItemAttributeSet`](https://developer.apple.com/documentation/CoreSpotlight/CSSearchableItemAttributeSet).
```
var searchableAttributes: CSSearchableItemAttributeSet {
    let attributes = CSSearchableItemAttributeSet()
    
    attributes.title = name
    attributes.namedLocation = regionDescription
    attributes.keywords = activities.localizedElements
    
    attributes.latitude = NSNumber(value: coordinate.latitude)
    attributes.longitude = NSNumber(value: coordinate.longitude)
    attributes.supportsNavigation = true
    
    return attributes
}

```

The app also declares a `TrailEntity` structure to make the trail data available to the rest of the system as part of its App Intents integration. To integrate `TrailEntity` with Spotlight, `TrailEntity` conforms to [`IndexedEntity`](https://developer.apple.com/documentation/AppIntents/IndexedEntity). The app associates the searchable attributes from the `Trail` structure with the `TrailEntity` by calling [`associateAppEntity(_:priority:)`](https://developer.apple.com/documentation/CoreSpotlight/CSSearchableItem/associateAppEntity\(_:priority:\)) before contributing the data to the Spotlight index.
```
// Create an array of the searchable information for each `Trail`.
let searchableItems = trails.map { trail in
    let item = CSSearchableItem(uniqueIdentifier: String(trail.id),
                                domainIdentifier: nil,
                                attributeSet: trail.searchableAttributes)
    
    let isFavorite = favoritesCollection.members.contains(trail.id)
    let weight = isFavorite ? 10 : 1
    let intent = TrailEntity(trail: trail)
    
    /**
     Associate `TrailEntity` with the data that the `Trail` structure provides so the system recognizes that
     both types represent the same data. You need to create this association before adding the `CSSearchableItem`
     to a `CSSearchableIndex`.
     */
    item.associateAppEntity(intent, priority: weight)
    return item
}


do {
    // Add the trails to the search index so people can find them through Spotlight.
    // You need to do this as part of the app's initial setup on launch.
    let index = CSSearchableIndex.default()
    try await index.indexSearchableItems(searchableItems)
    Logger.spotlightLogging.info("[Spotlight] Trails indexed by Spotlight")
} catch let error {
    Logger.spotlightLogging.error("[Spotlight] Trails were not indexed by Spotlight. Reason: \(error.localizedDescription)")
}

```

### [Integrate universal links](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents#Integrate-universal-links)
The sample app offers an `OpenTrail` intent so that people can open the app to a specific trail’s information from a shortcut. Rather than adding code to configure the app’s UI for displaying a trail’s information just for this intent, the app uses the same URL scheme it uses to implement universal links. The app declares the URL for a trail’s details through conformance to [`URLRepresentableEntity`](https://developer.apple.com/documentation/AppIntents/URLRepresentableEntity).
```
extension TrailEntity: URLRepresentableEntity {
    static var urlRepresentation: URLRepresentation {
        // Use string interpolation to fill values from your entity necessary for constructing the universal link URL.
        // This example URL uses the unique and persistant identifier for the `TrailEntity` in the URL.
        "https://example.com/trail/\(.id)/details"
    }
}

```

To leverage the app’s existing code for handling a universal link, the app conforms the `OpenTrail` intent to both [`OpenIntent`](https://developer.apple.com/documentation/AppIntents/OpenIntent) and [`URLRepresentableIntent`](https://developer.apple.com/documentation/AppIntents/URLRepresentableIntent). These conformances allow the app to skip implementing a `perform()` method on `OpenTrail`. When the intent runs, the system automatically passes the URL to the app using the standard mechanisms required for handling universal links.
## [See Also](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents#see-also)
### [Essentials](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents#Essentials)
[App Intents updates](https://developer.apple.com/documentation/Updates/AppIntents)
Learn about important changes in App Intents.
[Making actions and content discoverable and widely available](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available)
Adopt App Intents to make your app discoverable with Spotlight, controls, widgets, and the Action button.
[Creating your first app intent](https://developer.apple.com/documentation/appintents/creating-your-first-app-intent)
Create your first app intent that makes your app available in system experiences like Spotlight or the Shortcuts app.
[Adopting App Intents to support system experiences](https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences)
Create app intents and entities to incorporate system experiences such as Spotlight, visual intelligence, and Shortcuts.
Current page is Accelerating app interactions with App Intents 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fappintents%2Facceleratingappinteractionswithappintents).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
