Source: https://developer.apple.com/documentation/StoreKit/ProductView

[ Skip Navigation ](https://developer.apple.com/documentation/StoreKit/ProductView#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/StoreKit/ProductView#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/StoreKit/ProductView)
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
[ Open Menu ](https://developer.apple.com/documentation/StoreKit/ProductView)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/StoreKit/ProductView)
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
1 of 60 symbols inside -1505352393 
In-App Purchase merchandising
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
2 of 60 symbols inside -1505352393 containing 83 symbols[StoreKit views](https://developer.apple.com/documentation/storekit/storekit-views)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 83 symbols inside 631715688 
Merchandising In-App Purchases, subscriptions, and offers
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
2 of 83 symbols inside 631715688 containing 15 symbols[ProductView](https://developer.apple.com/documentation/storekit/productview)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 15 symbols inside -861810841 
Creating product views that load products
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 15 symbols inside -861810841 [init(id: Product.ID, prefersPromotionalIcon: Bool)](https://developer.apple.com/documentation/storekit/productview/init\(id:preferspromotionalicon:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 15 symbols inside -861810841 [init(id: Product.ID, prefersPromotionalIcon: Bool, icon: () -> Icon)](https://developer.apple.com/documentation/storekit/productview/init\(id:preferspromotionalicon:icon:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 15 symbols inside -861810841 [init(id: Product.ID, prefersPromotionalIcon: Bool, icon: () -> Icon, placeholderIcon: () -> PlaceholderIcon)](https://developer.apple.com/documentation/storekit/productview/init\(id:preferspromotionalicon:icon:placeholdericon:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
5 of 15 symbols inside -861810841 [init(id: Product.ID, icon: (ProductIconPhase) -> Icon, placeholderIcon: () -> PlaceholderIcon)](https://developer.apple.com/documentation/storekit/productview/init\(id:icon:placeholdericon:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 15 symbols inside -861810841 
Creating product views with preloaded products
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
7 of 15 symbols inside -861810841 [init(Product, prefersPromotionalIcon: Bool, icon: () -> Icon)](https://developer.apple.com/documentation/storekit/productview/init\(_:preferspromotionalicon:icon:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
8 of 15 symbols inside -861810841 [init(Product, prefersPromotionalIcon: Bool)](https://developer.apple.com/documentation/storekit/productview/init\(_:preferspromotionalicon:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
9 of 15 symbols inside -861810841 [init(Product, icon: (ProductIconPhase) -> Icon)](https://developer.apple.com/documentation/storekit/productview/init\(_:icon:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 15 symbols inside -861810841 
Creating product views with a configuration
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
11 of 15 symbols inside -861810841 [init(ProductViewStyleConfiguration)](https://developer.apple.com/documentation/storekit/productview/init\(_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 15 symbols inside -861810841 
Loading promotional images
191 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ StoreKit ](https://developer.apple.com/documentation/storekit)
  * [ ProductView ](https://developer.apple.com/documentation/StoreKit/ProductView)
  *     * ProductView 


Structure
# ProductView
A view that merchandises an individual In-App Purchase product.
StoreKitSwiftUIiOS 17.0+iPadOS 17.0+macOS 14.0+tvOS 17.0+visionOS 1.0+watchOS 10.0+
```
@[MainActor](https://developer.apple.com/documentation/Swift/MainActor) @preconcurrency
struct ProductView<Icon, PlaceholderIcon> where Icon : [View](https://developer.apple.com/documentation/SwiftUI/View), PlaceholderIcon : [View](https://developer.apple.com/documentation/SwiftUI/View)
```

## [Overview](https://developer.apple.com/documentation/StoreKit/ProductView#overview)
A `ProductView` shows information about an in-app purchase product, including its localized name, description, and price, and displays a purchase button.
You create a product view by providing a product identifier to load from the App Store, or a [`Product`](https://developer.apple.com/documentation/storekit/product) value you previously loaded. If you provide a product identifier, the view loads the product’s information from the App Store automatically, and updates the view when the product is available.
You can customize the view by providing a view to use as an icon, or image, for the in-app purchase product. If you provide a product identifier, you can optionally provide a placeholder icon for the system to use instead of the automatic placeholder icon. If you set up promoted images for your products in App Store Connect, you can choose to use those images as the icon.
You can customize the product view’s appearance using the standard styles, including the [`CompactProductViewStyle`](https://developer.apple.com/documentation/storekit/compactproductviewstyle), [`RegularProductViewStyle`](https://developer.apple.com/documentation/storekit/regularproductviewstyle), and [`LargeProductViewStyle`](https://developer.apple.com/documentation/storekit/largeproductviewstyle) styles. Apply the style using the [`productViewStyle(_:)`](https://developer.apple.com/documentation/SwiftUI/View/productViewStyle\(_:\)) view modifier.
You can also create your own custom styles by creating styles that conform to the [`ProductViewStyle`](https://developer.apple.com/documentation/storekit/productviewstyle) protocol.
## [Topics](https://developer.apple.com/documentation/StoreKit/ProductView#topics)
### [Creating product views that load products](https://developer.apple.com/documentation/StoreKit/ProductView#Creating-product-views-that-load-products)
[`init(id: Product.ID, prefersPromotionalIcon: Bool)`](https://developer.apple.com/documentation/storekit/productview/init\(id:preferspromotionalicon:\))
Creates a view to load and merchandise an individual product from the App Store.
[`init(id: Product.ID, prefersPromotionalIcon: Bool, icon: () -> Icon)`](https://developer.apple.com/documentation/storekit/productview/init\(id:preferspromotionalicon:icon:\))
Creates a view to load an individual product from the App Store and merchandise it using a custom icon.
[`init(id: Product.ID, prefersPromotionalIcon: Bool, icon: () -> Icon, placeholderIcon: () -> PlaceholderIcon)`](https://developer.apple.com/documentation/storekit/productview/init\(id:preferspromotionalicon:icon:placeholdericon:\))
Creates a view to load an individual product from the App Store and merchandise it using an image and a custom placeholder icon.
[`init(id: Product.ID, icon: (ProductIconPhase) -> Icon, placeholderIcon: () -> PlaceholderIcon)`](https://developer.apple.com/documentation/storekit/productview/init\(id:icon:placeholdericon:\))
Creates a view to load an individual product from the App Store, and merchandise it using its promotional image and a custom placeholder icon.
### [Creating product views with preloaded products](https://developer.apple.com/documentation/StoreKit/ProductView#Creating-product-views-with-preloaded-products)
[`init(Product, prefersPromotionalIcon: Bool, icon: () -> Icon)`](https://developer.apple.com/documentation/storekit/productview/init\(_:preferspromotionalicon:icon:\))
Creates a view to merchandise an individual product using a custom icon.
[`init(Product, prefersPromotionalIcon: Bool)`](https://developer.apple.com/documentation/storekit/productview/init\(_:preferspromotionalicon:\))
Creates a view to merchandise an individual product.
[`init(Product, icon: (ProductIconPhase) -> Icon)`](https://developer.apple.com/documentation/storekit/productview/init\(_:icon:\))
Creates a view to display a product that the system already loaded from the App Store, and merchandise it using its promotional image.
### [Creating product views with a configuration](https://developer.apple.com/documentation/StoreKit/ProductView#Creating-product-views-with-a-configuration)
[`init(ProductViewStyleConfiguration)`](https://developer.apple.com/documentation/storekit/productview/init\(_:\))
Creates a view to merchandise an individual product using a configuration for product view style.
### [Loading promotional images](https://developer.apple.com/documentation/StoreKit/ProductView#Loading-promotional-images)
[`enum ProductIconPhase`](https://developer.apple.com/documentation/storekit/producticonphase)
The current phase of the asynchronous loading operation of a product’s promotional image.
### [Supporting types](https://developer.apple.com/documentation/StoreKit/ProductView#Supporting-types)
[`struct AutomaticProductPlaceholderIcon`](https://developer.apple.com/documentation/storekit/automaticproductplaceholdericon)
A view that represents the default placeholder icon for an in-app store product.
## [Relationships](https://developer.apple.com/documentation/StoreKit/ProductView#relationships)
### [Conforms To](https://developer.apple.com/documentation/StoreKit/ProductView#conforms-to)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)
  * [`View`](https://developer.apple.com/documentation/SwiftUI/View)


## [See Also](https://developer.apple.com/documentation/StoreKit/ProductView#see-also)
### [Merchandising In-App Purchases, subscriptions, and offers](https://developer.apple.com/documentation/StoreKit/ProductView#Merchandising-In-App-Purchases-subscriptions-and-offers)
[`struct StoreView`](https://developer.apple.com/documentation/storekit/storeview)
A view that merchandises a collection of In-App Purchase products.
[`struct SubscriptionStoreView`](https://developer.apple.com/documentation/storekit/subscriptionstoreview)
A view that merchandises a collection of auto-renewable subscription options that belong to the same subscription group.
[`struct SubscriptionOfferView`](https://developer.apple.com/documentation/storekit/subscriptionofferview)
[Backyard Birds: Building an app with SwiftData and widgets](https://developer.apple.com/documentation/SwiftUI/Backyard-birds-sample)
Create an app with persistent data, interactive widgets, and an all new in-app purchase experience.
Current page is ProductView 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FStoreKit%2FProductView).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
