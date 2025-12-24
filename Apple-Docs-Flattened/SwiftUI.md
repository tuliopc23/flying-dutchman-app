Source: https://developer.apple.com/documentation/swiftui

[ Skip Navigation ](https://developer.apple.com/documentation/swiftui#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/swiftui#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/swiftui)
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
[ Open Menu ](https://developer.apple.com/documentation/swiftui)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/swiftui)
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
Collection
10 of 63 symbols inside <root> containing 82 symbols[Windows](https://developer.apple.com/documentation/swiftui/windows)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
11 of 63 symbols inside <root> containing 28 symbols[Immersive spaces](https://developer.apple.com/documentation/swiftui/immersive-spaces)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
12 of 63 symbols inside <root> containing 34 symbols[Documents](https://developer.apple.com/documentation/swiftui/documents)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
13 of 63 symbols inside <root> containing 65 symbols[Navigation](https://developer.apple.com/documentation/swiftui/navigation)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
14 of 63 symbols inside <root> containing 95 symbols[Modal presentations](https://developer.apple.com/documentation/swiftui/modal-presentations)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
15 of 63 symbols inside <root> containing 45 symbols[Toolbars](https://developer.apple.com/documentation/swiftui/toolbars)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
16 of 63 symbols inside <root> containing 36 symbols[Search](https://developer.apple.com/documentation/swiftui/search)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
17 of 63 symbols inside <root> containing 29 symbols[App extensions](https://developer.apple.com/documentation/swiftui/app-extensions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
18 of 63 symbols inside <root>
Data and storage
63 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Framework
# SwiftUI
Declare the user interface and behavior for your app on every platform.
iOS 13.0+iPadOS 13.0+Mac Catalyst 13.0+macOS 10.15+tvOS 13.0+visionOS 1.0+watchOS 6.0+
## [Overview](https://developer.apple.com/documentation/swiftui#Overview)
SwiftUI provides views, controls, and layout structures for declaring your app’s user interface. The framework provides event handlers for delivering taps, gestures, and other types of input to your app, and tools to manage the flow of data from your app’s models down to the views and controls that users see and interact with.
Define your app structure using the [`App`](https://developer.apple.com/documentation/swiftui/app) protocol, and populate it with scenes that contain the views that make up your app’s user interface. Create your own custom views that conform to the [`View`](https://developer.apple.com/documentation/swiftui/view) protocol, and compose them with SwiftUI views for displaying text, images, and custom shapes using stacks, lists, and more. Apply powerful modifiers to built-in views and your own views to customize their rendering and interactivity. Share code between apps on multiple platforms with views and controls that adapt to their context and presentation.
![An image of the Landmarks sample app on Mac, iPad, and iPhone showing the Mount Fuji landmark.](https://docs-assets.developer.apple.com/published/ce193ec494e91d4150c3356442824213/landmarks-app-article-hero%402x.png)
You can integrate SwiftUI views with objects from the [UIKit](https://developer.apple.com/documentation/UIKit), [AppKit](https://developer.apple.com/documentation/AppKit), and [WatchKit](https://developer.apple.com/documentation/WatchKit) frameworks to take further advantage of platform-specific functionality. You can also customize accessibility support in SwiftUI, and localize your app’s interface for different languages, countries, or cultural regions.
### [Featured samples](https://developer.apple.com/documentation/swiftui#Featured-samples)
[![An image with a background of Mount Fuji, and in the foreground screenshots of the landmark detail view for Mount Fuji in the Landmarks app, in an iPad and iPhone.](https://docs-assets.developer.apple.com/published/54d1e5049c272381ddeb6c5d7b04fd25/Landmarks-Building-an-app-with-Liquid-Glass-PageImage-card%402x.png) Landmarks: Building an app with Liquid Glass  Enhance your app experience with system-provided and custom Liquid Glass. View sample code  ](https://developer.apple.com/documentation/swiftui/landmarks-building-an-app-with-liquid-glass)
[![](https://docs-assets.developer.apple.com/published/648c665254129674ce04bbc64dbeeb2d/Destination-Video-intro%402x.png) Destination Video  Leverage SwiftUI to build an immersive media experience in a multiplatform app. View sample code  ](https://developer.apple.com/documentation/visionOS/destination-video)
[![](https://docs-assets.developer.apple.com/published/d9f7d85cd82f76e6fd53df7302f0424a/BOT-anist-PageImage-card%402x.png) BOT-anist  Build a multiplatform app that uses windows, volumes, and animations to create a robot botanist’s greenhouse. View sample code  ](https://developer.apple.com/documentation/visionOS/BOT-anist)
[![A screenshot displaying the document launch experience on iPad with a robot and plant accessory to the left and right of the title view, respectively.](https://docs-assets.developer.apple.com/published/e143ff39a1e48efe1ed0000f6e902a5b/Building-a-document-based-app-PageImage-card%402x.png) Building a document-based app with SwiftUI  Create, save, and open documents in a multiplatform app. View sample code  ](https://developer.apple.com/documentation/swiftui/building-a-document-based-app-with-swiftui)
## [Topics](https://developer.apple.com/documentation/swiftui#topics)
### [Essentials](https://developer.apple.com/documentation/swiftui#Essentials)
[Adopting Liquid Glass](https://developer.apple.com/documentation/TechnologyOverviews/adopting-liquid-glass)
Find out how to bring the new material to your app.
[Learning SwiftUI](https://developer.apple.com/tutorials/swiftui-concepts)
Discover tips and techniques for building multiplatform apps with this set of conceptual articles and sample code.
[Exploring SwiftUI Sample Apps](https://developer.apple.com/tutorials/Sample-Apps)
Explore these SwiftUI samples using Swift Playgrounds on iPad or in Xcode to learn about defining user interfaces, responding to user interactions, and managing data flow.
[SwiftUI updates](https://developer.apple.com/documentation/Updates/SwiftUI)
Learn about important changes to SwiftUI.
[Landmarks: Building an app with Liquid Glass](https://developer.apple.com/documentation/swiftui/landmarks-building-an-app-with-liquid-glass)
Enhance your app experience with system-provided and custom Liquid Glass.
### [App structure](https://developer.apple.com/documentation/swiftui#App-structure)
[API Reference App organization](https://developer.apple.com/documentation/swiftui/app-organization)
Define the entry point and top-level structure of your app.
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
### [Data and storage](https://developer.apple.com/documentation/swiftui#Data-and-storage)
[API Reference Model data](https://developer.apple.com/documentation/swiftui/model-data)
Manage the data that your app uses to drive its interface.
[API Reference Environment values](https://developer.apple.com/documentation/swiftui/environment-values)
Share data throughout a view hierarchy using the environment.
[API Reference Preferences](https://developer.apple.com/documentation/swiftui/preferences)
Indicate configuration preferences from views to their container views.
[API Reference Persistent storage](https://developer.apple.com/documentation/swiftui/persistent-storage)
Store data for use across sessions of your app.
### [Views](https://developer.apple.com/documentation/swiftui#Views)
[API Reference View fundamentals](https://developer.apple.com/documentation/swiftui/view-fundamentals)
Define the visual elements of your app using a hierarchy of views.
[API Reference View configuration](https://developer.apple.com/documentation/swiftui/view-configuration)
Adjust the characteristics of views in a hierarchy.
[API Reference View styles](https://developer.apple.com/documentation/swiftui/view-styles)
Apply built-in and custom appearances and behaviors to different types of views.
[API Reference Animations](https://developer.apple.com/documentation/swiftui/animations)
Create smooth visual updates in response to state changes.
[API Reference Text input and output](https://developer.apple.com/documentation/swiftui/text-input-and-output)
Display formatted text and get text input from the user.
[API Reference Images](https://developer.apple.com/documentation/swiftui/images)
Add images and symbols to your app’s user interface.
[API Reference Controls and indicators](https://developer.apple.com/documentation/swiftui/controls-and-indicators)
Display values and get user selections.
[API Reference Menus and commands](https://developer.apple.com/documentation/swiftui/menus-and-commands)
Provide space-efficient, context-dependent access to commands and controls.
[API Reference Shapes](https://developer.apple.com/documentation/swiftui/shapes)
Trace and fill built-in and custom shapes with a color, gradient, or other pattern.
[API Reference Drawing and graphics](https://developer.apple.com/documentation/swiftui/drawing-and-graphics)
Enhance your views with graphical effects and customized drawings.
### [View layout](https://developer.apple.com/documentation/swiftui#View-layout)
[API Reference Layout fundamentals](https://developer.apple.com/documentation/swiftui/layout-fundamentals)
Arrange views inside built-in layout containers like stacks and grids.
[API Reference Layout adjustments](https://developer.apple.com/documentation/swiftui/layout-adjustments)
Make fine adjustments to alignment, spacing, padding, and other layout parameters.
[API Reference Custom layout](https://developer.apple.com/documentation/swiftui/custom-layout)
Place views in custom arrangements and create animated transitions between layout types.
[API Reference Lists](https://developer.apple.com/documentation/swiftui/lists)
Display a structured, scrollable column of information.
[API Reference Tables](https://developer.apple.com/documentation/swiftui/tables)
Display selectable, sortable data arranged in rows and columns.
[API Reference View groupings](https://developer.apple.com/documentation/swiftui/view-groupings)
Present views in different kinds of purpose-driven containers, like forms or control groups.
[API Reference Scroll views](https://developer.apple.com/documentation/swiftui/scroll-views)
Enable people to scroll to content that doesn’t fit in the current display.
### [Event handling](https://developer.apple.com/documentation/swiftui#Event-handling)
[API Reference Gestures](https://developer.apple.com/documentation/swiftui/gestures)
Define interactions from taps, clicks, and swipes to fine-grained gestures.
[API Reference Input events](https://developer.apple.com/documentation/swiftui/input-events)
Respond to input from a hardware device, like a keyboard or a Touch Bar.
[API Reference Clipboard](https://developer.apple.com/documentation/swiftui/clipboard)
Enable people to move or duplicate items by issuing Copy and Paste commands.
[API Reference Drag and drop](https://developer.apple.com/documentation/swiftui/drag-and-drop)
Enable people to move or duplicate items by dragging them from one location to another.
[API Reference Focus](https://developer.apple.com/documentation/swiftui/focus)
Identify and control which visible object responds to user interaction.
[API Reference System events](https://developer.apple.com/documentation/swiftui/system-events)
React to system events, like opening a URL.
### [Accessibility](https://developer.apple.com/documentation/swiftui#Accessibility)
[API Reference Accessibility fundamentals](https://developer.apple.com/documentation/swiftui/accessibility-fundamentals)
Make your SwiftUI apps accessible to everyone, including people with disabilities.
[API Reference Accessible appearance](https://developer.apple.com/documentation/swiftui/accessible-appearance)
Enhance the legibility of content in your app’s interface.
[API Reference Accessible controls](https://developer.apple.com/documentation/swiftui/accessible-controls)
Improve access to actions that your app can undertake.
[API Reference Accessible descriptions](https://developer.apple.com/documentation/swiftui/accessible-descriptions)
Describe interface elements to help people understand what they represent.
[API Reference Accessible navigation](https://developer.apple.com/documentation/swiftui/accessible-navigation)
Enable users to navigate to specific user interface elements using rotors.
### [Framework integration](https://developer.apple.com/documentation/swiftui#Framework-integration)
[API Reference AppKit integration](https://developer.apple.com/documentation/swiftui/appkit-integration)
Add AppKit views to your SwiftUI app, or use SwiftUI views in your AppKit app.
[API Reference UIKit integration](https://developer.apple.com/documentation/swiftui/uikit-integration)
Add UIKit views to your SwiftUI app, or use SwiftUI views in your UIKit app.
[API Reference WatchKit integration](https://developer.apple.com/documentation/swiftui/watchkit-integration)
Add WatchKit views to your SwiftUI app, or use SwiftUI views in your WatchKit app.
[API Reference Technology-specific views](https://developer.apple.com/documentation/swiftui/technology-specific-views)
Use SwiftUI views that other Apple frameworks provide.
### [Tool support](https://developer.apple.com/documentation/swiftui#Tool-support)
[API Reference Previews in Xcode](https://developer.apple.com/documentation/swiftui/previews-in-xcode)
Generate dynamic, interactive previews of your custom views.
[API Reference Xcode library customization](https://developer.apple.com/documentation/swiftui/xcode-library-customization)
Expose custom views and modifiers in the Xcode library.
[API Reference Performance analysis](https://developer.apple.com/documentation/swiftui/performance-analysis)
Measure and improve your app’s responsiveness.
Current page is SwiftUI 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fswiftui).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
