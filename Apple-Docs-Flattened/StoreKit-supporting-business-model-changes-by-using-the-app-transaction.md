Source: https://developer.apple.com/documentation/storekit/supporting-business-model-changes-by-using-the-app-transaction

[ Skip Navigation ](https://developer.apple.com/documentation/storekit/supporting-business-model-changes-by-using-the-app-transaction#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/storekit/supporting-business-model-changes-by-using-the-app-transaction#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/storekit/supporting-business-model-changes-by-using-the-app-transaction)
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
[ Open Menu ](https://developer.apple.com/documentation/storekit/supporting-business-model-changes-by-using-the-app-transaction)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/storekit/supporting-business-model-changes-by-using-the-app-transaction)


[](https://developer.apple.com/documentation/storekit/supporting-business-model-changes-by-using-the-app-transaction)
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
  * [ Supporting business model changes by using the app transaction ](https://developer.apple.com/documentation/storekit/supporting-business-model-changes-by-using-the-app-transaction)
  *     * Supporting business model changes by using the app transaction 


Article
# Supporting business model changes by using the app transaction
Access the app transaction to determine when a customer purchased an app and the features to which they’re entitled.
## [Overview](https://developer.apple.com/documentation/storekit/supporting-business-model-changes-by-using-the-app-transaction#overview)
The [`originalAppVersion`](https://developer.apple.com/documentation/storekit/apptransaction/originalappversion) property indicates the app version that the customer purchased. If you change your business model from a paid app to a free app that offers in-app purchases, use this property to learn whether the customer purchased your app before you changed the business model. Then, use that information to determine your customers’ entitlement to features that were available in the paid app.
### [Provide features to all customers](https://developer.apple.com/documentation/storekit/supporting-business-model-changes-by-using-the-app-transaction#Provide-features-to-all-customers)
For example, an app that is a paid app in version 1 has premium features available to everyone who buys it. For version 2, the developer changes the business model, making it a free app that offers in-app purchases. Version 2 of the app has the same premium features, but now they’re available as in-app purchases.
In version 2, the developer wants to continue to provide the premium features to customers who purchased version 1. To do so, the app performs the following steps:
  1. The app’s code includes a constant that indicates the version the business model changed; that constant is `"2"` in this example.
  2. The app compares the [`originalAppVersion`](https://developer.apple.com/documentation/storekit/apptransaction/originalappversion) value with the constant. If the customer purchased the app before the business model changed, the app determines that they’re entitled to the premium features.
  3. The app also checks the [`currentEntitlements`](https://developer.apple.com/documentation/storekit/transaction/currententitlements) sequence and delivers any in-app purchases the customers may have made.


### [Obtain an app transaction](https://developer.apple.com/documentation/storekit/supporting-business-model-changes-by-using-the-app-transaction#Obtain-an-app-transaction)
An app that performs these steps ensures that paid customers can access the premium features that were included with the app they purchased.
The code examples below demonstrate how an app obtains an [`AppTransaction`](https://developer.apple.com/documentation/storekit/apptransaction), compares the [`originalAppVersion`](https://developer.apple.com/documentation/storekit/apptransaction/originalappversion) with a constant that represents a specific app version, and then determines the customer’s entitlements.
Here’s how it looks in macOS:
```
do {
    // Get the `appTransaction`.
    let shared = try await AppTransaction.shared
    if case .verified(let appTransaction) = shared {
        // Hard-code the major version number in which the app's business model changed.
        let newBusinessModelMajorVersion = "2" 


        // Get the major version number of the version the customer originally purchased.
        let versionComponents = appTransaction.originalAppVersion.split(separator: ".")
        let originalMajorVersion = versionComponents[0]


        if originalMajorVersion < newBusinessModelMajorVersion {
            // This customer purchased the app before the business model changed.
            // Deliver content that they're entitled to based on their app purchase.
        }
        else {
            // This person purchased the app after the business model changed.
        }
    }
}
catch {
    // Handle errors.
}




// Iterate over any other products they purchased.
for await result in Transaction.currentEntitlements {
    if case .verified(let transaction) = result {
        // Deliver the content based on their current entitlements.
    }
}

```

Here’s an example of the code for an app in iOS, tvOS, watchOS, and visionOS:
```
do {
    // Get the `appTransaction`.
    let shared = try await AppTransaction.shared
    if case .verified(let appTransaction) = shared {
        // Hard-code the `CFBundleVersion` number in which the app's business model changed.
        let newBusinessModelVersion = "2"


        // Compare this number with the version number the person originally purchased.
        if appTransaction.originalAppVersion < newBusinessModelVersion {
            // Handle a case in which a person purchased the app before the business model changed.
            // Deliver content that they're entitled to based on their app purchase.
        }
        else {
            // This person purchased the app after the business model changed.
        }
    }
}
catch {
    // Handle errors.
}


// Iterate over any other products they purchased.
for await result in Transaction.currentEntitlements {
    if case .verified(let transaction) = result {
    // Deliver the content based on their current entitlements.
    }
}

```

Related sessions from WWDC22
Session 10007: [What’s new with in-app purchase](https://developer.apple.com/videos/play/wwdc2022/10007/)
## [See Also](https://developer.apple.com/documentation/storekit/supporting-business-model-changes-by-using-the-app-transaction#see-also)
### [App transaction](https://developer.apple.com/documentation/storekit/supporting-business-model-changes-by-using-the-app-transaction#App-transaction)
[`struct AppTransaction`](https://developer.apple.com/documentation/storekit/apptransaction)
Information that represents the customer’s purchase of the app, cryptographically signed by the App Store.
Current page is Supporting business model changes by using the app transaction 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fstorekit%2Fsupporting-business-model-changes-by-using-the-app-transaction).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
