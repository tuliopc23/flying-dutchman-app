Source: https://developer.apple.com/documentation/swiftui/scenes

[ Skip Navigation ](https://developer.apple.com/documentation/swiftui/scenes#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/swiftui/scenes#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/swiftui/scenes)
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
[ Open Menu ](https://developer.apple.com/documentation/swiftui/scenes)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/swiftui/scenes)
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
Collection
9 of 63 symbols inside <root> containing 19 symbols[Scenes](https://developer.apple.com/documentation/swiftui/scenes)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 19 symbols inside 1435247602 
Creating scenes
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
2 of 19 symbols inside 1435247602 containing 66 symbols[Scene](https://developer.apple.com/documentation/swiftui/scene)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
3 of 19 symbols inside 1435247602 containing 5 symbols[SceneBuilder](https://developer.apple.com/documentation/swiftui/scenebuilder)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 19 symbols inside 1435247602 
Monitoring scene life cycle
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
5 of 19 symbols inside 1435247602 [var scenePhase: ScenePhase](https://developer.apple.com/documentation/swiftui/environmentvalues/scenephase)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
6 of 19 symbols inside 1435247602 containing 4 symbols[ScenePhase](https://developer.apple.com/documentation/swiftui/scenephase)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 19 symbols inside 1435247602 
Managing a settings window
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
8 of 19 symbols inside 1435247602 containing 2 symbols[Settings](https://developer.apple.com/documentation/swiftui/settings)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
9 of 19 symbols inside 1435247602 containing 5 symbols[SettingsLink](https://developer.apple.com/documentation/swiftui/settingslink)
82 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Collection
  * [ SwiftUI ](https://developer.apple.com/documentation/swiftui)
  * [ Scenes ](https://developer.apple.com/documentation/swiftui/scenes)
  *     * Scenes 


API Collection
# Scenes
Declare the user interface groupings that make up the parts of your app.
## [Overview](https://developer.apple.com/documentation/swiftui/scenes#Overview)
A scene represents a part of your app’s user interface that has a life cycle that the system manages. An [`App`](https://developer.apple.com/documentation/swiftui/app) instance presents the scenes it contains, while each [`Scene`](https://developer.apple.com/documentation/swiftui/scene) acts as the root element of a [`View`](https://developer.apple.com/documentation/swiftui/view) hierarchy.
![](https://docs-assets.developer.apple.com/published/0ae322d333458f9341bc3aa57f4e8250/scenes-hero%402x.png)
The system presents scenes in different ways depending on the type of scene, the platform, and the context. A scene might fill the entire display, part of the display, a window, a tab in a window, or something else. In some cases, your app might also be able to display more than one instance of the scene at a time, like when a user simultaneously opens multiple windows based on a single [`WindowGroup`](https://developer.apple.com/documentation/swiftui/windowgroup) declaration in your app. For more information about the primary built-in scene types, see [Windows](https://developer.apple.com/documentation/swiftui/windows) and [Documents](https://developer.apple.com/documentation/swiftui/documents).
You configure scenes using modifiers, similar to how you configure views. For example, you can adjust the appearance of the window that contains a scene — if the scene happens to appear in a window — using the [`windowStyle(_:)`](https://developer.apple.com/documentation/swiftui/scene/windowstyle\(_:\)) modifier. Similarly, you can add menu commands that become available when the scene is in the foreground on certain platforms using the [`commands(content:)`](https://developer.apple.com/documentation/swiftui/scene/commands\(content:\)) modifier.
## [Topics](https://developer.apple.com/documentation/swiftui/scenes#topics)
### [Creating scenes](https://developer.apple.com/documentation/swiftui/scenes#Creating-scenes)
[`protocol Scene`](https://developer.apple.com/documentation/swiftui/scene)
A part of an app’s user interface with a life cycle managed by the system.
[`struct SceneBuilder`](https://developer.apple.com/documentation/swiftui/scenebuilder)
A result builder for composing a collection of scenes into a single composite scene.
### [Monitoring scene life cycle](https://developer.apple.com/documentation/swiftui/scenes#Monitoring-scene-life-cycle)
[`var scenePhase: ScenePhase`](https://developer.apple.com/documentation/swiftui/environmentvalues/scenephase)
The current phase of the scene.
[`enum ScenePhase`](https://developer.apple.com/documentation/swiftui/scenephase)
An indication of a scene’s operational state.
### [Managing a settings window](https://developer.apple.com/documentation/swiftui/scenes#Managing-a-settings-window)
[`struct Settings`](https://developer.apple.com/documentation/swiftui/settings)
A scene that presents an interface for viewing and modifying an app’s settings.
[`struct SettingsLink`](https://developer.apple.com/documentation/swiftui/settingslink)
A view that opens the Settings scene defined by an app.
[`struct OpenSettingsAction`](https://developer.apple.com/documentation/swiftui/opensettingsaction)
An action that presents the settings scene for an app.
[`var openSettings: OpenSettingsAction`](https://developer.apple.com/documentation/swiftui/environmentvalues/opensettings)
A Settings presentation action stored in a view’s environment.
### [Building a menu bar](https://developer.apple.com/documentation/swiftui/scenes#Building-a-menu-bar)
[Building and customizing the menu bar with SwiftUI](https://developer.apple.com/documentation/swiftui/building-and-customizing-the-menu-bar-with-swiftui)
Provide a seamless, cross-platform user experience by building a native menu bar for iPadOS and macOS.
### [Creating a menu bar extra](https://developer.apple.com/documentation/swiftui/scenes#Creating-a-menu-bar-extra)
[`struct MenuBarExtra`](https://developer.apple.com/documentation/swiftui/menubarextra)
A scene that renders itself as a persistent control in the system menu bar.
[`func menuBarExtraStyle<S>(S) -> some Scene`](https://developer.apple.com/documentation/swiftui/scene/menubarextrastyle\(_:\))
Sets the style for menu bar extra created by this scene.
[`protocol MenuBarExtraStyle`](https://developer.apple.com/documentation/swiftui/menubarextrastyle)
A specification for the appearance and behavior of a menu bar extra scene.
### [Creating watch notifications](https://developer.apple.com/documentation/swiftui/scenes#Creating-watch-notifications)
[`struct WKNotificationScene`](https://developer.apple.com/documentation/swiftui/wknotificationscene)
A scene which appears in response to receiving the specified category of remote or local notifications.
## [See Also](https://developer.apple.com/documentation/swiftui/scenes#see-also)
### [App structure](https://developer.apple.com/documentation/swiftui/scenes#App-structure)
[API Reference App organization](https://developer.apple.com/documentation/swiftui/app-organization)
Define the entry point and top-level structure of your app.
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
Current page is Scenes 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fswiftui%2Fscenes).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
