Source: https://developer.apple.com/documentation/Foundation/Measurement

[ Skip Navigation ](https://developer.apple.com/documentation/Foundation/Measurement#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/Foundation/Measurement#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/Foundation/Measurement)
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
[ Open Menu ](https://developer.apple.com/documentation/Foundation/Measurement)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/Foundation/Measurement)
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
1 of 40 symbols inside 457802412 
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
2 of 40 symbols inside 457802412 containing 35 symbols[Measurement](https://developer.apple.com/documentation/foundation/measurement)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 35 symbols inside -155993074 
Creating a Measurement
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 35 symbols inside -155993074 [init(value: Double, unit: UnitType)](https://developer.apple.com/documentation/foundation/measurement/init\(value:unit:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 35 symbols inside -155993074 
Accessing the Value and Units
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
4 of 35 symbols inside -155993074 [let unit: UnitType](https://developer.apple.com/documentation/foundation/measurement/unit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
5 of 35 symbols inside -155993074 [var value: Double](https://developer.apple.com/documentation/foundation/measurement/value)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 35 symbols inside -155993074 
Converting to Other Units
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
7 of 35 symbols inside -155993074 [func convert(to: UnitType)](https://developer.apple.com/documentation/foundation/measurement/convert\(to:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
8 of 35 symbols inside -155993074 [func converted(to: UnitType) -> Measurement<UnitType>](https://developer.apple.com/documentation/foundation/measurement/converted\(to:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 35 symbols inside -155993074 
Operating on a Measurement
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 35 symbols inside -155993074 [static func * (Double, Measurement<UnitType>) -> Measurement<UnitType>](https://developer.apple.com/documentation/foundation/measurement/*\(_:_:\)-1d26c)
139 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Foundation ](https://developer.apple.com/documentation/foundation)
  * [ Measurement ](https://developer.apple.com/documentation/Foundation/Measurement)
  *     * Measurement 


Structure
# Measurement
A numeric quantity labeled with a unit of measure, with support for unit conversion and unit-aware calculations.
iOS 10.0+iPadOS 10.0+Mac Catalyst 10.0+macOS 10.12+tvOS 10.0+visionOS 1.0+watchOS 3.0+
```
struct Measurement<UnitType> where UnitType : [Unit](https://developer.apple.com/documentation/foundation/unit)
```

## [Overview](https://developer.apple.com/documentation/Foundation/Measurement#overview)
A [`Measurement`](https://developer.apple.com/documentation/foundation/measurement) object represents a quantity and unit of measure. The [`Measurement`](https://developer.apple.com/documentation/foundation/measurement) type provides a programmatic interface to converting measurements into different units, as well as calculating the sum or difference between two measurements.
[`Measurement`](https://developer.apple.com/documentation/foundation/measurement) objects are initialized with a [`Unit`](https://developer.apple.com/documentation/foundation/unit) object and double value. [`Measurement`](https://developer.apple.com/documentation/foundation/measurement) objects are immutable, and cannot be changed after being created.
Measurements support a large set of operators, including `+`, `-`, `*`, `/`, and a full set of comparison operators.
## [Topics](https://developer.apple.com/documentation/Foundation/Measurement#topics)
### [Creating a Measurement](https://developer.apple.com/documentation/Foundation/Measurement#Creating-a-Measurement)
[`init(value: Double, unit: UnitType)`](https://developer.apple.com/documentation/foundation/measurement/init\(value:unit:\))
Create a `Measurement` given a specified value and unit.
### [Accessing the Value and Units](https://developer.apple.com/documentation/Foundation/Measurement#Accessing-the-Value-and-Units)
[`let unit: UnitType`](https://developer.apple.com/documentation/foundation/measurement/unit)
The unit component of the measurement.
[`var value: Double`](https://developer.apple.com/documentation/foundation/measurement/value)
The value component of the measurement.
### [Converting to Other Units](https://developer.apple.com/documentation/Foundation/Measurement#Converting-to-Other-Units)
[`func convert(to: UnitType)`](https://developer.apple.com/documentation/foundation/measurement/convert\(to:\))
Converts the measurement to the specified unit.
[`func converted(to: UnitType) -> Measurement<UnitType>`](https://developer.apple.com/documentation/foundation/measurement/converted\(to:\))
Returns a new measurement created by converting to the specified unit.
### [Operating on a Measurement](https://developer.apple.com/documentation/Foundation/Measurement#Operating-on-a-Measurement)
[`static func * (Double, Measurement<UnitType>) -> Measurement<UnitType>`](https://developer.apple.com/documentation/foundation/measurement/*\(_:_:\)-1d26c)
Multiply a scalar value by a measurement.
[`static func * (Measurement<UnitType>, Double) -> Measurement<UnitType>`](https://developer.apple.com/documentation/foundation/measurement/*\(_:_:\)-5tv8a)
Multiply a measurement by a scalar value.
[`static func + (Measurement<UnitType>, Measurement<UnitType>) -> Measurement<UnitType>`](https://developer.apple.com/documentation/foundation/measurement/+\(_:_:\)-9lejn)
Add two measurements.
[`static func + (Measurement<UnitType>, Measurement<UnitType>) -> Measurement<UnitType>`](https://developer.apple.com/documentation/foundation/measurement/+\(_:_:\)-4fsbl)
Adds two measurements of the same dimension.
[`static func - (Measurement<UnitType>, Measurement<UnitType>) -> Measurement<UnitType>`](https://developer.apple.com/documentation/foundation/measurement/-\(_:_:\)-2nnoy)
Subtract two measurements of the same Unit.
[`static func - (Measurement<UnitType>, Measurement<UnitType>) -> Measurement<UnitType>`](https://developer.apple.com/documentation/foundation/measurement/-\(_:_:\)-1a47h)
Subtract two measurements of the same Dimension.
[`static func / (Double, Measurement<UnitType>) -> Measurement<UnitType>`](https://developer.apple.com/documentation/foundation/measurement/_\(_:_:\)-98s40)
Divide a scalar value by a measurement.
[`static func / (Measurement<UnitType>, Double) -> Measurement<UnitType>`](https://developer.apple.com/documentation/foundation/measurement/_\(_:_:\)-71kwk)
Divide a measurement by a scalar value.
### [Formatting a Measurement](https://developer.apple.com/documentation/Foundation/Measurement#Formatting-a-Measurement)
[`func formatted() -> String`](https://developer.apple.com/documentation/foundation/measurement/formatted\(\))
Generates a locale-aware string representation of a measurement using the default measurement format style.
[`func formatted<S>(S) -> S.FormatOutput`](https://developer.apple.com/documentation/foundation/measurement/formatted\(_:\))
Generates a locale-aware string representation of a measurement using the provided measurement format style.
[`struct FormatStyle`](https://developer.apple.com/documentation/foundation/measurement/formatstyle)
A type that provides localized representations of measurements.
[`struct AttributedStyle`](https://developer.apple.com/documentation/foundation/measurement/attributedstyle)
A type that provides localized representations of measurements with an attributed string.
### [Comparing Measurements](https://developer.apple.com/documentation/Foundation/Measurement#Comparing-Measurements)
[`static func < <LeftHandSideType, RightHandSideType>(Measurement<LeftHandSideType>, Measurement<RightHandSideType>) -> Bool`](https://developer.apple.com/documentation/foundation/measurement/_\(_:_:\)-7pou4)
Compare two measurements of the same `Unit`.
### [Using Reference Types](https://developer.apple.com/documentation/Foundation/Measurement#Using-Reference-Types)
[`class NSMeasurement`](https://developer.apple.com/documentation/foundation/nsmeasurement)
A numeric quantity labeled with a unit of measure, with support for unit conversion and unit-aware calculations.
### [Type Aliases](https://developer.apple.com/documentation/Foundation/Measurement#Type-Aliases)
[`typealias Specification`](https://developer.apple.com/documentation/foundation/measurement/specification)
[`typealias UnwrappedType`](https://developer.apple.com/documentation/foundation/measurement/unwrappedtype)
[`typealias ValueType`](https://developer.apple.com/documentation/foundation/measurement/valuetype)
### [Type Properties](https://developer.apple.com/documentation/Foundation/Measurement#Type-Properties)
[`static var defaultResolverSpecification: some ResolverSpecification`](https://developer.apple.com/documentation/foundation/measurement/defaultresolverspecification)
### [Default Implementations](https://developer.apple.com/documentation/Foundation/Measurement#Default-Implementations)
[API Reference Comparable Implementations](https://developer.apple.com/documentation/foundation/measurement/comparable-implementations)
[API Reference Equatable Implementations](https://developer.apple.com/documentation/foundation/measurement/equatable-implementations)
## [Relationships](https://developer.apple.com/documentation/Foundation/Measurement#relationships)
### [Conforms To](https://developer.apple.com/documentation/Foundation/Measurement#conforms-to)
  * [`Comparable`](https://developer.apple.com/documentation/Swift/Comparable)
  * [`Copyable`](https://developer.apple.com/documentation/Swift/Copyable)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomReflectable`](https://developer.apple.com/documentation/Swift/CustomReflectable)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Decodable`](https://developer.apple.com/documentation/Swift/Decodable)
  * [`ElectricityInsightMeasure`](https://developer.apple.com/documentation/EnergyKit/ElectricityInsightMeasure)
  * [`Encodable`](https://developer.apple.com/documentation/Swift/Encodable)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`ReferenceConvertible`](https://developer.apple.com/documentation/foundation/referenceconvertible)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)


## [See Also](https://developer.apple.com/documentation/Foundation/Measurement#see-also)
### [Essentials](https://developer.apple.com/documentation/Foundation/Measurement#Essentials)
[`class NSMeasurement`](https://developer.apple.com/documentation/foundation/nsmeasurement)
A numeric quantity labeled with a unit of measure, with support for unit conversion and unit-aware calculations.
[`class Unit`](https://developer.apple.com/documentation/foundation/unit)
An abstract class representing a unit of measure.
[`class Dimension`](https://developer.apple.com/documentation/foundation/dimension)
An abstract class representing a dimensional unit of measure.
Current page is Measurement 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FFoundation%2FMeasurement).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
