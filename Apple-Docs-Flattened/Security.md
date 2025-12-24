Source: https://developer.apple.com/documentation/security

[ Skip Navigation ](https://developer.apple.com/documentation/security#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/security#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/security)
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
[ Open Menu ](https://developer.apple.com/documentation/security)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/security)


[](https://developer.apple.com/documentation/security)
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
Collection
5 of 65 symbols inside <root> containing 8 symbols[Shared Web Credentials](https://developer.apple.com/documentation/security/shared-web-credentials)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
6 of 65 symbols inside <root> containing 31 symbols[Authorization Services](https://developer.apple.com/documentation/security/authorization-services)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
7 of 65 symbols inside <root> containing 5 symbols[Authorization Plug-ins](https://developer.apple.com/documentation/security/authorization-plug-ins)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
8 of 65 symbols inside <root> containing 10 symbols[Sessions](https://developer.apple.com/documentation/security/sessions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
9 of 65 symbols inside <root> containing 2 symbols[One-time codes](https://developer.apple.com/documentation/security/one-time-codes)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 65 symbols inside <root>
Secure data
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
11 of 65 symbols inside <root> containing 4 symbols[Keychain services](https://developer.apple.com/documentation/security/keychain-services)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
12 of 65 symbols inside <root> containing 4 symbols[Preventing Insecure Network Connections](https://developer.apple.com/documentation/security/preventing-insecure-network-connections)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
13 of 65 symbols inside <root>
Secure code
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
14 of 65 symbols inside <root> containing 62 symbols[Code Signing Services](https://developer.apple.com/documentation/security/code-signing-services)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
15 of 65 symbols inside <root> containing 3 symbols[Notarizing macOS software before distribution](https://developer.apple.com/documentation/security/notarizing-macos-software-before-distribution)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
16 of 65 symbols inside <root> [Preparing your app to work with pointer authentication](https://developer.apple.com/documentation/security/preparing-your-app-to-work-with-pointer-authentication)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
17 of 65 symbols inside <root> containing 33 symbols[App Sandbox](https://developer.apple.com/documentation/security/app-sandbox)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
18 of 65 symbols inside <root> containing 15 symbols[Hardened Runtime](https://developer.apple.com/documentation/security/hardened-runtime)
65 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Framework
# Security
Secure the data your app manages, and control access to your app.
iOS 2.0+iPadOS 2.0+Mac Catalyst 13.0+macOS 10.0+tvOS 9.0+visionOS 1.0+watchOS 2.0+
## [Overview](https://developer.apple.com/documentation/security#overview)
Use the Security framework to protect information, establish trust, and control access to software. Broadly, security services support these goals:
  * Establish a user’s identity (authentication) and then selectively grant access to resources (authorization).
  * Secure data, both on disk and in motion across a network connection.
  * Ensure the validity of code to be executed for a particular purpose.


As shown in the image below, you can also use lower level cryptographic resources to create new secure services. Cryptography is difficult and the cost of bugs typically so high that it’s rarely a good idea to implement your own cryptography solution. Rely on the Security framework when you need cryptography in your app.
![Diagram showing your app sitting above the Security framework, which provides tools to enable secure interaction with users, data, and code.](https://docs-assets.developer.apple.com/published/c89145031becb4c02e98769e238d4f25/media-2891898%402x.png)
Note
Always use the highest level API that meets your needs. The Security framework is not always your best option. For example, to conduct secure network communications, start by considering the [Foundation](https://developer.apple.com/documentation/Foundation) framework’s [URL Loading System](https://developer.apple.com/documentation/Foundation/url-loading-system), which builds on the Security framework. Only if your app requires lower level access to security protocol functions would you use the secure transport API directly.
## [Topics](https://developer.apple.com/documentation/security#topics)
### [Essentials](https://developer.apple.com/documentation/security#Essentials)
[Security updates](https://developer.apple.com/documentation/Updates/Security)
Learn about important changes to Security.
### [Authorization and authentication](https://developer.apple.com/documentation/security#Authorization-and-authentication)
[API Reference Password AutoFill](https://developer.apple.com/documentation/security/password-autofill)
Streamline your app’s login and onboarding procedures.
[API Reference Shared Web Credentials](https://developer.apple.com/documentation/security/shared-web-credentials)
Share credentials between iOS apps and their website counterparts.
[API Reference Authorization Services](https://developer.apple.com/documentation/security/authorization-services)
Access restricted areas of the operating system, and control access to particular features of your macOS app.
[API Reference Authorization Plug-ins](https://developer.apple.com/documentation/security/authorization-plug-ins)
Extend the authorization services API by creating plug-ins that can participate in authorization decisions.
[API Reference Sessions](https://developer.apple.com/documentation/security/sessions)
Manage login, authorization, and security sessions in macOS.
[API Reference One-time codes](https://developer.apple.com/documentation/security/one-time-codes)
Streamline entry of authentication and recovery codes.
### [Secure data](https://developer.apple.com/documentation/security#Secure-data)
[API Reference Keychain services](https://developer.apple.com/documentation/security/keychain-services)
Securely store small chunks of data on behalf of the user.
[API Reference Preventing Insecure Network Connections](https://developer.apple.com/documentation/security/preventing-insecure-network-connections)
Enforce secure network links in your app by relying on App Transport Security.
### [Secure code](https://developer.apple.com/documentation/security#Secure-code)
[API Reference Code Signing Services](https://developer.apple.com/documentation/security/code-signing-services)
Examine and validate signed code running on the system.
[API Reference Notarizing macOS software before distribution](https://developer.apple.com/documentation/security/notarizing-macos-software-before-distribution)
Give users even more confidence in your macOS software by submitting it to Apple for notarization.
[Preparing your app to work with pointer authentication](https://developer.apple.com/documentation/security/preparing-your-app-to-work-with-pointer-authentication)
Test your app against the arm64e architecture to ensure that it works seamlessly with enhanced security features.
[API Reference App Sandbox](https://developer.apple.com/documentation/security/app-sandbox)
Restrict access to system resources and user data in macOS apps to contain damage if an app becomes compromised.
[API Reference Hardened Runtime](https://developer.apple.com/documentation/security/hardened-runtime)
Manage security protections and resource access for your macOS apps.
[Disabling and Enabling System Integrity Protection](https://developer.apple.com/documentation/security/disabling-and-enabling-system-integrity-protection)
Disable system protections only temporarily during development to test drivers, kernel extensions, and other low-level code.
[Using the latest code signature format](https://developer.apple.com/documentation/Xcode/using-the-latest-code-signature-format)
Update legacy app code signatures so your app runs on current OS releases.
[Updating Mac Software](https://developer.apple.com/documentation/security/updating-mac-software)
Implement Mac software updates without causing code-signing crashes.
[TN3125: Inside Code Signing: Provisioning Profiles](https://developer.apple.com/documentation/Technotes/tn3125-inside-code-signing-provisioning-profiles)
Learn how provisioning profiles enable third-party code to run on Apple platforms.
### [Launch environment constraints](https://developer.apple.com/documentation/security#Launch-environment-constraints)
[Applying launch environment and library constraints](https://developer.apple.com/documentation/security/applying-launch-environment-and-library-constraints)
Limit the libraries your process loads, and the situations where it runs.
[Defining launch environment and library constraints](https://developer.apple.com/documentation/security/defining-launch-environment-and-library-constraints)
Restrict your app’s components to their expected contexts.
[Constraining a tool’s launch environment](https://developer.apple.com/documentation/security/constraining-a-tool's-launch-environment)
Improve the security of your macOS app by limiting the ways its components can run.
### [Cryptography](https://developer.apple.com/documentation/security#Cryptography)
[API Reference Complying with Encryption Export Regulations](https://developer.apple.com/documentation/security/complying-with-encryption-export-regulations)
Declare the use of encryption in your app to streamline the app submission process.
[API Reference Certificate, Key, and Trust Services](https://developer.apple.com/documentation/security/certificate-key-and-trust-services)
Establish trust using certificates and cryptographic keys.
[API Reference Cryptographic Message Syntax Services](https://developer.apple.com/documentation/security/cryptographic-message-syntax-services)
Cryptographically sign and encrypt S/MIME messages.
[API Reference Randomization Services](https://developer.apple.com/documentation/security/randomization-services)
Generate cryptographically secure random numbers.
[API Reference Security Transforms](https://developer.apple.com/documentation/security/security-transforms)
Perform cryptographic functions like encoding, encryption, signing, and signature verification.
[API Reference ASN.1](https://developer.apple.com/documentation/security/asn-1)
Encode and decode Distinguished Encoding Rules (DER) and Basic Encoding Rules (BER) data streams.
### [Result codes](https://developer.apple.com/documentation/security#Result-codes)
[API Reference Security Framework Result Codes](https://developer.apple.com/documentation/security/security-framework-result-codes)
Evaluate result codes common to many Security framework functions.
### [Legacy interfaces](https://developer.apple.com/documentation/security#Legacy-interfaces)
[API Reference Common Security Services Manager](https://developer.apple.com/documentation/security/common-security-services-manager)
A set of open source modules underpinning the legacy implementation of the Security framework.
[API Reference Secure Transport](https://developer.apple.com/documentation/security/secure-transport)
Secure network communication using standardized transport layer security mechanisms.
[API Reference Secure Download](https://developer.apple.com/documentation/security/secure-download)
Implement Apple’s Secure Download System in macOS.
[API Reference Security legacy reference](https://developer.apple.com/documentation/security/security-legacy-reference)
Learn about legacy APIs.
### [Reference](https://developer.apple.com/documentation/security#Reference)
[API Reference Security Structures](https://developer.apple.com/documentation/security/security-structures)
[API Reference Security Constants](https://developer.apple.com/documentation/security/security-constants)
[API Reference Security Functions](https://developer.apple.com/documentation/security/security-functions)
[API Reference Security Data Types](https://developer.apple.com/documentation/security/security-data-types)
### [Variables](https://developer.apple.com/documentation/security#Variables)
[`var CSSM_APPLE_PRIVATE_CSPDL_CODE_28: Int`](https://developer.apple.com/documentation/security/cssm_apple_private_cspdl_code_28)
[`var TLS_ECDHE_PSK_WITH_CHACHA20_POLY1305_SHA256: SSLCipherSuite`](https://developer.apple.com/documentation/security/tls_ecdhe_psk_with_chacha20_poly1305_sha256)
[`var errSecMissingQualifiedCertStatement: OSStatus`](https://developer.apple.com/documentation/security/errsecmissingqualifiedcertstatement)
[`let kSecPolicyAppleEAPClient: CFString`](https://developer.apple.com/documentation/security/ksecpolicyappleeapclient)
[`let kSecPolicyAppleEAPServer: CFString`](https://developer.apple.com/documentation/security/ksecpolicyappleeapserver)
[`let kSecPolicyAppleIPSecClient: CFString`](https://developer.apple.com/documentation/security/ksecpolicyappleipsecclient)
[`let kSecPolicyAppleIPSecServer: CFString`](https://developer.apple.com/documentation/security/ksecpolicyappleipsecserver)
[`let kSecPolicyAppleSSLClient: CFString`](https://developer.apple.com/documentation/security/ksecpolicyapplesslclient)
[`let kSecPolicyAppleSSLServer: CFString`](https://developer.apple.com/documentation/security/ksecpolicyapplesslserver)
[`let kSecTrustQCStatements: CFString`](https://developer.apple.com/documentation/security/ksectrustqcstatements)
[`let kSecTrustQWACValidation: CFString`](https://developer.apple.com/documentation/security/ksectrustqwacvalidation)
### [Functions](https://developer.apple.com/documentation/security#Functions)
[`func SecIdentityCreate(CFAllocator?, SecCertificate, SecKey) -> SecIdentity?`](https://developer.apple.com/documentation/security/secidentitycreate\(_:_:_:\))
[`func sec_protocol_metadata_copy_negotiated_protocol(sec_protocol_metadata_t) -> UnsafePointer<CChar>?`](https://developer.apple.com/documentation/security/sec_protocol_metadata_copy_negotiated_protocol\(_:\))
[`func sec_protocol_metadata_copy_server_name(sec_protocol_metadata_t) -> UnsafePointer<CChar>?`](https://developer.apple.com/documentation/security/sec_protocol_metadata_copy_server_name\(_:\))
### [Type Aliases](https://developer.apple.com/documentation/security#Type-Aliases)
[`typealias CE_DataType`](https://developer.apple.com/documentation/security/ce_datatype-swift.typealias)
[`typealias CE_ExtendedKeyUsage`](https://developer.apple.com/documentation/security/ce_extendedkeyusage-swift.typealias)
[`typealias CE_GeneralNameType`](https://developer.apple.com/documentation/security/ce_generalnametype-swift.typealias)
Current page is Security 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fsecurity).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
