Source: https://developer.apple.com/documentation/Combine/Publisher/Failure

[ Skip Navigation ](https://developer.apple.com/documentation/Combine/Publisher/Failure#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/Combine/Publisher/Failure#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/Combine/Publisher/Failure)
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
[ Open Menu ](https://developer.apple.com/documentation/Combine/Publisher/Failure)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/Combine/Publisher/Failure)
## [ Combine  ](https://developer.apple.com/documentation/combine)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 51 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 51 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 51 symbols inside <root> [Receiving and Handling Events with Combine](https://developer.apple.com/documentation/combine/receiving-and-handling-events-with-combine)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 51 symbols inside <root>
Publishers
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
4 of 51 symbols inside <root> containing 149 symbols[Publisher](https://developer.apple.com/documentation/combine/publisher)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 149 symbols inside -205249544 
Declaring supporting types
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
2 of 149 symbols inside -205249544 [Output](https://developer.apple.com/documentation/combine/publisher/output)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
3 of 149 symbols inside -205249544 [Failure](https://developer.apple.com/documentation/combine/publisher/failure)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 149 symbols inside -205249544 
Working with subscribers
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
5 of 149 symbols inside -205249544 [func receive<S>(subscriber: S)](https://developer.apple.com/documentation/combine/publisher/receive\(subscriber:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
6 of 149 symbols inside -205249544 [func subscribe<S>(S)](https://developer.apple.com/documentation/combine/publisher/subscribe\(_:\)-4u8kn)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
7 of 149 symbols inside -205249544 [func subscribe<S>(S) -> AnyCancellable](https://developer.apple.com/documentation/combine/publisher/subscribe\(_:\)-3fk20)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 149 symbols inside -205249544 
Mapping elements
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
9 of 149 symbols inside -205249544 [func map<T>((Self.Output) -> T) -> Publishers.Map<Self, T>](https://developer.apple.com/documentation/combine/publisher/map\(_:\)-99evh)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
10 of 149 symbols inside -205249544 [func tryMap<T>((Self.Output) throws -> T) -> Publishers.TryMap<Self, T>](https://developer.apple.com/documentation/combine/publisher/trymap\(_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
11 of 149 symbols inside -205249544 [func mapError<E>((Self.Failure) -> E) -> Publishers.MapError<Self, E>](https://developer.apple.com/documentation/combine/publisher/maperror\(_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
12 of 149 symbols inside -205249544 [func replaceNil<T>(with: T) -> Publishers.Map<Self, T>](https://developer.apple.com/documentation/combine/publisher/replacenil\(with:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
13 of 149 symbols inside -205249544 [func scan<T>(T, (T, Self.Output) -> T) -> Publishers.Scan<Self, T>](https://developer.apple.com/documentation/combine/publisher/scan\(_:_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
14 of 149 symbols inside -205249544 [func tryScan<T>(T, (T, Self.Output) throws -> T) -> Publishers.TryScan<Self, T>](https://developer.apple.com/documentation/combine/publisher/tryscan\(_:_:\))
200 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Combine ](https://developer.apple.com/documentation/combine)
  * [ Publisher ](https://developer.apple.com/documentation/combine/publisher)
  * [ Failure ](https://developer.apple.com/documentation/Combine/Publisher/Failure)
  *     * [ Publisher ](https://developer.apple.com/documentation/combine/publisher)
    * Failure 


Associated Type
# Failure
The kind of errors this publisher might publish.
iOS 13.0+iPadOS 13.0+Mac Catalyst 13.0+macOS 10.15+tvOS 13.0+visionOS 1.0+watchOS 6.0+
```
associatedtype Failure : [Error](https://developer.apple.com/documentation/Swift/Error)
```

**Required**
## [ Mentioned in ](https://developer.apple.com/documentation/Combine/Publisher/Failure#mentions)
[](https://developer.apple.com/documentation/combine/receiving-and-handling-events-with-combine)
## [Discussion](https://developer.apple.com/documentation/Combine/Publisher/Failure#discussion)
Use `Never` if this `Publisher` does not publish errors.
## [See Also](https://developer.apple.com/documentation/Combine/Publisher/Failure#see-also)
### [Declaring supporting types](https://developer.apple.com/documentation/Combine/Publisher/Failure#Declaring-supporting-types)
[`associatedtype Output`](https://developer.apple.com/documentation/combine/publisher/output)
The kind of values published by this publisher.
**Required**
Current page is Failure 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FCombine%2FPublisher%2FFailure).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
