Source: https://developer.apple.com/documentation/uikit

[ Skip Navigation ](https://developer.apple.com/documentation/uikit#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/uikit#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/uikit)
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
[ Open Menu ](https://developer.apple.com/documentation/uikit)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/uikit)


[](https://developer.apple.com/documentation/uikit)
## [ UIKit  ](https://developer.apple.com/documentation/uikit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 46 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 46 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 46 symbols inside <root> [Adopting Liquid Glass](https://developer.apple.com/documentation/technologyoverviews/adopting-liquid-glass)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 46 symbols inside <root> [UIKit updates](https://developer.apple.com/documentation/updates/uikit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 46 symbols inside <root> [About App Development with UIKit](https://developer.apple.com/documentation/uikit/about-app-development-with-uikit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
5 of 46 symbols inside <root> containing 3 symbols[Protecting the User’s Privacy](https://developer.apple.com/documentation/uikit/protecting-the-user-s-privacy)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 46 symbols inside <root>
App structure
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
7 of 46 symbols inside <root> containing 26 symbols[App and environment](https://developer.apple.com/documentation/uikit/app-and-environment)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
8 of 46 symbols inside <root> containing 15 symbols[Documents, data, and pasteboard](https://developer.apple.com/documentation/uikit/documents-data-and-pasteboard)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
9 of 46 symbols inside <root> containing 11 symbols[Resource management](https://developer.apple.com/documentation/uikit/resource-management)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
10 of 46 symbols inside <root> containing 12 symbols[App extensions](https://developer.apple.com/documentation/uikit/app-extensions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
11 of 46 symbols inside <root> containing 8 symbols[Interprocess communication](https://developer.apple.com/documentation/uikit/interprocess-communication)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
12 of 46 symbols inside <root> containing 27 symbols[Mac Catalyst](https://developer.apple.com/documentation/uikit/mac-catalyst)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
13 of 46 symbols inside <root>
User interface
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
14 of 46 symbols inside <root> containing 70 symbols[Views and controls](https://developer.apple.com/documentation/uikit/views-and-controls)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
15 of 46 symbols inside <root> containing 80 symbols[View controllers](https://developer.apple.com/documentation/uikit/view-controllers)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
16 of 46 symbols inside <root> containing 17 symbols[View layout](https://developer.apple.com/documentation/uikit/view-layout)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
17 of 46 symbols inside <root> containing 26 symbols[Appearance customization](https://developer.apple.com/documentation/uikit/appearance-customization)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
18 of 46 symbols inside <root> containing 15 symbols[Animation and haptics](https://developer.apple.com/documentation/uikit/animation-and-haptics)
46 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Framework
# UIKit
Construct and manage a graphical, event-driven user interface for your iOS, iPadOS, or tvOS app.
iOS 2.0+iPadOS 2.0+Mac Catalyst 13.0+tvOS 9.0+visionOS 1.0+watchOS 2.0+
## [Overview](https://developer.apple.com/documentation/uikit#overview)
UIKit provides a variety of features for building apps, including components you can use to construct the core infrastructure of your iOS, iPadOS, or tvOS apps. The framework provides the window and view architecture for implementing your UI, the event-handling infrastructure for delivering Multi-Touch and other types of input to your app, and the main run loop for managing interactions between the user, the system, and your app.
![An image of the Landmarks sample app on iPad and iPhone showing the Mount Fuji landmark.](https://docs-assets.developer.apple.com/published/6452b204ef978b327ecf448e232eee4e/Landmarks-Building-an-app-with-Liquid-Glass-1%402x.png)
UIKit also includes support for animations, documents, drawing and printing, text management and display, search, app extensions, resource management, and getting information about the current device. You can also customize accessibility support, and localize your app’s interface for different languages, countries, or cultural regions.
UIKit works seamlessly with the [SwiftUI](https://developer.apple.com/documentation/SwiftUI) framework, so you can implement parts of your UIKit app in SwiftUI or mix interface elements between the two frameworks. For example, you can place UIKit views and view controllers inside SwiftUI views, and vice versa.
To build a macOS app, you can use [SwiftUI](https://developer.apple.com/documentation/SwiftUI) to create an app that works across all of Apple’s platforms, or use [AppKit](https://developer.apple.com/documentation/AppKit) to create an app for Mac only. Alternatively, you can bring your UIKit iPad app to the Mac with [Mac Catalyst](https://developer.apple.com/documentation/uikit/mac-catalyst).
Important
Use UIKit classes only from your app’s main thread or main dispatch queue, unless otherwise indicated in the documentation for those classes. This restriction particularly applies to classes that derive from [`UIResponder`](https://developer.apple.com/documentation/uikit/uiresponder) or that involve manipulating your app’s user interface in any way.
## [Topics](https://developer.apple.com/documentation/uikit#topics)
### [Essentials](https://developer.apple.com/documentation/uikit#Essentials)
[Adopting Liquid Glass](https://developer.apple.com/documentation/TechnologyOverviews/adopting-liquid-glass)
Find out how to bring the new material to your app.
[UIKit updates](https://developer.apple.com/documentation/Updates/UIKit)
Learn about important changes to UIKit.
[About App Development with UIKit](https://developer.apple.com/documentation/uikit/about-app-development-with-uikit)
Learn about the basic support that UIKit and Xcode provide for your iOS and tvOS apps.
[API Reference Protecting the User’s Privacy](https://developer.apple.com/documentation/uikit/protecting-the-user-s-privacy)
Secure personal data, and respect user preferences for how data is used.
### [App structure](https://developer.apple.com/documentation/uikit#App-structure)
UIKit manages your app’s interactions with the system and provides classes for you to manage your app’s data and resources.
[API Reference App and environment](https://developer.apple.com/documentation/uikit/app-and-environment)
Manage life-cycle events and your app’s UI scenes, and get information about traits and the environment in which your app runs.
[API Reference Documents, data, and pasteboard](https://developer.apple.com/documentation/uikit/documents-data-and-pasteboard)
Organize your app’s data and share that data on the pasteboard.
[API Reference Resource management](https://developer.apple.com/documentation/uikit/resource-management)
Manage the images, strings, storyboards, and nib files that you use to implement your app’s interface.
[API Reference App extensions](https://developer.apple.com/documentation/uikit/app-extensions)
Extend your app’s basic functionality to other parts of the system.
[API Reference Interprocess communication](https://developer.apple.com/documentation/uikit/interprocess-communication)
Display activity-based services to people.
[API Reference Mac Catalyst](https://developer.apple.com/documentation/uikit/mac-catalyst)
Create a version of your iPad app that users can run on a Mac device.
### [User interface](https://developer.apple.com/documentation/uikit#User-interface)
Views help you display content onscreen and facilitate user interactions; view controllers help you manage views and the structure of your interface.
[API Reference Views and controls](https://developer.apple.com/documentation/uikit/views-and-controls)
Present your content onscreen and define the interactions allowed with that content.
[API Reference View controllers](https://developer.apple.com/documentation/uikit/view-controllers)
Manage your interface using view controllers and facilitate navigation around your app’s content.
[API Reference View layout](https://developer.apple.com/documentation/uikit/view-layout)
Use stack views to lay out the views of your interface automatically. Use Auto Layout when you require precise placement of your views.
[API Reference Appearance customization](https://developer.apple.com/documentation/uikit/appearance-customization)
Apply Liquid Glass to views, support Dark Mode in your app, customize the appearance of bars, and use appearance proxies to modify your UI.
[API Reference Animation and haptics](https://developer.apple.com/documentation/uikit/animation-and-haptics)
Provide feedback to users using view-based animations and haptics.
[API Reference Windows and screens](https://developer.apple.com/documentation/uikit/windows-and-screens)
Provide a container for your view hierarchies and other content.
### [User interactions](https://developer.apple.com/documentation/uikit#User-interactions)
Responders and gesture recognizers help you handle touches and other events. Drag and drop, focus, peek and pop, and accessibility handle other user interactions.
[API Reference Touches, presses, and gestures](https://developer.apple.com/documentation/uikit/touches-presses-and-gestures)
Encapsulate your app’s event-handling logic in gesture recognizers so that you can reuse that code throughout your app.
[API Reference Menus and shortcuts](https://developer.apple.com/documentation/uikit/menus-and-shortcuts)
Simplify interactions with your app using menu systems, contextual menus, Home Screen quick actions, and keyboard shortcuts.
[API Reference Drag and drop](https://developer.apple.com/documentation/uikit/drag-and-drop)
Bring drag and drop to your app by using interaction APIs with your views.
[API Reference Pointer interactions](https://developer.apple.com/documentation/uikit/pointer-interactions)
Support pointer interactions in your custom controls and views.
[API Reference Apple Pencil interactions](https://developer.apple.com/documentation/uikit/apple-pencil-interactions)
Handle user interactions like double tap and squeeze on Apple Pencil.
[API Reference Focus-based navigation](https://developer.apple.com/documentation/uikit/focus-based-navigation)
Navigate the interface of your UIKit app using a remote, game controller, or keyboard.
[API Reference Accessibility for UIKit](https://developer.apple.com/documentation/uikit/accessibility-for-uikit)
Make your UIKit apps accessible to everyone who uses iOS and tvOS.
### [Graphics, drawing, and printing](https://developer.apple.com/documentation/uikit#Graphics-drawing-and-printing)
UIKit provides classes and protocols that help you configure your drawing environment and render your content.
[API Reference Images and PDF](https://developer.apple.com/documentation/uikit/images-and-pdf)
Create and manage images, including those that use bitmap and PDF formats.
[API Reference Drawing](https://developer.apple.com/documentation/uikit/drawing)
Configure your app’s drawing environment using colors, renderers, draw paths, strings, and shadows.
[API Reference Printing](https://developer.apple.com/documentation/uikit/printing)
Display the system print panels and manage the printing process.
### [Text](https://developer.apple.com/documentation/uikit#Text)
In addition to text views that simplify displaying text in your app, UIKit provides custom text management and rendering that supports the system keyboards.
[API Reference Text display and fonts](https://developer.apple.com/documentation/uikit/text-display-and-fonts)
Display text, manage fonts, and check spelling.
[API Reference TextKit](https://developer.apple.com/documentation/uikit/textkit)
Manage text storage and perform custom layout of text-based content in your app’s views.
[API Reference Keyboards and input](https://developer.apple.com/documentation/uikit/keyboards-and-input)
Configure the system keyboard, create your own keyboards to handle input, or detect key presses on a physical keyboard.
[API Reference Writing Tools](https://developer.apple.com/documentation/uikit/writing-tools)
Add support for Writing Tools to your app’s text views.
[API Reference Handwriting recognition](https://developer.apple.com/documentation/uikit/handwriting-recognition)
Configure text fields and custom views that accept text to handle input from Apple Pencil.
### [Deprecated](https://developer.apple.com/documentation/uikit#Deprecated)
Avoid using deprecated classes and protocols in your apps.
[API Reference Deprecated symbols](https://developer.apple.com/documentation/uikit/deprecated-symbols)
Review unsupported symbols and their replacements.
### [Reference](https://developer.apple.com/documentation/uikit#Reference)
[API Reference UIKit Enumerations](https://developer.apple.com/documentation/uikit/uikit-enumerations)
[API Reference UIKit Constants](https://developer.apple.com/documentation/uikit/uikit-constants)
This document describes constants that are used throughout the UIKit framework.
[API Reference UIKit Data Types](https://developer.apple.com/documentation/uikit/uikit-data-types)
The UIKit framework defines data types that are used in multiple places throughout the framework.
[API Reference UIKit Functions](https://developer.apple.com/documentation/uikit/uikit-functions)
The UIKit framework defines a number of functions, many of them used in graphics and drawing operations.
### [Classes](https://developer.apple.com/documentation/uikit#Classes)
[`class UIColorEffect`](https://developer.apple.com/documentation/uikit/uicoloreffect)
A visual effect that applies a solid color background.
Current page is UIKit 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fuikit).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
