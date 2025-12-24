Source: https://developer.apple.com/documentation/coredata/creating-a-core-data-model

[ Skip Navigation ](https://developer.apple.com/documentation/coredata/creating-a-core-data-model#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/coredata/creating-a-core-data-model#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/coredata/creating-a-core-data-model)
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
[ Open Menu ](https://developer.apple.com/documentation/coredata/creating-a-core-data-model)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/coredata/creating-a-core-data-model)


[](https://developer.apple.com/documentation/coredata/creating-a-core-data-model)
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
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
14 of 37 symbols inside <root> containing 25 symbols[NSFetchedResultsController](https://developer.apple.com/documentation/coredata/nsfetchedresultscontroller)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
15 of 37 symbols inside <root>
SwiftData migration and coexistence
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
16 of 37 symbols inside <root> [Adopting SwiftData for a Core Data app](https://developer.apple.com/documentation/coredata/adopting-swiftdata-for-a-core-data-app)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
17 of 37 symbols inside <root>
CloudKit mirroring
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
18 of 37 symbols inside <root> containing 5 symbols[Mirroring a Core Data store with CloudKit](https://developer.apple.com/documentation/coredata/mirroring-a-core-data-store-with-cloudkit)
37 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Core Data ](https://developer.apple.com/documentation/coredata)
  * [ Creating a Core Data model ](https://developer.apple.com/documentation/coredata/creating-a-core-data-model)
  *     * Creating a Core Data model 


Article
# Creating a Core Data model
Define your app’s object structure with a data model file.
## [Overview](https://developer.apple.com/documentation/coredata/creating-a-core-data-model#overview)
The first step in working with Core Data is to create a data model file to define the structure of your app’s objects, including their object types, properties, and relationships.
You can add a Core Data model file to your Xcode project when you create the project, or you can add it to an existing project.
### [Add Core Data to a New Xcode Project](https://developer.apple.com/documentation/coredata/creating-a-core-data-model#Add-Core-Data-to-a-New-Xcode-Project)
In the dialog for creating a new project, select the Use Core Data checkbox, and click Next.
![Screenshot showing the Use Core Data checkbox in the options for creating a new Xcode project. The checkbox appears after the language dropdown, and before the checkboxes for including Unit Tests and UI Tests.](https://docs-assets.developer.apple.com/published/19ae17fc660e455d5244f4d43eedb41a/media-3039511%402x.png)
The resulting project includes an `.xcdatamodeld` file.
![Screenshot showing the .xcdatamodeld file highlighted in the project navigator.](https://docs-assets.developer.apple.com/published/bbbb08e2398531cf02bc029b3aa047e3/media-3080773%402x.png)
### [Add a Core Data Model to an Existing Project](https://developer.apple.com/documentation/coredata/creating-a-core-data-model#Add-a-Core-Data-Model-to-an-Existing-Project)
Choose File > New > File and select the iOS platform tab. Scroll down to the Core Data section, select Data Model, and click Next.
![Screenshot showing the Data Model template in the Core Data section of the file template chooser.](https://docs-assets.developer.apple.com/published/9e07aa8d17ce31890e3262cb2434d297/media-3039513%402x.png)
Name your model file, select its group and targets, and click Create.
![Screenshot showing the dialog for saving a data model file. The filename is selected and immediately editable.](https://docs-assets.developer.apple.com/published/d04d51680b0977d684f13964ef908766/media-3122943%402x.png)
Xcode adds an `.xcdatamodeld` file with the specified name to your project.
![Screenshot of Xcode showing the new model file selected in the project navigator.](https://docs-assets.developer.apple.com/published/a7a34ec891b4f73305a50e61a313cd9f/media-3080772%402x.png)
## [See Also](https://developer.apple.com/documentation/coredata/creating-a-core-data-model#see-also)
### [Related Documentation](https://developer.apple.com/documentation/coredata/creating-a-core-data-model#Related-Documentation)
[Configuring Attributes](https://developer.apple.com/documentation/coredata/configuring-attributes)
Describe the properties that compose an entity.
[Configuring Relationships](https://developer.apple.com/documentation/coredata/configuring-relationships)
Specify how entities relate and how change propagates between them.
[Generating code](https://developer.apple.com/documentation/coredata/generating-code)
Automatically or manually generate managed object subclasses from entities.
### [Essentials](https://developer.apple.com/documentation/coredata/creating-a-core-data-model#Essentials)
[Setting up a Core Data stack](https://developer.apple.com/documentation/coredata/setting-up-a-core-data-stack)
Set up the classes that manage and persist your app’s objects.
[API Reference Core Data stack](https://developer.apple.com/documentation/coredata/core-data-stack)
Manage and persist your app’s model layer.
[Handling Different Data Types in Core Data](https://developer.apple.com/documentation/coredata/handling-different-data-types-in-core-data)
Create, store, and present records for a variety of data types.
[Linking Data Between Two Core Data Stores](https://developer.apple.com/documentation/coredata/linking-data-between-two-core-data-stores)
Organize data in two different stores and implement a link between them.
Current page is Creating a Core Data model 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fcoredata%2Fcreating-a-core-data-model).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
