Source: https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension

[ Skip Navigation ](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension)
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
[ Open Menu ](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension)


[](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension)
## [ WidgetKit  ](https://developer.apple.com/documentation/widgetkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 23 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 23 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 23 symbols inside <root> [Developing a WidgetKit strategy](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 23 symbols inside <root> [WidgetKit updates](https://developer.apple.com/documentation/updates/widgetkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 23 symbols inside <root> [Creating a widget extension](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 23 symbols inside <root> [Emoji Rangers: Supporting Live Activities, interactivity, and animations](https://developer.apple.com/documentation/widgetkit/emoji-rangers-supporting-live-activities-interactivity-and-animations)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
6 of 23 symbols inside <root> [WidgetBundle](https://developer.apple.com/documentation/swiftui/widgetbundle)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 23 symbols inside <root>
System experiences
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
8 of 23 symbols inside <root> containing 67 symbols[Widgets and watch complications](https://developer.apple.com/documentation/widgetkit/widgets-and-complications-collection)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
9 of 23 symbols inside <root> containing 13 symbols[Live Activities](https://developer.apple.com/documentation/widgetkit/liveactivities-collection)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
10 of 23 symbols inside <root> containing 20 symbols[Controls](https://developer.apple.com/documentation/widgetkit/controls-collection)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
11 of 23 symbols inside <root>
Presentation
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 23 symbols inside <root> [Creating views for widgets, Live Activities, and watch complications](https://developer.apple.com/documentation/widgetkit/creating-views-for-widgets-live-activities-and-watch-complications)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
13 of 23 symbols inside <root> containing 71 symbols[SwiftUI views for widgets](https://developer.apple.com/documentation/widgetkit/swiftui-views)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
14 of 23 symbols inside <root>
Interactivity
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
15 of 23 symbols inside <root> [Adding interactivity to widgets and Live Activities](https://developer.apple.com/documentation/widgetkit/adding-interactivity-to-widgets-and-live-activities)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
16 of 23 symbols inside <root> [Animating data updates in widgets and Live Activities](https://developer.apple.com/documentation/widgetkit/animating-data-updates-in-widgets-and-live-activities)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
17 of 23 symbols inside <root> [Linking to specific app scenes from your widget or Live Activity](https://developer.apple.com/documentation/widgetkit/linking-to-specific-app-scenes-from-your-widget-or-live-activity)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
18 of 23 symbols inside <root>
Accessibility
23 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ WidgetKit ](https://developer.apple.com/documentation/widgetkit)
  * [ Creating a widget extension ](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension)
  *     * Creating a widget extension 


Article
# Creating a widget extension
Display your app’s content in a convenient, informative widget on various devices.
## [Overview](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension#Overview)
Widgets display relevant, glanceable content that people can quickly access for more details. Your app can provide a variety of widgets, letting people focus on the information that’s most important to them.
A good way to get started with widgets and WidgetKit is by adding a _static_ widget to your app. A static widget doesn’t need any configuration by a person. For example, a static widget might show a stock market summary, or the next event on the person’s calendar. The _data_ the widget shows is dynamic, but the _type_ of data it shows is fixed. Consider the information your app presents, and choose something that people would find useful to see at a glance on their device.
Widgets can display data in many sizes, from small watch complications or Dynamic Island presentations, to extra large iPad and macOS widgets. The example that follows below focuses on a single size widget, the small system size, or [`WidgetFamily.systemSmall`](https://developer.apple.com/documentation/widgetkit/widgetfamily/systemsmall). The example widget displays the status of a hypothetical game such as the health level of a character.
You build widgets using SwiftUI. While there are similarities to how you present views in your app, some aspects are unique to developing widgets. For more information about using SwiftUI, refer to [SwiftUI](https://developer.apple.com/documentation/SwiftUI). However, not all SwiftUI views work in widgets. For a list of the views that work in widgets, refer to [SwiftUI views for widgets](https://developer.apple.com/documentation/widgetkit/swiftui-views).
### [Add a widget target to your app](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension#Add-a-widget-target-to-your-app)
The Widget Extension template provides a starting point for creating your widget. The template creates an extension target that contains a single widget. Later, you can add widgets to the same extension to display different types of information or to support additional widget sizes.
  1. Open your app project in Xcode and choose File > New > Target.
  2. From the Application Extension group, select Widget Extension, and then click Next.
  3. Enter the name of your extension.
  4. Deselect the Include Live Activity and Include Configuration App Intent checkboxes, if they’re selected.
  5. Click Finish.


![A screenshot showing Xcode’s new target sheet with Widget Extension selected.](https://docs-assets.developer.apple.com/published/f895c4d95ac3dc25debf2c19d5006c8c/WidgetKit-Add-Widget-Extension%402x.png)
Note
Live Activities use WidgetKit and share many aspects of their design and implementation with the widgets in your app. If your app supports Live Activities, consider implementing them at the same time you add your widgets. For more information about Live Activities, refer to [Displaying live data with Live Activities](https://developer.apple.com/documentation/ActivityKit/displaying-live-data-with-live-activities).
The widget extension template provides an initial implementation that conforms to the [`Widget`](https://developer.apple.com/documentation/SwiftUI/Widget) protocol. The widget’s `body` property determines the type of content that the widget presents. Static widgets use a [`StaticConfiguration`](https://developer.apple.com/documentation/widgetkit/staticconfiguration) for the `body` property. Other types of widget configurations include:
  * [`AppIntentConfiguration`](https://developer.apple.com/documentation/widgetkit/appintentconfiguration) that enables user customization, such as a weather widget that needs a zip or postal code for a city, or a package-tracking widget that needs a tracking number.
  * [`ActivityConfiguration`](https://developer.apple.com/documentation/widgetkit/activityconfiguration) to present live data, such as scores during a sporting event or a food delivery estimate.
  * [`RelevanceConfiguration`](https://developer.apple.com/documentation/widgetkit/relevanceconfiguration) to provide relevance clues for widgets in watchOS.


For more information about these other widget configurations, refer to [Making a configurable widget](https://developer.apple.com/documentation/widgetkit/making-a-configurable-widget), [Displaying live data with Live Activities](https://developer.apple.com/documentation/ActivityKit/displaying-live-data-with-live-activities), and [Increasing the visibility of widgets in Smart Stacks](https://developer.apple.com/documentation/widgetkit/widget-suggestions-in-smart-stacks).
### [Add configuration details](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension#Add-configuration-details)
To configure a static widget, provide the following information: 

`kind`
    
A string that identifies the widget. This is an identifier you choose, and should be descriptive of what the widget represents. 

`provider`
    
An object that conforms to [`TimelineProvider`](https://developer.apple.com/documentation/widgetkit/timelineprovider) and produces a _timeline_ that tells WidgetKit when to render the widget. A timeline is a sequence that contains a custom [`TimelineEntry`](https://developer.apple.com/documentation/widgetkit/timelineentry) type you define. The entries in this sequence identify the date when you want WidgetKit to update the widget’s content and includes properties your widget’s view needs to render in the custom type. 

`content`
    
A closure that contains SwiftUI views. WidgetKit invokes this to render the widget’s content, passing a `TimelineEntry` parameter from the provider.
Use modifiers to provide additional configuration details, including a display name, a description, and the families the widget supports. The following code shows a widget that provides general status for a game:
```
@main
struct GameStatusWidget: Widget {
    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: "com.mygame.game-status",
            provider: GameStatusProvider(),
        ) { entry in
            GameStatusView(entry.gameStatus)
        }
        .configurationDisplayName("Game Status")
        .description("Shows an overview of your game status")
        .supportedFamilies([.systemSmall])
    }
}

```

The widget’s provider generates a timeline for the widget, and includes the game-status details in each entry. When the date of each timeline entry arrives, WidgetKit invokes the `content` closure to display the widget’s content. Finally, the modifiers specify the name and description shown in the widget gallery, and the sizes that the widget supports.
Important
For an app’s widget to appear in the widget gallery, a person must launch the app that contains the widget at least once after the app is installed.
Note the usage of the `@main` attribute on this widget. This attribute indicates that the `GameStatusWidget` is the entry point for the widget extension, implying that the extension contains a single widget. To support multiple widgets, refer to the [`WidgetBundle`](https://developer.apple.com/documentation/SwiftUI/WidgetBundle).
### [Provide timeline entries](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension#Provide-timeline-entries)
The timeline provider you define generates a sequence of timeline entries. Each specifies the date and time to update the widget’s content, and includes the data your widget needs to render its view. The game-status widget might define its timeline entry to include a string that represents the status of the game, as follows:
```
struct GameStatusEntry: TimelineEntry {
    var date: Date
    var gameStatus: String
}

```

WidgetKit calls [`getTimeline(in:completion:)`](https://developer.apple.com/documentation/widgetkit/timelineprovider/gettimeline\(in:completion:\)) to request the timeline from the provider. The timeline consists of one or more timeline entries and a reload policy that informs WidgetKit when to request a subsequent timeline.
Tip
You can use APNs and WidgetKit push notifications to update your widgets. To build your first widget, create a widget that uses a timeline to update its data, then add push notification updates if it’s a good fit for your widget. For more information, refer to [Keeping a widget up to date](https://developer.apple.com/documentation/widgetkit/keeping-a-widget-up-to-date).
The following example shows how the game-status widget’s provider generates a timeline that consists of a single entry with the current game status from the server, and a reload policy to request a new timeline in 15 minutes:
```
struct GameStatusProvider: TimelineProvider {
    func getTimeline(in context: Context, completion: @escaping (Timeline<GameStatusEntry>) -> Void) {
        // Create a timeline entry for "now."
        let date = Date()
        let entry = GameStatusEntry(
            date: date,
            gameStatus: gameStatusFromServer
        )


        // Create a date that's 15 minutes in the future.
        let nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 15, to: date)!


        // Create the timeline with the entry and a reload policy with the date
        // for the next update.
        let timeline = Timeline(
            entries:[entry],
            policy: .after(nextUpdateDate)
        )


        // Call the completion to pass the timeline to WidgetKit.
        completion(timeline)
    }
}

```

In this example, if the widget didn’t have the current status from the server, it could store a reference to the completion, perform an asynchronous request to the server to fetch the game status, and call the completion when that request completes.
For more information about generating timelines, refer to [Keeping a widget up to date](https://developer.apple.com/documentation/widgetkit/keeping-a-widget-up-to-date) and [Increasing the visibility of widgets in Smart Stacks](https://developer.apple.com/documentation/widgetkit/widget-suggestions-in-smart-stacks). For more information about handling network requests, refer to [Making network requests in a widget extension](https://developer.apple.com/documentation/widgetkit/making-network-requests-in-a-widget-extension).
### [Generate a preview for the widget gallery](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension#Generate-a-preview-for-the-widget-gallery)
In order for people to be able to use your widget, it needs to be available in the widget gallery. To show your widget in the widget gallery, WidgetKit asks the provider for a _preview snapshot_ that displays generic data. WidgetKit makes this request by calling the provider’s [`getSnapshot(in:completion:)`](https://developer.apple.com/documentation/widgetkit/timelineprovider/getsnapshot\(in:completion:\)) method with the `context` parameter’s [`isPreview`](https://developer.apple.com/documentation/widgetkit/timelineprovidercontext/ispreview) property set to `true`.
In response, you need to create the preview snapshot quickly. If your widget would normally need assets or information that takes time to generate or fetch from a server, use sample data instead.
In the following code, the game-status widget’s provider implements the snapshot method by showing the game status if it’s available, falling back to an empty status if it doesn’t have the status from its server:
```
struct GameStatusProvider: TimelineProvider {
    var hasFetchedGameStatus: Bool
    var gameStatusFromServer: String


    func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
        let date = Date()
        let entry: GameStatusEntry


        if context.isPreview && !hasFetchedGameStatus {
            entry = GameStatusEntry(date: date, gameStatus: "—")
        } else {
            entry = GameStatusEntry(date: date, gameStatus: gameStatusFromServer)
        }
        completion(entry)
    }

```

### [Display content in your widget](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension#Display-content-in-your-widget)
Widgets define their content using a SwiftUI view, commonly by composing other SwiftUI views. As shown in the [Add configuration details](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension#Add-configuration-details) section, the widget configuration contains the closure that WidgetKit invokes to render the widget’s content.
When people add your widget from the widget gallery, they choose the specific family — for example, small or medium — from the ones your widget supports. The widget’s content closure has to be capable of rendering each family the widget supports. WidgetKit sets the corresponding family and additional properties, such as the color scheme (light or dark), in the SwiftUI environment.
In the game-status widget’s configuration shown above, the content closure uses a `GameStatusView` to display the status. Because this widget only supports the `.systemSmall` family, it uses a composed `GameTurnSummary` SwiftUI view to display a summary of the game’s current status. For any other family size, it shows the default view, which indicates that game status is unavailable.
```
struct GameStatusView : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    var gameStatus: GameStatus
    var selectedCharacter: CharacterDetail


    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall: GameTurnSummary(gameStatus)
        default: GameDetailsNotAvailable()
        }
    }
}

```

In your widget, as you add more supported families to the widget’s configuration, you would add additional cases in the widget view’s `body` property for each additional family.
Note
The view declares its body with `@ViewBuilder` because the type of view it uses varies.
### [Display a placeholder widget](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension#Display-a-placeholder-widget)
A placeholder view is similar to a preview snapshot, but instead of showing example data to let people see the type of data the widget displays, it shows a generic visual representation with no specific content. When WidgetKit renders your widget, it may need to render your content as a placeholder, for example, while you load data in the background or if you tell the system that your widget contains sensitive information.
### [Hide sensitive content](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension#Hide-sensitive-content)
Widgets and watch complications may show sensitive information and can be highly visible, especially on devices with an Always-On display. When you create your widget or watch complication, review its content and consider hiding sensitive information.
To let people decide whether a widget should show sensitive data on a locked device, mark views that contain sensitive information using the [`privacySensitive(_:)`](https://developer.apple.com/documentation/SwiftUI/View/privacySensitive\(_:\)) modifier. In iOS, people can configure whether to show sensitive data on the Lock Screen and during Always On. In Settings, they can deactivate data access for Lock Screen widgets in the ALLOW ACCESS WHEN LOCKED section of Settings > Face ID & Passcode. On Apple Watch, people can configure whether to show sensitive data during Always On by Choosing Settings > Display & Brightness > Always On > Hide Sensitive Complications. They can choose to show redacted content for all or individual complications.
If a person chooses to hide privacy sensitive content, WidgetKit renders a placeholder or redactions you configure. To configure redactions, implement the [`redacted(reason:)`](https://developer.apple.com/documentation/SwiftUI/View/redacted\(reason:\)) callback, read out the [`privacy`](https://developer.apple.com/documentation/SwiftUI/RedactionReasons/privacy) property, and provide custom placeholder views. You can also choose to render a view as unredacted with the [`unredacted()`](https://developer.apple.com/documentation/SwiftUI/View/unredacted\(\)) view modifier.
As an alternative to marking individual views as privacy sensitive, for example, if your entire widget content is privacy sensitive, you can add the Data Protection capability to your widget extension. Until a person unlocks their device to match the privacy level you chose, WidgetKit displays a placeholder instead of the widget content. First, enable the Data Protection capability for your widget extension in Xcode, then set the [`Data Protection Entitlement`](https://developer.apple.com/documentation/BundleResources/Entitlements/com.apple.developer.default-data-protection) entitlement to the value that fits the level of privacy you want to offer: 

`NSFileProtectionComplete`
    
WidgetKit hides widget content when the device is locked. Additionally, iOS widgets aren’t available as iPhone widgets on Mac. 

`NSFileProtectionCompleteUnlessOpen`
    
WidgetKit hides widget content when the device is passcode locked. Additionally, iOS widgets aren’t available as iPhone widgets on Mac.
If you choose the `NSFileProtectionCompleteUntilFirstUserAuthentication` or `NSFileProtectionNone` protection level for your widget extension:
  * WidgetKit uses its default behavior and displays a placeholder until a person authenticates after they reboot their device.
  * iOS widgets are available as iPhone widgets on Mac.


### [Add dynamic content to your widget](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension#Add-dynamic-content-to-your-widget)
Widgets typically present read-only information and don’t generally support interactive elements such as scrolling lists or text input. Widgets support some interactive elements and animations. For details on adding interactivity to your widgets, refer to [Adding interactivity to widgets and Live Activities](https://developer.apple.com/documentation/widgetkit/adding-interactivity-to-widgets-and-live-activities).
For a list of views that WidgetKit supports, refer to [SwiftUI views for widgets](https://developer.apple.com/documentation/widgetkit/swiftui-views). WidgetKit ignores other views when it renders the widget’s content.
Although the display of a widget is based on a snapshot of your view, you can use various SwiftUI views that continue to update while your widget is visible. For more about providing dynamic content, refer to [Keeping a widget up to date](https://developer.apple.com/documentation/widgetkit/keeping-a-widget-up-to-date) and [Displaying dynamic dates in widgets](https://developer.apple.com/documentation/widgetkit/displaying-dynamic-dates).
### [Respond to user interactions](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension#Respond-to-user-interactions)
When people interact with your widget, beyond interactive elements described above, the system launches your app to handle the request. When the system activates your app, navigate to the details that correspond to the widget’s content. Your widget can specify a URL to inform the app what content to display. To configure custom URLs in your widget:
  * For all widgets, add the [`widgetURL(_:)`](https://developer.apple.com/documentation/SwiftUI/View/widgetURL\(_:\)) view modifier to a view in your widget’s view hierarchy. If the widget’s view hierarchy includes more than one `widgetURL` modifier, the behavior is undefined.
  * For widgets that use [`WidgetFamily.systemMedium`](https://developer.apple.com/documentation/widgetkit/widgetfamily/systemmedium), [`WidgetFamily.systemLarge`](https://developer.apple.com/documentation/widgetkit/widgetfamily/systemlarge), or [`WidgetFamily.systemExtraLarge`](https://developer.apple.com/documentation/widgetkit/widgetfamily/systemextralarge), add one or more [`Link`](https://developer.apple.com/documentation/SwiftUI/Link) controls to your widget’s view hierarchy. You can use both `widgetURL` and `Link` controls. If the interaction targets a `Link` control, the system uses the URL in that control. For interactions anywhere else in the widget, the system uses the URL specified in the `widgetURL` view modifier.


For more details about adding links from your widgets to your app, refer to [Linking to specific app scenes from your widget or Live Activity](https://developer.apple.com/documentation/widgetkit/linking-to-specific-app-scenes-from-your-widget-or-live-activity).
### [Preview widgets in Xcode](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension#Preview-widgets-in-Xcode)
Xcode allows you to look at previews of your widgets without running your app in Simulator or on a test device. The following example shows the preview code from the Emoji Rangers widget of the [Building Widgets Using WidgetKit and SwiftUI](https://developer.apple.com/documentation/widgetkit/building_widgets_using_widgetkit_and_swiftui) sample code project.
```
#Preview(as: .systemMedium, widget: {
    EmojiRangerWidget()
}, timeline: {
    SimpleEntry(date: Date(), relevance: nil, hero: .spouty)
})

```

As you support more widget families in your widget, you can add more preview views to see multiple sizes in a single preview.
For additional information about previewing widgets, refer to [Previewing widgets and Live Activities in Xcode](https://developer.apple.com/documentation/widgetkit/previewing-widgets-and-live-activities-in-xcode).
### [Expand your widget’s capabilities](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension#Expand-your-widgets-capabilities)
To give people flexible access to your app’s content, you can support additional families, add widget types, make your widgets user-configurable, or add support for Live Activities if your app presents live data. To explore a plan to support additional features, refer to [Developing a WidgetKit strategy](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy).
To explore WidgetKit code for the first time, refer to the following sample code projects:
  * [Building Widgets Using WidgetKit and SwiftUI](https://developer.apple.com/documentation/widgetkit/building_widgets_using_widgetkit_and_swiftui) is the sample code project associated with the WWDC20 code-alongs [Widgets Code-along, part 1: The adventure begins](https://developer.apple.com/videos/play/wwdc2020/10034/), [Widgets Code-along, part 2: Alternate timelines](https://developer.apple.com/videos/play/wwdc2020/10035/), and [Widgets Code-along, part 3: Advancing timelines](https://developer.apple.com/videos/play/wwdc2020/10036/), where you learn how to build your first widget.
  * [Emoji Rangers: Supporting Live Activities, interactivity, and animations](https://developer.apple.com/documentation/widgetkit/emoji-rangers-supporting-live-activities-interactivity-and-animations) expands the Emoji Rangers sample code project to include Lock Screen widgets, Live Activities, interactivity, and animations.
  * [Fruta: Building a feature-rich app with SwiftUI](https://developer.apple.com/documentation/AppClip/fruta-building-a-feature-rich-app-with-swiftui) and [Backyard Birds: Building an app with SwiftData and widgets](https://developer.apple.com/documentation/SwiftUI/Backyard-birds-sample) are sample code projects that support widgets in addition to other technologies like [App Clips](https://developer.apple.com/documentation/AppClip) and [SwiftData](https://developer.apple.com/documentation/SwiftData).


### [Create multiple widget extensions](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension#Create-multiple-widget-extensions)
You can include multiple widget types in your widget extension, although your app can contain multiple extensions. For example, if some of your widgets use location information and others don’t, keep the widgets that use location information in a separate extension. This allows the system to prompt someone for authorization to use location information only for the widgets from the extension that uses location information. For details about bundling multiple widgets in an extension, refer to [`WidgetBundle`](https://developer.apple.com/documentation/SwiftUI/WidgetBundle).
## [See Also](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension#see-also)
### [Essentials](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension#Essentials)
[Developing a WidgetKit strategy](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy)
Explore features, tasks, related frameworks, and constraints as you make a plan to implement widgets, controls, watch complications, and Live Activities.
[WidgetKit updates](https://developer.apple.com/documentation/Updates/WidgetKit)
Learn about important changes in WidgetKit.
[Emoji Rangers: Supporting Live Activities, interactivity, and animations](https://developer.apple.com/documentation/widgetkit/emoji-rangers-supporting-live-activities-interactivity-and-animations)
Offer Live Activities, controls, animate data updates, and add interactivity to widgets.
[`protocol WidgetBundle`](https://developer.apple.com/documentation/SwiftUI/WidgetBundle)
A container used to expose multiple widgets from a single widget extension.
Current page is Creating a widget extension 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fwidgetkit%2Fcreating-a-widget-extension).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
