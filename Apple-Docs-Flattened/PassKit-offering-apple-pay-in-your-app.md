Source: https://developer.apple.com/documentation/passkit/offering-apple-pay-in-your-app

[ Skip Navigation ](https://developer.apple.com/documentation/passkit/offering-apple-pay-in-your-app#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/passkit/offering-apple-pay-in-your-app#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/passkit/offering-apple-pay-in-your-app)
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
[ Open Menu ](https://developer.apple.com/documentation/passkit/offering-apple-pay-in-your-app)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/passkit/offering-apple-pay-in-your-app)


[](https://developer.apple.com/documentation/passkit/offering-apple-pay-in-your-app)
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
C
7 of 55 symbols inside 908859029 containing 13 symbols[PKPaymentAuthorizationViewController](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationviewcontroller)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 55 symbols inside 908859029 
Apple Pay buttons
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
9 of 55 symbols inside 908859029 containing 8 symbols[PKPaymentButton](https://developer.apple.com/documentation/passkit/pkpaymentbutton)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
10 of 55 symbols inside 908859029 containing 7 symbols[PayWithApplePayButton](https://developer.apple.com/documentation/passkit/paywithapplepaybutton)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
11 of 55 symbols inside 908859029 containing 18 symbols[PayWithApplePayButtonLabel](https://developer.apple.com/documentation/passkit/paywithapplepaybuttonlabel)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
12 of 55 symbols inside 908859029 containing 5 symbols[PayWithApplePayButtonStyle](https://developer.apple.com/documentation/passkit/paywithapplepaybuttonstyle)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
13 of 55 symbols inside 908859029 containing 18 symbols[PayWithApplePayButtonLabel](https://developer.apple.com/documentation/passkit/paywithapplepaybuttonlabel)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
14 of 55 symbols inside 908859029 
Payment requests
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
15 of 55 symbols inside 908859029 containing 69 symbols[PKPaymentRequest](https://developer.apple.com/documentation/passkit/pkpaymentrequest)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
16 of 55 symbols inside 908859029 containing 12 symbols[PKRecurringPaymentRequest](https://developer.apple.com/documentation/passkit/pkrecurringpaymentrequest)
59 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ PassKit (Apple Pay and Wallet) ](https://developer.apple.com/documentation/passkit)
  * [ Apple Pay ](https://developer.apple.com/documentation/passkit/apple-pay)
  * [ Offering Apple Pay in Your App ](https://developer.apple.com/documentation/passkit/offering-apple-pay-in-your-app)
  *     * [ Apple Pay ](https://developer.apple.com/documentation/passkit/apple-pay)
    * Offering Apple Pay in Your App 


Sample Code
# Offering Apple Pay in Your App
Collect payments with iPhone and Apple Watch using Apple Pay.
[ Download ](https://docs-assets.developer.apple.com/published/5717c0e852a2/OfferingApplePayInYourApp.zip)
iOS 15.0+iPadOS 15.0+watchOS 8.0+Xcode 13.0+
## [Overview](https://developer.apple.com/documentation/passkit/offering-apple-pay-in-your-app#Overview)
This sample shows the implementation of an integrated Apple Pay eCommerce experience across iOS and watchOS. The sample app demonstrates how to use the Apple Pay button, display the Apple Pay payment sheet, make payment requests, and accept coupon codes.
The sample ticket booking app implements buying a ticket using Apple Pay in:
  * An iOS app.
  * A watchOS app.


A shared `PaymentHandler` class handles payment in each of the apps.
Note
This sample code project is associated with WWDC21 session [10092: What’s New in Wallet and Apple Pay](https://developer.apple.com/wwdc21/10092/).
### [Configure the Sample Code Project](https://developer.apple.com/documentation/passkit/offering-apple-pay-in-your-app#Configure-the-Sample-Code-Project)
Test Apple Pay payments with this sample by configuring the bundle identifiers and Apple Pay configuration items in Xcode. Doing this requires an Apple developer account. Before building the app, complete these four steps:
  1. Change the bundle ID for each target so that it’s unique for your developer account; change `example` in the bundle ID to something that represents you or your organization.
  2. In the build settings, update the value of the user-defined `OFFERING_APPLE_PAY_BUNDLE_PREFIX` setting to match the prefix of the bundle IDs you changed in step 1. For example, if you changed `example` in each bundle ID to your organization name, change `example` in `OFFERING_APPLE_PAY_BUNDLE_PREFIX` to the same organization name. Xcode configures the required merchant ID for Apple Pay in each target when you build the project.
  3. Set up the Apple Pay Merchant Identity and Apple Pay Payment Processing certificates. For more information on setting up a merchant identity and processing certificates, see [Setting Up Apple Pay](https://developer.apple.com/documentation/PassKit/setting-up-apple-pay).
  4. Set the signing option for the iOS app to “Automatically manage signing.”


Running this app on an iPhone or Apple Watch requires an Apple Pay card. Running in Simulator doesn’t require a card.
Note
Not all Apple Pay features are supported in the iOS simulator. Testing Apple Pay is unsupported in the watchOS simulator.
For more information about processing an Apple Pay payment using a payment platform or merchant bank, see [An easier way to pay within apps and websites](https://developer.apple.com/apple-pay). To set up your sandbox environment for testing, see [Sandbox Testing](https://developer.apple.com/apple-pay/sandbox-testing/).
### [Add the Apple Pay Button](https://developer.apple.com/documentation/passkit/offering-apple-pay-in-your-app#Add-the-Apple-Pay-Button)
Apple Pay includes pre-built buttons to start a payment interaction, or to set up payment methods. The iOS app displays the payment button if the device can make payments, and it contains at least one payment card; otherwise it displays the button to add a payment.
This sample checks for the ability to make payments using [`canMakePayments()`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/canmakepayments\(\)), and checks for available payment cards using [`canMakePayments(usingNetworks:)`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller/canmakepayments\(usingnetworks:\)). Both of these methods are part of [`PKPaymentAuthorizationController`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller).
```
static let supportedNetworks: [PKPaymentNetwork] = [
    .amex,
    .discover,
    .masterCard,
    .visa
]


class func applePayStatus() -> (canMakePayments: Bool, canSetupCards: Bool) {
    return (PKPaymentAuthorizationController.canMakePayments(),
            PKPaymentAuthorizationController.canMakePayments(usingNetworks: supportedNetworks))
}

```

The iOS app displays the payment button by adding an instance of [`PKPaymentButton`](https://developer.apple.com/documentation/passkit/pkpaymentbutton).
Note
The sample app doesn’t display the add button if a device can’t accept payments due to hardware limitations, parental controls, or any other reasons.
```
let result = PaymentHandler.applePayStatus()
var button: UIButton?


if result.canMakePayments {
    button = PKPaymentButton(paymentButtonType: .book, paymentButtonStyle: .black)
    button?.addTarget(self, action: #selector(ViewController.payPressed), for: .touchUpInside)
} else if result.canSetupCards {
    button = PKPaymentButton(paymentButtonType: .setUp, paymentButtonStyle: .black)
    button?.addTarget(self, action: #selector(ViewController.setupPressed), for: .touchUpInside)
}


if let applePayButton = button {
    let constraints = [
        applePayButton.centerXAnchor.constraint(equalTo: applePayView.centerXAnchor),
        applePayButton.centerYAnchor.constraint(equalTo: applePayView.centerYAnchor)
    ]
    applePayButton.translatesAutoresizingMaskIntoConstraints = false
    applePayView.addSubview(applePayButton)
    NSLayoutConstraint.activate(constraints)
}

```

The watchOS app adds the button to the storyboard as an instance of [`WKInterfacePaymentButton`](https://developer.apple.com/documentation/WatchKit/WKInterfacePaymentButton).
### [Define the Shipping Methods](https://developer.apple.com/documentation/passkit/offering-apple-pay-in-your-app#Define-the-Shipping-Methods)
The app defines two shipping methods: delivery with estimated shipping dates and on-site collection. The payment sheet displays the delivery information for the chosen shipping method, including estimated delivery dates. Configuring the dates requires a calendar, start date components, and end date components
```
func shippingMethodCalculator() -> [PKShippingMethod] {
    // Calculate the pickup date.
    
    let today = Date()
    let calendar = Calendar.current
    
    let shippingStart = calendar.date(byAdding: .day, value: 3, to: today)!
    let shippingEnd = calendar.date(byAdding: .day, value: 5, to: today)!
    
    let startComponents = calendar.dateComponents([.calendar, .year, .month, .day], from: shippingStart)
    let endComponents = calendar.dateComponents([.calendar, .year, .month, .day], from: shippingEnd)
     
    let shippingDelivery = PKShippingMethod(label: "Delivery", amount: NSDecimalNumber(string: "0.00"))
    shippingDelivery.dateComponentsRange = PKDateComponentsRange(start: startComponents, end: endComponents)
    shippingDelivery.detail = "Ticket sent to you address"
    shippingDelivery.identifier = "DELIVERY"
    
    let shippingCollection = PKShippingMethod(label: "Collection", amount: NSDecimalNumber(string: "0.00"))
    shippingCollection.detail = "Collect ticket at festival"
    shippingCollection.identifier = "COLLECTION"
    
    return [shippingDelivery, shippingCollection]
}

```

### [Start the Payment Process](https://developer.apple.com/documentation/passkit/offering-apple-pay-in-your-app#Start-the-Payment-Process)
Both iOS and watchOS implementations start the payment process by calling the `startPayment` method of the shared `PaymentHandler`. Updates to the payment sheet use the completion handlers implemented by both apps. The `startPayment` method stores the completion handlers because the Apple Pay functionality is asynchronous; and then the method creates an array of [`PKPaymentSummaryItem`](https://developer.apple.com/documentation/passkit/pkpaymentsummaryitem) to display the charges on the payment sheet.
```
let ticket = PKPaymentSummaryItem(label: "Festival Entry", amount: NSDecimalNumber(string: "9.99"), type: .final)
let tax = PKPaymentSummaryItem(label: "Tax", amount: NSDecimalNumber(string: "1.00"), type: .final)
let total = PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(string: "10.99"), type: .final)
paymentSummaryItems = [ticket, tax, total]

```

The app configures a [`PKPaymentRequest`](https://developer.apple.com/documentation/passkit/pkpaymentrequest) using the list of payment items and other details.
```
let paymentRequest = PKPaymentRequest()
paymentRequest.paymentSummaryItems = paymentSummaryItems
paymentRequest.merchantIdentifier = Configuration.Merchant.identifier
paymentRequest.merchantCapabilities = .capability3DS
paymentRequest.countryCode = "US"
paymentRequest.currencyCode = "USD"
paymentRequest.supportedNetworks = PaymentHandler.supportedNetworks
paymentRequest.shippingType = .delivery
paymentRequest.shippingMethods = shippingMethodCalculator()
paymentRequest.requiredShippingContactFields = [.name, .postalAddress]
#if !os(watchOS)
paymentRequest.supportsCouponCode = true
#endif

```

Next the app displays the payment sheet by calling [`PKPaymentAuthorizationController`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontroller) with the payment request. Both apps present the payment sheet using `present(completion:)`.
The payment sheet handles all user interactions, including payment confirmation. It requests updates using the completion handlers stored by the `startPayment` method when a user updates the sheet.
```
paymentController = PKPaymentAuthorizationController(paymentRequest: paymentRequest)
paymentController?.delegate = self
paymentController?.present(completion: { (presented: Bool) in
    if presented {
        debugPrint("Presented payment controller")
    } else {
        debugPrint("Failed to present payment controller")
        self.completionHandler(false)
    }
})

```

### [Respond to Coupon Code Entry](https://developer.apple.com/documentation/passkit/offering-apple-pay-in-your-app#Respond-to-Coupon-Code-Entry)
The `PaymentHandler` class handles coupons by implementing the [`PKPaymentAuthorizationControllerDelegate`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontrollerdelegate) protocol method [`paymentAuthorizationController(_:didSelectPaymentMethod:handler:)`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontrollerdelegate/paymentauthorizationcontroller\(_:didselectpaymentmethod:handler:\)).
After the user enters an accepted coupon code, the method adds a new `PKPaymentSummaryItem` displaying the discount, and adjusts the `PKPaymentSummaryItem` with the discounted total.
Note
This method is wrapped in a conditional compilation flag as watchOS 8 doesn’t support coupon codes.
```
#if !os(watchOS)


func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController,
                                    didChangeCouponCode couponCode: String,
                                    handler completion: @escaping (PKPaymentRequestCouponCodeUpdate) -> Void) {
    // The `didChangeCouponCode` delegate method allows you to make changes when the user enters or updates a coupon code.
    
    func applyDiscount(items: [PKPaymentSummaryItem]) -> [PKPaymentSummaryItem] {
        let tickets = items.first!
        let couponDiscountItem = PKPaymentSummaryItem(label: "Coupon Code Applied", amount: NSDecimalNumber(string: "-2.00"))
        let updatedTax = PKPaymentSummaryItem(label: "Tax", amount: NSDecimalNumber(string: "0.80"), type: .final)
        let updatedTotal = PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(string: "8.80"), type: .final)
        let discountedItems = [tickets, couponDiscountItem, updatedTax, updatedTotal]
        return discountedItems
    }
    
    if couponCode.uppercased() == "FESTIVAL" {
        // If the coupon code is valid, update the summary items.
        let couponCodeSummaryItems = applyDiscount(items: paymentSummaryItems)
        completion(PKPaymentRequestCouponCodeUpdate(paymentSummaryItems: applyDiscount(items: couponCodeSummaryItems)))
        return
    } else if couponCode.isEmpty {
        // If the user doesn't enter a code, return the current payment summary items.
        completion(PKPaymentRequestCouponCodeUpdate(paymentSummaryItems: paymentSummaryItems))
        return
    } else {
        // If the user enters a code, but it's not valid, we can display an error.
        let couponError = PKPaymentRequest.paymentCouponCodeInvalidError(localizedDescription: "Coupon code is not valid.")
        completion(PKPaymentRequestCouponCodeUpdate(errors: [couponError], paymentSummaryItems: paymentSummaryItems, shippingMethods: shippingMethodCalculator()))
        return
    }
}


#endif

```

### [Handle Payment Success or Failure](https://developer.apple.com/documentation/passkit/offering-apple-pay-in-your-app#Handle-Payment-Success-or-Failure)
When the user authorizes the payment, the system calls the [`paymentAuthorizationController(_:didAuthorizePayment:handler:)`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontrollerdelegate/paymentauthorizationcontroller\(_:didauthorizepayment:handler:\)) method of the [`PKPaymentAuthorizationControllerDelegate`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontrollerdelegate) protocol. Your handler confirms that the shipping address meets the criteria needed, and then calls the completion handler to report success or failure of the payment.
The sample code contains a comment at the place you add code for processing the payment.
```
func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
    
    // Perform basic validation on the provided contact information.
    var errors = [Error]()
    var status = PKPaymentAuthorizationStatus.success
    if payment.shippingContact?.postalAddress?.isoCountryCode != "US" {
        let pickupError = PKPaymentRequest.paymentShippingAddressUnserviceableError(withLocalizedDescription: "Sample App only available in the United States")
        let countryError = PKPaymentRequest.paymentShippingAddressInvalidError(withKey: CNPostalAddressCountryKey, localizedDescription: "Invalid country")
        errors.append(pickupError)
        errors.append(countryError)
        status = .failure
    } else {
        // Send the payment token to your server or payment provider to process here.
        // Once processed, return an appropriate status in the completion handler (success, failure, and so on).
    }
    
    self.paymentStatus = status
    completion(PKPaymentAuthorizationResult(status: status, errors: errors))
}

```

Once the sample app calls the completion handler in the [`paymentAuthorizationController(_:didAuthorizePayment:handler:)`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontrollerdelegate/paymentauthorizationcontroller\(_:didauthorizepayment:handler:\)) method, Apple Pay tells the app it can dismiss the payment sheet by calling [`paymentAuthorizationControllerDidFinish(_:)`](https://developer.apple.com/documentation/passkit/pkpaymentauthorizationcontrollerdelegate/paymentauthorizationcontrollerdidfinish\(_:\)). iOS and watchOS both handle dismissing the sheet as appropriate for each platform. In the iOS app, if payment succeeds the completion handler performs a segue to display a new view controller. If the payment fails, it remains on the payment sheet so the user can attempt payment with a different card or correct any issues.
```
@objc func payPressed(sender: AnyObject) {
    paymentHandler.startPayment() { (success) in
        if success {
            self.performSegue(withIdentifier: "Confirmation", sender: self)
        }
    }
}

```

## [See Also](https://developer.apple.com/documentation/passkit/offering-apple-pay-in-your-app#see-also)
### [Apple Pay setup](https://developer.apple.com/documentation/passkit/offering-apple-pay-in-your-app#Apple-Pay-setup)
[Setting up Apple Pay](https://developer.apple.com/documentation/passkit/setting-up-apple-pay)
Fulfill the requirements to provide Apple Pay as a payment option on your website or in your app.
[Complying with regional regulations](https://developer.apple.com/documentation/passkit/complying-with-regional-regulations)
Check regional regulations for possible requirements for your Apple Pay-based implementation.
Current page is Offering Apple Pay in Your App 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fpasskit%2Foffering-apple-pay-in-your-app).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
