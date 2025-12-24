Source: https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller

[ Skip Navigation ](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller)
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
[ Open Menu ](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller)


[](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller)
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
1 of 19 symbols inside 2000193030 
Creating a controller
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 19 symbols inside 2000193030 [init(authorizationRequests: [ASAuthorizationRequest])](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/init\(authorizationrequests:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 19 symbols inside 2000193030 
Inspecting requests
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
4 of 19 symbols inside 2000193030 containing 3 symbols[ASAuthorizationRequest](https://developer.apple.com/documentation/authenticationservices/asauthorizationrequest)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
5 of 19 symbols inside 2000193030 [var authorizationRequests: [ASAuthorizationRequest]](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/authorizationrequests)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
6 of 19 symbols inside 2000193030 [var customAuthorizationMethods: [ASAuthorizationCustomMethod]](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/customauthorizationmethods)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 19 symbols inside 2000193030 
Presenting requests
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
8 of 19 symbols inside 2000193030 [var presentationContextProvider: (any ASAuthorizationControllerPresentationContextProviding)?](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/presentationcontextprovider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
9 of 19 symbols inside 2000193030 containing 3 symbols[ASAuthorizationControllerPresentationContextProviding](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontrollerpresentationcontextproviding)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 19 symbols inside 2000193030 
Executing requests
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
11 of 19 symbols inside 2000193030 [func performRequests()](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/performrequests\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
12 of 19 symbols inside 2000193030 [func performRequests(options: ASAuthorizationController.RequestOptions)](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/performrequests\(options:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
13 of 19 symbols inside 2000193030 [func performAutoFillAssistedRequests()](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/performautofillassistedrequests\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
14 of 19 symbols inside 2000193030 [func cancel()](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/cancel\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
15 of 19 symbols inside 2000193030 containing 4 symbols[ASAuthorizationController.RequestOptions](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/requestoptions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
16 of 19 symbols inside 2000193030 
Responding to request completion
98 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Authentication Services ](https://developer.apple.com/documentation/authenticationservices)
  * [ ASAuthorizationController ](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller)
  *     * ASAuthorizationController 


Class
# ASAuthorizationController
A controller that manages authorization requests that a provider creates.
iOS 13.0+iPadOS 13.0+Mac Catalyst 13.1+macOS 10.15+tvOS 13.0+visionOS 1.0+watchOS 6.0+
```
class ASAuthorizationController
```

## [ Mentioned in ](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller#mentions)
[](https://developer.apple.com/documentation/authenticationservices/authenticating-people-by-using-passkeys-in-browser-apps)
## [Overview](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller#overview)
Create authorization requests for the credential types your app supports, such as [`ASAuthorizationAppleIDRequest`](https://developer.apple.com/documentation/authenticationservices/asauthorizationappleidrequest) for Sign in with Apple, or [`ASAuthorizationPasswordRequest`](https://developer.apple.com/documentation/authenticationservices/asauthorizationpasswordrequest) for password credentials. Create an authorization controller using [`init(authorizationRequests:)`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/init\(authorizationrequests:\)), supplying the authorization requests you create. Set the authorization controller’s [`delegate`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/delegate) to receive responses when requests succeed or fail, and set its [`presentationContextProvider`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/presentationcontextprovider) so that the authorization controller can present UI.
Call [`performAutoFillAssistedRequests()`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/performautofillassistedrequests\(\)) to present inline UI to request credentials, or [`performRequests()`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/performrequests\(\)) or [`performRequests(options:)`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/performrequests\(options:\)) to request credentials using modal UI. [`ASAuthorizationController`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller) calls your delegate’s methods when the request completes.
Set the content type of text fields in your app’s login UI so that [`ASAuthorizationController`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller) can detect when to offer AutoFill suggestions. Use [`username`](https://developer.apple.com/documentation/UIKit/UITextContentType/username) as the content type for user name text fields, and [`password`](https://developer.apple.com/documentation/UIKit/UITextContentType/password) for password fields.
## [Topics](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller#topics)
### [Creating a controller](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller#Creating-a-controller)
[`init(authorizationRequests: [ASAuthorizationRequest])`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/init\(authorizationrequests:\))
Creates a controller from a collection of authorization requests.
### [Inspecting requests](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller#Inspecting-requests)
[`class ASAuthorizationRequest`](https://developer.apple.com/documentation/authenticationservices/asauthorizationrequest)
A base class for different kinds of authorization requests.
[`var authorizationRequests: [ASAuthorizationRequest]`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/authorizationrequests)
The authorization requests that the controller manages.
[`var customAuthorizationMethods: [ASAuthorizationCustomMethod]`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/customauthorizationmethods)
An array of custom authorization methods for the user to choose.
### [Presenting requests](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller#Presenting-requests)
[`var presentationContextProvider: (any ASAuthorizationControllerPresentationContextProviding)?`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/presentationcontextprovider)
A delegate that provides a display context in which the system can present an authorization interface to the user.
[`protocol ASAuthorizationControllerPresentationContextProviding`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontrollerpresentationcontextproviding)
An interface the controller uses to ask a delegate for a presentation context.
### [Executing requests](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller#Executing-requests)
[`func performRequests()`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/performrequests\(\))
Starts the specified authorization flows during controller initialization.
[`func performRequests(options: ASAuthorizationController.RequestOptions)`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/performrequests\(options:\))
Starts the specified authorization flows during controller initialization.
[`func performAutoFillAssistedRequests()`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/performautofillassistedrequests\(\))
Initiates the authorization flows for requests that support AutoFill presentation.
[`func cancel()`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/cancel\(\))
Cancels any active authorization requests.
[`struct RequestOptions`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/requestoptions)
Options that modify how a controller performs authorization requests.
### [Responding to request completion](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller#Responding-to-request-completion)
[`var delegate: (any ASAuthorizationControllerDelegate)?`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller/delegate)
A delegate that the authorization controller informs about the success or failure of an authorization attempt.
[`func authorizationController(ASAuthorizationController, didCompleteWithCustomMethod: ASAuthorizationCustomMethod)`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontrollerdelegate/authorizationcontroller\(_:didcompletewithcustommethod:\))
Informs the delegate when authorization completes, and specifies the custom method the user selected.
[`protocol ASAuthorizationControllerDelegate`](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontrollerdelegate)
An interface for providing information about the outcome of an authorization request.
## [Relationships](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller#relationships)
### [Inherits From](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller#inherits-from)
  * [`NSObject`](https://developer.apple.com/documentation/ObjectiveC/NSObject-swift.class)


### [Conforms To](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller#conforms-to)
  * [`CVarArg`](https://developer.apple.com/documentation/Swift/CVarArg)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`NSObjectProtocol`](https://developer.apple.com/documentation/ObjectiveC/NSObjectProtocol)


## [See Also](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller#see-also)
### [Authorization requests](https://developer.apple.com/documentation/authenticationservices/asauthorizationcontroller#Authorization-requests)
[`struct AuthorizationController`](https://developer.apple.com/documentation/authenticationservices/authorizationcontroller)
A SwiftUI environment value that views use to perform authorization requests.
[`enum ASAuthorizationResult`](https://developer.apple.com/documentation/authenticationservices/asauthorizationresult)
Describes the outcome of a successful authorization request.
Current page is ASAuthorizationController 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fauthenticationservices%2Fasauthorizationcontroller).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
