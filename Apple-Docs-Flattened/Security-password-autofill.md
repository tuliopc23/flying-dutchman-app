Source: https://developer.apple.com/documentation/security/password-autofill

[ Skip Navigation ](https://developer.apple.com/documentation/security/password-autofill#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/security/password-autofill#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/security/password-autofill)
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
[ Open Menu ](https://developer.apple.com/documentation/security/password-autofill)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/security/password-autofill)


[](https://developer.apple.com/documentation/security/password-autofill)
## [ Security  ](https://developer.apple.com/documentation/security)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 65 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 65 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 65 symbols inside <root> [Security updates](https://developer.apple.com/documentation/updates/security)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 65 symbols inside <root>
Authorization and authentication
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
4 of 65 symbols inside <root> containing 17 symbols[Password AutoFill](https://developer.apple.com/documentation/security/password-autofill)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 17 symbols inside 694228083 
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 17 symbols inside 694228083 [About the Password AutoFill workflow](https://developer.apple.com/documentation/security/about-the-password-autofill-workflow)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
3 of 17 symbols inside 694228083 [Supporting associated domains](https://developer.apple.com/documentation/xcode/supporting-associated-domains)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
4 of 17 symbols inside 694228083 [object applinks](https://developer.apple.com/documentation/bundleresources/applinks)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 17 symbols inside 694228083 
Text input views
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 17 symbols inside 694228083 [Enabling Password AutoFill on a text input view](https://developer.apple.com/documentation/security/enabling-password-autofill-on-a-text-input-view)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
7 of 17 symbols inside 694228083 [var textContentType: UITextContentType!](https://developer.apple.com/documentation/uikit/uitextinputtraits/textcontenttype)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
8 of 17 symbols inside 694228083 [static let username: UITextContentType](https://developer.apple.com/documentation/uikit/uitextcontenttype/username)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
9 of 17 symbols inside 694228083 [static let password: UITextContentType](https://developer.apple.com/documentation/uikit/uitextcontenttype/password)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
10 of 17 symbols inside 694228083 [static let newPassword: UITextContentType](https://developer.apple.com/documentation/uikit/uitextcontenttype/newpassword)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
11 of 17 symbols inside 694228083 [static let oneTimeCode: UITextContentType](https://developer.apple.com/documentation/uikit/uitextcontenttype/onetimecode)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 17 symbols inside 694228083 
Text input elements
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
13 of 17 symbols inside 694228083 [Enabling Password AutoFill on an HTML input element](https://developer.apple.com/documentation/security/enabling-password-autofill-on-an-html-input-element)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
14 of 17 symbols inside 694228083 
Password rules
82 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Collection
  * [ Security ](https://developer.apple.com/documentation/security)
  * [ Password AutoFill ](https://developer.apple.com/documentation/security/password-autofill)
  *     * Password AutoFill 


# Password AutoFill
Streamline your app’s login and onboarding procedures.
## [Overview](https://developer.apple.com/documentation/security/password-autofill#overview)
Password AutoFill simplifies login and account creation tasks for iOS apps and webpages. With just a few taps, your users can create and save new passwords or log in to an existing account. Users don’t even need to know their password; the system handles everything. This convenience increases the likelihood that users will complete your app’s onboarding process and start using your app more quickly. Additionally, by encouraging users to select unique, strong passwords, you increase the security of your app.
By default, Password AutoFill saves the user’s login credentials on their current iOS device. iOS can sync these credentials securely across the user’s devices using iCloud Keychain. Password AutoFill recommends credentials only for your app’s associated domain, and the user must authenticate using Face ID or Touch ID before accessing these credentials. For more information on privacy and security, see [Approach to Privacy](https://www.apple.com/privacy/approach-to-privacy/) and [iOS Security Guide](https://images.apple.com/business/docs/iOS_Security_Guide.pdf).
Password AutoFill also provides credentials from third-party password managers that implement a credential provider extension. For more information on the credential provider extension, see the [Authentication Services](https://developer.apple.com/documentation/AuthenticationServices) framework.
### [Enable Password AutoFill](https://developer.apple.com/documentation/security/password-autofill#Enable-Password-AutoFill)
Password AutoFill uses heuristics to determine when the user logs in or creates new passwords, and automatically provides the password QuickType bar. These heuristics give users some Password AutoFill support in most apps, even if those apps haven’t been updated to support AutoFill. However, to provide the best user experience and ensure your app fully supports Password AutoFill, perform the following steps:
  1. Set up your app’s associated domains. To learn how to set up your app’s associated domains, see [Supporting associated domains](https://developer.apple.com/documentation/Xcode/supporting-associated-domains).
  2. Set the correct AutoFill type on relevant text fields. For an iOS app, see [Enabling Password AutoFill on a text input view](https://developer.apple.com/documentation/security/enabling-password-autofill-on-a-text-input-view). For a web app, see [Enabling Password AutoFill on an HTML input element](https://developer.apple.com/documentation/security/enabling-password-autofill-on-an-html-input-element).


### [Support third-party web services](https://developer.apple.com/documentation/security/password-autofill#Support-third-party-web-services)
Password AutoFill streamlines logging into web services at your domain; however, if you need to log into a third-party service, use [`ASWebAuthenticationSession`](https://developer.apple.com/documentation/AuthenticationServices/ASWebAuthenticationSession) instead, which supports Password AutoFill when your user hasn’t already logged in.
### [Integrate a password management app with Password AutoFill](https://developer.apple.com/documentation/security/password-autofill#Integrate-a-password-management-app-with-Password-AutoFill)
If you’re developing a password management app, create AutoFill Credential Provider Extensions to surface credentials from your app in Password AutoFill and pull your app’s password data into the Password AutoFill workflow. When your app integrates with Password AutoFill, users don’t have to copy and paste credentials. Instead, they can use password data stored in your app easily because the data will be offered to the user to fill in compatible user name and password fields. To integrate a password app with Password AutoFill, use in the [Authentication Services](https://developer.apple.com/documentation/AuthenticationServices) framework.
## [Topics](https://developer.apple.com/documentation/security/password-autofill#topics)
### [Essentials](https://developer.apple.com/documentation/security/password-autofill#Essentials)
[About the Password AutoFill workflow](https://developer.apple.com/documentation/security/about-the-password-autofill-workflow)
Learn how Password AutoFill interacts with both iOS and web apps.
[Supporting associated domains](https://developer.apple.com/documentation/Xcode/supporting-associated-domains)
Connect your app and a website to provide both a native app and a browser experience.
[`object applinks`](https://developer.apple.com/documentation/BundleResources/applinks)
The root object for a universal links service definition.
### [Text input views](https://developer.apple.com/documentation/security/password-autofill#Text-input-views)
[Enabling Password AutoFill on a text input view](https://developer.apple.com/documentation/security/enabling-password-autofill-on-a-text-input-view)
Make sure a text input view displays the correct AutoFill suggestions.
[`var textContentType: UITextContentType!`](https://developer.apple.com/documentation/UIKit/UITextInputTraits/textContentType)
The semantic meaning for a text input area.
[`static let username: UITextContentType`](https://developer.apple.com/documentation/UIKit/UITextContentType/username)
A property that defines the content in a text input area as an account or login name.
[`static let password: UITextContentType`](https://developer.apple.com/documentation/UIKit/UITextContentType/password)
A property that defines the content in a text input area as a password.
[`static let newPassword: UITextContentType`](https://developer.apple.com/documentation/UIKit/UITextContentType/newPassword)
A property that defines the content in a text input area as a new password.
[`static let oneTimeCode: UITextContentType`](https://developer.apple.com/documentation/UIKit/UITextContentType/oneTimeCode)
A property that defines the content in a text input area as a one-time code.
### [Text input elements](https://developer.apple.com/documentation/security/password-autofill#Text-input-elements)
[Enabling Password AutoFill on an HTML input element](https://developer.apple.com/documentation/security/enabling-password-autofill-on-an-html-input-element)
Make sure a web view or webpage provides the correct AutoFill suggestions.
### [Password rules](https://developer.apple.com/documentation/security/password-autofill#Password-rules)
[Customizing Password AutoFill rules](https://developer.apple.com/documentation/security/customizing-password-autofill-rules)
Modify the strong password rules for your app by adding your own restrictions.
[`var passwordRules: UITextInputPasswordRules?`](https://developer.apple.com/documentation/UIKit/UITextInputTraits/passwordRules)
[`class UITextInputPasswordRules`](https://developer.apple.com/documentation/UIKit/UITextInputPasswordRules)
A class that represents password rules for a text input field.
Current page is Password AutoFill 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fsecurity%2Fpassword-autofill).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
