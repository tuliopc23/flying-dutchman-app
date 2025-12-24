Source: https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller

[ Skip Navigation ](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller)
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
[ Open Menu ](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller)


[](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller)
## [ PassKit (Apple Pay and Wallet)  ](https://developer.apple.com/documentation/passkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 4 symbols inside <root>
Apple pay support
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 4 symbols inside <root>
Apple pay support
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
2 of 4 symbols inside <root> containing 55 symbols[Apple Pay](https://developer.apple.com/documentation/passkit/apple-pay)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 55 symbols inside 908859029 
Apple Pay setup
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 55 symbols inside 908859029 [Setting up Apple Pay](https://developer.apple.com/documentation/passkit/setting-up-apple-pay)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 55 symbols inside 908859029 [Offering Apple Pay in Your App](https://developer.apple.com/documentation/passkit/offering-apple-pay-in-your-app)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 55 symbols inside 908859029 [Complying with regional regulations](https://developer.apple.com/documentation/passkit/complying-with-regional-regulations)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 55 symbols inside 908859029 
Apple Pay availability
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
6 of 55 symbols inside 908859029 containing 15 symbols[PKPaymentAuthorizationController](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 15 symbols inside 132960337 
Creating a payment authorization controller
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 15 symbols inside 132960337 [init(paymentRequest: PKPaymentRequest)](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/init\(paymentrequest:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 15 symbols inside 132960337 [convenience init(disbursementRequest: PKDisbursementRequest)](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/init\(disbursementrequest:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 15 symbols inside 132960337 
Determining whether the user can make payments or disbursements
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
5 of 15 symbols inside 132960337 [class func canMakePayments() -> Bool](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/canmakepayments\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
6 of 15 symbols inside 132960337 [class func canMakePayments(usingNetworks: [PKPaymentNetwork]) -> Bool](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/canmakepayments\(usingnetworks:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
7 of 15 symbols inside 132960337 [class func canMakePayments(usingNetworks: [PKPaymentNetwork], capabilities: PKMerchantCapability) -> Bool](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/canmakepayments\(usingnetworks:capabilities:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
8 of 15 symbols inside 132960337 [class func supportsDisbursements() -> Bool](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/supportsdisbursements\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
9 of 15 symbols inside 132960337 [class func supportsDisbursements(using: [PKPaymentNetwork]) -> Bool](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/supportsdisbursements\(using:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
10 of 15 symbols inside 132960337 [class func supportsDisbursements(using: [PKPaymentNetwork], capabilities: PKMerchantCapability) -> Bool](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/supportsdisbursements\(using:capabilities:\))
74 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ PassKit (Apple Pay and Wallet) ](https://developer.apple.com/documentation/passkit)
  * [ PKPaymentAuthorizationController ](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller)
  *     * PKPaymentAuthorizationController 


Class
# PKPaymentAuthorizationController
An object that presents a sheet that prompts the user to authorize a payment request.
iOS 10.0+iPadOS 10.0+Mac Catalyst 13.1+macOS 11.0+visionOS 1.0+watchOS 3.0+
```
class PKPaymentAuthorizationController
```

## [Overview](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller#overview)
After the user authorizes the payment request for a transaction, the delegate is called with a payment token used to authorize the transaction’s payment.
Important
The [`PKPaymentAuthorizationController`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller) class performs the same role as the [`PKPaymentAuthorizationViewController`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationviewcontroller) class, but it does not depend on the UIKit framework. This means that the authorization controller can be used in places where a view controller cannot (for example, in watchOS apps or in SiriKit extensions).
## [Topics](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller#topics)
### [Creating a payment authorization controller](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller#Creating-a-payment-authorization-controller)
[`init(paymentRequest: PKPaymentRequest)`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/init\(paymentrequest:\))
Initializes and returns a payment authorization controller.
[`convenience init(disbursementRequest: PKDisbursementRequest)`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/init\(disbursementrequest:\))
Creates a new payment authorization controller with the disbursement request you provide.
### [Determining whether the user can make payments or disbursements](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller#Determining-whether-the-user-can-make-payments-or-disbursements)
[`class func canMakePayments() -> Bool`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/canmakepayments\(\))
Returns whether the user can make payments.
[`class func canMakePayments(usingNetworks: [PKPaymentNetwork]) -> Bool`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/canmakepayments\(usingnetworks:\))
Returns whether the user can make payments through the specified network.
[`class func canMakePayments(usingNetworks: [PKPaymentNetwork], capabilities: PKMerchantCapability) -> Bool`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/canmakepayments\(usingnetworks:capabilities:\))
Returns whether the user can make payments using a card from the specified network with the specified capabilities.
[`class func supportsDisbursements() -> Bool`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/supportsdisbursements\(\))
Returns a Boolean value that indicates whether this device can process disbursement requests.
[`class func supportsDisbursements(using: [PKPaymentNetwork]) -> Bool`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/supportsdisbursements\(using:\))
Returns a Boolean value that indicates whether this device can process disbursement requests using the specified payment network brands.
[`class func supportsDisbursements(using: [PKPaymentNetwork], capabilities: PKMerchantCapability) -> Bool`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/supportsdisbursements\(using:capabilities:\))
Returns a Boolean value indicating whether this device can process disbursement requests using the specified payment network brands and capabilities.
### [Handling user interactions](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller#Handling-user-interactions)
[`var delegate: (any PKPaymentAuthorizationControllerDelegate)?`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/delegate)
The controller’s delegate.
[`protocol PKPaymentAuthorizationControllerDelegate`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontrollerdelegate)
Methods that let you respond to user interactions with your payment authorization controller.
[`func present(completion: ((Bool) -> Void)?)`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/present\(completion:\))
Presents the payment sheet modally over your app.
[`func dismiss(completion: (() -> Void)?)`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/dismiss\(completion:\))
Dismisses the payment sheet.
## [Relationships](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller#relationships)
### [Inherits From](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller#inherits-from)
  * [`NSObject`](https://developer.apple.com/documentation/ObjectiveC/NSObject-swift.class)


### [Conforms To](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller#conforms-to)
  * [`CVarArg`](https://developer.apple.com/documentation/Swift/CVarArg)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`NSObjectProtocol`](https://developer.apple.com/documentation/ObjectiveC/NSObjectProtocol)


## [See Also](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller#see-also)
### [Apple Pay availability](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller#Apple-Pay-availability)
[`class PKPaymentAuthorizationViewController`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationviewcontroller)
An object that presents a sheet that prompts the user to authorize a payment request.
Current page is PKPaymentAuthorizationController 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fpasskit%2Fpkpaymentauthorizationcontroller).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
