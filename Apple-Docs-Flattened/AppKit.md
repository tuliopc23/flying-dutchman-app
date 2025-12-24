Source: https://developer.apple.com/documentation/appkit

[ Skip Navigation ](https://developer.apple.com/documentation/appkit#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/appkit#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/appkit)
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
[ Open Menu ](https://developer.apple.com/documentation/appkit)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/appkit)


[](https://developer.apple.com/documentation/appkit)
## [ AppKit  ](https://developer.apple.com/documentation/appkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 44 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 44 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 44 symbols inside <root> [Adopting Liquid Glass](https://developer.apple.com/documentation/technologyoverviews/adopting-liquid-glass)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 44 symbols inside <root> [AppKit updates](https://developer.apple.com/documentation/updates/appkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
4 of 44 symbols inside <root> [Protecting the User’s Privacy](https://developer.apple.com/documentation/uikit/protecting-the-user-s-privacy)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
5 of 44 symbols inside <root> [Porting your macOS apps to Apple silicon](https://developer.apple.com/documentation/apple-silicon/porting-your-macos-apps-to-apple-silicon)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 44 symbols inside <root>
App Structure
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
7 of 44 symbols inside <root> containing 26 symbols[App and Environment](https://developer.apple.com/documentation/appkit/app-and-environment)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
8 of 44 symbols inside <root> containing 26 symbols[Documents, Data, and Pasteboard](https://developer.apple.com/documentation/appkit/documents-data-and-pasteboard)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
9 of 44 symbols inside <root> containing 21 symbols[Cocoa Bindings](https://developer.apple.com/documentation/appkit/cocoa-bindings)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
10 of 44 symbols inside <root> containing 8 symbols[Resource Management](https://developer.apple.com/documentation/appkit/resource-management)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
11 of 44 symbols inside <root> containing 19 symbols[App Extensions](https://developer.apple.com/documentation/appkit/app-extensions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 44 symbols inside <root>
User Interface
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
13 of 44 symbols inside <root> containing 60 symbols[Views and Controls](https://developer.apple.com/documentation/appkit/views-and-controls)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
14 of 44 symbols inside <root> containing 18 symbols[View Management](https://developer.apple.com/documentation/appkit/view-management)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
15 of 44 symbols inside <root> containing 13 symbols[View Layout](https://developer.apple.com/documentation/appkit/view-layout)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
16 of 44 symbols inside <root> containing 5 symbols[Appearance Customization](https://developer.apple.com/documentation/appkit/appearance-customization)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
17 of 44 symbols inside <root> containing 11 symbols[Animation](https://developer.apple.com/documentation/appkit/animation)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
18 of 44 symbols inside <root> containing 38 symbols[Windows, Panels, and Screens](https://developer.apple.com/documentation/appkit/windows-panels-and-screens)
44 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Framework
# AppKit
Construct and manage a graphical, event-driven user interface for your macOS app.
Mac Catalyst 13.0+macOS 10.0+
## [Overview](https://developer.apple.com/documentation/appkit#overview)
AppKit contains the objects you need to build the user interface for a macOS app. In addition to drawing windows, buttons, panels, and text fields, it handles all the event management and interaction between your app, people, and macOS.
![An image of the Landmarks sample app on Mac showing the Mount Fuji landmark.](https://docs-assets.developer.apple.com/published/2ba3100f3acde10ba4fbbbdb32b4cbda/landmarks-app-article-hero%402x.png)
Aside from drawing and managing interactions, AppKit handles printing, animating, as well as creating documents with large amounts of data efficiently. The framework also contains built-in support for localization and accessibility to ensure that your app reaches as many people as possible.
AppKit also works with [SwiftUI](https://developer.apple.com/documentation/SwiftUI), so you can implement parts of your AppKit app in SwiftUI or mix interface elements between the two frameworks. For example, you can place AppKit views and view controllers inside SwiftUI views, and vice versa.
Note
For information about bringing your iPad app to Mac, see [Mac Catalyst](https://developer.apple.com/documentation/UIKit/mac-catalyst). To build an iOS app, you can use SwiftUI to create an app that works across all of Apple’s platforms, or use [UIKit](https://developer.apple.com/documentation/UIKit) to create an app for iOS only.
## [Topics](https://developer.apple.com/documentation/appkit#topics)
### [Essentials](https://developer.apple.com/documentation/appkit#Essentials)
[Adopting Liquid Glass](https://developer.apple.com/documentation/TechnologyOverviews/adopting-liquid-glass)
Find out how to bring the new material to your app.
[AppKit updates](https://developer.apple.com/documentation/Updates/AppKit)
Learn about important changes to AppKit.
[Protecting the User’s Privacy](https://developer.apple.com/documentation/UIKit/protecting-the-user-s-privacy)
Secure personal data, and respect user preferences for how data is used.
[Porting your macOS apps to Apple silicon](https://developer.apple.com/documentation/Apple-Silicon/porting-your-macos-apps-to-apple-silicon)
Create a version of your macOS app that runs on both Apple silicon and Intel-based Mac computers.
### [App Structure](https://developer.apple.com/documentation/appkit#App-Structure)
[API Reference App and Environment](https://developer.apple.com/documentation/appkit/app-and-environment)
Learn about the objects that you use to interact with the system.
[API Reference Documents, Data, and Pasteboard](https://developer.apple.com/documentation/appkit/documents-data-and-pasteboard)
Organize your app’s data and preferences, and share that data on the pasteboard or in iCloud.
[API Reference Cocoa Bindings](https://developer.apple.com/documentation/appkit/cocoa-bindings)
Automatically synchronize your data model with your app’s interface using Cocoa Bindings.
[API Reference Resource Management](https://developer.apple.com/documentation/appkit/resource-management)
Manage the storyboards and nib files containing your app’s user interface, and learn how to load data that is stored in resource files.
[API Reference App Extensions](https://developer.apple.com/documentation/appkit/app-extensions)
Extend your app’s basic functionality to other parts of the system.
### [User Interface](https://developer.apple.com/documentation/appkit#User-Interface)
Your app’s user interface provides visual, audible, and tactile feedback to the user about what your app is doing.
[API Reference Views and Controls](https://developer.apple.com/documentation/appkit/views-and-controls)
Present your content onscreen and handle user input and events.
[API Reference View Management](https://developer.apple.com/documentation/appkit/view-management)
Manage your user interface, including the size and position of views in a window.
[API Reference View Layout](https://developer.apple.com/documentation/appkit/view-layout)
Position and size views using a stack view or Auto Layout constraints.
[API Reference Appearance Customization](https://developer.apple.com/documentation/appkit/appearance-customization)
Add Dark Mode support to your app, and use appearance proxies to modify your UI.
[API Reference Animation](https://developer.apple.com/documentation/appkit/animation)
Animate your views and other content to create a more engaging experience for users.
[API Reference Windows, Panels, and Screens](https://developer.apple.com/documentation/appkit/windows-panels-and-screens)
Organize your view hierarchies and facilitate their display onscreen.
[API Reference Sound, Speech, and Haptics](https://developer.apple.com/documentation/appkit/sound-speech-and-haptics)
Play sounds and haptic feedback, and incorporate speech recognition and synthesis into your interface.
[Supporting Continuity Camera in Your Mac App](https://developer.apple.com/documentation/appkit/supporting-continuity-camera-in-your-mac-app)
Incorporate scanned documents and pictures from a user’s iPhone, iPad, or iPod touch into your Mac app using Continuity Camera.
### [User Interactions](https://developer.apple.com/documentation/appkit#User-Interactions)
[API Reference Mouse, Keyboard, and Trackpad](https://developer.apple.com/documentation/appkit/mouse-keyboard-and-trackpad)
Handle events related to mouse, keyboard, and trackpad input.
[API Reference Menus, Cursors, and the Dock](https://developer.apple.com/documentation/appkit/menus-cursors-and-the-dock)
Implement menus and cursors to facilitate interactions with your app, and use your app’s Dock tile to convey updated information.
[API Reference Gestures](https://developer.apple.com/documentation/appkit/gestures)
Encapsulate your app’s event-handling logic in gesture recognizers so that you can reuse that code throughout your app.
[API Reference Touch Bar](https://developer.apple.com/documentation/appkit/touch-bar)
Display interactive content and controls in the Touch Bar.
[API Reference Drag and Drop](https://developer.apple.com/documentation/appkit/drag-and-drop)
Support the direct manipulation of your app’s content using drag and drop.
[API Reference Accessibility for AppKit](https://developer.apple.com/documentation/appkit/accessibility-for-appkit)
Make your AppKit apps accessible to everyone who uses macOS.
### [Graphics, Drawing, Color, and Printing](https://developer.apple.com/documentation/appkit#Graphics-Drawing-Color-and-Printing)
[API Reference Images and PDF](https://developer.apple.com/documentation/appkit/images-and-pdf)
Create and manage images, in bitmap, PDF, and other formats.
[API Reference Drawing](https://developer.apple.com/documentation/appkit/drawing)
Draw shapes, images, and other content on the screen.
[API Reference Color](https://developer.apple.com/documentation/appkit/color)
Represent colors using built-in or custom formats, and give users options for selecting and applying colors.
[API Reference Printing](https://developer.apple.com/documentation/appkit/printing)
Display the system print panels and manage the printing process.
### [Text](https://developer.apple.com/documentation/appkit#Text)
[API Reference Text Display](https://developer.apple.com/documentation/appkit/text-display)
Display text and check spelling.
[API Reference TextKit](https://developer.apple.com/documentation/appkit/textkit)
Manage text storage and perform custom layout of text-based content in your app’s views.
[API Reference Fonts](https://developer.apple.com/documentation/appkit/fonts)
Manage the fonts used to display text.
[API Reference Writing Tools](https://developer.apple.com/documentation/appkit/writing-tools)
Add support for Writing Tools to your app’s text views.
### [Deprecated](https://developer.apple.com/documentation/appkit#Deprecated)
Avoid using deprecated classes and protocols in your apps.
[API Reference Deprecated Symbols](https://developer.apple.com/documentation/appkit/deprecated-symbols)
Review symbols that are no longer supported, and find the replacements to use instead.
### [Reference](https://developer.apple.com/documentation/appkit#Reference)
[API Reference Enumerations](https://developer.apple.com/documentation/appkit/enumerations)
Enumerations for use with multiple classes.
[API Reference Constants](https://developer.apple.com/documentation/appkit/constants)
Constants for use with multiple classes.
[API Reference Data Types](https://developer.apple.com/documentation/appkit/data-types)
Data types for use with multiple classes.
[API Reference Macros](https://developer.apple.com/documentation/appkit/macros)
Macros for use with multiple classes.
Current page is AppKit 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fappkit).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
