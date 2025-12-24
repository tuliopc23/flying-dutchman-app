Source: https://developer.apple.com/documentation/swift

[ Skip Navigation ](https://developer.apple.com/documentation/swift#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/swift#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/swift)
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
[ Open Menu ](https://developer.apple.com/documentation/swift)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/swift)
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
Framework
# Swift
Build apps using a powerful open language.
iOS 8.0+iPadOS 8.0+Mac Catalyst 13.0+macOS 10.10+tvOS 9.0+visionOS 1.0+watchOS 2.0+
## [Overview](https://developer.apple.com/documentation/swift#Overview)
Swift includes modern features like type inference, optionals, and closures, which make the syntax concise yet expressive. Swift ensures your code is fast and efficient, while its memory safety and native error handling make the language safe by design. Writing Swift code is interactive and fun in Swift Playgrounds, playgrounds in Xcode, and REPL.
```
var interestingNumbers = [
    "primes": [2, 3, 5, 7, 11, 13, 17],
    "triangular": [1, 3, 6, 10, 15, 21, 28],
    "hexagonal": [1, 6, 15, 28, 45, 66, 91]
]


for key in interestingNumbers.keys {
    interestingNumbers[key]?.sort(by: >)
}


print(interestingNumbers["primes"]!)
// Prints "[17, 13, 11, 7, 5, 3, 2]"

```

### [Learn Swift](https://developer.apple.com/documentation/swift#Learn-Swift)
If you’re new to Swift, read [The Swift Programming Language](https://docs.swift.org/swift-book/) for a quick tour, a comprehensive language guide, and a full reference manual. If you’re new to programming, check out [Swift Playgrounds](https://www.apple.com/swift/playgrounds/) on iPad.
Swift is developed in the open. To learn more about the open source Swift project and community, visit [Swift.org](https://swift.org).
## [Topics](https://developer.apple.com/documentation/swift#topics)
### [Essentials](https://developer.apple.com/documentation/swift#Essentials)
[Swift updates](https://developer.apple.com/documentation/Updates/Swift)
Learn about important changes to Swift.
[Adopting strict concurrency in Swift 6 apps](https://developer.apple.com/documentation/swift/adoptingswift6)
Enable strict concurrency checking to find data races at compile time.
### [Standard Library](https://developer.apple.com/documentation/swift#Standard-Library)
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
### [Observation](https://developer.apple.com/documentation/swift#Observation)
[Observation](https://developer.apple.com/documentation/swift#Observation)
### [Distributed Actors](https://developer.apple.com/documentation/swift#Distributed-Actors)
[Distributed](https://developer.apple.com/documentation/distributed)
Build systems that run distributed code across multiple processes and devices.
### [Regular Expression DSL](https://developer.apple.com/documentation/swift#Regular-Expression-DSL)
[RegexBuilder](https://developer.apple.com/documentation/regexbuilder)
Use an expressive domain-specific language to build regular expressions, for operations like searching and replacing in text.
### [Low-Level Atomic Operations](https://developer.apple.com/documentation/swift#Low-Level-Atomic-Operations)
[Synchronization](https://developer.apple.com/documentation/synchronization)
Build synchronization constructs using low-level, primitive operations.
### [Data Modeling](https://developer.apple.com/documentation/swift#Data-Modeling)
[Choosing Between Structures and Classes](https://developer.apple.com/documentation/swift/choosing-between-structures-and-classes)
Decide how to store data and model behavior.
[Adopting Common Protocols](https://developer.apple.com/documentation/swift/adopting-common-protocols)
Make your custom types easier to use by ensuring that they conform to Swift protocols.
### [Data Flow and Control Flow](https://developer.apple.com/documentation/swift#Data-Flow-and-Control-Flow)
[Maintaining State in Your Apps](https://developer.apple.com/documentation/swift/maintaining-state-in-your-apps)
Use enumerations to capture and track the state of your app.
[Preventing Timing Problems When Using Closures](https://developer.apple.com/documentation/swift/preventing-timing-problems-when-using-closures)
Understand how different API calls to your closures can affect your app.
### [Language Interoperability with Objective-C and C](https://developer.apple.com/documentation/swift#Language-Interoperability-with-Objective-C-and-C)
[API Reference Objective-C and C Code Customization](https://developer.apple.com/documentation/swift/objective-c-and-c-code-customization)
Apply macros to your Objective-C APIs to customize how they’re imported into Swift.
[Migrating Your Objective-C Code to Swift](https://developer.apple.com/documentation/swift/migrating-your-objective-c-code-to-swift)
Learn the recommended steps to migrate your code.
[API Reference Cocoa Design Patterns](https://developer.apple.com/documentation/swift/cocoa-design-patterns)
Adopt and interoperate with Cocoa design patterns in your Swift apps.
[Handling Dynamically Typed Methods and Objects in Swift](https://developer.apple.com/documentation/swift/handling-dynamically-typed-methods-and-objects-in-swift)
Cast instances of the Objective-C `id` type to a specific Swift type.
[Using Objective-C Runtime Features in Swift](https://developer.apple.com/documentation/swift/using-objective-c-runtime-features-in-swift)
Use selectors and key paths to interact with dynamic Objective-C APIs.
[API Reference Imported C and Objective-C APIs](https://developer.apple.com/documentation/swift/imported-c-and-objective-c-apis)
Use native Swift syntax to interoperate with types and functions in C and Objective-C.
[Calling Objective-C APIs Asynchronously](https://developer.apple.com/documentation/swift/calling-objective-c-apis-asynchronously)
Learn how functions and methods that take a completion handler are converted to Swift asynchronous functions.
### [Language Interoperability with C++](https://developer.apple.com/documentation/swift#Language-Interoperability-with-C++)
[Mixing Languages in an Xcode project](https://developer.apple.com/documentation/swift/mixinglanguagesinanxcodeproject)
Use C++ APIs in Swift – and Swift APIs in C++ – in a single framework target, and consume the framework’s APIs in a separate app target.
[Calling APIs Across Language Boundaries](https://developer.apple.com/documentation/swift/callingapisacrosslanguageboundaries)
Use a variety of C++ APIs in Swift – and vice-versa – across multiple targets and frameworks in an Xcode project.
### [Structures](https://developer.apple.com/documentation/swift#Structures)
[`struct OutputRawSpan`](https://developer.apple.com/documentation/swift/outputrawspan)
Current page is Swift 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fswift).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
