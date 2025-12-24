Source: https://developer.apple.com/documentation/PassKit/wallet

[ Skip Navigation ](https://developer.apple.com/documentation/PassKit/wallet#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/PassKit/wallet#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/PassKit/wallet)
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
[ Open Menu ](https://developer.apple.com/documentation/PassKit/wallet)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/PassKit/wallet)


[](https://developer.apple.com/documentation/PassKit/wallet)
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
3 of 4 symbols inside <root>
Wallet support
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
4 of 4 symbols inside <root> containing 93 symbols[Wallet](https://developer.apple.com/documentation/passkit/wallet)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 93 symbols inside -993201791 
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
2 of 93 symbols inside -993201791 [Pass Type IDs Entitlement](https://developer.apple.com/documentation/bundleresources/entitlements/com.apple.developer.pass-type-identifiers)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
3 of 93 symbols inside -993201791 [Merchant IDs Entitlement](https://developer.apple.com/documentation/bundleresources/entitlements/com.apple.developer.in-app-payments)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
4 of 93 symbols inside -993201791 [com.apple.developer.in-app-identity-presentment](https://developer.apple.com/documentation/bundleresources/entitlements/com.apple.developer.in-app-identity-presentment)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 93 symbols inside -993201791 [Requesting identity data from a Wallet pass](https://developer.apple.com/documentation/passkit/requesting-identity-data-from-a-wallet-pass)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 93 symbols inside -993201791 [Verifying Wallet identity requests](https://developer.apple.com/documentation/passkit/verifying-wallet-identity-requests)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 93 symbols inside -993201791 
Wallet Passes
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 93 symbols inside -993201791 [Wallet Passes](https://developer.apple.com/documentation/walletpasses)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 93 symbols inside -993201791 
Common data types
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
10 of 93 symbols inside -993201791 [PKObject](https://developer.apple.com/documentation/passkit/pkobject)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
11 of 93 symbols inside -993201791 containing 6 symbols[PKAddPassButton](https://developer.apple.com/documentation/passkit/pkaddpassbutton)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
12 of 93 symbols inside -993201791 containing 5 symbols[PKLabeledValue](https://developer.apple.com/documentation/passkit/pklabeledvalue)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
13 of 93 symbols inside -993201791 containing 14 symbols[AddPassToWalletButton](https://developer.apple.com/documentation/passkit/addpasstowalletbutton)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
14 of 93 symbols inside -993201791 containing 4 symbols[AddPassToWalletButtonFilter](https://developer.apple.com/documentation/passkit/addpasstowalletbuttonfilter)
97 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Collection
  * [ PassKit (Apple Pay and Wallet) ](https://developer.apple.com/documentation/passkit)
  * [ Wallet ](https://developer.apple.com/documentation/PassKit/wallet)
  *     * Wallet 


API Collection
# Wallet
Manage tickets, boarding passes, payment cards and other passes in the Wallet app.
## [Overview](https://developer.apple.com/documentation/PassKit/wallet#overview)
To access your pass using PassKit, add the Wallet capability to your app. Use the API in Wallet to access and manage different types of passes, including identity passes, payment passes, and digital car keys. You can choose to access all of the passes signed with your developer team identifier, or access a subset of pass types. For information on adding capabilities to your app, see [Adding capabilities to your app](https://developer.apple.com/documentation/Xcode/adding-capabilities-to-your-app). For information on signing a pass, see [Wallet Passes](https://developer.apple.com/documentation/WalletPasses).
## [Topics](https://developer.apple.com/documentation/PassKit/wallet#topics)
### [Essentials](https://developer.apple.com/documentation/PassKit/wallet#Essentials)
[`Pass Type IDs Entitlement`](https://developer.apple.com/documentation/BundleResources/Entitlements/com.apple.developer.pass-type-identifiers)
A list of identifiers that specify pass types that your app can access in Wallet.
[`Merchant IDs Entitlement`](https://developer.apple.com/documentation/BundleResources/Entitlements/com.apple.developer.in-app-payments)
A list of merchant IDs your app uses for Apple Pay support.
[`com.apple.developer.in-app-identity-presentment`](https://developer.apple.com/documentation/BundleResources/Entitlements/com.apple.developer.in-app-identity-presentment)
An entitlement that verifies age or identity.
[Requesting identity data from a Wallet pass](https://developer.apple.com/documentation/passkit/requesting-identity-data-from-a-wallet-pass)
Initiate a request for identity information by prompting a user for permission and decrypting a response payload.
[Verifying Wallet identity requests](https://developer.apple.com/documentation/passkit/verifying-wallet-identity-requests)
Decrypt and verify an in-app presentment request on your server.
### [Wallet Passes](https://developer.apple.com/documentation/PassKit/wallet#Wallet-Passes)
[Wallet Passes](https://developer.apple.com/documentation/WalletPasses)
Create, distribute, and update passes for the Wallet app.
### [Common data types](https://developer.apple.com/documentation/PassKit/wallet#Common-data-types)
[`class PKObject`](https://developer.apple.com/documentation/passkit/pkobject)
An opaque type that acts as the superclass for the pass object.
[`class PKAddPassButton`](https://developer.apple.com/documentation/passkit/pkaddpassbutton)
Provides a button that enables users to add passes to Wallet.
[`class PKLabeledValue`](https://developer.apple.com/documentation/passkit/pklabeledvalue)
An object that can represent a detail about a payment card or other item.
[`struct AddPassToWalletButton`](https://developer.apple.com/documentation/passkit/addpasstowalletbutton)
A type that provides a button that enables people to add a new or existing pass to Apple Wallet.
[`struct AddPassToWalletButtonFilter`](https://developer.apple.com/documentation/passkit/addpasstowalletbuttonfilter)
[`struct AddPassToWalletButtonResponse`](https://developer.apple.com/documentation/passkit/addpasstowalletbuttonresponse)
[`struct AddPassToWalletButtonStyle`](https://developer.apple.com/documentation/passkit/addpasstowalletbuttonstyle)
### [Pass library](https://developer.apple.com/documentation/PassKit/wallet#Pass-library)
[`class PKPassLibrary`](https://developer.apple.com/documentation/passkit/pkpasslibrary)
Provides an interface to the user’s library of passes.
### [General purpose passes](https://developer.apple.com/documentation/PassKit/wallet#General-purpose-passes)
[`class PKSecureElementPass`](https://developer.apple.com/documentation/passkit/pksecureelementpass)
A pass with a credential that the device stores in a certified payment information chip.
[`class PKAddSecureElementPassConfiguration`](https://developer.apple.com/documentation/passkit/pkaddsecureelementpassconfiguration)
An object that describes the configuration of a secure element payment pass.
[`class PKAddSecureElementPassViewController`](https://developer.apple.com/documentation/passkit/pkaddsecureelementpassviewcontroller)
A view controller that manages the addition of secure element payment passes.
[`class PKPass`](https://developer.apple.com/documentation/passkit/pkpass)
An object that represents a single pass.
[`class PKAddPassesViewController`](https://developer.apple.com/documentation/passkit/pkaddpassesviewcontroller)
Lets your app show a pass and prompt the user to add that pass to the pass library.
[`struct AsyncShareablePassConfiguration`](https://developer.apple.com/documentation/passkit/asyncshareablepassconfiguration)
[`class PKShareSecureElementPassViewController`](https://developer.apple.com/documentation/passkit/pksharesecureelementpassviewcontroller)
[`protocol PKShareSecureElementPassViewControllerDelegate`](https://developer.apple.com/documentation/passkit/pksharesecureelementpassviewcontrollerdelegate)
[`class Preview`](https://developer.apple.com/documentation/passkit/pkshareablepassmetadata/preview-swift.class)
[`enum PKShareSecureElementPassResult`](https://developer.apple.com/documentation/passkit/pksharesecureelementpassresult)
### [Identity passes and authorization](https://developer.apple.com/documentation/PassKit/wallet#Identity-passes-and-authorization)
[Requesting identity data from a Wallet pass](https://developer.apple.com/documentation/passkit/requesting-identity-data-from-a-wallet-pass)
Initiate a request for identity information by prompting a user for permission and decrypting a response payload.
[Configuring your environment for the Verify with Wallet API](https://developer.apple.com/documentation/passkit/configuring-your-environment-for-the-verify-with-wallet-api)
Set up your environment to use Verify with Wallet.
[Verifying Wallet identity requests](https://developer.apple.com/documentation/passkit/verifying-wallet-identity-requests)
Decrypt and verify an in-app presentment request on your server.
[`class PKIdentityPhotoIDDescriptor`](https://developer.apple.com/documentation/passkit/pkidentityphotoiddescriptor)
An object you use to request information from a user’s photo ID or equivalent document.
[`class PKIdentityAnyOfDescriptor`](https://developer.apple.com/documentation/passkit/pkidentityanyofdescriptor)
An object you use to request information from multiple identity documents.
[`class PKIdentityDriversLicenseDescriptor`](https://developer.apple.com/documentation/passkit/pkidentitydriverslicensedescriptor)
An object for requesting information from a user’s driver’s license or equivalent document.
[`class PKAddIdentityDocumentMetadata`](https://developer.apple.com/documentation/passkit/pkaddidentitydocumentmetadata)
The object for specifying the metadata necessary to provision identity documents.
[`class PKAddIdentityDocumentConfiguration`](https://developer.apple.com/documentation/passkit/pkaddidentitydocumentconfiguration)
Configuration to define the identity document.
[`struct JPKIPassContents`](https://developer.apple.com/documentation/passkit/jpkipasscontents)
A set of actions for viewing and updating PINs, passwords, and signing abilities associated with digital identities on the JPKI applet.
[`class PKAddIdentityDocumentConfiguration`](https://developer.apple.com/documentation/passkit/pkaddidentitydocumentconfiguration)
Configuration to define the identity document.
[`class PKAddPassMetadataPreview`](https://developer.apple.com/documentation/passkit/pkaddpassmetadatapreview)
A preview object that contains information representing the pass you add to Wallet.
[`class PKIdentityDocumentMetadata`](https://developer.apple.com/documentation/passkit/pkidentitydocumentmetadata)
A set of configured metadata that defines the required information to add the corresponding pass to Wallet.
[`class PKIdentityNationalIDCardDescriptor`](https://developer.apple.com/documentation/passkit/pkidentitynationalidcarddescriptor)
An object for requesting information from a user’s national ID card.
[`class PKJapanIndividualNumberCardMetadata`](https://developer.apple.com/documentation/passkit/pkjapanindividualnumbercardmetadata)
A class that contains metadata indicating the specific product instance to provision.
### [Identity sheet interactions and authorization](https://developer.apple.com/documentation/PassKit/wallet#Identity-sheet-interactions-and-authorization)
[`class PKIdentityAuthorizationController`](https://developer.apple.com/documentation/passkit/pkidentityauthorizationcontroller)
An object that presents a sheet that prompts the user to allow a request for identity information.
[`class PKIdentityRequest`](https://developer.apple.com/documentation/passkit/pkidentityrequest)
An object that represents a request for identity information from a Wallet pass.
[`class PKIdentityDocument`](https://developer.apple.com/documentation/passkit/pkidentitydocument)
An object that represents the response to a request.
[`class PKIdentityElement`](https://developer.apple.com/documentation/passkit/pkidentityelement)
An object that represents the elements an app requests from identity documents.
[`class PKIdentityButton`](https://developer.apple.com/documentation/passkit/pkidentitybutton)
An object that displays a button to trigger the identity verification flow.
[`struct VerifyIdentityWithWalletButton`](https://developer.apple.com/documentation/passkit/verifyidentitywithwalletbutton)
A type that displays a button to present the identity verification flow.
[`struct VerifyIdentityWithWalletButtonLabel`](https://developer.apple.com/documentation/passkit/verifyidentitywithwalletbuttonlabel)
A type that represents the label you use with a verify identity button.
[`struct VerifyIdentityWithWalletButtonStyle`](https://developer.apple.com/documentation/passkit/verifyidentitywithwalletbuttonstyle)
A type that represents the style you use with a verify identity button.
### [Payment passes](https://developer.apple.com/documentation/PassKit/wallet#Payment-passes)
[`class PKPaymentPass`](https://developer.apple.com/documentation/passkit/pkpaymentpass)
An object that represents a provisioned payment card for in-app payments.
[`class PKAddPaymentPassViewController`](https://developer.apple.com/documentation/passkit/pkaddpaymentpassviewcontroller)
Displays an interface that lets users add cards to Apple Pay from within your app.
### [Stored-value passes](https://developer.apple.com/documentation/PassKit/wallet#Stored-value-passes)
[`class PKTransitPassProperties`](https://developer.apple.com/documentation/passkit/pktransitpassproperties)
The properties of a transit pass.
[`class PKSuicaPassProperties`](https://developer.apple.com/documentation/passkit/pksuicapassproperties)
The properties of a pass used as a ticket for the Suica transportation system.
[`class PKStoredValuePassProperties`](https://developer.apple.com/documentation/passkit/pkstoredvaluepassproperties)
An object that represents the properties of a pass that contains a balance used for specific transactions, such as a transit pass or loyalty card.
[`class PKStoredValuePassBalance`](https://developer.apple.com/documentation/passkit/pkstoredvaluepassbalance)
An object that represents a balance that’s available for transactions, such as points or money.
### [Shareable passes](https://developer.apple.com/documentation/PassKit/wallet#Shareable-passes)
[`class PKAddShareablePassConfiguration`](https://developer.apple.com/documentation/passkit/pkaddshareablepassconfiguration)
An object that represents the data and action for a shared copy of pass.
[`class PKShareablePassMetadata`](https://developer.apple.com/documentation/passkit/pkshareablepassmetadata)
Information that you use to configure the sharing sheet for a pass.
[`enum PKAddShareablePassConfigurationPrimaryAction`](https://developer.apple.com/documentation/passkit/pkaddshareablepassconfigurationprimaryaction)
The kind of add action that the system performs with a pass.
### [Digital car keys](https://developer.apple.com/documentation/PassKit/wallet#Digital-car-keys)
[`class PKAddCarKeyPassConfiguration`](https://developer.apple.com/documentation/passkit/pkaddcarkeypassconfiguration)
A specialized configuration object that PassKit uses when it creates a digital car key.
[`class PKVehicleConnectionSession`](https://developer.apple.com/documentation/passkit/pkvehicleconnectionsession)
[`protocol PKVehicleConnectionDelegate`](https://developer.apple.com/documentation/passkit/pkvehicleconnectiondelegate)
[`enum PKVehicleConnectionSessionConnectionState`](https://developer.apple.com/documentation/passkit/pkvehicleconnectionsessionconnectionstate)
### [Issuer cards](https://developer.apple.com/documentation/PassKit/wallet#Issuer-cards)
[Implementing Wallet Extensions](https://developer.apple.com/documentation/passkit/implementing-wallet-extensions)
Support adding an issued card to Apple Pay from directly within Apple Wallet using Wallet Extensions.
[`class PKIssuerProvisioningExtensionHandler`](https://developer.apple.com/documentation/passkit/pkissuerprovisioningextensionhandler)
An abstract superclass for an app extension to add a payment card to Wallet.
[`protocol PKIssuerProvisioningExtensionAuthorizationProviding`](https://developer.apple.com/documentation/passkit/pkissuerprovisioningextensionauthorizationproviding)
A protocol for a UI app extension to authorize a user to add a payment card to Wallet.
### [Errors](https://developer.apple.com/documentation/PassKit/wallet#Errors)
[`struct PKPassKitError`](https://developer.apple.com/documentation/passkit/pkpasskiterror)
Errors that the PassKit framework uses.
[`struct PKAddSecureElementPassError`](https://developer.apple.com/documentation/passkit/pkaddsecureelementpasserror)
An error object that PassKit uses when it adds Secure Element passes.
[`enum Code`](https://developer.apple.com/documentation/passkit/pkpasskiterror/code)
Errors that the PassKit framework uses.
[`enum Code`](https://developer.apple.com/documentation/passkit/pkaddsecureelementpasserror/code)
Error codes for problems that occur when you add a secure element passes.
[`enum PKAddPaymentPassError`](https://developer.apple.com/documentation/passkit/pkaddpaymentpasserror)
Error codes for adding payment passes.
[`struct PKIdentityError`](https://developer.apple.com/documentation/passkit/pkidentityerror-swift.struct)
A structure that represents an identity error.
[`enum Code`](https://developer.apple.com/documentation/passkit/pkidentityerror-swift.struct/code)
Error codes for identity operations.
[`struct PKShareSecureElementPassError`](https://developer.apple.com/documentation/passkit/pksharesecureelementpasserror)
[`enum Code`](https://developer.apple.com/documentation/passkit/pksharesecureelementpasserror/code)
[`enum PKVehicleConnectionErrorCode`](https://developer.apple.com/documentation/passkit/pkvehicleconnectionerrorcode)
[`enum PayWithApplePayButtonPaymentAuthorizationPhase`](https://developer.apple.com/documentation/passkit/paywithapplepaybuttonpaymentauthorizationphase)
[`let PKPassKitErrorDomain: String`](https://developer.apple.com/documentation/passkit/pkpasskiterrordomain)
The error domain for PassKit errors.
[`let PKIdentityErrorDomain: String`](https://developer.apple.com/documentation/passkit/pkidentityerrordomain)
The error domain for identity errors.
[`let PKAddSecureElementPassErrorDomain: String`](https://developer.apple.com/documentation/passkit/pkaddsecureelementpasserrordomain)
The error domain for errors that occur when adding a secure pass.
[`let PKShareSecureElementPassErrorDomain: String`](https://developer.apple.com/documentation/passkit/pksharesecureelementpasserrordomain)
### [Deprecated](https://developer.apple.com/documentation/PassKit/wallet#Deprecated)
[`struct PayLaterView`](https://developer.apple.com/documentation/passkit/paylaterview)
A view that displays the Apple Pay Later visual merchandising widget.
Deprecated
[`class PKPayLaterView`](https://developer.apple.com/documentation/passkit/pkpaylaterview)
A view that displays the Apple Pay Later visual merchandising widget.
Deprecated
Current page is Wallet 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FPassKit%2Fwallet).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
