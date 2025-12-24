Source: https://developer.apple.com/documentation/authenticationservices

[ Skip Navigation ](https://developer.apple.com/documentation/authenticationservices#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/authenticationservices#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/authenticationservices)
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
[ Open Menu ](https://developer.apple.com/documentation/authenticationservices)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/authenticationservices)


[](https://developer.apple.com/documentation/authenticationservices)
## [ Authentication Services  ](https://developer.apple.com/documentation/authenticationservices)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 79 symbols inside <root>
Authorization requests
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
18 of 79 symbols inside <root> containing 34 symbols[Public-Private Key Authentication](https://developer.apple.com/documentation/authenticationservices/public-private-key-authentication)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
17 of 79 symbols inside <root>
Passkeys
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
16 of 79 symbols inside <root> containing 7 symbols[Password use in web browsers](https://developer.apple.com/documentation/authenticationservices/password-use-in-web-browsers)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
15 of 79 symbols inside <root> containing 5 symbols[ASPasswordCredential](https://developer.apple.com/documentation/authenticationservices/aspasswordcredential)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
14 of 79 symbols inside <root> containing 3 symbols[ASAuthorizationPasswordProvider](https://developer.apple.com/documentation/authenticationservices/asauthorizationpasswordprovider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
13 of 79 symbols inside <root> [Password AutoFill](https://developer.apple.com/documentation/security/password-autofill)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 79 symbols inside <root>
Passwords
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
11 of 79 symbols inside <root> containing 14 symbols[ASAuthorizationAppleIDCredential](https://developer.apple.com/documentation/authenticationservices/asauthorizationappleidcredential)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
10 of 79 symbols inside <root> containing 11 symbols[ASAuthorizationAppleIDProvider](https://developer.apple.com/documentation/authenticationservices/asauthorizationappleidprovider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
9 of 79 symbols inside <root> [Sign in with Apple Entitlement](https://developer.apple.com/documentation/bundleresources/entitlements/com.apple.developer.applesignin)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
8 of 79 symbols inside <root> containing 4 symbols[SignInWithAppleButton](https://developer.apple.com/documentation/authenticationservices/signinwithapplebutton)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 79 symbols inside <root> [Simplifying User Authentication in a tvOS App](https://developer.apple.com/documentation/authenticationservices/simplifying-user-authentication-in-a-tvos-app)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 79 symbols inside <root> [Implementing User Authentication with Sign in with Apple](https://developer.apple.com/documentation/authenticationservices/implementing-user-authentication-with-sign-in-with-apple)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 79 symbols inside <root>
Sign In with Apple
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
4 of 79 symbols inside <root> containing 10 symbols[ASAuthorizationResult](https://developer.apple.com/documentation/authenticationservices/asauthorizationresult)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
3 of 79 symbols inside <root> containing 10 symbols[AuthorizationController](https://developer.apple.com/documentation/authenticationservices/authorizationcontroller)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
2 of 79 symbols inside <root> containing 19 symbols[ASAuthorizationController](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 79 symbols inside <root>
Authorization requests
79 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Framework
# Authentication Services
Make it easy for users to log into apps and services.
iOS 12.0+iPadOS 12.0+Mac Catalyst 13.0+macOS 10.15+tvOS 13.0+visionOS 1.0+watchOS 6.0+
## [Overview](https://developer.apple.com/documentation/authenticationservices#overview)
Use the Authentication Services framework to improve the experience of users when they enter credentials to establish their identity.
  * Give users the ability to sign into your services with their Apple ID.
  * Enable users to look up their stored passwords from within the sign-in flow of an app.
  * Provide a passwordless registration and authentication workflow for apps and websites using iCloud Keychain or a physical security key.
  * Perform automatic security upgrades from weak to strong passwords, or upgrade to using Sign in with Apple.
  * Share data between an app and a web browser using technologies like OAuth to leverage existing web-based logins in the app.
  * Create a single sign-on (SSO) experience in an enterprise app.


Simple and straightforward sign-up and sign-in flows reduce the burden on the user to remember passwords, which may improve security.
## [Topics](https://developer.apple.com/documentation/authenticationservices#topics)
### [Authorization requests](https://developer.apple.com/documentation/authenticationservices#Authorization-requests)
[`class ASAuthorizationController`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller)
A controller that manages authorization requests that a provider creates.
[`struct AuthorizationController`](https://developer.apple.com/documentation/authenticationservices/authorizationcontroller)
A SwiftUI environment value that views use to perform authorization requests.
[`enum ASAuthorizationResult`](https://developer.apple.com/documentation/authenticationservices/asauthorizationresult)
Describes the outcome of a successful authorization request.
### [Sign In with Apple](https://developer.apple.com/documentation/authenticationservices#Sign-In-with-Apple)
[Implementing User Authentication with Sign in with Apple](https://developer.apple.com/documentation/authenticationservices/implementing-user-authentication-with-sign-in-with-apple)
Provide a way for users of your app to set up an account and start using your services.
[Simplifying User Authentication in a tvOS App](https://developer.apple.com/documentation/authenticationservices/simplifying-user-authentication-in-a-tvos-app)
Build a fluid sign-in experience for your tvOS apps using AuthenticationServices.
[`struct SignInWithAppleButton`](https://developer.apple.com/documentation/authenticationservices/signinwithapplebutton)
A SwiftUI view that creates the Sign in with Apple button for display.
[`Sign in with Apple Entitlement`](https://developer.apple.com/documentation/BundleResources/Entitlements/com.apple.developer.applesignin)
An entitlement that lets your app use Sign in with Apple.
[`class ASAuthorizationAppleIDProvider`](https://developer.apple.com/documentation/authenticationservices/asauthorizationappleidprovider)
A mechanism for generating requests to authenticate users based on their Apple ID.
[`class ASAuthorizationAppleIDCredential`](https://developer.apple.com/documentation/authenticationservices/asauthorizationappleidcredential)
A credential that results from a successful Apple ID authentication.
### [Passwords](https://developer.apple.com/documentation/authenticationservices#Passwords)
[Password AutoFill](https://developer.apple.com/documentation/Security/password-autofill)
Streamline your app’s login and onboarding procedures.
[`class ASAuthorizationPasswordProvider`](https://developer.apple.com/documentation/authenticationservices/asauthorizationpasswordprovider)
A mechanism for generating requests to perform keychain credential sharing.
[`class ASPasswordCredential`](https://developer.apple.com/documentation/authenticationservices/aspasswordcredential)
A password credential.
[API Reference Password use in web browsers](https://developer.apple.com/documentation/authenticationservices/password-use-in-web-browsers)
Register and authenticate website users by using passwords.
### [Passkeys](https://developer.apple.com/documentation/authenticationservices#Passkeys)
[API Reference Public-Private Key Authentication](https://developer.apple.com/documentation/authenticationservices/public-private-key-authentication)
Register and authenticate users with passkeys and security keys, without using passwords.
[API Reference Passkey use in web browsers](https://developer.apple.com/documentation/authenticationservices/passkey-use-in-web-browsers)
Register and authenticate website users by using passkeys.
[Performing fast account creation with passkeys](https://developer.apple.com/documentation/authenticationservices/performing-fast-account-creation-with-passkeys)
Allow people to quickly create an account with passkeys and associated domains.
[Connecting to a service with passkeys](https://developer.apple.com/documentation/authenticationservices/connecting-to-a-service-with-passkeys)
Allow users to sign in to a service without typing a password.
### [Web authentication sessions](https://developer.apple.com/documentation/authenticationservices#Web-authentication-sessions)
[Authenticating a User Through a Web Service](https://developer.apple.com/documentation/authenticationservices/authenticating-a-user-through-a-web-service)
Use a web authentication session to authenticate a user in your app.
[Securing Logins with iCloud Keychain Verification Codes](https://developer.apple.com/documentation/authenticationservices/securing-logins-with-icloud-keychain-verification-codes)
Use time-based codes generated on-device for a secure authentication experience.
[`class ASWebAuthenticationSession`](https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsession)
A session that an app uses to authenticate a user through a web service.
[`struct WebAuthenticationSession`](https://developer.apple.com/documentation/authenticationservices/webauthenticationsession)
A SwiftUI environment value that views use to authenticate someone using a web service.
[Supporting Single Sign-On in a Web Browser App](https://developer.apple.com/documentation/authenticationservices/supporting-single-sign-on-in-a-web-browser-app)
Extend your web browser app to handle web authentication requests from other apps.
[`class ASWebAuthenticationSessionWebBrowserSessionManager`](https://developer.apple.com/documentation/authenticationservices/aswebauthenticationsessionwebbrowsersessionmanager)
A session manager that mediates sharing data between an app and a web browser.
[`ASWebAuthenticationSessionWebBrowserSupportCapabilities`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/ASWebAuthenticationSessionWebBrowserSupportCapabilities)
A collection of keys that a browser app uses to declare its ability to handle authentication requests from other apps.
### [AutoFill credentials](https://developer.apple.com/documentation/authenticationservices#AutoFill-credentials)
[Providing one-time passcodes to AutoFill](https://developer.apple.com/documentation/authenticationservices/providing-one-time-passcodes-to-autofill)
Help people efficiently perform multifactor authentication.
[`AutoFill Credential Provider Entitlement`](https://developer.apple.com/documentation/BundleResources/Entitlements/com.apple.developer.authentication-services.autofill-credential-provider)
A Boolean value that indicates whether the app may, with user permission, provide user names and passwords for AutoFill in Safari and other apps.
[`class ASCredentialProviderViewController`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller)
A view controller that a credential manager app uses to extend AutoFill.
### [Credential migration](https://developer.apple.com/documentation/authenticationservices#Credential-migration)
[`class ASCredentialExportManager`](https://developer.apple.com/documentation/authenticationservices/ascredentialexportmanager)
A class to manage exporting credentials.
[`class ASCredentialImportManager`](https://developer.apple.com/documentation/authenticationservices/ascredentialimportmanager)
A class to manage importing credentials.
### [Single sign-on (SSO)](https://developer.apple.com/documentation/authenticationservices#Single-sign-on-SSO)
[API Reference Enterprise single sign-on (SSO)](https://developer.apple.com/documentation/authenticationservices/enterprise-single-sign-on-sso)
[API Reference Platform single sign-on (SSO)](https://developer.apple.com/documentation/authenticationservices/platform-single-sign-on-sso)
Use credentials from macOS login to perform single sign-on with an identity provider.
### [Apple TV authentication](https://developer.apple.com/documentation/authenticationservices#Apple-TV-authentication)
[`var customAuthorizationMethods: [ASAuthorizationCustomMethod]`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/customauthorizationmethods)
An array of custom authorization methods for the user to choose.
[`func authorizationController(ASAuthorizationController, didCompleteWithCustomMethod: ASAuthorizationCustomMethod)`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontrollerdelegate/authorizationcontroller\(_:didcompletewithcustommethod:\))
Informs the delegate when authorization completes, and specifies the custom method the user selected.
[`struct ASAuthorizationCustomMethod`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcustommethod)
The custom authorization method.
### [Automatic security upgrades](https://developer.apple.com/documentation/authenticationservices#Automatic-security-upgrades)
[Upgrading Account Security With an Account Authentication Modification Extension](https://developer.apple.com/documentation/authenticationservices/upgrading-account-security-with-an-account-authentication-modification-extension)
Automatically and transparently convert accounts to Sign in with Apple or to use strong passwords for improved security.
[`class ASAccountAuthenticationModificationController`](https://developer.apple.com/documentation/authenticationservices/asaccountauthenticationmodificationcontroller)
An object that performs a request to modify an account’s authentication properties.
[`class ASAccountAuthenticationModificationViewController`](https://developer.apple.com/documentation/authenticationservices/asaccountauthenticationmodificationviewcontroller)
A view controller that can upgrade user passwords to strong passwords, or convert accounts to use Sign in with Apple.
[`class ASAccountAuthenticationModificationExtensionContext`](https://developer.apple.com/documentation/authenticationservices/asaccountauthenticationmodificationextensioncontext)
An object that you interact with to change an account’s password or to upgrade to Sign in with Apple.
### [Updating credential managers](https://developer.apple.com/documentation/authenticationservices#Updating-credential-managers)
[`class ASCredentialUpdater`](https://developer.apple.com/documentation/authenticationservices/ascredentialupdater)
A class to pass credential update events to credential managers enabled on the system.
Deprecated
### [Reference](https://developer.apple.com/documentation/authenticationservices#Reference)
[API Reference AuthenticationServices Enumerations](https://developer.apple.com/documentation/authenticationservices/authenticationservices-enumerations)
[API Reference AuthenticationServices Data Types](https://developer.apple.com/documentation/authenticationservices/authenticationservices-data-types)
### [Classes](https://developer.apple.com/documentation/authenticationservices#Classes)
[`class ASAuthorizationAccountCreationPlatformPublicKeyCredential`](https://developer.apple.com/documentation/authenticationservices/asauthorizationaccountcreationplatformpublickeycredential)
[`class ASAuthorizationAccountCreationPlatformPublicKeyCredentialRequest`](https://developer.apple.com/documentation/authenticationservices/asauthorizationaccountcreationplatformpublickeycredentialrequest)
[`class ASAuthorizationAccountCreationProvider`](https://developer.apple.com/documentation/authenticationservices/asauthorizationaccountcreationprovider)
[`class ASAuthorizationProviderExtensionUserLoginConfiguration`](https://developer.apple.com/documentation/authenticationservices/asauthorizationproviderextensionuserloginconfiguration)
[`class ASCredentialDataManager`](https://developer.apple.com/documentation/authenticationservices/ascredentialdatamanager)
This class allows submitting credentials and events to any credential manager enabled on the system.
[`class ASGeneratePasswordsRequest`](https://developer.apple.com/documentation/authenticationservices/asgeneratepasswordsrequest)
[`class ASGeneratedPassword`](https://developer.apple.com/documentation/authenticationservices/asgeneratedpassword)
[`class ASOneTimeCodeCredentialIdentity`](https://developer.apple.com/documentation/authenticationservices/asonetimecodecredentialidentity)
[`class ASSavePasswordRequest`](https://developer.apple.com/documentation/authenticationservices/assavepasswordrequest)
### [Structures](https://developer.apple.com/documentation/authenticationservices#Structures)
[`struct ASAuthorizationProviderExtensionEncryptionAlgorithm`](https://developer.apple.com/documentation/authenticationservices/asauthorizationproviderextensionencryptionalgorithm)
[`struct ASAuthorizationProviderExtensionSigningAlgorithm`](https://developer.apple.com/documentation/authenticationservices/asauthorizationproviderextensionsigningalgorithm)
[`struct ASAutoFillURLScope`](https://developer.apple.com/documentation/authenticationservices/asautofillurlscope)
This structure represents the subset of URL components supported for the AutoFill of credentials.
[`struct ASEmailIdentifier`](https://developer.apple.com/documentation/authenticationservices/asemailidentifier)
[`struct ASImportableCredentialScope`](https://developer.apple.com/documentation/authenticationservices/asimportablecredentialscope)
The scope for where a credential should be usable.
[`struct ASImportableEditableField`](https://developer.apple.com/documentation/authenticationservices/asimportableeditablefield)
A field that someone can edit within a credential.
[`struct ASPhoneNumberIdentifier`](https://developer.apple.com/documentation/authenticationservices/asphonenumberidentifier)
[`struct ASPublicKeyCredentialClientData`](https://developer.apple.com/documentation/authenticationservices/aspublickeycredentialclientdata-swift.struct)
[`struct CredentialDataManager`](https://developer.apple.com/documentation/authenticationservices/credentialdatamanager)
### [Variables](https://developer.apple.com/documentation/authenticationservices#Variables)
[`let ASCredentialExchangeActivity: String`](https://developer.apple.com/documentation/authenticationservices/ascredentialexchangeactivity)
The activity type used in user activity objects sent to importing apps.
[`let ASCredentialImportToken: String`](https://developer.apple.com/documentation/authenticationservices/ascredentialimporttoken)
The key for the token in the user info dictionary of the user activity sent to importing apps.
### [Enumerations](https://developer.apple.com/documentation/authenticationservices#Enumerations)
[`enum ASContactIdentifier`](https://developer.apple.com/documentation/authenticationservices/ascontactidentifier)
[`enum ASContactIdentifierRequest`](https://developer.apple.com/documentation/authenticationservices/ascontactidentifierrequest)
Current page is Authentication Services 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fauthenticationservices).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
