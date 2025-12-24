Source: https://developer.apple.com/documentation/AuthenticationServices/implementing-user-authentication-with-sign-in-with-apple

[ Skip Navigation ](https://developer.apple.com/documentation/AuthenticationServices/implementing-user-authentication-with-sign-in-with-apple#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/AuthenticationServices/implementing-user-authentication-with-sign-in-with-apple#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/AuthenticationServices/implementing-user-authentication-with-sign-in-with-apple)
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
[ Open Menu ](https://developer.apple.com/documentation/AuthenticationServices/implementing-user-authentication-with-sign-in-with-apple)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/AuthenticationServices/implementing-user-authentication-with-sign-in-with-apple)


[](https://developer.apple.com/documentation/AuthenticationServices/implementing-user-authentication-with-sign-in-with-apple)
## [ Authentication Services  ](https://developer.apple.com/documentation/authenticationservices)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 79 symbols inside <root>
Authorization requests
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 79 symbols inside <root>
Authorization requests
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
2 of 79 symbols inside <root> containing 19 symbols[ASAuthorizationController](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
3 of 79 symbols inside <root> containing 10 symbols[AuthorizationController](https://developer.apple.com/documentation/authenticationservices/authorizationcontroller)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
4 of 79 symbols inside <root> containing 10 symbols[ASAuthorizationResult](https://developer.apple.com/documentation/authenticationservices/asauthorizationresult)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 79 symbols inside <root>
Sign In with Apple
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 79 symbols inside <root> [Implementing User Authentication with Sign in with Apple](https://developer.apple.com/documentation/authenticationservices/implementing-user-authentication-with-sign-in-with-apple)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 79 symbols inside <root> [Simplifying User Authentication in a tvOS App](https://developer.apple.com/documentation/authenticationservices/simplifying-user-authentication-in-a-tvos-app)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
8 of 79 symbols inside <root> containing 4 symbols[SignInWithAppleButton](https://developer.apple.com/documentation/authenticationservices/signinwithapplebutton)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
9 of 79 symbols inside <root> [Sign in with Apple Entitlement](https://developer.apple.com/documentation/bundleresources/entitlements/com.apple.developer.applesignin)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
10 of 79 symbols inside <root> containing 11 symbols[ASAuthorizationAppleIDProvider](https://developer.apple.com/documentation/authenticationservices/asauthorizationappleidprovider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
11 of 79 symbols inside <root> containing 14 symbols[ASAuthorizationAppleIDCredential](https://developer.apple.com/documentation/authenticationservices/asauthorizationappleidcredential)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 79 symbols inside <root>
Passwords
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
13 of 79 symbols inside <root> [Password AutoFill](https://developer.apple.com/documentation/security/password-autofill)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
14 of 79 symbols inside <root> containing 3 symbols[ASAuthorizationPasswordProvider](https://developer.apple.com/documentation/authenticationservices/asauthorizationpasswordprovider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
15 of 79 symbols inside <root> containing 5 symbols[ASPasswordCredential](https://developer.apple.com/documentation/authenticationservices/aspasswordcredential)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
16 of 79 symbols inside <root> containing 7 symbols[Password use in web browsers](https://developer.apple.com/documentation/authenticationservices/password-use-in-web-browsers)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
17 of 79 symbols inside <root>
Passkeys
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
18 of 79 symbols inside <root> containing 34 symbols[Public-Private Key Authentication](https://developer.apple.com/documentation/authenticationservices/public-private-key-authentication)
79 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Authentication Services ](https://developer.apple.com/documentation/authenticationservices)
  * [ Implementing User Authentication with Sign in with Apple ](https://developer.apple.com/documentation/AuthenticationServices/implementing-user-authentication-with-sign-in-with-apple)
  *     * Implementing User Authentication with Sign in with Apple 


Sample Code
# Implementing User Authentication with Sign in with Apple
Provide a way for users of your app to set up an account and start using your services.
[ Download ](https://docs-assets.developer.apple.com/published/4b0771b46501/ImplementingUserAuthenticationWithSignInWithApple.zip)
iOS 13.0+iPadOS 13.0+Xcode 11.3+
## [Overview](https://developer.apple.com/documentation/AuthenticationServices/implementing-user-authentication-with-sign-in-with-apple#Overview)
This sample app, Juice, uses the [AuthenticationServices](https://developer.apple.com/documentation/AuthenticationServices) framework to provide users an interface to set up accounts and sign in with their Apple ID. The app presents a form in which the user can create and set up an account for the app, then authenticates the user’s Apple ID with Sign in with Apple, and displays the user’s account data.
For more information about implementing Sign in with Apple on iOS 12 and earlier, see Incorporating Sign in with Apple into Other Platforms.
### [Configure the Sample Code Project](https://developer.apple.com/documentation/AuthenticationServices/implementing-user-authentication-with-sign-in-with-apple#Configure-the-Sample-Code-Project)
To configure the sample code project, perform the following steps in Xcode:
  1. On the Signing & Capabilities pane, [set the bundle ID](https://help.apple.com/xcode/mac/current/#/deve21d0239c) to a unique identifier (you must change the bundle ID to proceed).
  2. [Add your Apple ID account](https://help.apple.com/xcode/mac/current/#/devaf282080a) and [assign the target to a team](https://help.apple.com/xcode/mac/current/#/dev23aab79b4) so Xcode can enable the Sign in with Apple capability with your provisioning profile.
  3. Choose a run destination from the scheme pop-up menu that you’re signed into with an Apple ID and that uses Two-Factor Authentication.
  4. If necessary, click Register Device in the Signing & Capabilities pane to create the provisioning profile.
  5. In the toolbar, click Run, or choose Product > Run (⌘R).


### [Add a Sign in with Apple Button](https://developer.apple.com/documentation/AuthenticationServices/implementing-user-authentication-with-sign-in-with-apple#Add-a-Sign-in-with-Apple-Button)
In the sample app, `LoginViewController` displays a login form and a Sign in with Apple button ([`ASAuthorizationAppleIDButton`](https://developer.apple.com/documentation/AuthenticationServices/ASAuthorizationAppleIDButton)) in its view hierarchy. The view controller also adds itself as the button’s target, and passes an action to be invoked when the button receives a touch-up event.
```
func setupProviderLoginView() {
    let authorizationButton = ASAuthorizationAppleIDButton()
    authorizationButton.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
    self.loginProviderStackView.addArrangedSubview(authorizationButton)
}

```

For more information about which Sign in with Apple buttons are available on different Apple platforms, see [Displaying Sign in with Apple buttons in your app](https://developer.apple.com/documentation/signinwithapple/displaying-sign-in-with-apple-buttons-in-your-app).
Important
When adding the Sign in with Apple button to your storyboard, you must also set the control’s class value to `ASAuthorizationAppleIDButton` in Xcode’s Identity Inspector.
### [Request Authorization with Apple ID](https://developer.apple.com/documentation/AuthenticationServices/implementing-user-authentication-with-sign-in-with-apple#Request-Authorization-with-Apple-ID)
When the user taps the Sign in with Apple button, the view controller invokes the `handleAuthorizationAppleIDButtonPress()` function, which starts the authentication flow by performing an authorization request for the users’s full name and email address. The system then checks whether the user is signed in with their Apple ID on the device. If the user is not signed in at the system-level, the app presents an alert directing the user to sign in with their Apple ID in Settings.
```
@objc
func handleAuthorizationAppleIDButtonPress() {
    let appleIDProvider = ASAuthorizationAppleIDProvider()
    let request = appleIDProvider.createRequest()
    request.requestedScopes = [.fullName, .email]
    
    let authorizationController = ASAuthorizationController(authorizationRequests: [request])
    authorizationController.delegate = self
    authorizationController.presentationContextProvider = self
    authorizationController.performRequests()
}

```

Important
The user must enable Two-Factor Authentication to use Sign in with Apple so that access to the account is secure.
The authorization controller calls the [`ASAuthorizationControllerPresentationContextProviding.presentationAnchor(for:)`](https://developer.apple.com/documentation/AuthenticationServices/ASAuthorizationControllerPresentationContextProviding/presentationAnchor\(for:\)) function to get the window from the app where it presents the Sign in with Apple content to the user in a modal sheet.
```
func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
    return self.view.window!
}

```

If the user is signed in at the system-level with their Apple ID, the sheet appears describing the Sign in with Apple feature, followed by another sheet allowing the user to edit the information in their account. The user can edit their first and last name, choose another email address as their contact information, and hide their email address from the app. If the user chooses to hide their email address from the app, Apple generates a proxy email address to forward email to the user’s private email address. Lastly, the user enters the password for the Apple ID, then clicks Continue to create the account.
### [Handle User Credentials](https://developer.apple.com/documentation/AuthenticationServices/implementing-user-authentication-with-sign-in-with-apple#Handle-User-Credentials)
If the authentication succeeds, the authorization controller invokes the [`ASAuthorizationControllerDelegate.authorizationController(controller:didCompleteWithAuthorization:)`](https://developer.apple.com/documentation/AuthenticationServices/ASAuthorizationControllerDelegate/authorizationController\(controller:didCompleteWithAuthorization:\)) delegate function, which the app uses to store the user’s data in the keychain.
```
func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    switch authorization.credential {
    case let appleIDCredential as ASAuthorizationAppleIDCredential:
        
        // Create an account in your system.
        let userIdentifier = appleIDCredential.user
        let fullName = appleIDCredential.fullName
        let email = appleIDCredential.email
        
        // For the purpose of this demo app, store the `userIdentifier` in the keychain.
        self.saveUserInKeychain(userIdentifier)
        
        // For the purpose of this demo app, show the Apple ID credential information in the `ResultViewController`.
        self.showResultViewController(userIdentifier: userIdentifier, fullName: fullName, email: email)
    
    case let passwordCredential as ASPasswordCredential:
    
        // Sign in using an existing iCloud Keychain credential.
        let username = passwordCredential.user
        let password = passwordCredential.password
        
        // For the purpose of this demo app, show the password credential as an alert.
        DispatchQueue.main.async {
            self.showPasswordCredentialAlert(username: username, password: password)
        }
        
    default:
        break
    }
}

```

Note
In your implementation, the `ASAuthorizationControllerDelegate.authorizationController(controller:didCompleteWithAuthorization:)` delegate function should create an account in your system using the data contained in the user identifier.
If the authentication fails, the authorization controller invokes the [`ASAuthorizationControllerDelegate.authorizationController(controller:didCompleteWithError:)`](https://developer.apple.com/documentation/AuthenticationServices/ASAuthorizationControllerDelegate/authorizationController\(controller:didCompleteWithError:\)) delegate function to handle the error.
```
func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    // Handle error.
}

```

Once the system authenticates the user, the app displays the `ResultViewController` which shows the user information requested from the framework, including the user-provided full name and email address. The view controller also displays a Sign Out button and stores the user data in the keychain. When the user taps the Sign Out button, the app deletes the user information from the view controller and the keychain, and presents the `LoginViewController` to the user.
### [Request Existing Credentials](https://developer.apple.com/documentation/AuthenticationServices/implementing-user-authentication-with-sign-in-with-apple#Request-Existing-Credentials)
The `LoginViewController.performExistingAccountSetupFlows()` function checks if the user has an existing account by requesting both an Apple ID and an iCloud keychain password. Similar to `handleAuthorizationAppleIDButtonPress()`, the authorization controller sets its presentation content provider and delegate to the `LoginViewController` object.
```
func performExistingAccountSetupFlows() {
    // Prepare requests for both Apple ID and password providers.
    let requests = [ASAuthorizationAppleIDProvider().createRequest(),
                    ASAuthorizationPasswordProvider().createRequest()]
    
    // Create an authorization controller with the given requests.
    let authorizationController = ASAuthorizationController(authorizationRequests: requests)
    authorizationController.delegate = self
    authorizationController.presentationContextProvider = self
    authorizationController.performRequests()
}

```

The `authorizationController(controller:didCompleteWithAuthorization:)` delegate function checks whether the credential is an Apple ID ([`ASAuthorizationAppleIDCredential`](https://developer.apple.com/documentation/AuthenticationServices/ASAuthorizationAppleIDCredential)) or a password credential ([`ASPasswordCredential`](https://developer.apple.com/documentation/AuthenticationServices/ASPasswordCredential)). If the credential is a password credential, the system displays an alert allowing the user to authenticate with the existing account.
### [Check User Credentials at Launch](https://developer.apple.com/documentation/AuthenticationServices/implementing-user-authentication-with-sign-in-with-apple#Check-User-Credentials-at-Launch)
The sample app only shows the Sign in with Apple user interface when necessary. The app delegate checks the status of the saved user credentials immediately after launch in the `AppDelegate.application(_:didFinishLaunchingWithOptions:)` function.
The [`ASAuthorizationAppleIDProvider.getCredentialState()`](https://developer.apple.com/documentation/AuthenticationServices/ASAuthorizationAppleIDProvider/getCredentialState\(forUserID:completion:\)) function retrieves the state of the user identifier saved in the keychain. If the user granted authorization for the app (for example, the user is signed into the app with their Apple ID on the device), then the app continues executing. If the user revoked authorization for the app, or the user’s credential state not found, the app displays the log in form by invoking the `showLoginViewController()` function.
```
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let appleIDProvider = ASAuthorizationAppleIDProvider()
    appleIDProvider.getCredentialState(forUserID: KeychainItem.currentUserIdentifier) { (credentialState, error) in
        switch credentialState {
        case .authorized:
            break // The Apple ID credential is valid.
        case .revoked, .notFound:
            // The Apple ID credential is either revoked or was not found, so show the sign-in UI.
            DispatchQueue.main.async {
                self.window?.rootViewController?.showLoginViewController()
            }
        default:
            break
        }
    }
    return true
}

```

## [See Also](https://developer.apple.com/documentation/AuthenticationServices/implementing-user-authentication-with-sign-in-with-apple#see-also)
### [Sign In with Apple](https://developer.apple.com/documentation/AuthenticationServices/implementing-user-authentication-with-sign-in-with-apple#Sign-In-with-Apple)
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
Current page is Implementing User Authentication with Sign in with Apple 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FAuthenticationServices%2Fimplementing-user-authentication-with-sign-in-with-apple).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
