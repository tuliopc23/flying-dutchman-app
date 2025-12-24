Source: https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available

[ Skip Navigation ](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available)
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
[ Open Menu ](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available)
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
  * [ Making actions and content discoverable and widely available ](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available)
  *     * Making actions and content discoverable and widely available 


Article
# Making actions and content discoverable and widely available
Adopt App Intents to make your app discoverable with Spotlight, controls, widgets, and the Action button.
## [Overview](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available#Overview)
The App Intents framework offers functionality to express your app’s actions and data in a way that enables deep integration with system capabilities Apple Intelligence provides and system experiences like Spotlight. Use App Intents to enable people to view your app’s content and to use its actions when and where they need them — whether they’re using your app or are elsewhere in the system.
The App Intents API is a fundamental framework that facilitates deep integration with system experiences across platforms and devices. You use the framework to express data and actions once to build a reusable foundation for many experiences and features. For example, use App Intents to integrate your app with Siri and Apple Intelligence, then reuse the code to create controls and interactive widgets in combination with [WidgetKit](https://developer.apple.com/documentation/WidgetKit).
Note
Siri’s personal context understanding, onscreen awareness, and in-app actions are in development and will be available with a future software update.
### [Review experiences that App Intents enables directly](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available#Review-experiences-that-App-Intents-enables-directly)
When you use the App Intents framework to express your app’s actions and data, you integrate your app with system experiences that offer broad visibility for your app and content and make its functionality available outside of the app itself; for example:
  * People will use Siri to perform app actions.
  * People find App Shortcuts you create in the Shortcuts app and initiate them throughout the system, across platforms and devices with Siri, Spotlight, the Action button, Apple Pencil Pro, and more.
  * Using the Shortcuts app, people create custom shortcuts with your app’s functionality and entirely new workflows across apps.
  * People reduce distractions with Focus, and you use the App Intents framework to respond to Focus changes.


On supported devices, the App Intents framework will provide integration with Apple Intelligence, a personal intelligence system that deeply integrates powerful generative models into the core of iPhone, iPad, and Mac. Siri will draw on the capabilities of Apple Intelligence to deliver assistance that’s natural, contextually relevant, and personal for everyone, including in the apps they use every day. The App Intents framework will enable you to express your app’s capabilities and content, giving the system access to this context and integrating your app with Siri and Apple Intelligence, and unlocking new ways for people to interact with it from anywhere on their device. For more information, refer to [Integrating actions with Siri and Apple Intelligence](https://developer.apple.com/documentation/appintents/integrating-actions-with-siri-and-apple-intelligence) and [Making onscreen content available to Siri and Apple Intelligence](https://developer.apple.com/documentation/appintents/making-onscreen-content-available-to-siri-and-apple-intelligence).
### [Understand experiences that use App Intents API](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available#Understand-experiences-that-use-App-Intents-API)
Across devices, your app’s content and actions appear in additional system experiences you create with a combination of the App Intents framework and other frameworks. As a result, adopting App Intents not only helps you adopt features the framework enables directly, it allows you to easily support additional system experiences that increase your app’s reach and allow people to personalize how they use your app. Use the App Intents framework to describe actions and content together with:
  * [WidgetKit](https://developer.apple.com/documentation/WidgetKit) to offer interactive and configurable widgets, watch complications, and controls
  * [ActivityKit](https://developer.apple.com/documentation/ActivityKit) to offer interactive Live Activities
  * [Core Spotlight](https://developer.apple.com/documentation/CoreSpotlight) to enable people to find your content using semantic search in Spotlight


### [Plan App Intents framework adoption](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available#Plan-App-Intents-framework-adoption)
If you’re new to the App Intents framework, first evaluate your app’s functionality and content. The framework is a fundamental building block for apps, and enables a broad range of user experiences, so it’s important to design a new app with App Intents functionality in mind. Similarly, consider a measured, thoughtful approach when adopting App Intents in your existing app.
To get started:
  1. Understand the role of the App Intents framework and the experiences it enables.
  2. Review key framework concepts and create a first implementation that launches your app with an [`AppIntent`](https://developer.apple.com/documentation/appintents/appintent) and add an App Shortcut. For more information, see [Creating your first app intent](https://developer.apple.com/documentation/appintents/creating-your-first-app-intent) and [App Shortcuts](https://developer.apple.com/documentation/appintents/app-shortcuts).
  3. Express additional actions and content using the App Intents framework.
  4. Integrate actions and content with Siri and Apple Intelligence. For more information, see [App intent domains](https://developer.apple.com/documentation/appintents/app-intent-domains) and [Integrating actions with Siri and Apple Intelligence](https://developer.apple.com/documentation/appintents/integrating-actions-with-siri-and-apple-intelligence).
  5. Depending on your app’s functionality, add support for additional system experiences and interactions that fit your app’s functionality. For example, respond to Focus changes as described in [Focus](https://developer.apple.com/documentation/appintents/focus) or add support for the Action button and squeeze gestures on Apple Pencil Pro, as described in [Responding to the Action button on Apple Watch Ultra](https://developer.apple.com/documentation/appintents/actionbuttonarticle).


### [Expand existing App Intents usage](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available#Expand-existing-App-Intents-usage)
If you’re currently using the App Intents framework in your app, you might limit app intents to selected actions and content. The App Intents framework will provide integration with Siri and Apple Intelligence for every action of your app and its content. Review your app’s actions and content, and consider expressing actions and content with App Intents.
### [Understand the impact of removing app intents and shortcuts](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available#Understand-the-impact-of-removing-app-intents-and-shortcuts)
People use app intents to automate workflows with custom shortcuts and [App Shortcuts](https://developer.apple.com/documentation/appintents/app-shortcuts). As a result, removing [`AppIntent`](https://developer.apple.com/documentation/appintents/appintent) code or an App Shortcut from your app can break people’s workflows and confuse or frustrate them because previously available functionality might stop working. Keep this in mind when you adopt the App Intents framework and consider a deprecation strategy for your [`AppIntent`](https://developer.apple.com/documentation/appintents/appintent) code. When you plan to remove an [`AppIntent`](https://developer.apple.com/documentation/appintents/appintent), give people notice about your intention to remove the app intent. Publish a release where you change an existing [`AppIntent`](https://developer.apple.com/documentation/appintents/appintent) to [`DeprecatedAppIntent`](https://developer.apple.com/documentation/appintents/deprecatedappintent) and offer people a suggested replacement. After giving people enough time to update their custom shortcuts and move to new App Shortcuts, remove the [`DeprecatedAppIntent`](https://developer.apple.com/documentation/appintents/deprecatedappintent) from your app.
### [Know when to migrate to the App Intents framework](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available#Know-when-to-migrate-to-the-App-Intents-framework)
For new functionality, use the App Intents framework to integrate your app with system experiences like widgets, controls, and Live Activities. Siri and Apple Intelligence automatically will leverage SiriKit intents. For existing functionality keep existing SiriKit implementations and take a measured approach to replacing SiriKit code with App Intents. If you remove code that uses SiriKit, give people advance notice about changes to avoid breaking their existing custom shortcuts and make sure to provide the same or comparable functionality that uses App Intents.
For more information about migrating your SiriKit code to App Intents, see [Soup Chef with App Intents: Migrating custom intents](https://developer.apple.com/documentation/SiriKit/soup-chef-with-app-intents-migrating-custom-intents).
## [See Also](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available#see-also)
### [Essentials](https://developer.apple.com/documentation/appintents/making-actions-and-content-discoverable-and-widely-available#Essentials)
[App Intents updates](https://developer.apple.com/documentation/Updates/AppIntents)
Learn about important changes in App Intents.
[Creating your first app intent](https://developer.apple.com/documentation/appintents/creating-your-first-app-intent)
Create your first app intent that makes your app available in system experiences like Spotlight or the Shortcuts app.
[Adopting App Intents to support system experiences](https://developer.apple.com/documentation/appintents/adopting-app-intents-to-support-system-experiences)
Create app intents and entities to incorporate system experiences such as Spotlight, visual intelligence, and Shortcuts.
[Accelerating app interactions with App Intents](https://developer.apple.com/documentation/appintents/acceleratingappinteractionswithappintents)
Enable people to use your app’s features quickly through Siri, Spotlight, and Shortcuts.
Current page is Making actions and content discoverable and widely available 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fappintents%2Fmaking-actions-and-content-discoverable-and-widely-available).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
