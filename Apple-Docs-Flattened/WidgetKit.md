Source: https://developer.apple.com/documentation/widgetkit

[ Skip Navigation ](https://developer.apple.com/documentation/widgetkit#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/widgetkit#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/widgetkit)
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
[ Open Menu ](https://developer.apple.com/documentation/widgetkit)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/widgetkit)


[](https://developer.apple.com/documentation/widgetkit)
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
Framework
# WidgetKit
Extend the reach of your app by creating widgets, watch complications, Live Activities, and controls.
iOS 14.0+iPadOS 14.0+Mac Catalyst 14.0+macOS 11.0+visionOS 26.0+watchOS 9.0+
## [Overview](https://developer.apple.com/documentation/widgetkit#Overview)
Using WidgetKit, you can make your app’s content available in contexts outside the app and extend its reach by building an ecosystem of glanceable, up-to-date experiences.
![A conceptual image that shows a small widget on iPhone, a rectangular widget on Apple Watch, and a small widget on the Mac desktop.](https://docs-assets.developer.apple.com/published/273bac77dde0ed1da3f887a44dd0a092/widgetkit-hero%402x.png)
The ecosystem that WidgetKit enables consists of: 

**Widgets**
    
Widgets elevate a small amount of timely, personally relevant information from your app, display it where people can see it at a glance, and offer specific app functionality without launching the app. On iPhone and iPad, people put widgets in Today View, on the Home Screen, and on the Lock Screen. On Mac, people put native Mac app widgets on the desktop and in Notification Center. Additionally, people place iPhone widgets in locations like a Mac desktop and Notification Center, or in CarPlay. On Apple Watch, widgets appear in the Smart Stack, and on Apple Vision Pro, widgets become three-dimensional objects that people pin to horizontal and vertical surfaces. 

**Smart Stacks**
    
On iPhone and iPad, people stack widgets on their Home Screen and create Smart Stacks that use Smart Rotate to show the most contextually relevant widget. On Apple Watch, the system intelligently displays widgets that are most relevant to someone’s personal context. Additionally, a person configures a widget to always appear in the Smart Stack or pins it to a fixed position. 

**Watch complications**
    
People place watch complications on the Apple Watch face to view timely, relevant information when they lift their wrist. Additionally, the Smart Stack on Apple Watch offers space for up to three complications. 

**Live Activities**
    
Live Activities display up-to-date content from your app such as event and task information on the Lock Screen or in the Dynamic Island. Live Activities use [ActivityKit](https://developer.apple.com/documentation/ActivityKit) for updates and optionally the Apple Push Notification service (APNs) to send ActivityKit push notifications. For more information, refer to [ActivityKit](https://developer.apple.com/documentation/ActivityKit). 

**Controls**
    
Controls act as a button or toggle that allows people to perform actions you describe with the [App Intents](https://developer.apple.com/documentation/AppIntents) framework in Control Center, on the Lock Screen, and from the Action button. A button control might initiate an action from your app, or open your app to a specific view, and a toggle might turn a light on and off or open and close a garage door. Controls appear in Control Center or as menu bar items and in Control Center on Apple Watch.
### [Develop glanceable features iteratively](https://developer.apple.com/documentation/widgetkit#Develop-glanceable-features-iteratively)
WidgetKit enables features across iPad, iPhone, the Mac, Apple Watch, and Apple Vision Pro, but only in a way that best fits a person’s device and personal needs. For example, WidgetKit powers widgets on all platforms in various sizes. It also powers Live Activities and controls, features that aren’t available on Apple Vision Pro.
Even though not every feature that WidgetKit powers is available on every platform or device, widgets, Live Activities, controls, and watch complications share technology and design similarities. This makes it easy to develop features in tandem and to expand usage across contexts.
Use an iterative approach and start with support for one feature or select sizes of widgets — for example, start with a small widget as described in [Creating a widget extension](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension), but plan and design additional sizes and features across platforms from the beginning. Then allow people to view your content in as many contexts as possible.
For more information, refer to [Developing a WidgetKit strategy](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy).
### [Understand interactivity and personalization](https://developer.apple.com/documentation/widgetkit#Understand-interactivity-and-personalization)
The WidgetKit ecosystem enables people to view your app content in new contexts and offers specific interactions with your app when and where they need it:
  * People tap a widget, watch complication, or Live Activity to launch the corresponding app or the app’s scene with matching information or functionality. For example, tapping an Emoji Ranger widget or watch complication launches the scene in the app that matches the displayed hero. For more information, refer to [Linking to specific app scenes from your widget or Live Activity](https://developer.apple.com/documentation/widgetkit/linking-to-specific-app-scenes-from-your-widget-or-live-activity).
  * People use buttons and toggles in widgets, controls, and Live Activities to interact with your app without launching it. For example, the large widget of the [Emoji Rangers: Supporting Live Activities, interactivity, and animations](https://developer.apple.com/documentation/widgetkit/emoji-rangers-supporting-live-activities-interactivity-and-animations) sample code project includes a button that people tap to give the healing capability of their hero a temporary boost.


In addition to offering relevant information and specific interactivity at a glance, people use widgets, watch complications, Live Activities, and controls to personalize their devices:
  * People configure widgets and watch complications to display details specific to their needs. For example, a widget of the [Emoji Rangers: Supporting Live Activities, interactivity, and animations](https://developer.apple.com/documentation/widgetkit/emoji-rangers-supporting-live-activities-interactivity-and-animations) sample code project allows people to configure the hero that appears on the widget.
  * People arrange widgets and watch complications in the way that works best for them. When they stack widgets and enable Smart Rotate on iPhone or iPad, WidgetKit automatically rotates the most relevant widget to the top, making sure people see the most important details at the right time. On Apple Watch, the Smart Stack displays widgets based on contextual relevance, and people pin a favorite widget to a fixed position in the Smart Stack.


### [Update content with timelines and push notifications](https://developer.apple.com/documentation/widgetkit#Update-content-with-timelines-and-push-notifications)
Widgets and watch complications use a special mechanism to update their content: You create a timeline of data updates and hand it to WidgetKit. WidgetKit then makes sure the widget or complication updates its content in an energy-efficient way. For more information on timelines, refer to [Keeping a widget up to date](https://developer.apple.com/documentation/widgetkit/keeping-a-widget-up-to-date). Additionally, widgets can receive updates by using the Apple Push Notification service (APNs) and remote push notifications.
Live Activities don’t use timelines to update their content. Instead, they use [ActivityKit](https://developer.apple.com/documentation/ActivityKit) and ActivityKit push notifications you send with APNs. For more information, refer to [ActivityKit](https://developer.apple.com/documentation/ActivityKit).
Controls don’t use timelines to update their content. Instead, your controls update their content when someone uses them, the app reloads them, or the system receives a remote push notification from APNs.
### [Create a focused, glanceable design](https://developer.apple.com/documentation/widgetkit#Create-a-focused-glanceable-design)
Widgets, watch complications, Live Activities, and controls are small and require a focused, glanceable design. For design guidance, refer to [Human Interface Guidelines > Widgets](https://developer.apple.com/design/human-interface-guidelines/components/system-experiences/widgets), [Human Interface Guidelines > Complications](https://developer.apple.com/design/human-interface-guidelines/components/system-experiences/complications), [Human Interface Guidelines > Live Activities](https://developer.apple.com/design/human-interface-guidelines/components/system-experiences/live-activities), and [Human Interface Guidelines > Controls](https://developer.apple.com/design/human-interface-guidelines/controls).
## [Topics](https://developer.apple.com/documentation/widgetkit#topics)
### [Essentials](https://developer.apple.com/documentation/widgetkit#Essentials)
[Developing a WidgetKit strategy](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy)
Explore features, tasks, related frameworks, and constraints as you make a plan to implement widgets, controls, watch complications, and Live Activities.
[WidgetKit updates](https://developer.apple.com/documentation/Updates/WidgetKit)
Learn about important changes in WidgetKit.
[Creating a widget extension](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension)
Display your app’s content in a convenient, informative widget on various devices.
[Emoji Rangers: Supporting Live Activities, interactivity, and animations](https://developer.apple.com/documentation/widgetkit/emoji-rangers-supporting-live-activities-interactivity-and-animations)
Offer Live Activities, controls, animate data updates, and add interactivity to widgets.
[`protocol WidgetBundle`](https://developer.apple.com/documentation/SwiftUI/WidgetBundle)
A container used to expose multiple widgets from a single widget extension.
### [System experiences](https://developer.apple.com/documentation/widgetkit#System-experiences)
[API Reference Widgets and watch complications](https://developer.apple.com/documentation/widgetkit/widgets-and-complications-collection)
Allow people to personalize their devices, view relevant information, and perform interactions with widgets and watch complications.
[API Reference Live Activities](https://developer.apple.com/documentation/widgetkit/liveactivities-collection)
Let people track updates from your app with Live Activities.
[API Reference Controls](https://developer.apple.com/documentation/widgetkit/controls-collection)
Offer controls that people place in Control Center, on the Lock Screen, and on the Action button to quickly perform an action from your app.
### [Presentation](https://developer.apple.com/documentation/widgetkit#Presentation)
[Creating views for widgets, Live Activities, and watch complications](https://developer.apple.com/documentation/widgetkit/creating-views-for-widgets-live-activities-and-watch-complications)
Implement glanceable views with WidgetKit and SwiftUI.
[API Reference SwiftUI views for widgets](https://developer.apple.com/documentation/widgetkit/swiftui-views)
Present your app’s content in widgets with SwiftUI views.
### [Interactivity](https://developer.apple.com/documentation/widgetkit#Interactivity)
[Adding interactivity to widgets and Live Activities](https://developer.apple.com/documentation/widgetkit/adding-interactivity-to-widgets-and-live-activities)
Include buttons or toggles in a widget or Live Activity to offer app functionality without launching the app.
[Animating data updates in widgets and Live Activities](https://developer.apple.com/documentation/widgetkit/animating-data-updates-in-widgets-and-live-activities)
Use SwiftUI animations to indicate data updates in your widgets and Live Activities.
[Linking to specific app scenes from your widget or Live Activity](https://developer.apple.com/documentation/widgetkit/linking-to-specific-app-scenes-from-your-widget-or-live-activity)
Add deep links to your widgets and Live Activities that enable people to open a specific scene in your app.
### [Accessibility](https://developer.apple.com/documentation/widgetkit#Accessibility)
[Adding accessible descriptions to widgets and Live Activities](https://developer.apple.com/documentation/ActivityKit/adding-accessible-descriptions-to-widgets-and-live-activities)
Describe the interface elements of your widgets and Live Activities to help people understand what they represent.
### [Previews and debugging](https://developer.apple.com/documentation/widgetkit#Previews-and-debugging)
[Previewing widgets and Live Activities in Xcode](https://developer.apple.com/documentation/widgetkit/previewing-widgets-and-live-activities-in-xcode)
Use Xcode previews to iteratively develop, fine-tune, and troubleshoot widgets and Live Activities.
[`struct WidgetPreviewContext`](https://developer.apple.com/documentation/widgetkit/widgetpreviewcontext)
A specification for the context of a widget preview.
[API Reference Preview macros](https://developer.apple.com/documentation/widgetkit/preview-macros)
Use Swift macros to create widget previews in Xcode.
Current page is WidgetKit 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fwidgetkit).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
