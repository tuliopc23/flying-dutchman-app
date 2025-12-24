Source: https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller

[ Skip Navigation ](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller)
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
[ Open Menu ](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller)


[](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller)
Navigator is loading 
  * [ Authentication Services ](https://developer.apple.com/documentation/authenticationservices)
  * [ ASCredentialProviderViewController ](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller)
  *     * ASCredentialProviderViewController 


Class
# ASCredentialProviderViewController
A view controller that a credential manager app uses to extend AutoFill.
iOS 12.0+iPadOS 12.0+Mac Catalyst 14.0+macOS 11.0+visionOS 1.0+
```
@[MainActor](https://developer.apple.com/documentation/Swift/MainActor)
class ASCredentialProviderViewController
```

## [Overview](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller#overview)
To integrate a password, passkey, or one-time passcode manager app with AutoFill:
  1. Add a Credential Provider Extension target to your project that subclasses [`ASCredentialProviderViewController`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller). Add the [`AutoFill Credential Provider Entitlement`](https://developer.apple.com/documentation/BundleResources/Entitlements/com.apple.developer.authentication-services.autofill-credential-provider) to both the extension and its containing app.
  2. Override the view controller’s [`prepareCredentialList(for:)`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/preparecredentiallist\(for:\)) method to prepare a view with a list of credentials that the person can choose from after opening your extension from the AutoFill suggestions list.
  3. Optionally add [`ASPasswordCredentialIdentity`](https://developer.apple.com/documentation/authenticationservices/aspasswordcredentialidentity) and [`ASPasskeyCredentialIdentity`](https://developer.apple.com/documentation/authenticationservices/aspasskeycredentialidentity) instances to the shared [`ASCredentialIdentityStore`](https://developer.apple.com/documentation/authenticationservices/ascredentialidentitystore) to make identities available directly in the AutoFill suggestions list. Then override the [`provideCredentialWithoutUserInteraction(for:)`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/providecredentialwithoutuserinteraction\(for:\)-3mo23) method to provide the associated credentials when the person taps a suggestion.
  4. Optionally, override the [`prepareInterfaceForExtensionConfiguration()`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/prepareinterfaceforextensionconfiguration\(\)) method to specify a configuration interface that you can show when people first enable your credentials manager in Settings.


### [Receiving credential updates](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller#Receiving-credential-updates)
Apps and websites that allow sign-ins can signal updates to the operating system with the [`ASCredentialUpdater`](https://developer.apple.com/documentation/authenticationservices/ascredentialupdater) class. The various “report” methods of [`ASCredentialUpdater`](https://developer.apple.com/documentation/authenticationservices/ascredentialupdater) work like the “signal” methods of `PublicKeyCredential` when using WebAuthn on the web. For example, a website or app can notify credential manager apps that it updated a user name or email for a given account, allowing the manager to stay consistent with the website.
Your credential manager manager receives these updates in the “report” methods of `ASCredentialProviderViewController`. Use these calls to update your manager’s stored credential data or behavior. For example, a call to [`reportUnusedPasswordCredential(forDomain:userName:)`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/reportunusedpasswordcredential\(fordomain:username:\)) can indicate that someone using a passkey will no longer use a password to sign in to a given domain, or that they deleted their account. In this case, the manager should stop showing the user name and password for that domain.
Note
This class ignores calls from Mac apps built with Mac Catalyst.
## [Topics](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller#topics)
### [Getting the extension context](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller#Getting-the-extension-context)
[`var extensionContext: ASCredentialProviderExtensionContext`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/extensioncontext)
The context your credential provider extension uses to provide information to the system.
[`class ASCredentialProviderExtensionContext`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderextensioncontext)
A mechanism that credential provider extensions use to communicate with the system.
### [Configuring the credential provider extension](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller#Configuring-the-credential-provider-extension)
[`func prepareInterfaceForExtensionConfiguration()`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/prepareinterfaceforextensionconfiguration\(\))
Prepares the interface to enable the user to configure the extension.
[`class ASCredentialIdentityStore`](https://developer.apple.com/documentation/authenticationservices/ascredentialidentitystore)
A container that your extension fills to provide credentials through the QuickType bar.
### [Selecting a credential](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller#Selecting-a-credential)
[`func prepareCredentialList(for: [ASCredentialServiceIdentifier])`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/preparecredentiallist\(for:\))
Prepares the interface to display a list of credentials from which the user can select.
[`func prepareCredentialList(for: [ASCredentialServiceIdentifier], requestParameters: ASPasskeyCredentialRequestParameters)`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/preparecredentiallist\(for:requestparameters:\))
Prepares the interface to display a list of passkey and password credentials from which the user can select.
[`func prepareOneTimeCodeCredentialList(for: [ASCredentialServiceIdentifier])`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/prepareonetimecodecredentiallist\(for:\))
Prepares the interface to display a list of one-time passcodes (OTPs) that people can select from.
[`func prepareInterface(forPasskeyRegistration: any ASCredentialRequest)`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/prepareinterface\(forpasskeyregistration:\))
Prepare the view controller to show user interface for registering a new passkey.
[`func prepareInterfaceToProvideCredential(for: any ASCredentialRequest)`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/prepareinterfacetoprovidecredential\(for:\)-68qpo)
Prepare the view controller to show user interface for providing the requested credential.
[`func provideCredentialWithoutUserInteraction(for: any ASCredentialRequest)`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/providecredentialwithoutuserinteraction\(for:\)-3mo23)
Attempts to provide the user-requested credential with no further user interaction.
[`func performWithoutUserInteractionIfPossible(passkeyRegistration: ASPasskeyCredentialRequest)`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/performwithoutuserinteractionifpossible\(passkeyregistration:\))
Perform a conditional passkey registration, if possible.
[`class ASCredentialServiceIdentifier`](https://developer.apple.com/documentation/authenticationservices/ascredentialserviceidentifier)
An identifier representing a particular service for which the user needs a credential, like a web site.
[`protocol ASCredentialRequest`](https://developer.apple.com/documentation/authenticationservices/ascredentialrequest)
A protocol that describes a request from the user for your extension to provide a credential.
[`class ASPasswordCredentialRequest`](https://developer.apple.com/documentation/authenticationservices/aspasswordcredentialrequest)
A class that represents a request to supply a password credential.
[`class ASOneTimeCodeCredentialRequest`](https://developer.apple.com/documentation/authenticationservices/asonetimecodecredentialrequest)
[`protocol ASAuthorizationPublicKeyCredentialRegistrationRequest`](https://developer.apple.com/documentation/authenticationservices/asauthorizationpublickeycredentialregistrationrequest)
An interface that defines properties for a credential registration request.
[`class ASPasskeyCredentialRequest`](https://developer.apple.com/documentation/authenticationservices/aspasskeycredentialrequest)
A class that represents a request to supply a passkey credential.
[`class ASPasskeyCredentialRequestParameters`](https://developer.apple.com/documentation/authenticationservices/aspasskeycredentialrequestparameters)
A class that represents information about a passkey credential request.
### [Providing text to AutoFill](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller#Providing-text-to-AutoFill)
[`func prepareInterfaceForUserChoosingTextToInsert()`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/prepareinterfaceforuserchoosingtexttoinsert\(\))
Prepare the view controller to show a list of all insertable text with user selectable fields.
### [Recognizing errors](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller#Recognizing-errors)
[`struct ASExtensionError`](https://developer.apple.com/documentation/authenticationservices/asextensionerror)
A credential provider extension error.
[`let ASExtensionErrorDomain: String`](https://developer.apple.com/documentation/authenticationservices/asextensionerrordomain)
The domain for a credential provider extension error.
[`enum Code`](https://developer.apple.com/documentation/authenticationservices/asextensionerror/code)
The codes for a credential provider extension error.
### [Accessing settings](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller#Accessing-settings)
[`class ASSettingsHelper`](https://developer.apple.com/documentation/authenticationservices/assettingshelper)
A class that opens Settings and navigates to the settings for configuring credential providers.
### [Receiving credential updates](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller#Receiving-credential-updates)
[`func reportAllAcceptedPublicKeyCredentials(forRelyingParty: String, userHandle: Data, acceptedCredentialIDs: [Data])`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/reportallacceptedpublickeycredentials\(forrelyingparty:userhandle:acceptedcredentialids:\))
Receives a report from the system that a relying party sent a snapshot of all accepted credentials for an account.
[`func reportPublicKeyCredentialUpdate(forRelyingParty: String, userHandle: Data, newName: String)`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/reportpublickeycredentialupdate\(forrelyingparty:userhandle:newname:\))
Receives a report from the system that a relying party indicated that a passkey’s user name updated.
[`func reportUnknownPublicKeyCredential(forRelyingParty: String, credentialID: Data)`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/reportunknownpublickeycredential\(forrelyingparty:credentialid:\))
Receives a report from the system that a relying party indicated a passkey credential is invalid.
[`func reportUnusedPasswordCredential(forDomain: String, userName: String)`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/reportunusedpasswordcredential\(fordomain:username:\))
Receives a report from the system that a relying party indicatd that a password credential isn’t needed anymore for a given user name.
### [Deprecated methods](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller#Deprecated-methods)
[`func provideCredentialWithoutUserInteraction(for: ASPasswordCredentialIdentity)`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/providecredentialwithoutuserinteraction\(for:\)-7jlg0)
Attempts to provide the user-requested credential with no further user interaction.
Deprecated
[`func prepareInterfaceToProvideCredential(for: ASPasswordCredentialIdentity)`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/prepareinterfacetoprovidecredential\(for:\)-18ukb)
Prepares the interface for a user interaction, like a database login, that enables it to access and return the credential for the given identity.
Deprecated
### [Instance Methods](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller#Instance-Methods)
[`func performWithoutUserInteraction(generatePasswordsRequest: ASGeneratePasswordsRequest)`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/performwithoutuserinteraction\(generatepasswordsrequest:\))
Attempt to generate passwords based on developer-specified rules.
[`func performWithoutUserInteractionIfPossible(savePasswordRequest: ASSavePasswordRequest)`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/performwithoutuserinteractionifpossible\(savepasswordrequest:\))
Attempt to save a password credential.
[`func prepareInterface(for: ASSavePasswordRequest)`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/prepareinterface\(for:\)-69elg)
Prepares the interface to display a prompt to save a password credential.
[`func prepareInterface(for: ASGeneratePasswordsRequest)`](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller/prepareinterface\(for:\)-7ideq)
Prepares the interface to display a prompt to generate passwords based on developer-specified rules.
## [Relationships](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller#relationships)
### [Inherits From](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller#inherits-from)
  * [`NSViewController`](https://developer.apple.com/documentation/AppKit/NSViewController)
  * [`UIViewController`](https://developer.apple.com/documentation/UIKit/UIViewController)


### [Conforms To](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller#conforms-to)
  * [`CVarArg`](https://developer.apple.com/documentation/Swift/CVarArg)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`NSCoding`](https://developer.apple.com/documentation/Foundation/NSCoding)
  * [`NSEditor`](https://developer.apple.com/documentation/AppKit/NSEditor)
  * [`NSExtensionRequestHandling`](https://developer.apple.com/documentation/Foundation/NSExtensionRequestHandling)
  * [`NSObjectProtocol`](https://developer.apple.com/documentation/ObjectiveC/NSObjectProtocol)
  * [`NSSeguePerforming`](https://developer.apple.com/documentation/AppKit/NSSeguePerforming)
  * [`NSStandardKeyBindingResponding`](https://developer.apple.com/documentation/AppKit/NSStandardKeyBindingResponding)
  * [`NSTouchBarProvider`](https://developer.apple.com/documentation/AppKit/NSTouchBarProvider)
  * [`NSUserActivityRestoring`](https://developer.apple.com/documentation/AppKit/NSUserActivityRestoring)
  * [`NSUserInterfaceItemIdentification`](https://developer.apple.com/documentation/AppKit/NSUserInterfaceItemIdentification)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)
  * [`UIActivityItemsConfigurationProviding`](https://developer.apple.com/documentation/UIKit/UIActivityItemsConfigurationProviding)
  * [`UIAppearanceContainer`](https://developer.apple.com/documentation/UIKit/UIAppearanceContainer)
  * [`UIContentContainer`](https://developer.apple.com/documentation/UIKit/UIContentContainer)
  * [`UIFocusEnvironment`](https://developer.apple.com/documentation/UIKit/UIFocusEnvironment)
  * [`UIPasteConfigurationSupporting`](https://developer.apple.com/documentation/UIKit/UIPasteConfigurationSupporting)
  * [`UIResponderStandardEditActions`](https://developer.apple.com/documentation/UIKit/UIResponderStandardEditActions)
  * [`UIStateRestoring`](https://developer.apple.com/documentation/UIKit/UIStateRestoring)
  * [`UITraitChangeObservable`](https://developer.apple.com/documentation/UIKit/UITraitChangeObservable-67e94)
  * [`UITraitEnvironment`](https://developer.apple.com/documentation/UIKit/UITraitEnvironment)
  * [`UIUserActivityRestoring`](https://developer.apple.com/documentation/UIKit/UIUserActivityRestoring)


## [See Also](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller#see-also)
### [AutoFill credentials](https://developer.apple.com/documentation/authenticationservices/ascredentialproviderviewcontroller#AutoFill-credentials)
[Providing one-time passcodes to AutoFill](https://developer.apple.com/documentation/authenticationservices/providing-one-time-passcodes-to-autofill)
Help people efficiently perform multifactor authentication.
[`AutoFill Credential Provider Entitlement`](https://developer.apple.com/documentation/BundleResources/Entitlements/com.apple.developer.authentication-services.autofill-credential-provider)
A Boolean value that indicates whether the app may, with user permission, provide user names and passwords for AutoFill in Safari and other apps.
Current page is ASCredentialProviderViewController 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fauthenticationservices%2Fascredentialproviderviewcontroller).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
