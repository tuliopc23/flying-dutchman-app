Source: https://developer.apple.com/documentation/AppIntents/Creating-your-first-app-intent

[ Skip Navigation ](https://developer.apple.com/documentation/AppIntents/Creating-your-first-app-intent#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/AppIntents/Creating-your-first-app-intent#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/AppIntents/Creating-your-first-app-intent)
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
[ Open Menu ](https://developer.apple.com/documentation/AppIntents/Creating-your-first-app-intent)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/AppIntents/Creating-your-first-app-intent)
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
  * [ Creating your first app intent ](https://developer.apple.com/documentation/AppIntents/Creating-your-first-app-intent)
  *     * Creating your first app intent 


Article
# Creating your first app intent
Create your first app intent that makes your app available in system experiences like Spotlight or the Shortcuts app.
## [Overview](https://developer.apple.com/documentation/AppIntents/Creating-your-first-app-intent#Overview)
To let people leverage your app’s features outside of the app itself, system experiences like Spotlight and the Shortcuts app require your help to understand your app’s actions and content so the system can expose that functionality. Use [App Intents](https://developer.apple.com/documentation/appintents) to express your app’s capabilities and make your app’s actions available to the system. App intents are self-contained types that act as a bridge between your code and system experiences and services. Each app intent encapsulates a single action that’s specific to your app. It provides the system with any action that makes sense for your app’s audience, such as showing information about a hiking trail from a hiking app, exporting a person’s transaction history from a budgeting app, or converting between two specific units of measurement with a converter app.
Every app intent provides descriptive information about itself that experiences and services like Siri can display or announce. When you build an app that contains app intents, the compiler examines your source and generates data about those intents that Xcode stores in the app bundle. After someone installs your app, the system uses that data to discover the intents and makes them available to the system.
Before you get started creating your first app intent, read [Making actions and content discoverable and widely available](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available) to review App Intents framework features and functionality. Then, identify an action and create your first app intent, and offer an App Shortcut as described below. App Shortcuts make your app intent even more useful. For example, App Shortcuts don’t require configuration, and people can place them on the Action button. Additionally, App Shortcuts appear in Spotlight even when a person hasn’t launched your app.
### [Identify an action](https://developer.apple.com/documentation/AppIntents/Creating-your-first-app-intent#Identify-an-action)
Think about actions and tasks people perform in your app, an action’s input and output data, and how the system could surface actions in its services and experiences. In general, implement your [`AppIntent`](https://developer.apple.com/documentation/appintents/appintent) to have a narrow focus and do one thing well. People can invoke it individually, or create custom shortcuts by combining it with app intents from other apps in the Shortcuts app.
For your first app intent, choose an action that people are likely to use frequently. Then, add an App Shortcut that includes the app intent.
Tip
To get familiar with the App Intents framework, consider creating your first app intent for functionality that doesn’t use a specialized app intent protocol; for example, an app intent that opens your app. When you’ve successfully created your first app intent, make changes to adopt a specialized app intent or add more app intents for more complex app functionality.
### [Review when to adopt specialized app intent protocols](https://developer.apple.com/documentation/AppIntents/Creating-your-first-app-intent#Review-when-to-adopt-specialized-app-intent-protocols)
For many app intents, the [`AppIntent`](https://developer.apple.com/documentation/appintents/appintent) protocol is the preferred protocol to adopt. However, depending on your app’s specific behaviors, you might prefer your code to conform to one of the other intent protocols; for example:
  * Create app intents that conform to assistant schemas that make sure your actions and content work well with the enhanced action capabilities of Siri that Apple Intelligence provides.
  * If your app plays or records audio and you want to offer that same functionality in an app intent, adopt [`AudioPlaybackIntent`](https://developer.apple.com/documentation/appintents/audioplaybackintent) instead. This protocol inherits from `AppIntent` and indicates the audio-related behavior to the system so that, where possible, it avoids audio interactions and other potential interruptions.


The App Intents framework provides a number of other specialized app intent protocols. For more information about integrating your app intents with Siri and Apple Intelligence, see [Integrating actions with Siri and Apple Intelligence](https://developer.apple.com/documentation/appintents/integrating-actions-with-siri-and-apple-intelligence) and [App intent domains](https://developer.apple.com/documentation/appintents/app-intent-domains). For more information about other specialized protocols, see [App intents](https://developer.apple.com/documentation/appintents/app-intents).
### [Create an app intent that opens your app](https://developer.apple.com/documentation/AppIntents/Creating-your-first-app-intent#Create-an-app-intent-that-opens-your-app)
To define an action, create a type that adopts the [`AppIntent`](https://developer.apple.com/documentation/appintents/appintent) protocol, or a related protocol that provides the specific behavior you need. If possible, start with a simple action that doesn’t require parameters. Alternatively, if your action requires a parameter, consider initially hard-coding the parameter to get your first app intent implementation to work. Then make changes to add parameters to your first app intent as described in [Adding parameters to an app intent](https://developer.apple.com/documentation/appintents/adding-parameters-to-an-app-intent).
For example, the [Accelerating app interactions with App Intents](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents) sample code project provides an app intent that opens the app and displays a person’s favorite hiking trails:
```
struct OpenFavorites: AppIntent {
    
    static var title: LocalizedStringResource = "Open Favorite Trails"


    static var description = IntentDescription("Opens the app and goes to your favorite trails.")
    
    static var openAppWhenRun: Bool = true
    
    @MainActor
    func perform() async throws -> some IntentResult {
        navigationModel.selectedCollection = trailManager.favoritesCollection
        
        return .result()
    }
    
    @Dependency
    private var navigationModel: NavigationModel
    
    @Dependency
    private var trailManager: TrailDataManager
}

```

In the structure, implement the protocol’s [`title`](https://developer.apple.com/documentation/appintents/appintent/title) requirement to provide the localized text that the Shortcuts app displays in its Action Library and shortcut editor. To include additional context for the intent, implement the optional [`description`](https://developer.apple.com/documentation/appintents/appintent/description) requirement to provide localized text that describes the app intent’s behavior. The Shortcuts app shows the description in its Action Library.
### [Perform the app intent’s action](https://developer.apple.com/documentation/AppIntents/Creating-your-first-app-intent#Perform-the-app-intents-action)
To provide your intent’s functionality, implement the [`perform()`](https://developer.apple.com/documentation/appintents/appintent/perform\(\)) protocol requirement. The system invokes this method after it resolves any required parameters, meaning those parameters are safe for your code to access from the function’s body.
Your implementation must complete the necessary work and return a result to the system. A result may include, among other things, a value that a shortcut can use in subsequent connected actions, dialogue to display or announce, and a [SwiftUI](https://developer.apple.com/documentation/SwiftUI) snippet view.
For example, the [Accelerating app interactions with App Intents](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents) sample code project returns a dialog for the `GetTrailInfo` app intent:
```
func perform() async throws -> some IntentResult & ReturnsValue<TrailEntity> & ProvidesDialog & ShowsSnippetView {
    guard let trailData = trailManager.trail(with: trail.id) else {
        throw TrailIntentError.trailNotFound
    }
            
    /**
     You provide a custom view by conforming the return type of the `perform()` function to the `ShowsSnippetView` protocol.
     */
    let snippet = TrailInfoView(trail: trailData, includeConditions: true)
    
    /**
     This intent displays a custom view that includes the trail conditions as part of the view. The dialog includes the trail conditions when
     the system can only read the response, but not display it. When the system can display the response, the dialog omits the trail
     conditions.
     */
    let dialog = IntentDialog(full: "The latest conditions reported for \(trail.name) indicate: \(trail.currentConditions).",
                              supporting: "Here's the latest information on trail conditions.")
    
    return .result(value: trail, dialog: dialog, view: snippet)
}

```

If it doesn’t make sense for your intent to return a concrete result, return `.result()` to tell the system the intent is complete.
Important
By default, the system launches your app in a limited mode in the background and executes the intent’s `perform()` method on an arbitrary queue. To override this behavior and launch the app in the foreground, set the intent’s [`openAppWhenRun`](https://developer.apple.com/documentation/appintents/appintent/openappwhenrun) variable to `true`. If your intent updates the app’s user interface, annotate [`perform()`](https://developer.apple.com/documentation/appintents/appintent/perform\(\)) with `@MainActor` to make sure the method executes on the main queue.
### [Verify the behavior of your intent in Simulator or on-device](https://developer.apple.com/documentation/AppIntents/Creating-your-first-app-intent#Verify-the-behavior-of-your-intent-in-Simulator-or-on-device)
During development, validate that your intents behave as you expect by testing them in Simulator or on-device. If you’re adding intents to a macOS app, build and run the app. For other platforms, select the relevant simulator or connected device and then build and run. After your app launches, follow these steps:
  1. Launch the Shortcuts app.
  2. Tap or click the New Shortcut (+) button to create a shortcut.
  3. Choose Apps in the Action Library’s segmented control.
  4. Tap or click your app’s icon.
  5. Select the action to test.
  6. For app intents with parameters, use the summary to set the parameter values.
  7. Tap or click the Run button.


Set a breakpoint at the top of your `perform()` method to confirm your implementation is working. The debugger pauses execution immediately after you run the shortcut, enabling you to step through the code and inspect the intent’s parameters to verify they have the values they require.
### [Design custom responses](https://developer.apple.com/documentation/AppIntents/Creating-your-first-app-intent#Design-custom-responses)
People may interact with your app intent through Siri. For a good user experience, consider communicating the intent’s result with a visual response using a custom UI snippet, and as a dialog for Siri to communicate the same information. For more information, see [Design custom responses](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents#Design-custom-responses).
### [Receive input with parameters and return results](https://developer.apple.com/documentation/AppIntents/Creating-your-first-app-intent#Receive-input-with-parameters-and-return-results)
Creating an app intent that opens a screen in your app is the first step to becoming familiar with the App Intents framework and to making your app and its content discoverable. Many actions in your app receive input and return data. To describe actions that receive and return data, add parameters to the app intent to tell the system about that data and whether it’s required or optional. By exposing parameters, you enable people to configure your intents with values unique to their requirements and enable the App Intents framework to communicate with system experiences to write those values at runtime. For example, the [Accelerating app interactions with App Intents](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents) sample code project enables people to choose which hiking trail information to view when they invoke an app intent. For more information about using parameters in an app intent, see [Adding parameters to an app intent](https://developer.apple.com/documentation/appintents/adding-parameters-to-an-app-intent).
### [Create an App Shortcut](https://developer.apple.com/documentation/AppIntents/Creating-your-first-app-intent#Create-an-App-Shortcut)
App intents you create appear in the Shortcuts app. People can create custom shortcuts that initiate your app intent and combine app intents to perform custom workflows. To enable people to discover and run your app intents without any configuration, bundle your app’s app intents into App Shortcuts to provide workflows of your app’s actions.
By offering App Shortcuts, you make your app’s functionality instantly available for use in Shortcuts, Spotlight, and Siri from the moment a person installs your app — without any setup in the Shortcuts app or an Add to Siri button. On devices that support the Action button, people can invoke your App Shortcut with the Action button for quick access to your app’s functionality.
To offer an App Shortcut for your first app intent:
  1. Create the [`AppShortcut`](https://developer.apple.com/documentation/appintents/appshortcut) object for your app intent using the [`init(intent:phrases:shortTitle:systemImageName:)`](https://developer.apple.com/documentation/appintents/appshortcut/init\(intent:phrases:shorttitle:systemimagename:\)-8yntq) initializer and provide phrases that people can use to run the app intent and the metadata that appears in the Shortcuts app.
  2. Implement the [`AppShortcutsProvider`](https://developer.apple.com/documentation/appintents/appshortcutsprovider) protocol that provides the App Shortcuts you offer to the Shortcuts app.


For more information about creating App Shortcuts, see [App Shortcuts](https://developer.apple.com/documentation/appintents/app-shortcuts) and [Create App Shortcuts](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents#Create-App-Shortcuts).
To learn more about supporting the Action button, refer to [Action button on iPhone and Apple Watch](https://developer.apple.com/documentation/appintents/actionbutton).
### [Donate app intents to the system](https://developer.apple.com/documentation/AppIntents/Creating-your-first-app-intent#Donate-app-intents-to-the-system)
Make your app intents discoverable by explicitly donating them to the system. When someone performs an action in your app, donate an intent that corresponds to that action. The system uses the information you provide to predict actions someone might take in the future. For example, if someone requests the weather from your app each morning, the system might proactively offer the corresponding app intent at the same time each day.
For more information, see [Intent discovery](https://developer.apple.com/documentation/appintents/intent-discovery).
## [See Also](https://developer.apple.com/documentation/AppIntents/Creating-your-first-app-intent#see-also)
### [Essentials](https://developer.apple.com/documentation/AppIntents/Creating-your-first-app-intent#Essentials)
[App Intents updates](https://developer.apple.com/documentation/Updates/AppIntents)
Learn about important changes in App Intents.
[Making actions and content discoverable and widely available](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available)
Adopt App Intents to make your app discoverable with Spotlight, controls, widgets, and the Action button.
[Adopting App Intents to support system experiences](https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences)
Create app intents and entities to incorporate system experiences such as Spotlight, visual intelligence, and Shortcuts.
[Accelerating app interactions with App Intents](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents)
Enable people to use your app’s features quickly through Siri, Spotlight, and Shortcuts.
Current page is Creating your first app intent 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FAppIntents%2FCreating-your-first-app-intent).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
