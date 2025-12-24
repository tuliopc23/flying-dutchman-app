Source: https://developer.apple.com/documentation/Swift/Range

[ Skip Navigation ](https://developer.apple.com/documentation/Swift/Range#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/Swift/Range#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/Swift/Range)
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
[ Open Menu ](https://developer.apple.com/documentation/Swift/Range)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/Swift/Range)
## [ Swift  ](https://developer.apple.com/documentation/swift)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
11 of 65 symbols inside 1427662234 
Checking for Containment
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 22 symbols inside -419660912 
Logical Values
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
2 of 22 symbols inside -419660912 containing 52 symbols[Bool](https://developer.apple.com/documentation/swift/bool)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 22 symbols inside -419660912 
Numeric Values
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
4 of 22 symbols inside -419660912 containing 128 symbols[Int](https://developer.apple.com/documentation/swift/int)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
5 of 22 symbols inside -419660912 containing 163 symbols[Double](https://developer.apple.com/documentation/swift/double)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
6 of 22 symbols inside -419660912 containing 154 symbols[Float](https://developer.apple.com/documentation/swift/float)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 22 symbols inside -419660912 
Ranges
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
8 of 22 symbols inside -419660912 containing 65 symbols[Range](https://developer.apple.com/documentation/swift/range)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 65 symbols inside 1427662234 
Creating a Range
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 65 symbols inside 1427662234 [static func ..< (Self, Self) -> Range<Self>](https://developer.apple.com/documentation/swift/comparable/'.._\(_:_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 65 symbols inside 1427662234 
Converting Ranges
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 65 symbols inside 1427662234 [func relative<C>(to: C) -> Range<Bound>](https://developer.apple.com/documentation/swift/range/relative\(to:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
5 of 65 symbols inside 1427662234 [init?(NSRange, in: String)](https://developer.apple.com/documentation/swift/range/init\(_:in:\)-5cclx)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
6 of 65 symbols inside 1427662234 [init?<S>(NSRange, in: S)](https://developer.apple.com/documentation/swift/range/init\(_:in:\)-5qfor)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 65 symbols inside 1427662234 
Inspecting a Range
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
8 of 65 symbols inside 1427662234 [var isEmpty: Bool](https://developer.apple.com/documentation/swift/range/isempty)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
9 of 65 symbols inside 1427662234 [let lowerBound: Bound](https://developer.apple.com/documentation/swift/range/lowerbound)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
10 of 65 symbols inside 1427662234 [let upperBound: Bound](https://developer.apple.com/documentation/swift/range/upperbound)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
11 of 65 symbols inside 1427662234 
Checking for Containment
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 65 symbols inside 1427662234 [static func ~= (Self, Self.Bound) -> Bool](https://developer.apple.com/documentation/swift/range/~=\(_:_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
13 of 65 symbols inside 1427662234 
Clamping a Range
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
14 of 65 symbols inside 1427662234 [func clamped(to: Range<Bound>) -> Range<Bound>](https://developer.apple.com/documentation/swift/range/clamped\(to:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
15 of 65 symbols inside 1427662234 
Working with Foundation Ranges
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
16 of 65 symbols inside 1427662234 [init?(NSRange)](https://developer.apple.com/documentation/swift/range/init\(_:\)-15u6b)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
17 of 65 symbols inside 1427662234 [init?(NSRange)](https://developer.apple.com/documentation/swift/range/init\(_:\)-1q7lu)
144 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Swift ](https://developer.apple.com/documentation/swift)
  * [ Range ](https://developer.apple.com/documentation/Swift/Range)
  *     * Range 


Structure
# Range
A half-open interval from a lower bound up to, but not including, an upper bound.
iOS 8.0+iPadOS 8.0+Mac Catalyst 13.0+macOS 10.10+tvOS 9.0+visionOS 1.0+watchOS 2.0+
```
@frozen
struct Range<Bound> where Bound : [Comparable](https://developer.apple.com/documentation/swift/comparable)
```

## [Overview](https://developer.apple.com/documentation/Swift/Range#overview)
You create a `Range` instance by using the half-open range operator (`..<`).
```
let underFive = 0.0..<5.0

```

You can use a `Range` instance to quickly check if a value is contained in a particular range of values. For example:
```
underFive.contains(3.14)
// true
underFive.contains(6.28)
// false
underFive.contains(5.0)
// false

```

`Range` instances can represent an empty interval, unlike `ClosedRange`.
```
let empty = 0.0..<0.0
empty.contains(0.0)
// false
empty.isEmpty
// true

```

## [Using a Range as a Collection of Consecutive Values](https://developer.apple.com/documentation/Swift/Range#Using-a-Range-as-a-Collection-of-Consecutive-Values)
When a range uses integers as its lower and upper bounds, or any other type that conforms to the `Strideable` protocol with an integer stride, you can use that range in a `for`-`in` loop or with any sequence or collection method. The elements of the range are the consecutive values from its lower bound up to, but not including, its upper bound.
```
for n in 3..<5 {
    print(n)
}
// Prints "3"
// Prints "4"

```

Because floating-point types such as `Float` and `Double` are their own `Stride` types, they cannot be used as the bounds of a countable range. If you need to iterate over consecutive floating-point values, see the `stride(from:to:by:)` function.
## [Topics](https://developer.apple.com/documentation/Swift/Range#topics)
### [Creating a Range](https://developer.apple.com/documentation/Swift/Range#Creating-a-Range)
Create a new range using the half-open range operator (`..<`).
[`static func ..< (Self, Self) -> Range<Self>`](https://developer.apple.com/documentation/swift/comparable/'.._\(_:_:\))
Returns a half-open range that contains its lower bound but not its upper bound.
### [Converting Ranges](https://developer.apple.com/documentation/Swift/Range#Converting-Ranges)
[`func relative<C>(to: C) -> Range<Bound>`](https://developer.apple.com/documentation/swift/range/relative\(to:\))
Returns the range of indices described by this range expression within the given collection.
[`init?(NSRange, in: String)`](https://developer.apple.com/documentation/swift/range/init\(_:in:\)-5cclx)
[`init?<S>(NSRange, in: S)`](https://developer.apple.com/documentation/swift/range/init\(_:in:\)-5qfor)
### [Inspecting a Range](https://developer.apple.com/documentation/Swift/Range#Inspecting-a-Range)
[`var isEmpty: Bool`](https://developer.apple.com/documentation/swift/range/isempty)
A Boolean value indicating whether the range contains no elements.
[`let lowerBound: Bound`](https://developer.apple.com/documentation/swift/range/lowerbound)
The range’s lower bound.
[`let upperBound: Bound`](https://developer.apple.com/documentation/swift/range/upperbound)
The range’s upper bound.
### [Checking for Containment](https://developer.apple.com/documentation/Swift/Range#Checking-for-Containment)
[`static func ~= (Self, Self.Bound) -> Bool`](https://developer.apple.com/documentation/swift/range/~=\(_:_:\))
Returns a Boolean value indicating whether a value is included in a range.
### [Clamping a Range](https://developer.apple.com/documentation/Swift/Range#Clamping-a-Range)
[`func clamped(to: Range<Bound>) -> Range<Bound>`](https://developer.apple.com/documentation/swift/range/clamped\(to:\))
Returns a copy of this range clamped to the given limiting range.
### [Working with Foundation Ranges](https://developer.apple.com/documentation/Swift/Range#Working-with-Foundation-Ranges)
[`init?(NSRange)`](https://developer.apple.com/documentation/swift/range/init\(_:\)-15u6b)
[`init?(NSRange)`](https://developer.apple.com/documentation/swift/range/init\(_:\)-1q7lu)
### [Comparing Ranges](https://developer.apple.com/documentation/Swift/Range#Comparing-Ranges)
[`static func == (Range<Bound>, Range<Bound>) -> Bool`](https://developer.apple.com/documentation/swift/range/==\(_:_:\))
Returns a Boolean value indicating whether two ranges are equal.
[`static func != (Self, Self) -> Bool`](https://developer.apple.com/documentation/swift/range/!=\(_:_:\))
Returns a Boolean value indicating whether two values are not equal.
[`func overlaps(Range<Bound>) -> Bool`](https://developer.apple.com/documentation/swift/range/overlaps\(_:\)-7osha)
Returns a Boolean value indicating whether this range and the given range contain an element in common.
[`func overlaps(ClosedRange<Bound>) -> Bool`](https://developer.apple.com/documentation/swift/range/overlaps\(_:\)-9fkb2)
Returns a Boolean value indicating whether this range and the given closed range contain an element in common.
### [Manipulating Indices](https://developer.apple.com/documentation/Swift/Range#Manipulating-Indices)
[`func hash(into: inout Hasher)`](https://developer.apple.com/documentation/swift/range/hash\(into:\))
Hashes the essential components of this value by feeding them into the given hasher.
### [Describing a Range](https://developer.apple.com/documentation/Swift/Range#Describing-a-Range)
[`var description: String`](https://developer.apple.com/documentation/swift/range/description)
A textual representation of the range.
[`var debugDescription: String`](https://developer.apple.com/documentation/swift/range/debugdescription)
A textual representation of the range, suitable for debugging.
[`var customMirror: Mirror`](https://developer.apple.com/documentation/swift/range/custommirror)
The custom mirror for this instance.
### [Encoding and Decoding a Range](https://developer.apple.com/documentation/Swift/Range#Encoding-and-Decoding-a-Range)
[`func encode(to: any Encoder) throws`](https://developer.apple.com/documentation/swift/range/encode\(to:\))
Encodes this value into the given encoder.
[`init(from: any Decoder) throws`](https://developer.apple.com/documentation/swift/range/init\(from:\))
Creates a new instance by decoding from the given decoder.
### [Infrequently Used Functionality](https://developer.apple.com/documentation/Swift/Range#Infrequently-Used-Functionality)
[`init(uncheckedBounds: (lower: Bound, upper: Bound))`](https://developer.apple.com/documentation/swift/range/init\(uncheckedbounds:\))
Creates an instance with the given bounds.
[`var hashValue: Int`](https://developer.apple.com/documentation/swift/range/hashvalue)
The hash value.
### [Initializers](https://developer.apple.com/documentation/Swift/Range#Initializers)
[`init(Range<Bound>)`](https://developer.apple.com/documentation/swift/range/init\(_:\)-35b1j)
Now that Range is conditionally a collection when Bound: Strideable, CountableRange is no longer needed. This is a deprecated initializer for any remaining uses of Range(countableRange).
[`init(ClosedRange<Bound>)`](https://developer.apple.com/documentation/swift/range/init\(_:\)-79g1a)
Creates an instance equivalent to the given `ClosedRange`.
[`init?<S>(NSRange, in: S)`](https://developer.apple.com/documentation/swift/range/init\(_:in:\)-24465)
[`init?<R, S>(R, in: S)`](https://developer.apple.com/documentation/swift/range/init\(_:in:\)-612lr)
[`init?<R, S>(R, in: S)`](https://developer.apple.com/documentation/swift/range/init\(_:in:\)-75xo3)
[`init?<S>(AttributedString.MarkdownSourcePosition, in: S)`](https://developer.apple.com/documentation/swift/range/init\(_:in:\)-9vre5)
### [Instance Methods](https://developer.apple.com/documentation/Swift/Range#Instance-Methods)
[`func contains(Range<Bound>) -> Bool`](https://developer.apple.com/documentation/swift/range/contains\(_:\)-4xxju)
Returns a Boolean value indicating whether the given range is contained within this range.
[`func contains(ClosedRange<Bound>) -> Bool`](https://developer.apple.com/documentation/swift/range/contains\(_:\)-680jp)
Returns a Boolean value indicating whether the given closed range is contained within this range.
[`func contains(Bound) -> Bool`](https://developer.apple.com/documentation/swift/range/contains\(_:\)-76nb4)
Returns a Boolean value indicating whether the given element is contained within the range.
[`func formatted() -> String`](https://developer.apple.com/documentation/swift/range/formatted\(\))
Formats the date range as an interval.
[`func formatted<S>(S) -> S.FormatOutput`](https://developer.apple.com/documentation/swift/range/formatted\(_:\))
Formats the date range using the specified style.
[`func formatted(date: Date.IntervalFormatStyle.DateStyle, time: Date.IntervalFormatStyle.TimeStyle) -> String`](https://developer.apple.com/documentation/swift/range/formatted\(date:time:\))
Formats the date range using the specified date and time format styles.
[`func isValid(within: some AttributedStringProtocol) -> Bool`](https://developer.apple.com/documentation/swift/range/isvalid\(within:\)-2fba2)
Indicates whether the range is valid for use with the provided attributed string.
[`func isValid(within: DiscontiguousAttributedSubstring) -> Bool`](https://developer.apple.com/documentation/swift/range/isvalid\(within:\)-8h4h8)
Indicates whether the range is valid for use with the provided discontiguous attributed string.
### [Type Methods](https://developer.apple.com/documentation/Swift/Range#Type-Methods)
[`static func upToNextMajor(from: Version) -> Range<Bound>`](https://developer.apple.com/documentation/swift/range/uptonextmajor\(from:\))
Returns a requirement for a version range, starting at the given minimum version and going up to the next major version. This is the recommended version requirement.
[`static func upToNextMinor(from: Version) -> Range<Bound>`](https://developer.apple.com/documentation/swift/range/uptonextminor\(from:\))
Returns a requirement for a version range, starting at the given minimum version and going up to the next minor version.
### [Default Implementations](https://developer.apple.com/documentation/Swift/Range#Default-Implementations)
[API Reference BidirectionalCollection Implementations](https://developer.apple.com/documentation/swift/range/bidirectionalcollection-implementations)
[API Reference Collection Implementations](https://developer.apple.com/documentation/swift/range/collection-implementations)
[API Reference CustomDebugStringConvertible Implementations](https://developer.apple.com/documentation/swift/range/customdebugstringconvertible-implementations)
[API Reference CustomReflectable Implementations](https://developer.apple.com/documentation/swift/range/customreflectable-implementations)
[API Reference CustomStringConvertible Implementations](https://developer.apple.com/documentation/swift/range/customstringconvertible-implementations)
[API Reference Decodable Implementations](https://developer.apple.com/documentation/swift/range/decodable-implementations)
[API Reference Encodable Implementations](https://developer.apple.com/documentation/swift/range/encodable-implementations)
[API Reference Equatable Implementations](https://developer.apple.com/documentation/swift/range/equatable-implementations)
[API Reference Hashable Implementations](https://developer.apple.com/documentation/swift/range/hashable-implementations)
[API Reference RangeExpression Implementations](https://developer.apple.com/documentation/swift/range/rangeexpression-implementations)
[API Reference Sequence Implementations](https://developer.apple.com/documentation/swift/range/sequence-implementations)
## [Relationships](https://developer.apple.com/documentation/Swift/Range#relationships)
### [Conforms To](https://developer.apple.com/documentation/Swift/Range#conforms-to)
  * [`BNNSGraph.Builder.SliceIndex`](https://developer.apple.com/documentation/Accelerate/BNNSGraph/Builder/SliceIndex)
  * [`BidirectionalCollection`](https://developer.apple.com/documentation/swift/bidirectionalcollection)
Conforms when `Bound` conforms to `Strideable` and `Bound.Stride` conforms to `SignedInteger`.
  * [`Collection`](https://developer.apple.com/documentation/swift/collection)
Conforms when `Bound` conforms to `Strideable` and `Bound.Stride` conforms to `SignedInteger`.
  * [`Copyable`](https://developer.apple.com/documentation/swift/copyable)
Conforms when `Bound` conforms to `Strideable` and `Bound.Stride` conforms to `SignedInteger`.
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/swift/customdebugstringconvertible)
Conforms when `Bound` conforms to `Comparable`.
  * [`CustomReflectable`](https://developer.apple.com/documentation/swift/customreflectable)
Conforms when `Bound` conforms to `Comparable`.
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/swift/customstringconvertible)
Conforms when `Bound` conforms to `Comparable`.
  * [`CustomTestStringConvertible`](https://developer.apple.com/documentation/Testing/CustomTestStringConvertible)
  * [`Decodable`](https://developer.apple.com/documentation/swift/decodable)
Conforms when `Bound` conforms to `Comparable` and `Decodable`.
  * [`Encodable`](https://developer.apple.com/documentation/swift/encodable)
Conforms when `Bound` conforms to `Comparable` and `Encodable`.
  * [`Equatable`](https://developer.apple.com/documentation/swift/equatable)
Conforms when `Bound` conforms to `Comparable`.
  * [`Hashable`](https://developer.apple.com/documentation/swift/hashable)
Conforms when `Bound` conforms to `Comparable` and `Hashable`.
  * [`MLShapedArrayRangeExpression`](https://developer.apple.com/documentation/CoreML/MLShapedArrayRangeExpression)
  * [`MLTensorRangeExpression`](https://developer.apple.com/documentation/CoreML/MLTensorRangeExpression)
  * [`RandomAccessCollection`](https://developer.apple.com/documentation/swift/randomaccesscollection)
Conforms when `Bound` conforms to `Strideable` and `Bound.Stride` conforms to `SignedInteger`.
  * [`RangeExpression`](https://developer.apple.com/documentation/swift/rangeexpression)
Conforms when `Bound` conforms to `Comparable`.
  * [`Sendable`](https://developer.apple.com/documentation/swift/sendable)
Conforms when `Bound` conforms to `Comparable` and `Sendable`.
  * [`SendableMetatype`](https://developer.apple.com/documentation/swift/sendablemetatype)
Conforms when `Bound` conforms to `Comparable` and `Sendable`.
  * [`Sequence`](https://developer.apple.com/documentation/swift/sequence)
Conforms when `Bound` conforms to `Strideable` and `Bound.Stride` conforms to `SignedInteger`.


## [See Also](https://developer.apple.com/documentation/Swift/Range#see-also)
### [Ranges](https://developer.apple.com/documentation/Swift/Range#Ranges)
[`static func ..< (Self, Self) -> Range<Self>`](https://developer.apple.com/documentation/swift/comparable/'.._\(_:_:\))
Returns a half-open range that contains its lower bound but not its upper bound.
[`struct RangeSet`](https://developer.apple.com/documentation/swift/rangeset)
A set of values of any comparable type, represented by ranges.
[`static func ... (Self, Self) -> ClosedRange<Self>`](https://developer.apple.com/documentation/swift/comparable/'...\(_:_:\))
Returns a closed range that contains both of its bounds.
[`struct ClosedRange`](https://developer.apple.com/documentation/swift/closedrange)
An interval from a lower bound up to, and including, an upper bound.
Current page is Range 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FSwift%2FRange).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
