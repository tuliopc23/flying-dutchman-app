Source: https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy

[ Skip Navigation ](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy)
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
[ Open Menu ](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy)


[](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy)
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
  * [ Developing a WidgetKit strategy ](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy)
  *     * Developing a WidgetKit strategy 


Article
# Developing a WidgetKit strategy
Explore features, tasks, related frameworks, and constraints as you make a plan to implement widgets, controls, watch complications, and Live Activities.
## [Overview](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy#Overview)
Use WidgetKit to build widgets, controls, watch complications, and Live Activities. When you offer these system experiences, your app becomes part of the widget ecosystem across platforms and devices, and expands its reach by taking up limited but effective, eye-catching space. System experiences that use WidgetKit as a foundation rely on a set of related frameworks and share design and functional similarities, making them great candidates for code and design component reuse.
To avoid costly changes in your app’s development process, plan your WidgetKit adoption before you create designs and write code. As you make your plans, take into account:
  * Feature availability for each platform
  * Frameworks to use in addition to WidgetKit
  * Required appearances and available sizes for widgets, watch complications, and Live Activities
  * Technology that powers content updates
  * Animation
  * Interactivity with your app through deep links, buttons, and toggles
  * Configuration options for widgets and watch complications
  * Visibility in Smart Stacks
  * Functional constraints


