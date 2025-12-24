Source: https://developer.apple.com/documentation/appintents

[ Skip Navigation ](https://developer.apple.com/documentation/appintents#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/appintents#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/appintents)
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
[ Open Menu ](https://developer.apple.com/documentation/appintents)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/appintents)
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
Framework
# App Intents
Make your app’s content and actions discoverable with system experiences like Spotlight, widgets, and the Shortcuts app.
iOS 16.0+iPadOS 16.0+Mac Catalyst 16.0+macOS 13.0+tvOS 16.0+visionOS 1.0+watchOS 9.0+
## [Overview](https://developer.apple.com/documentation/appintents#Overview)
The App Intents framework provides functionality to deeply integrate your app’s actions and content with system experiences across platforms, including Siri, Spotlight, widgets, controls and more. With Apple Intelligence and enhancements to App Intents, Siri will suggest your app’s actions to help people discover your app’s features and gains the ability to take actions in and across apps.
![A hero image of an App Intents framework icon.](https://docs-assets.developer.apple.com/published/4c11e7619eec4482c4c0d9fdb7676e38/app-intents-hero%402x.png)
By adopting the App Intents framework, you allow people to personalize their devices by instantly using your app’s functionality with:
  * Interactions with Siri, including those that use the personal context awareness and action capabilities of Apple Intelligence.
  * Spotlight suggestions and search.
  * Actions and automations in the Shortcuts app.
  * Hardware interactions that initiate app actions, like the Action button and squeeze gestures on Apple Pencil.
  * Focus to allow people to reduce distractions.


Note
Siri’s personal context understanding, onscreen awareness, and in-app actions are in development and will be available with a future software update.
For example, App Intents enables you to express your app’s actions, by offering an App Shortcut. People can then ask Siri to take those actions on their behalf, whether they’re in your app or elsewhere in the system. Use App Entities to expose content in your app to Spotlight and semantic indexing with Apple Intelligence. People can then ask Siri to retrieve information from your app, like asking Siri to pull up flight information from a travel app to share with a loved one.
You reuse these components with other technologies to offer additional features and experiences that make your app and its functionality even more discoverable and widely available. For example, you reuse modular App Intents code together with [WidgetKit](https://developer.apple.com/documentation/WidgetKit) to offer:
  * Interactive widgets
  * Controls
  * Live Activities


To learn more about features that the App Intents framework enables and how you can best adopt the framework, see [Making actions and content discoverable and widely available](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available).
For design guidance, see [Human Interface Guidelines > App Shortcuts](https://developer.apple.com/design/human-interface-guidelines/app-shortcuts), [Human Interface Guidelines > Siri](https://developer.apple.com/design/human-interface-guidelines/siri), and [Human Interface Guidelines > Action Button](https://developer.apple.com/design/human-interface-guidelines/action-button).
## [Topics](https://developer.apple.com/documentation/appintents#topics)
### [Essentials](https://developer.apple.com/documentation/appintents#Essentials)
[App Intents updates](https://developer.apple.com/documentation/Updates/AppIntents)
Learn about important changes in App Intents.
[Making actions and content discoverable and widely available](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available)
Adopt App Intents to make your app discoverable with Spotlight, controls, widgets, and the Action button.
[Creating your first app intent](https://developer.apple.com/documentation/appintents/creating-your-first-app-intent)
Create your first app intent that makes your app available in system experiences like Spotlight or the Shortcuts app.
[Adopting App Intents to support system experiences](https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences)
Create app intents and entities to incorporate system experiences such as Spotlight, visual intelligence, and Shortcuts.
[Accelerating app interactions with App Intents](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents)
Enable people to use your app’s features quickly through Siri, Spotlight, and Shortcuts.
### [Siri and Apple Intelligence](https://developer.apple.com/documentation/appintents#Siri-and-Apple-Intelligence)
[Integrating actions with Siri and Apple Intelligence](https://developer.apple.com/documentation/appintents/integrating-actions-with-siri-and-apple-intelligence)
Create app intents, entities, and enumerations that conform to assistant schemas to tap into the enhanced action capabilities of Siri and Apple Intelligence.
[API Reference Making onscreen content available to Siri and Apple Intelligence](https://developer.apple.com/documentation/appintents/making-onscreen-content-available-to-siri-and-apple-intelligence)
Enable Siri and Apple Intelligence to respond to a person’s questions and action requests for your app’s onscreen content.
[API Reference App intent domains](https://developer.apple.com/documentation/appintents/app-intent-domains)
Make your app’s actions and content available to Siri and Apple Intelligence with assistant schemas.
[Making your app’s functionality available to Siri](https://developer.apple.com/documentation/appintents/making-your-app-s-functionality-available-to-siri)
Add app intent schemas to your app so Siri can complete requests, and integrate your app with Apple Intelligence, Spotlight, and other system experiences.
### [Visual intelligence](https://developer.apple.com/documentation/appintents#Visual-intelligence)
[Integrating your app with visual intelligence](https://developer.apple.com/documentation/VisualIntelligence/integrating-your-app-with-visual-intelligence)
Enable people to find app content that matches their surroundings or objects onscreen with visual intelligence.
[Visual Intelligence](https://developer.apple.com/documentation/VisualIntelligence)
Include your app’s content in search results that visual intelligence provides.
[`protocol IntentValueQuery`](https://developer.apple.com/documentation/appintents/intentvaluequery)
A query that provides entity values to the system; for example, for visual intelligence search.
### [Interactive Snippets](https://developer.apple.com/documentation/appintents#Interactive-Snippets)
[Displaying static and interactive snippets](https://developer.apple.com/documentation/appintents/displaying-static-and-interactive-snippets)
Enable people to view the outcome of an app intent and immediately perform follow-up actions.
[`protocol SnippetIntent`](https://developer.apple.com/documentation/appintents/snippetintent)
An app intent that presents an interactive snippet onscreen.
### [Other system experiences](https://developer.apple.com/documentation/appintents#Other-system-experiences)
[Making app entities available in Spotlight](https://developer.apple.com/documentation/appintents/making-app-entities-available-in-spotlight)
Allow people to find your app’s content in Spotlight by donating app entities to its semantic index.
[API Reference Focus](https://developer.apple.com/documentation/appintents/focus)
Adjust your app’s behavior and filter incoming notifications when the current Focus changes.
[API Reference Action button on iPhone and Apple Watch](https://developer.apple.com/documentation/appintents/actionbutton)
Enable people to run your App Shortcuts with the Action button on iPhone or to start your app’s workout or dive sessions using the Action button on Apple Watch.
[Launching your voice-based conversational app from the side button of iPhone](https://developer.apple.com/documentation/appintents/launching-your-voice-based-conversational-app-from-the-side-button-of-iphone)
Let people in Japan configure the side button of iPhone to launch your voice-based conversational app.
[Developing a WidgetKit strategy](https://developer.apple.com/documentation/WidgetKit/Developing-a-WidgetKit-strategy)
Explore features, tasks, related frameworks, and constraints as you make a plan to implement widgets, controls, watch complications, and Live Activities.
### [SiriKit migration](https://developer.apple.com/documentation/appintents#SiriKit-migration)
[Soup Chef with App Intents: Migrating custom intents](https://developer.apple.com/documentation/SiriKit/soup-chef-with-app-intents-migrating-custom-intents)
Integrating App Intents to provide your appʼs actions to Siri and Shortcuts.
### [Actions](https://developer.apple.com/documentation/appintents#Actions)
[API Reference App intents](https://developer.apple.com/documentation/appintents/app-intents)
Define the custom actions your app exposes to the system, and incorporate support for existing SiriKit intents.
[API Reference Intent discovery](https://developer.apple.com/documentation/appintents/intent-discovery)
Donate your app’s intents to the system to help it identify trends and predict future behaviors.
[API Reference App Shortcuts](https://developer.apple.com/documentation/appintents/app-shortcuts)
Integrate your app’s intents and entities with the Shortcuts app, Siri, Spotlight, and the Action button on supported iPhone and Apple Watch models.
### [Parameters, custom data types, and queries](https://developer.apple.com/documentation/appintents#Parameters-custom-data-types-and-queries)
[Adding parameters to an app intent](https://developer.apple.com/documentation/appintents/adding-parameters-to-an-app-intent)
Enable people to configure app intents with their custom input values.
[Integrating custom data types into your intents](https://developer.apple.com/documentation/appintents/integrating-custom-types-into-your-intents)
Provide the system with information about the types your app uses to model its data so that your intents can use those types as parameters.
[API Reference Parameter resolution](https://developer.apple.com/documentation/appintents/parameter-resolution)
Define the required parameters for your app intents and specify how to resolve those parameters at runtime.
[API Reference App entities](https://developer.apple.com/documentation/appintents/app-entities)
Make core types or concepts discoverable to the system by declaring them as app entities.
[API Reference Entity queries](https://developer.apple.com/documentation/appintents/entity-queries)
Help the system find the entities your app defines and use them to resolve parameters.
[API Reference Resolvers](https://developer.apple.com/documentation/appintents/resolvers)
Resolve the parameters of your app intents, and extend the standard resolution types to include your app’s custom types.
### [Utility types](https://developer.apple.com/documentation/appintents#Utility-types)
[API Reference Common types](https://developer.apple.com/documentation/appintents/common-data-types)
Specify common types that your app supports, including currencies, files, and contacts.
### [Errors](https://developer.apple.com/documentation/appintents#Errors)
[`struct AppIntentError`](https://developer.apple.com/documentation/appintents/appintenterror)
Errors that your intent-handling code can return to indicate problems while interpreting or executing an app intent.
### [Protocols](https://developer.apple.com/documentation/appintents#Protocols)
[`protocol AppIntentSceneDelegate`](https://developer.apple.com/documentation/appintents/appintentscenedelegate)
Implement this protocol on your UIScene delegate to handle AppIntent invocations targeting a specific scene Example:
[`protocol AppShortcutsContent`](https://developer.apple.com/documentation/appintents/appshortcutscontent)
[`protocol CustomURLRepresentationParameterConvertible`](https://developer.apple.com/documentation/appintents/customurlrepresentationparameterconvertible)
[`protocol ShowsSnippetIntent`](https://developer.apple.com/documentation/appintents/showssnippetintent)
The result of performing an action that present a snippet generated by a `SnippetIntent`-conforming type.
[`protocol TargetContentProvidingIntent`](https://developer.apple.com/documentation/appintents/targetcontentprovidingintent)
[`protocol UISceneAppIntent`](https://developer.apple.com/documentation/appintents/uisceneappintent)
[`protocol UndoableIntent`](https://developer.apple.com/documentation/appintents/undoableintent)
### [Structures](https://developer.apple.com/documentation/appintents#Structures)
[`struct ConfirmationConditions`](https://developer.apple.com/documentation/appintents/confirmationconditions)
Conditions for a confirmation request.
[`struct EntityPropertyModifiers`](https://developer.apple.com/documentation/appintents/entitypropertymodifiers)
[`struct EntityURLRepresentation`](https://developer.apple.com/documentation/appintents/entityurlrepresentation)
The URL representation of an app entity.
[`struct EnumURLRepresentation`](https://developer.apple.com/documentation/appintents/enumurlrepresentation)
The URL representation of an app enum.
[`struct FileEntityIdentifier`](https://developer.apple.com/documentation/appintents/fileentityidentifier)
An identifier for an app entity that refers to a document or other file.
[`struct IntentChoiceOption`](https://developer.apple.com/documentation/appintents/intentchoiceoption)
A structure representing an entry in a list of options for a person to choose from before an app intent resumes its action.
[`struct IntentModes`](https://developer.apple.com/documentation/appintents/intentmodes)
A set of options that describe an app intent’s behavior.
[`struct IntentURLRepresentation`](https://developer.apple.com/documentation/appintents/intenturlrepresentation)
The URL representation of an app intent.
### [Macros](https://developer.apple.com/documentation/appintents#Macros)
[`macro UnionValue()`](https://developer.apple.com/documentation/appintents/unionvalue\(\))
### [Enumerations](https://developer.apple.com/documentation/appintents#Enumerations)
[`enum AppShortcutPhraseToken`](https://developer.apple.com/documentation/appintents/appshortcutphrasetoken)
Dynamic values you can include in the spoken phrases that run your shortcut.
[`enum VideoCategory`](https://developer.apple.com/documentation/appintents/videocategory)
Current page is App Intents 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fappintents).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
