Source: https://developer.apple.com/documentation/coredata/modeling-data

[ Skip Navigation ](https://developer.apple.com/documentation/coredata/modeling-data#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/coredata/modeling-data#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/coredata/modeling-data)
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
[ Open Menu ](https://developer.apple.com/documentation/coredata/modeling-data)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/coredata/modeling-data)


[](https://developer.apple.com/documentation/coredata/modeling-data)
## [ Core Data  ](https://developer.apple.com/documentation/coredata)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 37 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 37 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 37 symbols inside <root> [Creating a Core Data model](https://developer.apple.com/documentation/coredata/creating-a-core-data-model)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 37 symbols inside <root> containing 2 symbols[Setting up a Core Data stack](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
4 of 37 symbols inside <root> containing 25 symbols[Core Data stack](https://developer.apple.com/documentation/coredata/core-data-stack)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 37 symbols inside <root> [Handling Different Data Types in Core Data](https://developer.apple.com/documentation/coredata/handling-different-data-types-in-core-data)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 37 symbols inside <root> [Linking Data Between Two Core Data Stores](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 37 symbols inside <root>
Data modeling
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 37 symbols inside <root> containing 5 symbols[Modeling data](https://developer.apple.com/documentation/coredata/modeling-data)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 5 symbols inside 1558104826 
Configuring a Core Data Model
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 5 symbols inside 1558104826 [Configuring Entities](https://developer.apple.com/documentation/coredata/configuring-entities)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 5 symbols inside 1558104826 [Configuring Attributes](https://developer.apple.com/documentation/coredata/configuring-attributes)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 5 symbols inside 1558104826 [Configuring Relationships](https://developer.apple.com/documentation/coredata/configuring-relationships)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 5 symbols inside 1558104826 [Generating code](https://developer.apple.com/documentation/coredata/generating-code)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
9 of 37 symbols inside <root> containing 13 symbols[Core Data model](https://developer.apple.com/documentation/coredata/core-data-model)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 37 symbols inside <root>
Fetch requests
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
11 of 37 symbols inside <root> containing 35 symbols[NSFetchRequest](https://developer.apple.com/documentation/coredata/nsfetchrequest)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
12 of 37 symbols inside <root> containing 6 symbols[NSAsynchronousFetchRequest](https://developer.apple.com/documentation/coredata/nsasynchronousfetchrequest)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
13 of 37 symbols inside <root> containing 3 symbols[NSAsynchronousFetchResult](https://developer.apple.com/documentation/coredata/nsasynchronousfetchresult)
42 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Core Data ](https://developer.apple.com/documentation/coredata)
  * [ Modeling data ](https://developer.apple.com/documentation/coredata/modeling-data)
  *     * Modeling data 


Article
# Modeling data
Configure the data model file to contain your app’s object graph.
## [Overview](https://developer.apple.com/documentation/coredata/modeling-data#overview)
A data model holds information about your application’s objects and the graph of how objects relate to each other. You provide this information in your project’s `.xcdatamodeld` file package. To add a data model to your project, see [Creating a Core Data model](https://developer.apple.com/documentation/coredata/creating-a-core-data-model).
This screenshot shows the data model for an app that displays a feed of earthquake data.
![A screenshot showing an .xcdatamodeld file containing a Quake entity with code, magnitude, place, and time attributes.](https://docs-assets.developer.apple.com/published/bc1708f16eb80039f62429b9fb1c8fe8/media-3839155%402x.png)
Model your data by describing your objects as entities, adding their properties as attributes and relationships, and finally generating respective [`NSManagedObject`](https://developer.apple.com/documentation/coredata/nsmanagedobject) subclasses to inherit change tracking and life cycle management.
## [Topics](https://developer.apple.com/documentation/coredata/modeling-data#topics)
### [Configuring a Core Data Model](https://developer.apple.com/documentation/coredata/modeling-data#Configuring-a-Core-Data-Model)
[Configuring Entities](https://developer.apple.com/documentation/coredata/configuring-entities)
Model your app’s objects.
[Configuring Attributes](https://developer.apple.com/documentation/coredata/configuring-attributes)
Describe the properties that compose an entity.
[Configuring Relationships](https://developer.apple.com/documentation/coredata/configuring-relationships)
Specify how entities relate and how change propagates between them.
[Generating code](https://developer.apple.com/documentation/coredata/generating-code)
Automatically or manually generate managed object subclasses from entities.
## [See Also](https://developer.apple.com/documentation/coredata/modeling-data#see-also)
### [Data modeling](https://developer.apple.com/documentation/coredata/modeling-data#Data-modeling)
[API Reference Core Data model](https://developer.apple.com/documentation/coredata/core-data-model)
Describe your app’s object structure.
Current page is Modeling data 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fcoredata%2Fmodeling-data).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
