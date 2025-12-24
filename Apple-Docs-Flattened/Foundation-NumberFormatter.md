Source: https://developer.apple.com/documentation/foundation/numberformatter

[ Skip Navigation ](https://developer.apple.com/documentation/foundation/numberformatter#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/foundation/numberformatter#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/foundation/numberformatter)
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
[ Open Menu ](https://developer.apple.com/documentation/foundation/numberformatter)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/foundation/numberformatter)


[](https://developer.apple.com/documentation/foundation/numberformatter)
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
1 of 25 symbols inside -1192674281 
Numbers
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
2 of 25 symbols inside -1192674281 [Int](https://developer.apple.com/documentation/swift/int)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
3 of 25 symbols inside -1192674281 [Double](https://developer.apple.com/documentation/swift/double)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
4 of 25 symbols inside -1192674281 containing 97 symbols[Decimal](https://developer.apple.com/documentation/foundation/decimal)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
5 of 25 symbols inside -1192674281 containing 95 symbols[NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 95 symbols inside -1969986013 
Configuring Formatter Behavior and Style
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
2 of 95 symbols inside -1969986013 [var formatterBehavior: NumberFormatter.Behavior](https://developer.apple.com/documentation/foundation/numberformatter/formatterbehavior)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 95 symbols inside -1969986013 [class func setDefaultFormatterBehavior(NumberFormatter.Behavior)](https://developer.apple.com/documentation/foundation/numberformatter/setdefaultformatterbehavior\(_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 95 symbols inside -1969986013 [class func defaultFormatterBehavior() -> NumberFormatter.Behavior](https://developer.apple.com/documentation/foundation/numberformatter/defaultformatterbehavior\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
5 of 95 symbols inside -1969986013 [var numberStyle: NumberFormatter.Style](https://developer.apple.com/documentation/foundation/numberformatter/numberstyle)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
6 of 95 symbols inside -1969986013 [var generatesDecimalNumbers: Bool](https://developer.apple.com/documentation/foundation/numberformatter/generatesdecimalnumbers)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 95 symbols inside -1969986013 
Converting Between Numbers and Strings
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
8 of 95 symbols inside -1969986013 [func getObjectValue(AutoreleasingUnsafeMutablePointer<AnyObject?>?, for: String, range: UnsafeMutablePointer<NSRange>?) throws](https://developer.apple.com/documentation/foundation/numberformatter/getobjectvalue\(_:for:range:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
9 of 95 symbols inside -1969986013 [func number(from: String) -> NSNumber?](https://developer.apple.com/documentation/foundation/numberformatter/number\(from:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
10 of 95 symbols inside -1969986013 [func string(from: NSNumber) -> String?](https://developer.apple.com/documentation/foundation/numberformatter/string\(from:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
11 of 95 symbols inside -1969986013 [class func localizedString(from: NSNumber, number: NumberFormatter.Style) -> String](https://developer.apple.com/documentation/foundation/numberformatter/localizedstring\(from:number:\))
184 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Foundation ](https://developer.apple.com/documentation/foundation)
  * [ NumberFormatter ](https://developer.apple.com/documentation/foundation/numberformatter)
  *     * NumberFormatter 


Class
# NumberFormatter
A formatter that converts between numeric values and their textual representations.
iOS 2.0+iPadOS 2.0+Mac Catalyst 13.0+macOS 10.0+tvOS 9.0+visionOS 1.0+watchOS 2.0+
```
class NumberFormatter
```

## [Overview](https://developer.apple.com/documentation/foundation/numberformatter#overview)
Instances of [`NumberFormatter`](https://developer.apple.com/documentation/foundation/numberformatter) format the textual representation of cells that contain [`NSNumber`](https://developer.apple.com/documentation/foundation/nsnumber) objects and convert textual representations of numeric values into [`NSNumber`](https://developer.apple.com/documentation/foundation/nsnumber) objects. The representation encompasses integers, floats, and doubles; floats and doubles can be formatted to a specified decimal position. [`NumberFormatter`](https://developer.apple.com/documentation/foundation/numberformatter) objects can also impose ranges on the numeric values cells can accept.
Tip
In Swift, you can use [`IntegerFormatStyle`](https://developer.apple.com/documentation/foundation/integerformatstyle), [`FloatingPointFormatStyle`](https://developer.apple.com/documentation/foundation/floatingpointformatstyle), or [`Decimal.FormatStyle`](https://developer.apple.com/documentation/foundation/decimal/formatstyle) rather than [`NumberFormatter`](https://developer.apple.com/documentation/foundation/numberformatter). The [`FormatStyle`](https://developer.apple.com/documentation/foundation/formatstyle) API offers a declarative idiom for customizing the formatting of various types. Also, Foundation caches identical [`FormatStyle`](https://developer.apple.com/documentation/foundation/formatstyle) instances, so you don’t need to pass them around your app, or risk wasting memory with duplicate formatters.
### [Significant Digits and Fraction Digits](https://developer.apple.com/documentation/foundation/numberformatter#Significant-Digits-and-Fraction-Digits)
The [`NumberFormatter`](https://developer.apple.com/documentation/foundation/numberformatter) class provides flexible options for displaying non-zero fractional parts of numbers.
If you set the [`usesSignificantDigits`](https://developer.apple.com/documentation/foundation/numberformatter/usessignificantdigits) property to [`true`](https://developer.apple.com/documentation/Swift/true), you can configure [`NumberFormatter`](https://developer.apple.com/documentation/foundation/numberformatter) to display significant digits using the [`minimumSignificantDigits`](https://developer.apple.com/documentation/foundation/numberformatter/minimumsignificantdigits) and [`maximumSignificantDigits`](https://developer.apple.com/documentation/foundation/numberformatter/maximumsignificantdigits) properties. If [`usesSignificantDigits`](https://developer.apple.com/documentation/foundation/numberformatter/usessignificantdigits) is [`false`](https://developer.apple.com/documentation/Swift/false), these properties are ignored. See Configuring Significant Digits.
Otherwise, you can configure the minimum and maximum number of integer and fraction digits, or the numbers before and after the decimal separator, respectively, using the [`minimumIntegerDigits`](https://developer.apple.com/documentation/foundation/numberformatter/minimumintegerdigits), [`maximumIntegerDigits`](https://developer.apple.com/documentation/foundation/numberformatter/maximumintegerdigits), [`minimumFractionDigits`](https://developer.apple.com/documentation/foundation/numberformatter/minimumfractiondigits), and [`maximumFractionDigits`](https://developer.apple.com/documentation/foundation/numberformatter/maximumfractiondigits) properties. See Configuring Integer and Fraction Digits.
### [Thread Safety](https://developer.apple.com/documentation/foundation/numberformatter#Thread-Safety)
On iOS 7 and later [`NumberFormatter`](https://developer.apple.com/documentation/foundation/numberformatter) is thread-safe.
In macOS 10.9 and later [`NumberFormatter`](https://developer.apple.com/documentation/foundation/numberformatter) is thread-safe so long as you are using the modern behavior in a 64-bit app.
On earlier versions of the operating system, or when using the legacy formatter behavior or running in 32-bit in macOS, [`NumberFormatter`](https://developer.apple.com/documentation/foundation/numberformatter) is not thread-safe, and you therefore must not mutate a number formatter simultaneously from multiple threads.
## [Topics](https://developer.apple.com/documentation/foundation/numberformatter#topics)
### [Configuring Formatter Behavior and Style](https://developer.apple.com/documentation/foundation/numberformatter#Configuring-Formatter-Behavior-and-Style)
[`var formatterBehavior: NumberFormatter.Behavior`](https://developer.apple.com/documentation/foundation/numberformatter/formatterbehavior)
The formatter behavior of the receiver.
[`class func setDefaultFormatterBehavior(NumberFormatter.Behavior)`](https://developer.apple.com/documentation/foundation/numberformatter/setdefaultformatterbehavior\(_:\))
Sets the default formatter behavior for new instances of `NSNumberFormatter` .
[`class func defaultFormatterBehavior() -> NumberFormatter.Behavior`](https://developer.apple.com/documentation/foundation/numberformatter/defaultformatterbehavior\(\))
Returns an `NSNumberFormatterBehavior` constant that indicates default formatter behavior for new instances of `NSNumberFormatter`.
[`var numberStyle: NumberFormatter.Style`](https://developer.apple.com/documentation/foundation/numberformatter/numberstyle)
The number style used by the receiver.
[`var generatesDecimalNumbers: Bool`](https://developer.apple.com/documentation/foundation/numberformatter/generatesdecimalnumbers)
Determines whether the receiver creates instances of [`NSDecimalNumber`](https://developer.apple.com/documentation/foundation/nsdecimalnumber) when it converts strings to number objects.
### [Converting Between Numbers and Strings](https://developer.apple.com/documentation/foundation/numberformatter#Converting-Between-Numbers-and-Strings)
[`func getObjectValue(AutoreleasingUnsafeMutablePointer<AnyObject?>?, for: String, range: UnsafeMutablePointer<NSRange>?) throws`](https://developer.apple.com/documentation/foundation/numberformatter/getobjectvalue\(_:for:range:\))
Returns by reference a cell-content object after creating it from a range of characters in a given string.
[`func number(from: String) -> NSNumber?`](https://developer.apple.com/documentation/foundation/numberformatter/number\(from:\))
Returns an [`NSNumber`](https://developer.apple.com/documentation/foundation/nsnumber) object created by parsing a given string.
[`func string(from: NSNumber) -> String?`](https://developer.apple.com/documentation/foundation/numberformatter/string\(from:\))
Returns a string containing the formatted value of the provided number object.
[`class func localizedString(from: NSNumber, number: NumberFormatter.Style) -> String`](https://developer.apple.com/documentation/foundation/numberformatter/localizedstring\(from:number:\))
Returns a localized number string with the specified style.
### [Managing Localization of Numbers](https://developer.apple.com/documentation/foundation/numberformatter#Managing-Localization-of-Numbers)
[`var localizesFormat: Bool`](https://developer.apple.com/documentation/foundation/numberformatter/localizesformat)
Determines whether the dollar sign character (`$`), decimal separator character (`.`), and thousand separator character (`,`) are converted to appropriately localized characters as specified by the user’s localization preference.
[`var locale: Locale!`](https://developer.apple.com/documentation/foundation/numberformatter/locale)
The locale of the receiver.
### [Configuring Rounding Behavior](https://developer.apple.com/documentation/foundation/numberformatter#Configuring-Rounding-Behavior)
[`var roundingBehavior: NSDecimalNumberHandler`](https://developer.apple.com/documentation/foundation/numberformatter/roundingbehavior)
The rounding behavior used by the receiver.
[`class NSDecimalNumberHandler`](https://developer.apple.com/documentation/foundation/nsdecimalnumberhandler)
A class that adopts the decimal number behaviors protocol.
[`var roundingIncrement: NSNumber!`](https://developer.apple.com/documentation/foundation/numberformatter/roundingincrement)
The rounding increment used by the receiver.
[`var roundingMode: NumberFormatter.RoundingMode`](https://developer.apple.com/documentation/foundation/numberformatter/roundingmode-swift.property)
The rounding mode used by the receiver.
### [Configuring Integer and Fraction Digits](https://developer.apple.com/documentation/foundation/numberformatter#Configuring-Integer-and-Fraction-Digits)
[`var minimumIntegerDigits: Int`](https://developer.apple.com/documentation/foundation/numberformatter/minimumintegerdigits)
The minimum number of digits before the decimal separator.
[`var maximumIntegerDigits: Int`](https://developer.apple.com/documentation/foundation/numberformatter/maximumintegerdigits)
The maximum number of digits before the decimal separator.
[`var minimumFractionDigits: Int`](https://developer.apple.com/documentation/foundation/numberformatter/minimumfractiondigits)
The minimum number of digits after the decimal separator.
[`var maximumFractionDigits: Int`](https://developer.apple.com/documentation/foundation/numberformatter/maximumfractiondigits)
The maximum number of digits after the decimal separator.
### [Configuring Significant Digits](https://developer.apple.com/documentation/foundation/numberformatter#Configuring-Significant-Digits)
[`var usesSignificantDigits: Bool`](https://developer.apple.com/documentation/foundation/numberformatter/usessignificantdigits)
A Boolean value indicating whether the formatter uses minimum and maximum significant digits when formatting numbers.
[`var minimumSignificantDigits: Int`](https://developer.apple.com/documentation/foundation/numberformatter/minimumsignificantdigits)
The minimum number of significant digits for the number formatter.
[`var maximumSignificantDigits: Int`](https://developer.apple.com/documentation/foundation/numberformatter/maximumsignificantdigits)
The maximum number of significant digits for the number formatter.
### [Configuring Numeric Formats](https://developer.apple.com/documentation/foundation/numberformatter#Configuring-Numeric-Formats)
[`var format: String`](https://developer.apple.com/documentation/foundation/numberformatter/format)
The receiver’s format.
[`var formattingContext: Formatter.Context`](https://developer.apple.com/documentation/foundation/numberformatter/formattingcontext)
The capitalization formatting context used when formatting a number.
[`var formatWidth: Int`](https://developer.apple.com/documentation/foundation/numberformatter/formatwidth)
The format width used by the receiver.
[`var negativeFormat: String!`](https://developer.apple.com/documentation/foundation/numberformatter/negativeformat)
The format the receiver uses to display negative values.
[`var positiveFormat: String!`](https://developer.apple.com/documentation/foundation/numberformatter/positiveformat)
The format the receiver uses to display positive values.
[`var multiplier: NSNumber?`](https://developer.apple.com/documentation/foundation/numberformatter/multiplier)
The multiplier of the receiver.
### [Configuring Numeric Symbols](https://developer.apple.com/documentation/foundation/numberformatter#Configuring-Numeric-Symbols)
[`var percentSymbol: String!`](https://developer.apple.com/documentation/foundation/numberformatter/percentsymbol)
The string used to represent a percent symbol.
[`var perMillSymbol: String!`](https://developer.apple.com/documentation/foundation/numberformatter/permillsymbol)
The string used to represent a per-mill (per-thousand) symbol.
[`var minusSign: String!`](https://developer.apple.com/documentation/foundation/numberformatter/minussign)
The string used to represent a minus sign.
[`var plusSign: String!`](https://developer.apple.com/documentation/foundation/numberformatter/plussign)
The string used to represent a plus sign.
[`var exponentSymbol: String!`](https://developer.apple.com/documentation/foundation/numberformatter/exponentsymbol)
The string used to represent an exponent symbol.
[`var zeroSymbol: String?`](https://developer.apple.com/documentation/foundation/numberformatter/zerosymbol)
The string used to represent a zero value.
[`var nilSymbol: String`](https://developer.apple.com/documentation/foundation/numberformatter/nilsymbol)
The string used to represent a `nil` value.
[`var notANumberSymbol: String!`](https://developer.apple.com/documentation/foundation/numberformatter/notanumbersymbol)
The string used to represent a NaN (“not a number”) value.
[`var negativeInfinitySymbol: String`](https://developer.apple.com/documentation/foundation/numberformatter/negativeinfinitysymbol)
The string used to represent a negative infinity symbol.
[`var positiveInfinitySymbol: String`](https://developer.apple.com/documentation/foundation/numberformatter/positiveinfinitysymbol)
The string used to represent a positive infinity symbol.
### [Configuring the Format of Currency](https://developer.apple.com/documentation/foundation/numberformatter#Configuring-the-Format-of-Currency)
[`var currencySymbol: String!`](https://developer.apple.com/documentation/foundation/numberformatter/currencysymbol)
The string used by the receiver as a local currency symbol.
[`var currencyCode: String!`](https://developer.apple.com/documentation/foundation/numberformatter/currencycode)
The receiver’s currency code.
[`var internationalCurrencySymbol: String!`](https://developer.apple.com/documentation/foundation/numberformatter/internationalcurrencysymbol)
The international currency symbol used by the receiver.
[`var currencyGroupingSeparator: String!`](https://developer.apple.com/documentation/foundation/numberformatter/currencygroupingseparator)
The currency grouping separator for the receiver.
### [Configuring Numeric Prefixes and Suffixes](https://developer.apple.com/documentation/foundation/numberformatter#Configuring-Numeric-Prefixes-and-Suffixes)
[`var positivePrefix: String!`](https://developer.apple.com/documentation/foundation/numberformatter/positiveprefix)
The string the receiver uses as the prefix for positive values.
[`var positiveSuffix: String!`](https://developer.apple.com/documentation/foundation/numberformatter/positivesuffix)
The string the receiver uses as the suffix for positive values.
[`var negativePrefix: String!`](https://developer.apple.com/documentation/foundation/numberformatter/negativeprefix)
The string the receiver uses as a prefix for negative values.
[`var negativeSuffix: String!`](https://developer.apple.com/documentation/foundation/numberformatter/negativesuffix)
The string the receiver uses as a suffix for negative values.
### [Configuring the Display of Numeric Values](https://developer.apple.com/documentation/foundation/numberformatter#Configuring-the-Display-of-Numeric-Values)
[`var textAttributesForNegativeValues: [String : Any]?`](https://developer.apple.com/documentation/foundation/numberformatter/textattributesfornegativevalues)
The text attributes to be used in displaying negative values.
[`var textAttributesForPositiveValues: [String : Any]?`](https://developer.apple.com/documentation/foundation/numberformatter/textattributesforpositivevalues)
The text attributes to be used in displaying positive values.
[`var attributedStringForZero: NSAttributedString`](https://developer.apple.com/documentation/foundation/numberformatter/attributedstringforzero)
The attributed string that the receiver uses to display zero values.
[`var textAttributesForZero: [String : Any]?`](https://developer.apple.com/documentation/foundation/numberformatter/textattributesforzero)
The text attributes used to display a zero value.
[`var attributedStringForNil: NSAttributedString`](https://developer.apple.com/documentation/foundation/numberformatter/attributedstringfornil)
The attributed string the receiver uses to display `nil` values.
[`var textAttributesForNil: [String : Any]?`](https://developer.apple.com/documentation/foundation/numberformatter/textattributesfornil)
The text attributes used to display the `nil` symbol.
[`var attributedStringForNotANumber: NSAttributedString`](https://developer.apple.com/documentation/foundation/numberformatter/attributedstringfornotanumber)
The attributed string the receiver uses to display “not a number” values.
[`var textAttributesForNotANumber: [String : Any]?`](https://developer.apple.com/documentation/foundation/numberformatter/textattributesfornotanumber)
The text attributes used to display the NaN (“not a number”) string.
[`var textAttributesForPositiveInfinity: [String : Any]?`](https://developer.apple.com/documentation/foundation/numberformatter/textattributesforpositiveinfinity)
The text attributes used to display the positive infinity symbol.
[`var textAttributesForNegativeInfinity: [String : Any]?`](https://developer.apple.com/documentation/foundation/numberformatter/textattributesfornegativeinfinity)
The text attributes used to display the negative infinity symbol.
### [Configuring Separators and Grouping Size](https://developer.apple.com/documentation/foundation/numberformatter#Configuring-Separators-and-Grouping-Size)
[`var groupingSeparator: String!`](https://developer.apple.com/documentation/foundation/numberformatter/groupingseparator)
The string used by the receiver for a grouping separator.
[`var usesGroupingSeparator: Bool`](https://developer.apple.com/documentation/foundation/numberformatter/usesgroupingseparator)
Determines whether the receiver displays the group separator.
[`var thousandSeparator: String!`](https://developer.apple.com/documentation/foundation/numberformatter/thousandseparator)
The character the receiver uses as a thousand separator.
[`var hasThousandSeparators: Bool`](https://developer.apple.com/documentation/foundation/numberformatter/hasthousandseparators)
Determines whether the receiver uses thousand separators.
[`var decimalSeparator: String!`](https://developer.apple.com/documentation/foundation/numberformatter/decimalseparator)
The character the receiver uses as a decimal separator.
[`var alwaysShowsDecimalSeparator: Bool`](https://developer.apple.com/documentation/foundation/numberformatter/alwaysshowsdecimalseparator)
Determines whether the receiver always shows the decimal separator, even for integer numbers.
[`var currencyDecimalSeparator: String!`](https://developer.apple.com/documentation/foundation/numberformatter/currencydecimalseparator)
The string used by the receiver as a currency decimal separator.
[`var groupingSize: Int`](https://developer.apple.com/documentation/foundation/numberformatter/groupingsize)
The grouping size of the receiver.
[`var secondaryGroupingSize: Int`](https://developer.apple.com/documentation/foundation/numberformatter/secondarygroupingsize)
The secondary grouping size of the receiver.
### [Managing the Padding of Numbers](https://developer.apple.com/documentation/foundation/numberformatter#Managing-the-Padding-of-Numbers)
[`var paddingCharacter: String!`](https://developer.apple.com/documentation/foundation/numberformatter/paddingcharacter)
The string that the receiver uses to pad numbers in the formatted string representation.
[`var paddingPosition: NumberFormatter.PadPosition`](https://developer.apple.com/documentation/foundation/numberformatter/paddingposition)
The padding position used by the receiver.
### [Managing Input and Output Attributes](https://developer.apple.com/documentation/foundation/numberformatter#Managing-Input-and-Output-Attributes)
[`var allowsFloats: Bool`](https://developer.apple.com/documentation/foundation/numberformatter/allowsfloats)
Determines whether the receiver allows as input floating-point values (that is, values that include the period character [`.`]).
[`var minimum: NSNumber?`](https://developer.apple.com/documentation/foundation/numberformatter/minimum)
The lowest number allowed as input by the receiver.
[`var maximum: NSNumber?`](https://developer.apple.com/documentation/foundation/numberformatter/maximum)
The highest number allowed as input by the receiver.
### [Managing Leniency Behavior](https://developer.apple.com/documentation/foundation/numberformatter#Managing-Leniency-Behavior)
[`var isLenient: Bool`](https://developer.apple.com/documentation/foundation/numberformatter/islenient)
Determines whether the receiver will use heuristics to guess at the number which is intended by a string.
### [Managing the Validation of Partial Numeric Strings](https://developer.apple.com/documentation/foundation/numberformatter#Managing-the-Validation-of-Partial-Numeric-Strings)
[`var isPartialStringValidationEnabled: Bool`](https://developer.apple.com/documentation/foundation/numberformatter/ispartialstringvalidationenabled)
Determines whether partial string validation is enabled for the receiver.
### [Constants](https://developer.apple.com/documentation/foundation/numberformatter#Constants)
[`enum Style`](https://developer.apple.com/documentation/foundation/numberformatter/style)
The predefined number format styles used by the [`numberStyle`](https://developer.apple.com/documentation/foundation/numberformatter/numberstyle) property.
[`enum Behavior`](https://developer.apple.com/documentation/foundation/numberformatter/behavior)
These constants specify the behavior of a number formatter. These constants are returned by the [`defaultFormatterBehavior()`](https://developer.apple.com/documentation/foundation/numberformatter/defaultformatterbehavior\(\)) class method and the [`formatterBehavior`](https://developer.apple.com/documentation/foundation/numberformatter/formatterbehavior) property.
[`enum PadPosition`](https://developer.apple.com/documentation/foundation/numberformatter/padposition)
These constants are used to specify how numbers should be padded. These constants are used by the [`paddingPosition`](https://developer.apple.com/documentation/foundation/numberformatter/paddingposition) property.
[`enum RoundingMode`](https://developer.apple.com/documentation/foundation/numberformatter/roundingmode-swift.enum)
These constants are used to specify how numbers should be rounded. These constants are used by the [`roundingMode`](https://developer.apple.com/documentation/foundation/numberformatter/roundingmode-swift.property) property.
### [Instance Properties](https://developer.apple.com/documentation/foundation/numberformatter#Instance-Properties)
[`var minimumGroupingDigits: Int`](https://developer.apple.com/documentation/foundation/numberformatter/minimumgroupingdigits)
## [Relationships](https://developer.apple.com/documentation/foundation/numberformatter#relationships)
### [Inherits From](https://developer.apple.com/documentation/foundation/numberformatter#inherits-from)
  * [`Formatter`](https://developer.apple.com/documentation/foundation/formatter)


### [Conforms To](https://developer.apple.com/documentation/foundation/numberformatter#conforms-to)
  * [`CVarArg`](https://developer.apple.com/documentation/Swift/CVarArg)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`NSCoding`](https://developer.apple.com/documentation/foundation/nscoding)
  * [`NSCopying`](https://developer.apple.com/documentation/foundation/nscopying)
  * [`NSObjectProtocol`](https://developer.apple.com/documentation/ObjectiveC/NSObjectProtocol)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)


Current page is NumberFormatter 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Ffoundation%2Fnumberformatter).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