Then, approach WidgetKit adoption iteratively. For example, start with a nonconfigurable [`WidgetFamily.systemSmall`](https://developer.apple.com/documentation/widgetkit/widgetfamily/systemsmall) widget as described in [Creating a widget extension](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension) because it gives your content broad exposure in the WidgetKit ecosystem on iPhone, iPad, Mac, and Apple Vision Pro. Then, add support for configuration, additional widget sizes, and — depending on your app’s features — Live Activities or a watchOS app with watch complications.
### [Review system experiences for each platform](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy#Review-system-experiences-for-each-platform)
Widgets come in different sizes, from circular accessory widgets on the Lock Screen and complications on Apple Watch to extra-large widgets on Apple Vision Pro. You can choose the sizes and complications you want to support, but consider supporting as many sizes and complications as possible.
Live Activities are available on iPhone and iPad and appear on the Lock Screen and in the Dynamic Island on supported devices. Additionally, Live Activities appear on a paired Mac or Apple Watch, and in CarPlay. When you add support for Live Activities, you need to create minimal, compact, and extended presentations that make sure your Live Activities appear correctly for each platform.
In iOS, iPadOS, and macOS, your app can offer controls people place in Control Center. On Mac, people can also place controls on the menu bar as menu bar items. On Apple Watch, controls from your watchOS app or a paired iPhone appear in Control Center and the Smart Stack, and people can place them on the Action button of Apple Watch Ultra.
This table shows the functionality available for each platform:
Widget size or technology | iPhone | iPad | Apple Watch | Mac | Apple Vision Pro  
---|---|---|---|---|---  
Small system widgets | Home Screen, Today View, and StandBy | Home Screen, Today View, and Lock Screen | No | Yes | Yes  
Medium system widgets | Home Screen and Today View | Home Screen and Today View | No | Yes | Yes  
Large system widgets | Home Screen and Today View | Home Screen and Today View | No | Yes | Yes  
Extra large system widgets | No | Home Screen and Today View | No | Yes | Yes  
Extra large system widgets (portrait) | No | No | No | No | Yes  
Circular accessory widgets | Lock Screen | Lock Screen | Watch complications and Smart Stack | No | No  
Corner accessory widgets | No | No | Watch complications | No | No  
Rectangular accessory widgets | Lock Screen | Lock Screen | Watch complications and Smart Stack | No | No  
Inline accessory widgets | Lock Screen | Lock Screen | Watch complications | No | No  
Live Activities | Yes | Yes | From a paired iPhone | From a paired iPhone | No  
Controls | Yes | Yes | Yes | Yes | No  
### [Leverage additional frameworks](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy#Leverage-additional-frameworks)
Widgets, watch complications, controls, and Live Activities use a widget extension you add to your Xcode project. The role of WidgetKit is to provide the infrastructure and configuration for the features it enables. Based on features and platforms you support, use WidgetKit in combination with other frameworks as follows:
  * To create the user interface for each feature, use [SwiftUI](https://developer.apple.com/documentation/SwiftUI).
  * To add interactivity to widgets and Live Activities, use [SwiftUI](https://developer.apple.com/documentation/SwiftUI) and the [App Intents](https://developer.apple.com/documentation/AppIntents) framework.
  * To offer watch complications and watchOS widgets, create a watchOS app.
  * To offer configurable widgets and watch complications, use [App Intents](https://developer.apple.com/documentation/AppIntents).
  * To provide the contextual clues that the system uses for Smart Stacks and to offer Widget Suggestions, use [App Intents](https://developer.apple.com/documentation/AppIntents) and [RelevanceKit](https://developer.apple.com/documentation/RelevanceKit).
  * To start, update, and end Live Activities, use [ActivityKit](https://developer.apple.com/documentation/ActivityKit).


### [Support different appearances](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy#Support-different-appearances)
Depending on the context, a widget or Live Activity changes its appearance to best fit its context. For example, a [`WidgetFamily.systemSmall`](https://developer.apple.com/documentation/widgetkit/widgetfamily/systemsmall) widget appears as follows:
  * On the Home Screen of iPhone and iPad, it uses it uses the [`accented`](https://developer.apple.com/documentation/widgetkit/widgetrenderingmode/accented) rendering mode for light and dark appearances, and [`fullColor`](https://developer.apple.com/documentation/widgetkit/widgetrenderingmode/fullcolor) on devices that run iOS and iPad 18 or older.
  * On the Lock Screen of iPad and iPhone, it uses the [`vibrant`](https://developer.apple.com/documentation/widgetkit/widgetrenderingmode/vibrant) rendering mode that provides a vibrant, blurred appearance. On the Lock Screen of iPhone in StandBy and StandBy in Night Mode, it renders scaled up in size using the [`vibrant`](https://developer.apple.com/documentation/widgetkit/widgetrenderingmode/vibrant) rendering mode.
  * In CarPlay, it renders scaled-up in size using the [`fullColor`](https://developer.apple.com/documentation/widgetkit/widgetrenderingmode/fullcolor) rendering mode with the background removed.
  * On Mac, it uses the [`accented`](https://developer.apple.com/documentation/widgetkit/widgetrenderingmode/accented) rendering mode. On older versions of macOS, it uses the [`fullColor`](https://developer.apple.com/documentation/widgetkit/widgetrenderingmode/fullcolor) or [`vibrant`](https://developer.apple.com/documentation/widgetkit/widgetrenderingmode/vibrant) modes.


Similarly, the [`WidgetFamily.accessoryRectangular`](https://developer.apple.com/documentation/widgetkit/widgetfamily/accessoryrectangular) widget appears as follows:
  * On the Lock Screen of iPhone and iPad, it takes on the [`vibrant`](https://developer.apple.com/documentation/widgetkit/widgetrenderingmode/vibrant) appearance.
  * On Apple Watch, it appears as a watch complication without a background and the [`accented`](https://developer.apple.com/documentation/widgetkit/widgetrenderingmode/accented) appearance and in a [`fullColor`](https://developer.apple.com/documentation/widgetkit/widgetrenderingmode/fullcolor) appearance in the Smart Stack.


With each feature you add to your app, make sure your widget, watch complication, or Live Activity supports all applicable contexts and appearances well. For more information, refer to [Preparing widgets for additional platforms, contexts, and appearances](https://developer.apple.com/documentation/widgetkit/preparing-widgets-for-additional-contexts-and-appearances). For design guidance, refer to [Human Interface Guidelines > Widgets](https://developer.apple.com/design/human-interface-guidelines/components/system-experiences/widgets).
### [Animate content updates](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy#Animate-content-updates)
Widgets and Live Activities can use animations to draw a person’s attention to data updates, inclusing custom animations. For more information, refer to [Animating data updates in widgets and Live Activities](https://developer.apple.com/documentation/widgetkit/animating-data-updates-in-widgets-and-live-activities).
### [Provide up-to-date information](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy#Provide-up-to-date-information)
Widgets and watch complications use a different mechanism than your app to update their content. They use a timeline of data updates that you create in your app and hand to WidgetKit. You maintain this timeline as your app receives new data, but, to optimize battery life for a device, each app has a budget to update its widgets or complications. Additionally, the system batches and schedules updates to preserve power. For more information on how timelines work and how you can keep your widgets and watch complications up to date, refer to [Keeping a widget up to date](https://developer.apple.com/documentation/widgetkit/keeping-a-widget-up-to-date) and [Making network requests in a widget extension](https://developer.apple.com/documentation/widgetkit/making-network-requests-in-a-widget-extension). Additionally, widgets can update their data with the Apple Push Notification service (APNs) and WidgetKit push notifications.
Live Activities don’t use timelines to update their content. Instead, they use [ActivityKit](https://developer.apple.com/documentation/ActivityKit) and ActivityKit push notifications you send with APNs. For more information, refer to [ActivityKit](https://developer.apple.com/documentation/ActivityKit).
Controls also don’t use timelines to update their content. Instead, they update their content when someone uses them, the app reloads them, or the system receives a remote push notification from APNs. For more information, refer to [Updating controls locally and remotely](https://developer.apple.com/documentation/widgetkit/updating-controls-locally-and-remotely).
### [Add specific app functionality to your widgets and Live Activities](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy#Add-specific-app-functionality-to-your-widgets-and-Live-Activities)
By default, people tap a widget, watch complication, or Live Activity to launch its corresponding app. To make the experience more intuitive and require fewer interactions, you can use deep linking to launch the scene of your app that matches the widget’s visible content. Widgets that offer enough space, such as [`WidgetFamily.systemSmall`](https://developer.apple.com/documentation/widgetkit/widgetfamily/systemsmall) or larger — and Live Activities in the extended or the Lock Screen appearance — add SwiftUI’s [`Link`](https://developer.apple.com/documentation/SwiftUI/Link) to your views and allow people to open different screens in your app.
Note
In iOS 16 and macOS 13 or earlier versions, only large and extra-large widgets can use [`Link`](https://developer.apple.com/documentation/SwiftUI/Link).
Widgets offer direct interaction with your app using the [App Intents](https://developer.apple.com/documentation/AppIntents) framework and SwiftUI. Both [`Button`](https://developer.apple.com/documentation/SwiftUI/Button) and [`Toggle`](https://developer.apple.com/documentation/SwiftUI/Toggle) offer dedicated initializers for this purpose. For more information, refer to [Adding interactivity to widgets and Live Activities](https://developer.apple.com/documentation/widgetkit/adding-interactivity-to-widgets-and-live-activities).
### [Offer configurable widgets and watch complications](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy#Offer-configurable-widgets-and-watch-complications)
Make it possible for people to select the information they want to view in the widget or a watch complication by offering configurable widgets and complications that provide customizable properties. For example, people might choose to stay informed about a specific stock in a stock market widget, or enter a tracking number for a package delivery widget. Configurable widgets and complications use the [App Intents](https://developer.apple.com/documentation/AppIntents) framework and custom intents you define — the same mechanism you use to support system-level services like Siri and the Shortcuts app. For information about creating configurable widgets and complications, refer to [Making a configurable widget](https://developer.apple.com/documentation/widgetkit/making-a-configurable-widget).
### [Increase visibility in Smart Stacks](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy#Increase-visibility-in-Smart-Stacks)
On iPhone and iPad, people create stacks of widgets and swipe through them manually. Additionally, people use Smart Stacks with Smart Rotate to view the most relevant widgets and see widget suggestions. To show relevant widgets at the top of Smart Stacks, iOS and iPadOS rely on behavioral clues that apps provide during use. On Apple Watch, people can place and pin widgets in the Smart Stack, but they rely more heavily on the system to automatically display contextually relevant widgets. To determine the most relevant widgets, watchOS queries your widget extension for contextual clues.
For more information, refer to [Increasing the visibility of widgets in Smart Stacks](https://developer.apple.com/documentation/widgetkit/widget-suggestions-in-smart-stacks).
### [Consider user privacy](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy#Consider-user-privacy)
The Lock Screen and watch faces are always visible, and people can configure widgets and complications to hide sensitive information when the device is locked or supports Always On. Review data that appears on your widget, Live Activity, or complication, and make sure you support redaction of sensitive data. For additional information, refer to [Creating a widget extension](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension).
### [Store shared data in a group container](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy#Store-shared-data-in-a-group-container)
To add widgets, watch complications, and Live Activities, you create a widget extension and add it to your app, and the extension target and your app are part of the same app group. As a result, you can store files and data in a shared container that’s accessible to the app and the widget extension. For example, your app can download data and store it in a database in the shared container, and then a widget can access the database.
For additional information about app groups and accessing a shared container, refer to [Configuring app groups](https://developer.apple.com/documentation/Xcode/configuring-app-groups).
### [Respect functional constraints](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy#Respect-functional-constraints)
Widgets, watch complications, and Live Activities are always visible. To preserve battery life and user privacy, they follow certain constraints. For example, Live Activities can’t access a person’s location. The following table shows availability features that impact battery life or user privacy for each feature:
Functionality | Widgets | Watch complications | Live Activities  
---|---|---|---  
Network access | Yes | Yes | No  
Location access | Yes | Yes | No  
For additional information, refer to [Accessing location information in widgets](https://developer.apple.com/documentation/widgetkit/accessing-location-information-in-widgets).
## [See Also](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy#see-also)
### [Essentials](https://developer.apple.com/documentation/widgetkit/developing-a-widgetkit-strategy#Essentials)
[WidgetKit updates](https://developer.apple.com/documentation/Updates/WidgetKit)
Learn about important changes in WidgetKit.
[Creating a widget extension](https://developer.apple.com/documentation/widgetkit/creating-a-widget-extension)
Display your app’s content in a convenient, informative widget on various devices.
[Emoji Rangers: Supporting Live Activities, interactivity, and animations](https://developer.apple.com/documentation/widgetkit/emoji-rangers-supporting-live-activities-interactivity-and-animations)
Offer Live Activities, controls, animate data updates, and add interactivity to widgets.
[`protocol WidgetBundle`](https://developer.apple.com/documentation/SwiftUI/WidgetBundle)
A container used to expose multiple widgets from a single widget extension.
Current page is Developing a WidgetKit strategy 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fwidgetkit%2Fdeveloping-a-widgetkit-strategy).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
