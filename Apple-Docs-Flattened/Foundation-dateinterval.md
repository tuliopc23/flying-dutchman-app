Source: https://developer.apple.com/documentation/foundation/dateinterval

[ Skip Navigation ](https://developer.apple.com/documentation/foundation/dateinterval#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/foundation/dateinterval#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/foundation/dateinterval)
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
[ Open Menu ](https://developer.apple.com/documentation/foundation/dateinterval)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/foundation/dateinterval)
## [ Foundation  ](https://developer.apple.com/documentation/foundation)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 64 symbols inside <root>
Fundamentals
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 64 symbols inside <root>
Fundamentals
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
2 of 64 symbols inside <root> containing 25 symbols[Numbers, Data, and Basic Values](https://developer.apple.com/documentation/foundation/numbers-data-and-basic-values)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
3 of 64 symbols inside <root> containing 31 symbols[Strings and Text](https://developer.apple.com/documentation/foundation/strings-and-text)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
4 of 64 symbols inside <root> containing 29 symbols[Collections](https://developer.apple.com/documentation/foundation/collections)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
5 of 64 symbols inside <root> containing 15 symbols[Dates and Times](https://developer.apple.com/documentation/foundation/dates-and-times)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 15 symbols inside -776489845 
Date Representations
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
2 of 15 symbols inside -776489845 containing 66 symbols[Date](https://developer.apple.com/documentation/foundation/date)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
3 of 15 symbols inside -776489845 containing 17 symbols[DateInterval](https://developer.apple.com/documentation/foundation/dateinterval)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 17 symbols inside 102240046 
Creating a Date Interval
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 17 symbols inside 102240046 [init()](https://developer.apple.com/documentation/foundation/dateinterval/init\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 17 symbols inside 102240046 [init(start: Date, duration: TimeInterval)](https://developer.apple.com/documentation/foundation/dateinterval/init\(start:duration:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 17 symbols inside 102240046 [init(start: Date, end: Date)](https://developer.apple.com/documentation/foundation/dateinterval/init\(start:end:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 17 symbols inside 102240046 
Accessing Start Date, End Date, and Duration
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
6 of 17 symbols inside 102240046 [var start: Date](https://developer.apple.com/documentation/foundation/dateinterval/start)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
7 of 17 symbols inside 102240046 [var end: Date](https://developer.apple.com/documentation/foundation/dateinterval/end)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
8 of 17 symbols inside 102240046 [var duration: TimeInterval](https://developer.apple.com/documentation/foundation/dateinterval/duration)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 17 symbols inside 102240046 
Determining Intersections
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
10 of 17 symbols inside 102240046 [func intersection(with: DateInterval) -> DateInterval?](https://developer.apple.com/documentation/foundation/dateinterval/intersection\(with:\))
96 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Foundation ](https://developer.apple.com/documentation/foundation)
  * [ DateInterval ](https://developer.apple.com/documentation/foundation/dateinterval)
  *     * DateInterval 


Structure
# DateInterval
The span of time between a specific start date and end date.
iOS 10.0+iPadOS 10.0+Mac Catalyst 10.0+macOS 10.12+tvOS 10.0+visionOS 1.0+watchOS 3.0+
```
struct DateInterval
```

## [Overview](https://developer.apple.com/documentation/foundation/dateinterval#overview)
DateInterval represents a closed date interval in the form of [startDate, endDate]. It is possible for the start and end dates to be the same with a duration of 0. DateInterval does not support reverse intervals i.e. intervals where the duration is less than 0 and the end date occurs earlier in time than the start date.
## [Topics](https://developer.apple.com/documentation/foundation/dateinterval#topics)
### [Creating a Date Interval](https://developer.apple.com/documentation/foundation/dateinterval#Creating-a-Date-Interval)
[`init()`](https://developer.apple.com/documentation/foundation/dateinterval/init\(\))
Initializes an interval with start and end dates set to the current date and the duration set to `0`.
[`init(start: Date, duration: TimeInterval)`](https://developer.apple.com/documentation/foundation/dateinterval/init\(start:duration:\))
Initializes an interval with the specified start date and duration.
[`init(start: Date, end: Date)`](https://developer.apple.com/documentation/foundation/dateinterval/init\(start:end:\))
Initializes an interval with the specified start and end date.
### [Accessing Start Date, End Date, and Duration](https://developer.apple.com/documentation/foundation/dateinterval#Accessing-Start-Date-End-Date-and-Duration)
[`var start: Date`](https://developer.apple.com/documentation/foundation/dateinterval/start)
The start date.
[`var end: Date`](https://developer.apple.com/documentation/foundation/dateinterval/end)
The end date.
[`var duration: TimeInterval`](https://developer.apple.com/documentation/foundation/dateinterval/duration)
The duration.
### [Determining Intersections](https://developer.apple.com/documentation/foundation/dateinterval#Determining-Intersections)
[`func intersection(with: DateInterval) -> DateInterval?`](https://developer.apple.com/documentation/foundation/dateinterval/intersection\(with:\))
Returns an interval that represents the interval where the given date interval and the current instance intersect.
[`func intersects(DateInterval) -> Bool`](https://developer.apple.com/documentation/foundation/dateinterval/intersects\(_:\))
Indicates whether this interval intersects the specified interval.
### [Determining Whether a Date Occurs Within a Date Interval](https://developer.apple.com/documentation/foundation/dateinterval#Determining-Whether-a-Date-Occurs-Within-a-Date-Interval)
[`func contains(Date) -> Bool`](https://developer.apple.com/documentation/foundation/dateinterval/contains\(_:\))
Indicates whether this interval contains the given date.
### [Using Reference Types](https://developer.apple.com/documentation/foundation/dateinterval#Using-Reference-Types)
[`class NSDateInterval`](https://developer.apple.com/documentation/foundation/nsdateinterval)
An object representing the span of time between a specific start date and end date.
### [Instance Methods](https://developer.apple.com/documentation/foundation/dateinterval#Instance-Methods)
[`func compare(DateInterval) -> ComparisonResult`](https://developer.apple.com/documentation/foundation/dateinterval/compare\(_:\))
Compares two intervals.
## [Relationships](https://developer.apple.com/documentation/foundation/dateinterval#relationships)
### [Conforms To](https://developer.apple.com/documentation/foundation/dateinterval#conforms-to)
  * [`Comparable`](https://developer.apple.com/documentation/Swift/Comparable)
  * [`Copyable`](https://developer.apple.com/documentation/Swift/Copyable)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomReflectable`](https://developer.apple.com/documentation/Swift/CustomReflectable)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Decodable`](https://developer.apple.com/documentation/Swift/Decodable)
  * [`Encodable`](https://developer.apple.com/documentation/Swift/Encodable)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`ReferenceConvertible`](https://developer.apple.com/documentation/foundation/referenceconvertible)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)


## [See Also](https://developer.apple.com/documentation/foundation/dateinterval#see-also)
### [Date Representations](https://developer.apple.com/documentation/foundation/dateinterval#Date-Representations)
[`struct Date`](https://developer.apple.com/documentation/foundation/date)
A specific point in time, independent of any calendar or time zone.
[`typealias TimeInterval`](https://developer.apple.com/documentation/foundation/timeinterval)
A number of seconds.
Current page is DateInterval 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Ffoundation%2Fdateinterval).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
