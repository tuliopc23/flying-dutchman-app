Source: https://developer.apple.com/documentation/storekit/understanding-storekit-workflows

[ Skip Navigation ](https://developer.apple.com/documentation/storekit/understanding-storekit-workflows#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/storekit/understanding-storekit-workflows#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/storekit/understanding-storekit-workflows)
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
[ Open Menu ](https://developer.apple.com/documentation/storekit/understanding-storekit-workflows)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/storekit/understanding-storekit-workflows)
## [ StoreKit  ](https://developer.apple.com/documentation/storekit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 33 symbols inside <root>
In-App Purchase
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 33 symbols inside <root>
In-App Purchase
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
2 of 33 symbols inside <root> containing 60 symbols[In-App Purchase](https://developer.apple.com/documentation/storekit/in-app-purchase)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 33 symbols inside <root> [Understanding StoreKit workflows](https://developer.apple.com/documentation/storekit/understanding-storekit-workflows)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 33 symbols inside <root> [Getting started with In-App Purchase using StoreKit views](https://developer.apple.com/documentation/storekit/getting-started-with-in-app-purchases-using-storekit-views)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 33 symbols inside <root>
App transaction
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 33 symbols inside <root> [Supporting business model changes by using the app transaction](https://developer.apple.com/documentation/storekit/supporting-business-model-changes-by-using-the-app-transaction)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
7 of 33 symbols inside <root> containing 29 symbols[AppTransaction](https://developer.apple.com/documentation/storekit/apptransaction)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 33 symbols inside <root>
Messages
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
9 of 33 symbols inside <root> containing 7 symbols[Message](https://developer.apple.com/documentation/storekit/message)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
10 of 33 symbols inside <root> containing 7 symbols[Message.Reason](https://developer.apple.com/documentation/storekit/message/reason-swift.struct)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
11 of 33 symbols inside <root> containing 2 symbols[DisplayMessageAction](https://developer.apple.com/documentation/storekit/displaymessageaction)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 33 symbols inside <root>
Reviews
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
13 of 33 symbols inside <root> [Requesting App Store reviews](https://developer.apple.com/documentation/storekit/requesting-app-store-reviews)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
14 of 33 symbols inside <root> containing 4 symbols[RequestReviewAction](https://developer.apple.com/documentation/storekit/requestreviewaction)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
15 of 33 symbols inside <root> containing 3 symbols[SKStoreReviewController](https://developer.apple.com/documentation/storekit/skstorereviewcontroller)Deprecated
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
16 of 33 symbols inside <root>
Recommendations
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
17 of 33 symbols inside <root> [Offering media for sale in your app](https://developer.apple.com/documentation/storekit/offering-media-for-sale-in-your-app)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
18 of 33 symbols inside <root> containing 10 symbols[SKStoreProductViewController](https://developer.apple.com/documentation/storekit/skstoreproductviewcontroller)
33 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ StoreKit ](https://developer.apple.com/documentation/storekit)
  * [ Understanding StoreKit workflows ](https://developer.apple.com/documentation/storekit/understanding-storekit-workflows)
  *     * Understanding StoreKit workflows 


Sample Code
# Understanding StoreKit workflows
Implement an in-app store with several product types, using StoreKit views.
[ Download ](https://docs-assets.developer.apple.com/published/6b864cb1ff7d/UnderstandingStoreKitWorkflows.zip)
iOS 26.0+iPadOS 26.0+macOS 26.0+Xcode 26.0+
## [Overview](https://developer.apple.com/documentation/storekit/understanding-storekit-workflows#Overview)
StoreKit offers an expansive API for creating an almost limitless variety of in-app stores. This sample app shows you precisely what you need to implement in order to get up and running with a store in your app that can implement several In-App Purchase (IAP) types, including subscriptions.
## [Configure and run the project](https://developer.apple.com/documentation/storekit/understanding-storekit-workflows#Configure-and-run-the-project)
The design of this sample doesn’t require any special setup, or even the creation of products in App Store Connect; it uses StoreKit Testing in Xcode and the Transaction Manager window in Xcode to test In-App Purchase.
This project comes with the following products set up locally:
  * A consumable item
  * A non-consumable item
  * A collection of consumable items
  * A monthly subscription
  * A yearly (annual) subscription
  * A premium yearly (annual) subscription, with a “1 month free” introductory offer.


For more information on the product types that App Store Connect supports, see [In-app purchase types](https://developer.apple.com/help/app-store-connect/reference/in-app-purchase-types/)
Note
The transactions this app demonstrates don’t get information from App Store Connect and don’t incur charges. Xcode simulates successful transactions without processing actual payments.
To see the pre-configured local StoreKit products, select the `LocalConfiguration` file in the project’s file navigator. This file lists all of the types, descriptions, and properties of the demo products the app supports.
For more information on using the `LocalConfiguration` file, including creating products and inspecting or modifying transactions, see [Testing in-app purchases with StoreKit transaction manager in Xcode](https://developer.apple.com/documentation/xcode/testing-in-app-purchases-with-storekit-transaction-manager-in-code).
To run the app, press the Xcode run button, or press command-R. To purchase any demo products, click or tap the buy button on a product, and the system presents the payment sheet that you can either accept (purchase) or cancel. The app shows the status and results of purchases on the status display near the top of the app’s window.
## [Reset the project’s In-App Purchases](https://developer.apple.com/documentation/storekit/understanding-storekit-workflows#Reset-the-projects-In-App-Purchases)
After you purchase products in the sample app, to reset the product to its initial unpurchased state, select Debug > StoreKit > Manage Transactions. In the sample app’s Transactions panel, select each transaction you want to delete, then click the minus (”-”) button at the bottom of the list to delete it. In addition, to reset the consumable item information that the app stores, run the command `defaults delete com.example.apple-samplecode.StoreKitWorkflows` in Terminal.
For more information on all the capabilities StoreKit provides for the construction of in-app stores and customized StoreKit Views, see [StoreKit views](https://developer.apple.com/documentation/storekit/storekit-views).
## [See Also](https://developer.apple.com/documentation/storekit/understanding-storekit-workflows#see-also)
### [In-App Purchase](https://developer.apple.com/documentation/storekit/understanding-storekit-workflows#In-App-Purchase)
[API Reference In-App Purchase](https://developer.apple.com/documentation/storekit/in-app-purchase)
Offer content and services in your app across Apple platforms using a Swift-based interface.
[Getting started with In-App Purchase using StoreKit views](https://developer.apple.com/documentation/storekit/getting-started-with-in-app-purchases-using-storekit-views)
Set up an in-app store using SwiftUI and StoreKit views.
Current page is Understanding StoreKit workflows 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fstorekit%2Funderstanding-storekit-workflows).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
