Source: https://developer.apple.com/documentation/foundation/data-formatting

[ Skip Navigation ](https://developer.apple.com/documentation/foundation/data-formatting#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/foundation/data-formatting#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/foundation/data-formatting)
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
[ Open Menu ](https://developer.apple.com/documentation/foundation/data-formatting)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/foundation/data-formatting)


[](https://developer.apple.com/documentation/foundation/data-formatting)
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
Collection
6 of 64 symbols inside <root> containing 40 symbols[Units and Measurement](https://developer.apple.com/documentation/foundation/units-and-measurement)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
7 of 64 symbols inside <root> containing 48 symbols[Data Formatting](https://developer.apple.com/documentation/foundation/data-formatting)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 48 symbols inside -1166029971 
Data formatting in Swift
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 48 symbols inside -1166029971 [Language Introspector](https://developer.apple.com/documentation/foundation/language-introspector)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
3 of 48 symbols inside -1166029971 containing 96 symbols[FormatStyle](https://developer.apple.com/documentation/foundation/formatstyle)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
4 of 48 symbols inside -1166029971 containing 32 symbols[IntegerFormatStyle](https://developer.apple.com/documentation/foundation/integerformatstyle)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
5 of 48 symbols inside -1166029971 containing 28 symbols[FloatingPointFormatStyle](https://developer.apple.com/documentation/foundation/floatingpointformatstyle)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
6 of 48 symbols inside -1166029971 containing 26 symbols[Decimal.FormatStyle](https://developer.apple.com/documentation/foundation/decimal/formatstyle)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
7 of 48 symbols inside -1166029971 containing 12 symbols[ListFormatStyle](https://developer.apple.com/documentation/foundation/listformatstyle)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
8 of 48 symbols inside -1166029971 [StringStyle](https://developer.apple.com/documentation/foundation/stringstyle)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
9 of 48 symbols inside -1166029971 containing 19 symbols[URL.FormatStyle](https://developer.apple.com/documentation/foundation/url/formatstyle)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
10 of 48 symbols inside -1166029971 containing 6 symbols[FormatStyleCapitalizationContext](https://developer.apple.com/documentation/foundation/formatstylecapitalizationcontext)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
11 of 48 symbols inside -1166029971 containing 5 symbols[Format Style Configurations](https://developer.apple.com/documentation/foundation/format-style-configurations)
112 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Collection
  * [ Foundation ](https://developer.apple.com/documentation/foundation)
  * [ Data Formatting ](https://developer.apple.com/documentation/foundation/data-formatting)
  *     * Data Formatting 


API Collection
# Data Formatting
Convert numbers, dates, measurements, and other values to and from locale-aware string representations.
## [Overview](https://developer.apple.com/documentation/foundation/data-formatting#overview)
Foundation supports two approaches for data formatting:
  * When working in Swift, use `formatted` methods directly on the types you want to format, optionally using [`FormatStyle`](https://developer.apple.com/documentation/foundation/formatstyle) and its subtypes to customize formatter output. This approach supports dates, integers, floating-point numbers, measurements, sequences, and person name components. Foundation caches identically-configured formatter instances internally, allowing you to focus on your app’s formatting needs.
  * In Objective-C, create instances of [`Formatter`](https://developer.apple.com/documentation/foundation/formatter) and its subtypes, and use the [`string(for:)`](https://developer.apple.com/documentation/foundation/formatter/string\(for:\)) method to convert objects to formatted strings.


## [Topics](https://developer.apple.com/documentation/foundation/data-formatting#topics)
### [Data formatting in Swift](https://developer.apple.com/documentation/foundation/data-formatting#Data-formatting-in-Swift)
[Language Introspector](https://developer.apple.com/documentation/foundation/language-introspector)
Converts data into human-readable text using formatters and locales.
[`protocol FormatStyle`](https://developer.apple.com/documentation/foundation/formatstyle)
A type that converts a given data type into a representation in another type, such as a string.
[`struct IntegerFormatStyle`](https://developer.apple.com/documentation/foundation/integerformatstyle)
A structure that converts between integer values and their textual representations.
[`struct FloatingPointFormatStyle`](https://developer.apple.com/documentation/foundation/floatingpointformatstyle)
A structure that converts between floating-point values and their textual representations.
[`struct FormatStyle`](https://developer.apple.com/documentation/foundation/decimal/formatstyle)
A structure that converts between decimal values and their textual representations.
[`struct ListFormatStyle`](https://developer.apple.com/documentation/foundation/listformatstyle)
A type that formats lists of items with a separator and conjunction appropriate for a given locale.
[`struct StringStyle`](https://developer.apple.com/documentation/foundation/stringstyle)
[`struct FormatStyle`](https://developer.apple.com/documentation/foundation/url/formatstyle)
A structure that converts between URL instances and their textual representations.
[`struct FormatStyleCapitalizationContext`](https://developer.apple.com/documentation/foundation/formatstylecapitalizationcontext)
The capitalization formatting context used when formatting dates and times.
[API Reference Format Style Configurations](https://developer.apple.com/documentation/foundation/format-style-configurations)
Behaviors for traits like numeric precision, rounding, and scale, used for formatting and parsing numeric values.
### [Data parsing in Swift](https://developer.apple.com/documentation/foundation/data-formatting#Data-parsing-in-Swift)
[`protocol ParseableFormatStyle`](https://developer.apple.com/documentation/foundation/parseableformatstyle)
A type that can convert a given input data type into a representation in an output type.
[`protocol ParseStrategy`](https://developer.apple.com/documentation/foundation/parsestrategy)
A type that parses an input representation, such as a formatted string, into a provided data type.
[`struct IntegerParseStrategy`](https://developer.apple.com/documentation/foundation/integerparsestrategy)
A parse strategy for creating integer values from formatted strings.
[`struct FloatingPointParseStrategy`](https://developer.apple.com/documentation/foundation/floatingpointparsestrategy)
A parse strategy for creating floating-point values from formatted strings.
[`struct ParseStrategy`](https://developer.apple.com/documentation/foundation/decimal/parsestrategy)
A parse strategy for creating decimal values from formatted strings.
### [Numbers and currency](https://developer.apple.com/documentation/foundation/data-formatting#Numbers-and-currency)
[`class NumberFormatter`](https://developer.apple.com/documentation/foundation/numberformatter)
A formatter that converts between numeric values and their textual representations.
### [Names](https://developer.apple.com/documentation/foundation/data-formatting#Names)
[`class PersonNameComponentsFormatter`](https://developer.apple.com/documentation/foundation/personnamecomponentsformatter)
A formatter that provides localized representations of the components of a person’s name.
[`struct PersonNameComponents`](https://developer.apple.com/documentation/foundation/personnamecomponents)
The separate parts of a person’s name, allowing locale-aware formatting.
### [Dates and times](https://developer.apple.com/documentation/foundation/data-formatting#Dates-and-times)
[`class DateFormatter`](https://developer.apple.com/documentation/foundation/dateformatter)
A formatter that converts between dates and their textual representations.
[`class DateComponentsFormatter`](https://developer.apple.com/documentation/foundation/datecomponentsformatter)
A formatter that creates string representations of quantities of time.
[`class RelativeDateTimeFormatter`](https://developer.apple.com/documentation/foundation/relativedatetimeformatter)
A formatter that creates locale-aware string representations of a relative date or time.
[`class DateIntervalFormatter`](https://developer.apple.com/documentation/foundation/dateintervalformatter)
A formatter that creates string representations of time intervals.
[`class ISO8601DateFormatter`](https://developer.apple.com/documentation/foundation/iso8601dateformatter)
A formatter that converts between dates and their ISO 8601 string representations.
### [Data sizes](https://developer.apple.com/documentation/foundation/data-formatting#Data-sizes)
[`class ByteCountFormatter`](https://developer.apple.com/documentation/foundation/bytecountformatter)
A formatter that converts a byte count value into a localized description that is formatted with the appropriate byte modifier (KB, MB, GB and so on).
### [Measurements](https://developer.apple.com/documentation/foundation/data-formatting#Measurements)
[`class MeasurementFormatter`](https://developer.apple.com/documentation/foundation/measurementformatter)
A formatter that provides localized representations of units and measurements.
### [Lists](https://developer.apple.com/documentation/foundation/data-formatting#Lists)
[`class ListFormatter`](https://developer.apple.com/documentation/foundation/listformatter)
An object that provides locale-correct formatting of a list of items using the appropriate separator and conjunction.
### [Internationalization](https://developer.apple.com/documentation/foundation/data-formatting#Internationalization)
[`struct Locale`](https://developer.apple.com/documentation/foundation/locale)
Information about linguistic, cultural, and technological conventions for use in formatting data for presentation.
### [Custom formatters](https://developer.apple.com/documentation/foundation/data-formatting#Custom-formatters)
[`class Formatter`](https://developer.apple.com/documentation/foundation/formatter)
An abstract class that declares an interface for objects that create, interpret, and validate the textual representation of values.
### [Automatic grammar agreement](https://developer.apple.com/documentation/foundation/data-formatting#Automatic-grammar-agreement)
[`enum InflectionRule`](https://developer.apple.com/documentation/foundation/inflectionrule)
A rule that affects how an attributed string performs automatic grammatical agreement.
[`struct Morphology`](https://developer.apple.com/documentation/foundation/morphology)
A description of the grammatical properties of a string.
[`struct TermOfAddress`](https://developer.apple.com/documentation/foundation/termofaddress)
The type for representing grammatical gender in localized text.
[`enum InflectionConcept`](https://developer.apple.com/documentation/foundation/inflectionconcept)
An inflection method to use when localizing text.
[`struct Pronoun`](https://developer.apple.com/documentation/foundation/morphology/pronoun)
A custom pronoun for referring to a third person.
### [Deprecated](https://developer.apple.com/documentation/foundation/data-formatting#Deprecated)
[`class LengthFormatter`](https://developer.apple.com/documentation/foundation/lengthformatter)
A formatter that provides localized descriptions of linear distances, such as length and height measurements.
[`class MassFormatter`](https://developer.apple.com/documentation/foundation/massformatter)
A formatter that provides localized descriptions of mass and weight values.
[`class EnergyFormatter`](https://developer.apple.com/documentation/foundation/energyformatter)
A formatter that provides localized descriptions of energy values.
## [See Also](https://developer.apple.com/documentation/foundation/data-formatting#see-also)
### [Fundamentals](https://developer.apple.com/documentation/foundation/data-formatting#Fundamentals)
[API Reference Numbers, Data, and Basic Values](https://developer.apple.com/documentation/foundation/numbers-data-and-basic-values)
Work with primitive values and other fundamental types used throughout Cocoa.
[API Reference Strings and Text](https://developer.apple.com/documentation/foundation/strings-and-text)
Create and process strings of Unicode characters, use regular expressions to find patterns, and perform natural language analysis of text.
[API Reference Collections](https://developer.apple.com/documentation/foundation/collections)
Use arrays, dictionaries, sets, and specialized collections to store and iterate groups of objects or values.
[API Reference Dates and Times](https://developer.apple.com/documentation/foundation/dates-and-times)
Compare dates and times, and perform calendar and time zone calculations.
[API Reference Units and Measurement](https://developer.apple.com/documentation/foundation/units-and-measurement)
Label numeric quantities with physical dimensions to allow locale-aware formatting and conversion between related units.
[API Reference Filters and Sorting](https://developer.apple.com/documentation/foundation/filters-and-sorting)
Use predicates, expressions, and sort descriptors to examine elements in collections and other services.
Current page is Data Formatting 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Ffoundation%2Fdata-formatting).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
