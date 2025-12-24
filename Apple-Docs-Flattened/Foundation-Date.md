Source: https://developer.apple.com/documentation/Foundation/Date

[ Skip Navigation ](https://developer.apple.com/documentation/Foundation/Date#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/Foundation/Date#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/Foundation/Date)
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
[ Open Menu ](https://developer.apple.com/documentation/Foundation/Date)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/Foundation/Date)
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
1 of 66 symbols inside -930719512 
Creating a Date
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 66 symbols inside -930719512 [init()](https://developer.apple.com/documentation/foundation/date/init\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 66 symbols inside -930719512 [init(timeIntervalSinceNow: TimeInterval)](https://developer.apple.com/documentation/foundation/date/init\(timeintervalsincenow:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 66 symbols inside -930719512 [init(timeInterval: TimeInterval, since: Date)](https://developer.apple.com/documentation/foundation/date/init\(timeinterval:since:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
5 of 66 symbols inside -930719512 [init(timeIntervalSinceReferenceDate: TimeInterval)](https://developer.apple.com/documentation/foundation/date/init\(timeintervalsincereferencedate:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
6 of 66 symbols inside -930719512 [init(timeIntervalSince1970: TimeInterval)](https://developer.apple.com/documentation/foundation/date/init\(timeintervalsince1970:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 66 symbols inside -930719512 
Retrieving the Current Date
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
8 of 66 symbols inside -930719512 [static var now: Date](https://developer.apple.com/documentation/foundation/date/now)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 66 symbols inside -930719512 
Getting Temporal Boundaries
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
10 of 66 symbols inside -930719512 [static let distantFuture: Date](https://developer.apple.com/documentation/foundation/date/distantfuture)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
11 of 66 symbols inside -930719512 [static let distantPast: Date](https://developer.apple.com/documentation/foundation/date/distantpast)
145 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Foundation ](https://developer.apple.com/documentation/foundation)
  * [ Date ](https://developer.apple.com/documentation/Foundation/Date)
  *     * Date 


Structure
# Date
A specific point in time, independent of any calendar or time zone.
iOS 8.0+iPadOS 8.0+Mac Catalyst 8.0+macOS 10.10+tvOS 9.0+visionOS 1.0+watchOS 2.0+
```
struct Date
```

## [ Mentioned in ](https://developer.apple.com/documentation/Foundation/Date#mentions)
[](https://developer.apple.com/documentation/foundation/encoding-and-decoding-custom-types)
## [Overview](https://developer.apple.com/documentation/Foundation/Date#overview)
A [`Date`](https://developer.apple.com/documentation/foundation/date) value encapsulate a single point in time, independent of any particular calendrical system or time zone. Date values represent a time interval relative to an absolute reference date.
The [`Date`](https://developer.apple.com/documentation/foundation/date) structure provides methods for comparing dates, calculating the time interval between two dates, and creating a new date from a time interval relative to another date. Use date values in conjunction with [`DateFormatter`](https://developer.apple.com/documentation/foundation/dateformatter) instances to create localized representations of dates and times and with [`Calendar`](https://developer.apple.com/documentation/foundation/calendar) instances to perform calendar arithmetic.
[`Date`](https://developer.apple.com/documentation/foundation/date) bridges to the [`NSDate`](https://developer.apple.com/documentation/foundation/nsdate) class. You can use these interchangeably in code that interacts with Objective-C APIs.
## [Topics](https://developer.apple.com/documentation/Foundation/Date#topics)
### [Creating a Date](https://developer.apple.com/documentation/Foundation/Date#Creating-a-Date)
[`init()`](https://developer.apple.com/documentation/foundation/date/init\(\))
Creates a date value initialized to the current date and time.
[`init(timeIntervalSinceNow: TimeInterval)`](https://developer.apple.com/documentation/foundation/date/init\(timeintervalsincenow:\))
Creates a date value initialized relative to the current date and time by a given number of seconds.
[`init(timeInterval: TimeInterval, since: Date)`](https://developer.apple.com/documentation/foundation/date/init\(timeinterval:since:\))
Creates a date value initialized relative to another given date by a given number of seconds.
[`init(timeIntervalSinceReferenceDate: TimeInterval)`](https://developer.apple.com/documentation/foundation/date/init\(timeintervalsincereferencedate:\))
Creates a date value initialized relative to 00:00:00 UTC on 1 January 2001 by a given number of seconds.
[`init(timeIntervalSince1970: TimeInterval)`](https://developer.apple.com/documentation/foundation/date/init\(timeintervalsince1970:\))
Creates a date value initialized relative to 00:00:00 UTC on 1 January 1970 by a given number of seconds.
### [Retrieving the Current Date](https://developer.apple.com/documentation/Foundation/Date#Retrieving-the-Current-Date)
[`static var now: Date`](https://developer.apple.com/documentation/foundation/date/now)
Returns a date instance that represents the current date and time, at the moment of access.
### [Getting Temporal Boundaries](https://developer.apple.com/documentation/Foundation/Date#Getting-Temporal-Boundaries)
[`static let distantFuture: Date`](https://developer.apple.com/documentation/foundation/date/distantfuture)
A date value representing a date in the distant future.
[`static let distantPast: Date`](https://developer.apple.com/documentation/foundation/date/distantpast)
A date value representing a date in the distant past.
### [Comparing Dates](https://developer.apple.com/documentation/Foundation/Date#Comparing-Dates)
[`static func == (Date, Date) -> Bool`](https://developer.apple.com/documentation/foundation/date/==\(_:_:\))
Returns true if the two `Date` values represent the same point in time.
[`static func > (Date, Date) -> Bool`](https://developer.apple.com/documentation/foundation/date/_\(_:_:\)-880ns)
Returns true if the left hand `Date` is later in time than the right hand `Date`.
[`static func < (Date, Date) -> Bool`](https://developer.apple.com/documentation/foundation/date/_\(_:_:\)-42kro)
Returns true if the left hand `Date` is earlier in time than the right hand `Date`.
[`func compare(Date) -> ComparisonResult`](https://developer.apple.com/documentation/foundation/date/compare\(_:\))
Compares another date to this one.
### [Getting Time Intervals](https://developer.apple.com/documentation/Foundation/Date#Getting-Time-Intervals)
[`func timeIntervalSince(Date) -> TimeInterval`](https://developer.apple.com/documentation/foundation/date/timeintervalsince\(_:\))
Returns the interval between this date and another given date.
[`var timeIntervalSinceNow: TimeInterval`](https://developer.apple.com/documentation/foundation/date/timeintervalsincenow)
The time interval between the date value and the current date and time.
[`var timeIntervalSinceReferenceDate: TimeInterval`](https://developer.apple.com/documentation/foundation/date/timeintervalsincereferencedate-swift.property)
The interval between the date value and 00:00:00 UTC on 1 January 2001.
[`var timeIntervalSince1970: TimeInterval`](https://developer.apple.com/documentation/foundation/date/timeintervalsince1970)
The interval between the date value and 00:00:00 UTC on 1 January 1970.
[`static var timeIntervalSinceReferenceDate: TimeInterval`](https://developer.apple.com/documentation/foundation/date/timeintervalsincereferencedate-swift.type.property)
The interval between 00:00:00 UTC on 1 January 2001 and the current date and time.
[`static let timeIntervalBetween1970AndReferenceDate: Double`](https://developer.apple.com/documentation/foundation/date/timeintervalbetween1970andreferencedate)
The number of seconds from 1 January 1970 to the reference date, 1 January 2001.
### [Adding or Subtracting a Time Interval](https://developer.apple.com/documentation/Foundation/Date#Adding-or-Subtracting-a-Time-Interval)
[`func addTimeInterval(TimeInterval)`](https://developer.apple.com/documentation/foundation/date/addtimeinterval\(_:\))
Adds a time interval to this date.
[`func addingTimeInterval(TimeInterval) -> Date`](https://developer.apple.com/documentation/foundation/date/addingtimeinterval\(_:\))
Creates a new date value by adding a time interval to this date.
[`static func + (Date, TimeInterval) -> Date`](https://developer.apple.com/documentation/foundation/date/+\(_:_:\))
Returns a date with a specified amount of time added to it.
[`static func += (inout Date, TimeInterval)`](https://developer.apple.com/documentation/foundation/date/+=\(_:_:\))
Adds a time interval to a date.
[`static func - (Date, TimeInterval) -> Date`](https://developer.apple.com/documentation/foundation/date/-\(_:_:\))
Returns a `Date` with a specified amount of time subtracted from it.
[`static func -= (inout Date, TimeInterval)`](https://developer.apple.com/documentation/foundation/date/-=\(_:_:\))
Subtract a `TimeInterval` from a `Date`.
### [Formatting a Date](https://developer.apple.com/documentation/Foundation/Date#Formatting-a-Date)
[`func formatted() -> String`](https://developer.apple.com/documentation/foundation/date/formatted\(\))
Generates a locale-aware string representation of a date using the default date format style.
[`func formatted(date: Date.FormatStyle.DateStyle, time: Date.FormatStyle.TimeStyle) -> String`](https://developer.apple.com/documentation/foundation/date/formatted\(date:time:\))
Generates a locale-aware string representation of a date using specified date and time format styles.
[`func formatted<F>(F) -> F.FormatOutput`](https://developer.apple.com/documentation/foundation/date/formatted\(_:\))
Generates a locale-aware string representation of a date using the specified date format style.
[`struct FormatStyle`](https://developer.apple.com/documentation/foundation/date/formatstyle)
A structure that creates a locale-appropriate string representation of a date instance and converts strings of dates and times into date instances.
[`struct RelativeFormatStyle`](https://developer.apple.com/documentation/foundation/date/relativeformatstyle)
A format style that forms locale-aware string representations of a relative date or time.
[`struct IntervalFormatStyle`](https://developer.apple.com/documentation/foundation/date/intervalformatstyle)
A format style that creates string representations of date intervals.
[`func ISO8601Format(Date.ISO8601FormatStyle) -> String`](https://developer.apple.com/documentation/foundation/date/iso8601format\(_:\))
Generates a locale-aware string representation of a date using the ISO 8601 date format.
[`struct ISO8601FormatStyle`](https://developer.apple.com/documentation/foundation/date/iso8601formatstyle)
A type that converts between dates and their ISO-8601 string representations.
### [Describing Dates](https://developer.apple.com/documentation/Foundation/Date#Describing-Dates)
[`var description: String`](https://developer.apple.com/documentation/foundation/date/description)
The representation is useful for debugging only. There are a number of options to acquire a formatted string for a date including: date formatters (see [NSDateFormatter](https://apple_ref/occ/cl/NSDateFormatter) and [Data Formatting Guide](https://apple_ref/doc/uid/10000029i)), and the `Date` function `description(locale:)`.
[`func description(with: Locale?) -> String`](https://developer.apple.com/documentation/foundation/date/description\(with:\))
Returns a string representation of the receiver using the given locale.
[`var customPlaygroundQuickLook: PlaygroundQuickLook`](https://developer.apple.com/documentation/foundation/date/customplaygroundquicklook)
A custom playground Quick Look for the date.
Deprecated
### [Working with notification messages](https://developer.apple.com/documentation/Foundation/Date#Working-with-notification-messages)
[`struct SystemClockDidChangeMessage`](https://developer.apple.com/documentation/foundation/date/systemclockdidchangemessage)
### [Using Reference Types](https://developer.apple.com/documentation/Foundation/Date#Using-Reference-Types)
[`class NSDate`](https://developer.apple.com/documentation/foundation/nsdate)
A representation of a specific point in time, independent of any calendar or time zone.
### [Structures](https://developer.apple.com/documentation/Foundation/Date#Structures)
[`struct AnchoredRelativeFormatStyle`](https://developer.apple.com/documentation/foundation/date/anchoredrelativeformatstyle)
A relative format style that is detached from the system time, and instead formats an anchor date relative to the format input.
[`struct AttributedStyle`](https://developer.apple.com/documentation/foundation/date/attributedstyle)
A structure that creates a locale-appropriate attributed string representation of a date instance.
Deprecated
[`struct ComponentsFormatStyle`](https://developer.apple.com/documentation/foundation/date/componentsformatstyle)
A style for formatting a date interval in terms of specific date components.
[`struct FormatString`](https://developer.apple.com/documentation/foundation/date/formatstring)
[`struct HTTPFormatStyle`](https://developer.apple.com/documentation/foundation/date/httpformatstyle)
Options for generating and parsing string representations of dates following the HTTP date format from [RFC 9110 § 5.6.7](https://www.rfc-editor.org/rfc/rfc9110.html#http.date).
[`struct ParseStrategy`](https://developer.apple.com/documentation/foundation/date/parsestrategy)
Options for parsing string representations of dates to create a `Date` instance.
[`struct VerbatimFormatStyle`](https://developer.apple.com/documentation/foundation/date/verbatimformatstyle)
A style that formats a date with an explicitly-specified style.
### [Initializers](https://developer.apple.com/documentation/Foundation/Date#Initializers)
[`init<T>(T.ParseInput, strategy: T) throws`](https://developer.apple.com/documentation/foundation/date/init\(_:strategy:\)-2oqi)
[`init<T, Value>(Value, strategy: T) throws`](https://developer.apple.com/documentation/foundation/date/init\(_:strategy:\)-6cq9s)
### [Type Aliases](https://developer.apple.com/documentation/Foundation/Date#Type-Aliases)
[`typealias Specification`](https://developer.apple.com/documentation/foundation/date/specification)
[`typealias UnwrappedType`](https://developer.apple.com/documentation/foundation/date/unwrappedtype)
[`typealias ValueType`](https://developer.apple.com/documentation/foundation/date/valuetype)
### [Type Properties](https://developer.apple.com/documentation/Foundation/Date#Type-Properties)
[`static var defaultResolverSpecification: some ResolverSpecification`](https://developer.apple.com/documentation/foundation/date/defaultresolverspecification)
### [Default Implementations](https://developer.apple.com/documentation/Foundation/Date#Default-Implementations)
[API Reference CustomStringConvertible Implementations](https://developer.apple.com/documentation/foundation/date/customstringconvertible-implementations)
## [Relationships](https://developer.apple.com/documentation/Foundation/Date#relationships)
### [Conforms To](https://developer.apple.com/documentation/Foundation/Date#conforms-to)
  * [`CKRecordValueProtocol`](https://developer.apple.com/documentation/CloudKit/CKRecordValueProtocol)
  * [`Comparable`](https://developer.apple.com/documentation/Swift/Comparable)
  * [`Copyable`](https://developer.apple.com/documentation/Swift/Copyable)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomReflectable`](https://developer.apple.com/documentation/Swift/CustomReflectable)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Decodable`](https://developer.apple.com/documentation/Swift/Decodable)
  * [`Encodable`](https://developer.apple.com/documentation/Swift/Encodable)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`Plottable`](https://developer.apple.com/documentation/Charts/Plottable)
  * [`PrimitivePlottableProtocol`](https://developer.apple.com/documentation/Charts/PrimitivePlottableProtocol)
  * [`ReferenceConvertible`](https://developer.apple.com/documentation/foundation/referenceconvertible)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)
  * [`Strideable`](https://developer.apple.com/documentation/Swift/Strideable)


## [See Also](https://developer.apple.com/documentation/Foundation/Date#see-also)
### [Date Representations](https://developer.apple.com/documentation/Foundation/Date#Date-Representations)
[`struct DateInterval`](https://developer.apple.com/documentation/foundation/dateinterval)
The span of time between a specific start date and end date.
[`typealias TimeInterval`](https://developer.apple.com/documentation/foundation/timeinterval)
A number of seconds.
Current page is Date 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FFoundation%2FDate).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
