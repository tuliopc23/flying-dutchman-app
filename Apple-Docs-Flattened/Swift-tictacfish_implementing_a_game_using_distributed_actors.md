Source: https://developer.apple.com/documentation/swift/tictacfish_implementing_a_game_using_distributed_actors

[ Skip Navigation ](https://developer.apple.com/documentation/swift/tictacfish_implementing_a_game_using_distributed_actors#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/swift/tictacfish_implementing_a_game_using_distributed_actors#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/swift/tictacfish_implementing_a_game_using_distributed_actors)
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
[ Open Menu ](https://developer.apple.com/documentation/swift/tictacfish_implementing_a_game_using_distributed_actors)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/swift/tictacfish_implementing_a_game_using_distributed_actors)
## [ Swift  ](https://developer.apple.com/documentation/swift)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 36 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 36 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 36 symbols inside <root> [Swift updates](https://developer.apple.com/documentation/updates/swift)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 36 symbols inside <root> [Adopting strict concurrency in Swift 6 apps](https://developer.apple.com/documentation/swift/adoptingswift6)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 36 symbols inside <root>
Standard Library
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
5 of 36 symbols inside <root> containing 128 symbols[Int](https://developer.apple.com/documentation/swift/int)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
6 of 36 symbols inside <root> containing 163 symbols[Double](https://developer.apple.com/documentation/swift/double)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
7 of 36 symbols inside <root> containing 340 symbols[String](https://developer.apple.com/documentation/swift/string)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
8 of 36 symbols inside <root> containing 197 symbols[Array](https://developer.apple.com/documentation/swift/array)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
9 of 36 symbols inside <root> containing 100 symbols[Dictionary](https://developer.apple.com/documentation/swift/dictionary)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
10 of 36 symbols inside <root> containing 21 symbols[Swift Standard Library](https://developer.apple.com/documentation/swift/swift-standard-library)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
11 of 36 symbols inside <root>
Observation
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 36 symbols inside <root>
Distributed Actors
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
13 of 36 symbols inside <root> [Distributed](https://developer.apple.com/documentation/distributed)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
14 of 36 symbols inside <root>
Regular Expression DSL
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
15 of 36 symbols inside <root> [RegexBuilder](https://developer.apple.com/documentation/regexbuilder)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
16 of 36 symbols inside <root>
Low-Level Atomic Operations
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
17 of 36 symbols inside <root> [Synchronization](https://developer.apple.com/documentation/synchronization)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
18 of 36 symbols inside <root>
Data Modeling
36 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Swift ](https://developer.apple.com/documentation/swift)
  * [ TicTacFish: Implementing a game using distributed actors ](https://developer.apple.com/documentation/swift/tictacfish_implementing_a_game_using_distributed_actors)
  *     * TicTacFish: Implementing a game using distributed actors 


Sample Code
# TicTacFish: Implementing a game using distributed actors
Use distributed actors to take your Swift concurrency and actor-based apps beyond a single process.
[ Download ](https://docs-assets.developer.apple.com/published/b583f10d72/TicTacFishImplementingAGameUsingDistributedActors.zip)
iOS 16.0+iPadOS 16.0+Xcode 14.0+
## [Overview](https://developer.apple.com/documentation/swift/tictacfish_implementing_a_game_using_distributed_actors#overview)
Note
This sample code project is associated with WWDC22 session [110356: Meet distributed actors in Swift](https://developer.apple.com/wwdc22/110356/).
### [Configure the sample code project](https://developer.apple.com/documentation/swift/tictacfish_implementing_a_game_using_distributed_actors#4037447)
Because the sample app uses new Swift language features introduced in Swift 5.7, you need at least the following versions of iOS, macOS, and Xcode to edit and run the samples:
To run the iOS app:
  * iOS 16
  * macOS 13
  * Xcode 14


To run the server-side application on your local Mac:
  * macOS 13
  * Xcode 14


To run the server-side application on a Linux server, compile and run the `Server` package using:
  * Any supported Linux distribution
  * Swift 5.7


You can try out the peer-to-peer local networking part of the sample app by starting multiple simulators (such as an iPhone 13 and an iPhone 13 Pro) from the same Xcode project.
## [See Also](https://developer.apple.com/documentation/swift/tictacfish_implementing_a_game_using_distributed_actors#see-also)
### [Standard Library](https://developer.apple.com/documentation/swift/tictacfish_implementing_a_game_using_distributed_actors#standard-library)
[`struct Int`](https://developer.apple.com/documentation/swift/int)
A signed integer value type.
[`struct Double`](https://developer.apple.com/documentation/swift/double)
A double-precision, floating-point value type.
[`struct String`](https://developer.apple.com/documentation/swift/string)
A Unicode string value that is a collection of characters.
[`struct Array`](https://developer.apple.com/documentation/swift/array)
An ordered, random-access collection.
[`struct Dictionary`](https://developer.apple.com/documentation/swift/dictionary)
A collection whose elements are key-value pairs.
[API Reference Swift Standard Library](https://developer.apple.com/documentation/swift/swift-standard-library)
Solve complex problems and write high-performance, readable code.
[Updating an App to Use Swift Concurrency](https://developer.apple.com/documentation/swift/updating_an_app_to_use_swift_concurrency)
Improve your app’s performance by refactoring your code to take advantage of asynchronous functions in Swift.
Current page is TicTacFish: Implementing a game using distributed actors 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fswift%2Ftictacfish_implementing_a_game_using_distributed_actors).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
