Source: https://developer.apple.com/documentation/widgetkit/animating-data-updates-in-widgets-and-live-activities

[ Skip Navigation ](https://developer.apple.com/documentation/widgetkit/animating-data-updates-in-widgets-and-live-activities#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/widgetkit/animating-data-updates-in-widgets-and-live-activities#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/widgetkit/animating-data-updates-in-widgets-and-live-activities)
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
[ Open Menu ](https://developer.apple.com/documentation/widgetkit/animating-data-updates-in-widgets-and-live-activities)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/widgetkit/animating-data-updates-in-widgets-and-live-activities)


[](https://developer.apple.com/documentation/widgetkit/animating-data-updates-in-widgets-and-live-activities)
## [ WidgetKit  ](https://developer.apple.com/documentation/widgetkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 23 symbols inside <root>
Essentials
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
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
19 of 23 symbols inside <root> [Adding accessible descriptions to widgets and Live Activities](https://developer.apple.com/documentation/activitykit/adding-accessible-descriptions-to-widgets-and-live-activities)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
20 of 23 symbols inside <root>
Previews and debugging
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
21 of 23 symbols inside <root> [Previewing widgets and Live Activities in Xcode](https://developer.apple.com/documentation/widgetkit/previewing-widgets-and-live-activities-in-xcode)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
22 of 23 symbols inside <root> containing 2 symbols[WidgetPreviewContext](https://developer.apple.com/documentation/widgetkit/widgetpreviewcontext)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
23 of 23 symbols inside <root> containing 14 symbols[Preview macros](https://developer.apple.com/documentation/widgetkit/preview-macros)
23 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ WidgetKit ](https://developer.apple.com/documentation/widgetkit)
  * [ Animating data updates in widgets and Live Activities ](https://developer.apple.com/documentation/widgetkit/animating-data-updates-in-widgets-and-live-activities)
  *     * Animating data updates in widgets and Live Activities 


Article
# Animating data updates in widgets and Live Activities
Use SwiftUI animations to indicate data updates in your widgets and Live Activities.
## [Overview](https://developer.apple.com/documentation/widgetkit/animating-data-updates-in-widgets-and-live-activities#Overview)
Animations bring your widgets and Live Activities to life and alert a person when new information is available. Widgets and Live Activities animate data updates with default animations or SwiftUI animations you choose, bringing a person’s attention to updated data. In earlier OS versions, widgets don’t animate, and Live Activities only use a subset of SwiftUI transitions and animations.
Note
Animations in widgets and Live Activities have a maximum duration of two seconds.
For example, text views animate content changes with blurred content transitions by default, and changes to images and SF Symbols animate with default content transitions. If you add or remove views from the interface based on timeline updates or other state changes, views fade in and out.
Related session from WWDC23
[Session 10028: Bring widgets to life](https://developer.apple.com/videos/play/wwdc2023/10028)
To replace default animations and transitions:
  * Configure built-in transitions like [`opacity`](https://developer.apple.com/documentation/SwiftUI/AnyTransition/opacity), [`move(edge:)`](https://developer.apple.com/documentation/SwiftUI/AnyTransition/move\(edge:\)), [`slide`](https://developer.apple.com/documentation/SwiftUI/AnyTransition/slide), [`push(from:)`](https://developer.apple.com/documentation/SwiftUI/AnyTransition/push\(from:\)), or combinations of them.
  * Add [`transition(_:)`](https://developer.apple.com/documentation/SwiftUI/View/transition\(_:\)-2vjb8), [`contentTransition(_:)`](https://developer.apple.com/documentation/SwiftUI/View/contentTransition\(_:\)), or [`animation(_:value:)`](https://developer.apple.com/documentation/SwiftUI/View/animation\(_:value:\)) to views.
  * Request animations for timer text with [`numericText(countsDown:)`](https://developer.apple.com/documentation/SwiftUI/ContentTransition/numericText\(countsDown:\)).


Important
On devices that include an Always-On display, the system doesn’t perform animations to preserve battery life in Always On. Check the [`isLuminanceReduced`](https://developer.apple.com/documentation/SwiftUI/EnvironmentValues/isLuminanceReduced) environment value to detect reduced luminance before animating content changes.
For Live Activities that appear on devices that run iOS 16 or earlier, the system ignores any animation modifiers — for example, [`withAnimation(_:_:)`](https://developer.apple.com/documentation/SwiftUI/withAnimation\(_:_:\)) and [`animation(_:value:)`](https://developer.apple.com/documentation/SwiftUI/View/animation\(_:value:\)) — and uses the system’s animation timing instead. However, you can use built-in transitions like [`opacity`](https://developer.apple.com/documentation/SwiftUI/AnyTransition/opacity), [`move(edge:)`](https://developer.apple.com/documentation/SwiftUI/AnyTransition/move\(edge:\)), [`slide`](https://developer.apple.com/documentation/SwiftUI/AnyTransition/slide), [`push(from:)`](https://developer.apple.com/documentation/SwiftUI/AnyTransition/push\(from:\)), or combinations of them.
For more information about SwiftUI animations, refer to [Animations](https://developer.apple.com/documentation/SwiftUI/Animations).
### [Add transitions and animations to views that update their data](https://developer.apple.com/documentation/widgetkit/animating-data-updates-in-widgets-and-live-activities#Add-transitions-and-animations-to-views-that-update-their-data)
In addition to the default transitions and animations that the system performs when views update their data, you can choose other built-in SwiftUI transitions and animations. Widgets and Live Activities support all built-in SwiftUI transitions and animations. For example, you could configure a content transition for numeric text as shown in this example:
```
Text(totalCaffeine.formatCaffeine())
    .font(.title)
    .minimumScaleFactor (0.8)
    .contentTransition(.numericText())

```

Additionally, you could add a spring animation to the transition:
```
Text (totalCaffeine.formatCaffeine())
    .font(.title)
    .minimumScaleFactor (0.8)
    .contentTransition(.numericText())
    .animation(.spring(duration: 0.2), value: totalCaffeine)

```

To use custom text animations, use [`contentTransition(_:)`](https://developer.apple.com/documentation/SwiftUI/View/contentTransition\(_:\)) as shown in the example above. To use the default text animation, use [`transition(_:)`](https://developer.apple.com/documentation/SwiftUI/View/transition\(_:\)-2vjb8), and customize its speed and delay as shown in the following example:
```
Text("Some text with \(entry.value) that changes.")
    .animation(.default.speed(0.25).delay(0.5), value: entry.value)

```

### [Add transitions and animations to additional views](https://developer.apple.com/documentation/widgetkit/animating-data-updates-in-widgets-and-live-activities#Add-transitions-and-animations-to-additional-views)
In addition to adding transitions or animations to a view that changes its data, you can animate a view when other widget information changes. To animate a view when a certain value changes, first associate the view you want to animate with that value’s data model object. This is easiest when your data model conforms to the [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable) protocol. If your data model doesn’t conform to `Hashable`, change its code accordingly. Then, associate the view with the data model using the [`id(_:)`](https://developer.apple.com/documentation/SwiftUI/View/id\(_:\)) view modifier. Finally, add a transition or animation.
The following example shows how the `LastDrinkView` adds a push transition when the associated `log` changes.
```
struct LastDrinkView: View {
    let log: CaffeineLog
    var dateFormatStyle: Date.FormatStyle {
        Date.FormatStyle(date: .omitted, time: .shortened)
    }


    var body: some View {
        VStack(alignment: .leading) {
            Text(log.drink.name)
                .bold()
            Text ("\(log.date, format: .dateformatStyle) • \(log.drink.caffeine.formatCaffeine())")
        }
        .font (.caption)
        .id(log) // Associate the view with the data model.
        .transition(.push(from: .bottom))
    }
}

```

### [Disable animations](https://developer.apple.com/documentation/widgetkit/animating-data-updates-in-widgets-and-live-activities#Disable-animations)
If a content update changes many views in your widget or Live Activity, consider disabling transitions and animations for some views to direct a person’s attention to the most important updates. To disable animations for a view, including default animations, pass [`identity`](https://developer.apple.com/documentation/SwiftUI/ContentTransition/identity) to [`transition(_:)`](https://developer.apple.com/documentation/SwiftUI/View/transition\(_:\)-5h5h0) or `nil` to the `animation` parameter of [`withAnimation(_:_:)`](https://developer.apple.com/documentation/SwiftUI/withAnimation\(_:_:\)) and [`animation(_:value:)`](https://developer.apple.com/documentation/SwiftUI/View/animation\(_:value:\)).
Note
[`Transaction`](https://developer.apple.com/documentation/SwiftUI/Transaction) isn’t available to widgets and Live Activities, so you can’t cancel or deactivate an animation by setting the transaction’s [`animation`](https://developer.apple.com/documentation/SwiftUI/Transaction/animation) property to `nil`.
## [See Also](https://developer.apple.com/documentation/widgetkit/animating-data-updates-in-widgets-and-live-activities#see-also)
### [Interactivity](https://developer.apple.com/documentation/widgetkit/animating-data-updates-in-widgets-and-live-activities#Interactivity)
[Adding interactivity to widgets and Live Activities](https://developer.apple.com/documentation/widgetkit/adding-interactivity-to-widgets-and-live-activities)
Include buttons or toggles in a widget or Live Activity to offer app functionality without launching the app.
[Linking to specific app scenes from your widget or Live Activity](https://developer.apple.com/documentation/widgetkit/linking-to-specific-app-scenes-from-your-widget-or-live-activity)
Add deep links to your widgets and Live Activities that enable people to open a specific scene in your app.
Current page is Animating data updates in widgets and Live Activities 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fwidgetkit%2Fanimating-data-updates-in-widgets-and-live-activities).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
