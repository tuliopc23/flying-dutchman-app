Source: https://developer.apple.com/documentation/SwiftUI/App-organization

[ Skip Navigation ](https://developer.apple.com/documentation/SwiftUI/App-organization#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/SwiftUI/App-organization#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/SwiftUI/App-organization)
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
[ Open Menu ](https://developer.apple.com/documentation/SwiftUI/App-organization)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/SwiftUI/App-organization)
## [ SwiftUI  ](https://developer.apple.com/documentation/swiftui)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 63 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 63 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 63 symbols inside <root> [Adopting Liquid Glass](https://developer.apple.com/documentation/technologyoverviews/adopting-liquid-glass)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 63 symbols inside <root> [Learning SwiftUI](https://developer.apple.com/tutorials/swiftui-concepts)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 63 symbols inside <root> [Exploring SwiftUI Sample Apps](https://developer.apple.com/tutorials/sample-apps)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 63 symbols inside <root> [SwiftUI updates](https://developer.apple.com/documentation/updates/swiftui)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 63 symbols inside <root> containing 5 symbols[Landmarks: Building an app with Liquid Glass](https://developer.apple.com/documentation/swiftui/landmarks-building-an-app-with-liquid-glass)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 63 symbols inside <root>
App structure
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
8 of 63 symbols inside <root> containing 21 symbols[App organization](https://developer.apple.com/documentation/swiftui/app-organization)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 21 symbols inside 984080041 
Creating an app
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 21 symbols inside 984080041 [Destination Video](https://developer.apple.com/documentation/visionos/destination-video)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 21 symbols inside 984080041 [Hello World](https://developer.apple.com/documentation/visionos/world)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 21 symbols inside 984080041 [Backyard Birds: Building an app with SwiftData and widgets](https://developer.apple.com/documentation/swiftui/backyard-birds-sample)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 21 symbols inside 984080041 [Food Truck: Building a SwiftUI multiplatform app](https://developer.apple.com/documentation/swiftui/food-truck-building-a-swiftui-multiplatform-app)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 21 symbols inside 984080041 [Fruta: Building a feature-rich app with SwiftUI](https://developer.apple.com/documentation/appclip/fruta-building-a-feature-rich-app-with-swiftui)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 21 symbols inside 984080041 [Migrating to the SwiftUI life cycle](https://developer.apple.com/documentation/swiftui/migrating-to-the-swiftui-life-cycle)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
8 of 21 symbols inside 984080041 containing 6 symbols[App](https://developer.apple.com/documentation/swiftui/app)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 21 symbols inside 984080041 
Targeting iOS and iPadOS
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
10 of 21 symbols inside 984080041 [UILaunchScreen](https://developer.apple.com/documentation/bundleresources/information-property-list/uilaunchscreen)
84 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Collection
  * [ SwiftUI ](https://developer.apple.com/documentation/swiftui)
  * [ App organization ](https://developer.apple.com/documentation/SwiftUI/App-organization)
  *     * App organization 


API Collection
# App organization
Define the entry point and top-level structure of your app.
## [Overview](https://developer.apple.com/documentation/SwiftUI/App-organization#Overview)
Describe your app’s structure declaratively, much like you declare a view’s appearance. Create a type that conforms to the [`App`](https://developer.apple.com/documentation/swiftui/app) protocol and use it to enumerate the [Scenes](https://developer.apple.com/documentation/swiftui/scenes) that represent aspects of your app’s user interface.
![](https://docs-assets.developer.apple.com/published/37814b39f4f1ecc76cd13f967145c10e/app-organization-hero%402x.png)
SwiftUI enables you to write code that works across all of Apple’s platforms. However, it also enables you to tailor your app to the specific capabilities of each platform. For example, if you need to respond to the callbacks that the system traditionally makes on a UIKit, AppKit, or WatchKit app’s delegate, define a delegate object and instantiate it in your app structure using an appropriate delegate adaptor property wrapper, like [`UIApplicationDelegateAdaptor`](https://developer.apple.com/documentation/swiftui/uiapplicationdelegateadaptor).
For platform-specific design guidance, see [Getting started](https://developer.apple.com/design/Human-Interface-Guidelines/getting-started) in the Human Interface Guidelines.
## [Topics](https://developer.apple.com/documentation/SwiftUI/App-organization#topics)
### [Creating an app](https://developer.apple.com/documentation/SwiftUI/App-organization#Creating-an-app)
[Destination Video](https://developer.apple.com/documentation/visionOS/destination-video)
Leverage SwiftUI to build an immersive media experience in a multiplatform app.
[Hello World](https://developer.apple.com/documentation/visionOS/World)
Use windows, volumes, and immersive spaces to teach people about the Earth.
[Backyard Birds: Building an app with SwiftData and widgets](https://developer.apple.com/documentation/swiftui/backyard-birds-sample)
Create an app with persistent data, interactive widgets, and an all new in-app purchase experience.
[Food Truck: Building a SwiftUI multiplatform app](https://developer.apple.com/documentation/swiftui/food-truck-building-a-swiftui-multiplatform-app)
Create a single codebase and app target for Mac, iPad, and iPhone.
[Fruta: Building a feature-rich app with SwiftUI](https://developer.apple.com/documentation/AppClip/fruta-building-a-feature-rich-app-with-swiftui)
Create a shared codebase to build a multiplatform app that offers widgets and an App Clip.
[Migrating to the SwiftUI life cycle](https://developer.apple.com/documentation/swiftui/migrating-to-the-swiftui-life-cycle)
Use a scene-based life cycle in SwiftUI while keeping your existing codebase.
[`protocol App`](https://developer.apple.com/documentation/swiftui/app)
A type that represents the structure and behavior of an app.
### [Targeting iOS and iPadOS](https://developer.apple.com/documentation/SwiftUI/App-organization#Targeting-iOS-and-iPadOS)
[`UILaunchScreen`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/UILaunchScreen)
The user interface to show while an app launches.
[`UILaunchScreens`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/UILaunchScreens)
The user interfaces to show while an app launches in response to different URL schemes.
[`struct UIApplicationDelegateAdaptor`](https://developer.apple.com/documentation/swiftui/uiapplicationdelegateadaptor)
A property wrapper type that you use to create a UIKit app delegate.
### [Targeting macOS](https://developer.apple.com/documentation/SwiftUI/App-organization#Targeting-macOS)
[`struct NSApplicationDelegateAdaptor`](https://developer.apple.com/documentation/swiftui/nsapplicationdelegateadaptor)
A property wrapper type that you use to create an AppKit app delegate.
### [Targeting watchOS](https://developer.apple.com/documentation/SwiftUI/App-organization#Targeting-watchOS)
[`struct WKApplicationDelegateAdaptor`](https://developer.apple.com/documentation/swiftui/wkapplicationdelegateadaptor)
A property wrapper that is used in `App` to provide a delegate from WatchKit.
[`struct WKExtensionDelegateAdaptor`](https://developer.apple.com/documentation/swiftui/wkextensiondelegateadaptor)
A property wrapper type that you use to create a WatchKit extension delegate.
### [Targeting tvOS](https://developer.apple.com/documentation/SwiftUI/App-organization#Targeting-tvOS)
[Creating a tvOS media catalog app in SwiftUI](https://developer.apple.com/documentation/swiftui/creating-a-tvos-media-catalog-app-in-swiftui)
Build standard content lockups and rows of content shelves for your tvOS app.
### [Handling system recenter events](https://developer.apple.com/documentation/SwiftUI/App-organization#Handling-system-recenter-events)
[`enum WorldRecenterPhase`](https://developer.apple.com/documentation/swiftui/worldrecenterphase)
A type that represents information associated with a phase of a system recenter event. Values of this type are passed to the closure specified in View.onWorldRecenter(action:).
## [See Also](https://developer.apple.com/documentation/SwiftUI/App-organization#see-also)
### [App structure](https://developer.apple.com/documentation/SwiftUI/App-organization#App-structure)
[API Reference Scenes](https://developer.apple.com/documentation/swiftui/scenes)
Declare the user interface groupings that make up the parts of your app.
[API Reference Windows](https://developer.apple.com/documentation/swiftui/windows)
Display user interface content in a window or a collection of windows.
[API Reference Immersive spaces](https://developer.apple.com/documentation/swiftui/immersive-spaces)
Display unbounded content in a person’s surroundings.
[API Reference Documents](https://developer.apple.com/documentation/swiftui/documents)
Enable people to open and manage documents.
[API Reference Navigation](https://developer.apple.com/documentation/swiftui/navigation)
Enable people to move between different parts of your app’s view hierarchy within a scene.
[API Reference Modal presentations](https://developer.apple.com/documentation/swiftui/modal-presentations)
Present content in a separate view that offers focused interaction.
[API Reference Toolbars](https://developer.apple.com/documentation/swiftui/toolbars)
Provide immediate access to frequently used commands and controls.
[API Reference Search](https://developer.apple.com/documentation/swiftui/search)
Enable people to search for text or other content within your app.
[API Reference App extensions](https://developer.apple.com/documentation/swiftui/app-extensions)
Extend your app’s basic functionality to other parts of the system, like by adding a Widget.
Current page is App organization 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FSwiftUI%2FApp-organization).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
