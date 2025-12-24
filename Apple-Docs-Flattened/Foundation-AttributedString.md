Source: https://developer.apple.com/documentation/Foundation/AttributedString

[ Skip Navigation ](https://developer.apple.com/documentation/Foundation/AttributedString#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/Foundation/AttributedString#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/Foundation/AttributedString)
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
[ Open Menu ](https://developer.apple.com/documentation/Foundation/AttributedString)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/Foundation/AttributedString)
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
1 of 31 symbols inside -832825547 
Strings
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
2 of 31 symbols inside -832825547 [String](https://developer.apple.com/documentation/swift/string)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
3 of 31 symbols inside -832825547 containing 27 symbols[String Encodings](https://developer.apple.com/documentation/foundation/1497293-string-encodings)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 31 symbols inside -832825547 
Strings with Metadata
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
5 of 31 symbols inside -832825547 containing 123 symbols[AttributedString](https://developer.apple.com/documentation/foundation/attributedstring)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 123 symbols inside 1481851804 
Creating an Attributed String
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 123 symbols inside 1481851804 [init()](https://developer.apple.com/documentation/foundation/attributedstring/init\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 123 symbols inside 1481851804 [init(AttributedSubstring)](https://developer.apple.com/documentation/foundation/attributedstring/init\(_:\)-8tnoq)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 123 symbols inside 1481851804 [init(String, attributes: AttributeContainer)](https://developer.apple.com/documentation/foundation/attributedstring/init\(_:attributes:\)-2a45h)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
5 of 123 symbols inside 1481851804 [init(Substring, attributes: AttributeContainer)](https://developer.apple.com/documentation/foundation/attributedstring/init\(_:attributes:\)-8jqhp)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
6 of 123 symbols inside 1481851804 [init<S>(S, attributes: AttributeContainer)](https://developer.apple.com/documentation/foundation/attributedstring/init\(_:attributes:\)-8l0iq)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
7 of 123 symbols inside 1481851804 containing 22 symbols[AttributeContainer](https://developer.apple.com/documentation/foundation/attributecontainer)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 123 symbols inside 1481851804 
Creating a Localized Attributed String
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
9 of 123 symbols inside 1481851804 [init(localized: String.LocalizationValue, options: AttributedString.FormattingOptions, table: String?, bundle: Bundle?, locale: Locale?, comment: StaticString?)](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:options:table:bundle:locale:comment:\)-8dlnl)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
10 of 123 symbols inside 1481851804 [init<S>(localized: String.LocalizationValue, options: AttributedString.FormattingOptions, table: String?, bundle: Bundle?, locale: Locale?, comment: StaticString?, including: S.Type)](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:options:table:bundle:locale:comment:including:\)-8uknv)
218 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Foundation ](https://developer.apple.com/documentation/foundation)
  * [ AttributedString ](https://developer.apple.com/documentation/Foundation/AttributedString)
  *     * AttributedString 


Structure
# AttributedString
A value type for a string with associated attributes for portions of its text.
iOS 15.0+iPadOS 15.0+Mac Catalyst 15.0+macOS 12.0+tvOS 15.0+visionOS 1.0+watchOS 8.0+
```
@dynamicMemberLookup
struct AttributedString
```

## [Overview](https://developer.apple.com/documentation/Foundation/AttributedString#overview)
Attributed strings are character strings that have attributes for individual characters or ranges of characters. Attributes provide traits like visual styles for display, accessibility for guided access, and hyperlink data for linking between data sources. Attribute keys provide the name and value type of each attribute. System frameworks like Foundation and SwiftUI define common keys, and you can define your own in custom extensions.
### [String Attributes](https://developer.apple.com/documentation/Foundation/AttributedString#String-Attributes)
You can apply an attribute to an entire string, or to a range within the string. The string represents each range with consistent attributes as a _run_.
[`AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring) uses subscripts and dynamic member lookup to simplify working with attributes from your call points. In its most verbose form, you set an attribute by creating an [`AttributeContainer`](https://developer.apple.com/documentation/foundation/attributecontainer) and merging it into an existing attributed string, like this:
```
var attributedString = AttributedString("This is a string with empty attributes.")
var container = AttributeContainer()
container[AttributeScopes.AppKitAttributes.ForegroundColorAttribute.self] = .red
attributedString.mergeAttributes(container, mergePolicy: .keepNew)

```

Using the attributed string’s [`subscript(_:)`](https://developer.apple.com/documentation/foundation/attributedstringprotocol/subscript\(_:\)-4thnp) method, you can omit the explicit use of an [`AttributeContainer`](https://developer.apple.com/documentation/foundation/attributecontainer) and just set the attribute by its type:
```
attributedString[AttributeScopes.AppKitAttributes.ForegroundColorAttribute.self] = .yellow

```

Because an [`AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring) supports dynamic member lookup — as described under [Attributes](https://docs.swift.org/swift-book/ReferenceManual/Attributes.html) in [The Swift Programming Language](https://docs.swift.org/swift-book/) — you can access its subscripts with dot syntax instead. When combined with properties like [`foregroundColor`](https://developer.apple.com/documentation/foundation/attributescopes/appkitattributes/foregroundcolor) that return the attribute key type, this final form offers a natural way to set an attribute that applies to an entire string:
```
attributedString.foregroundColor = .green

```

This example works because AppKit defines an [`AttributeScope`](https://developer.apple.com/documentation/foundation/attributescope), [`AttributeScopes.AppKitAttributes`](https://developer.apple.com/documentation/foundation/attributescopes/appkitattributes), in which the property [`foregroundColor`](https://developer.apple.com/documentation/foundation/attributescopes/appkitattributes/foregroundcolor) returns the type `AttributeScopes.AppKitAttributes.ForegroundColorAttribute`. Because AppKit’s attribute scope implements [`AttributeDynamicLookup`](https://developer.apple.com/documentation/foundation/attributedynamiclookup), the dot syntax resolves to an equivalent subscript expression, allowing `attributedString.foregroundColor` to replace `attributedString[AttributeScopes.AppKitAttributes.ForegroundColorAttribute.self]`.
You can also set an attribute to apply only to part of an attributed string, by applying the attribute to a range, as seen here:
```
var attributedString = AttributedString("The first month of your subscription is free.")
guard let range = attributedString.range(of: "free") else {return}
attributedString[range].foregroundColor = .green

```

You can access portions of the string with unique combinations of attributes by iterating over the string’s `runs` property.
You can define your own custom attributes by creating types that conform to [`AttributedStringKey`](https://developer.apple.com/documentation/foundation/attributedstringkey), and collecting them in an [`AttributeScope`](https://developer.apple.com/documentation/foundation/attributescope). Custom keys should also extend [`AttributeDynamicLookup`](https://developer.apple.com/documentation/foundation/attributedynamiclookup), so callers can use dot-syntax to access the attribute.
### [Creating Attributed Strings with Markdown](https://developer.apple.com/documentation/Foundation/AttributedString#Creating-Attributed-Strings-with-Markdown)
You can create an attributed string by passing a standard [`String`](https://developer.apple.com/documentation/Swift/String) or [`Data`](https://developer.apple.com/documentation/foundation/data) instance that contains Markdown to initializers like [`init(markdown:options:baseURL:)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(markdown:options:baseurl:\)-52n3u). The attributed string creates attributes by parsing the markup in the string.
```
do {
    let thankYouString = try AttributedString(
        markdown:"**Thank you!** Please visit our [website](https://example.com)")
} catch {
    print("Couldn't parse the string. \(error.localizedDescription)")
}

```

Localized strings that you load from strings files with initializers like [`init(localized:options:table:bundle:locale:comment:)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:options:table:bundle:locale:comment:\)-8dlnl) can also contain Markdown to add styling. In addition, these localized attributed string initializers can apply the [`replacementIndex`](https://developer.apple.com/documentation/foundation/attributescopes/foundationattributes/replacementindex) attribute, which allows you to determine the range of replacement strings, whose order may vary between languages.
By declaring new attributes that conform to [`MarkdownDecodableAttributedStringKey`](https://developer.apple.com/documentation/foundation/markdowndecodableattributedstringkey), you can add attributes that you invoke by using Apple’s Markdown extension syntax: `^[text](name:value, name:value, …)`. See the sample code project doc:building-a-localized-food-ordering-app for an example of creating custom attributes and using them with Markdown.
Localized attributed strings can also use the extension syntax to indicate parts of the string where the system can apply automatic grammar agreement. See the initializers that take a `localized:` parameter for examples of this extension syntax, as used with automatic grammar agreement.
### [Attribute Scopes](https://developer.apple.com/documentation/Foundation/AttributedString#Attribute-Scopes)
The [`AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring) API defines keys for common uses, such as text styling, semantically marking up formattable types like dates and numbers, and hyperlinking. You can find these in the [`AttributeScopes`](https://developer.apple.com/documentation/foundation/attributescopes) enumeration, which contains attributes for AppKit, Foundation, SwiftUI, and UIKit.
You can define your own attributes by implementing [`AttributedStringKey`](https://developer.apple.com/documentation/foundation/attributedstringkey), and reference them by name by collecting them in an [`AttributeScope`](https://developer.apple.com/documentation/foundation/attributescope).
## [Topics](https://developer.apple.com/documentation/Foundation/AttributedString#topics)
### [Creating an Attributed String](https://developer.apple.com/documentation/Foundation/AttributedString#Creating-an-Attributed-String)
[`init()`](https://developer.apple.com/documentation/foundation/attributedstring/init\(\))
Creates an empty attributed string.
[`init(AttributedSubstring)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(_:\)-8tnoq)
Creates an attributed string from an attributed substring.
[`init(String, attributes: AttributeContainer)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(_:attributes:\)-2a45h)
Creates an attributed string from a string and an attribute container.
[`init(Substring, attributes: AttributeContainer)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(_:attributes:\)-8jqhp)
Creates an attributed string from a substring and an attribute container.
[`init<S>(S, attributes: AttributeContainer)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(_:attributes:\)-8l0iq)
Creates an attributed string from a character sequence and an attribute container.
[`struct AttributeContainer`](https://developer.apple.com/documentation/foundation/attributecontainer)
A container for attribute keys and values.
### [Creating a Localized Attributed String](https://developer.apple.com/documentation/Foundation/AttributedString#Creating-a-Localized-Attributed-String)
[`init(localized: String.LocalizationValue, options: AttributedString.FormattingOptions, table: String?, bundle: Bundle?, locale: Locale?, comment: StaticString?)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:options:table:bundle:locale:comment:\)-8dlnl)
Creates an attributed string by looking up a localized string from the app’s bundle.
[`init<S>(localized: String.LocalizationValue, options: AttributedString.FormattingOptions, table: String?, bundle: Bundle?, locale: Locale?, comment: StaticString?, including: S.Type)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:options:table:bundle:locale:comment:including:\)-8uknv)
Creates an attributed string by looking up a localized string from the app’s bundle, including an attribute scope.
[`init<S>(localized: String.LocalizationValue, options: AttributedString.FormattingOptions, table: String?, bundle: Bundle?, locale: Locale?, comment: StaticString?, including: KeyPath<AttributeScopes, S.Type>)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:options:table:bundle:locale:comment:including:\)-5jzpg)
Creates an attributed string by looking up a localized string from the app’s bundle, including an attribute scope that a key path identifies.
[`struct LocalizationValue`](https://developer.apple.com/documentation/Swift/String/LocalizationValue)
A reference to a localizable string, with optional string interpolation.
[`struct FormattingOptions`](https://developer.apple.com/documentation/foundation/attributedstring/formattingoptions)
Options that affect the handling of attributes.
[`init(localized: LocalizedStringResource)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:\))
Creates a localized attributed string from a localized string resource.
[`init<S>(localized: LocalizedStringResource, including: S.Type)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:including:\)-2xebo)
Creates a localized attributed string from a localized string resource, including an attribute scope.
[`init<S>(localized: LocalizedStringResource, including: KeyPath<AttributeScopes, S.Type>)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:including:\)-15xc5)
Creates a localized attributed string from a localized string resource, including an attribute scope that a key path identifies.
[`struct LocalizedStringResource`](https://developer.apple.com/documentation/foundation/localizedstringresource)
A reference to a localizable string, accessible from another process.
### [Creating a Localized Attributed String with a Default Value](https://developer.apple.com/documentation/Foundation/AttributedString#Creating-a-Localized-Attributed-String-with-a-Default-Value)
[`init(localized: StaticString, defaultValue: String.LocalizationValue, options: AttributedString.FormattingOptions, table: String?, bundle: Bundle?, locale: Locale?, comment: StaticString?)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:defaultvalue:options:table:bundle:locale:comment:\)-4n8e2)
Creates an attributed string by looking up a localized string from the app’s bundle, using a default value if necessary.
[`init<S>(localized: StaticString, defaultValue: String.LocalizationValue, options: AttributedString.FormattingOptions, table: String?, bundle: Bundle?, locale: Locale?, comment: StaticString?, including: S.Type)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:defaultvalue:options:table:bundle:locale:comment:including:\)-2elmp)
Creates an attributed string by looking up a localized string from the app’s bundle, including an attribute scope, using a default value if necessary.
[`init<S>(localized: StaticString, defaultValue: String.LocalizationValue, options: AttributedString.FormattingOptions, table: String?, bundle: Bundle?, locale: Locale?, comment: StaticString?, including: KeyPath<AttributeScopes, S.Type>)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:defaultvalue:options:table:bundle:locale:comment:including:\)-9gjtg)
Creates an attributed string by looking up a localized string from the app’s bundle, including an attribute scope that a key path identifies, using a default value if necessary.
### [Creating an Attributed String from Markdown](https://developer.apple.com/documentation/Foundation/AttributedString#Creating-an-Attributed-String-from-Markdown)
Use Markdown syntax to initialize an attributed string with text and attributes.
[API Reference Instantiating Attributed Strings with Markdown Syntax](https://developer.apple.com/documentation/foundation/instantiating-attributed-strings-with-markdown-syntax)
Use a Markdown-syntax string to iniitalize an attributed string with standard or custom attributes.
### [Creating an Attributed String from a Reference Type](https://developer.apple.com/documentation/Foundation/AttributedString#Creating-an-Attributed-String-from-a-Reference-Type)
[`init<S>(NSAttributedString, including: S.Type) throws`](https://developer.apple.com/documentation/foundation/attributedstring/init\(_:including:\)-9no47)
Creates a value-type attributed string from a reference type, including an attribute scope.
[`init<S>(NSAttributedString, including: KeyPath<AttributeScopes, S.Type>) throws`](https://developer.apple.com/documentation/foundation/attributedstring/init\(_:including:\)-puv0)
Creates a value-type attributed string from a reference type, including an attribute scope that a key path identifies.
[`init(NSAttributedString)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(_:\)-1fru0)
Creates a value-type attributed string from a reference type.
### [Creating a Duplicate Attributed String](https://developer.apple.com/documentation/Foundation/AttributedString#Creating-a-Duplicate-Attributed-String)
[`init<S, T>(T, including: S.Type)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(_:including:\)-6u3ho)
Creates an attributed string from another attributed string, including an attribute scope.
[`init<S, T>(T, including: KeyPath<AttributeScopes, S.Type>)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(_:including:\)-9ejyj)
Creates an attributed string from another attributed string, including an attribute scope that a key path identifies.
### [Applying and Modifying Attributes](https://developer.apple.com/documentation/Foundation/AttributedString#Applying-and-Modifying-Attributes)
[`enum AttributeMergePolicy`](https://developer.apple.com/documentation/foundation/attributedstring/attributemergepolicy)
An enumeration of behaviors to apply when merging attributes.
[`protocol AttributedStringAttributeMutation`](https://developer.apple.com/documentation/foundation/attributedstringattributemutation)
A protocol that defines in-place mutations for attributes in an attributed string.
### [Using Defined Attributes](https://developer.apple.com/documentation/Foundation/AttributedString#Using-Defined-Attributes)
[`enum AttributeScopes`](https://developer.apple.com/documentation/foundation/attributescopes)
Collections of attributes that system frameworks define.
[`enum AttributeDynamicLookup`](https://developer.apple.com/documentation/foundation/attributedynamiclookup)
A type to support dynamic member lookup of attributes and containers.
[`struct ScopedAttributeContainer`](https://developer.apple.com/documentation/foundation/scopedattributecontainer)
An attribute container that allows dynamic member lookup of its contents within the specified attribute scope.
### [Accessing Indices](https://developer.apple.com/documentation/Foundation/AttributedString#Accessing-Indices)
[API Reference Accessing Indicies Within an Attributed String](https://developer.apple.com/documentation/foundation/accessing-indicies-within-an-attributed-string)
Access a position within an attributed string, offset from the beginning, or before or after another known position.
### [Accessing Views into the Attributed String](https://developer.apple.com/documentation/Foundation/AttributedString#Accessing-Views-into-the-Attributed-String)
[`struct CharacterView`](https://developer.apple.com/documentation/foundation/attributedstring/characterview)
A view into the underlying storage of the attributed string, as Unicode characters.
[`struct UnicodeScalarView`](https://developer.apple.com/documentation/foundation/attributedstring/unicodescalarview)
A view into the underlying storage of the attributed string, as Unicode scalars.
[`struct Runs`](https://developer.apple.com/documentation/foundation/attributedstring/runs)
An iterable view into segments of the attributed string, each of which indicates where a run of identical attributes begins or ends.
### [Modifying an Attributed String](https://developer.apple.com/documentation/Foundation/AttributedString#Modifying-an-Attributed-String)
[`func insert(some AttributedStringProtocol, at: AttributedString.Index)`](https://developer.apple.com/documentation/foundation/attributedstring/insert\(_:at:\))
Inserts the specified string at a specific index in the attributed string.
[`struct Index`](https://developer.apple.com/documentation/foundation/attributedstring/index)
A type that represents the position of a character or code unit within an attributed string.
[`func removeSubrange(some RangeExpression<AttributedString.Index>)`](https://developer.apple.com/documentation/foundation/attributedstring/removesubrange\(_:\))
Removes a range of characters from the attributed string.
[`func replaceSubrange(some RangeExpression<AttributedString.Index>, with: some AttributedStringProtocol)`](https://developer.apple.com/documentation/foundation/attributedstring/replacesubrange\(_:with:\))
Replaces the contents in a range of the attributed string.
### [Transforming Attributes](https://developer.apple.com/documentation/Foundation/AttributedString#Transforming-Attributes)
[`func transformingAttributes<K>(K.Type, (inout AttributedString.SingleAttributeTransformer<K>) -> Void) -> AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring/transformingattributes\(_:_:\)-9prm2)
Returns an attributed string by calling a closure that transforms one attribute of a source attributed string.
[`func transformingAttributes<K>(KeyPath<AttributeDynamicLookup, K>, (inout AttributedString.SingleAttributeTransformer<K>) -> Void) -> AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring/transformingattributes\(_:_:\)-64qnl)
Returns an attributed string by calling a closure that transforms one attribute, which a key path identifies, of a source attributed string.
[`func transformingAttributes<K1, K2>(K1.Type, K2.Type, (inout AttributedString.SingleAttributeTransformer<K1>, inout AttributedString.SingleAttributeTransformer<K2>) -> Void) -> AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring/transformingattributes\(_:_:_:\)-7kw1o)
Returns an attributed string by calling a closure that transforms two attributes of a source attributed string.
[`func transformingAttributes<K1, K2>(KeyPath<AttributeDynamicLookup, K1>, KeyPath<AttributeDynamicLookup, K2>, (inout AttributedString.SingleAttributeTransformer<K1>, inout AttributedString.SingleAttributeTransformer<K2>) -> Void) -> AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring/transformingattributes\(_:_:_:\)-8gt2n)
Returns an attributed string created by calling a closure that transforms two attributes, which key paths identify, of a source attributed string.
[`func transformingAttributes<K1, K2, K3>(K1.Type, K2.Type, K3.Type, (inout AttributedString.SingleAttributeTransformer<K1>, inout AttributedString.SingleAttributeTransformer<K2>, inout AttributedString.SingleAttributeTransformer<K3>) -> Void) -> AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring/transformingattributes\(_:_:_:_:\)-4owv7)
Returns an attributed string by calling a closure that transforms three attributes of a source attributed string.
[`func transformingAttributes<K1, K2, K3>(KeyPath<AttributeDynamicLookup, K1>, KeyPath<AttributeDynamicLookup, K2>, KeyPath<AttributeDynamicLookup, K3>, (inout AttributedString.SingleAttributeTransformer<K1>, inout AttributedString.SingleAttributeTransformer<K2>, inout AttributedString.SingleAttributeTransformer<K3>) -> Void) -> AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring/transformingattributes\(_:_:_:_:\)-5xmlf)
Returns an attributed string by calling a closure that transforms three attributes, which key paths identify, of a source attributed string.
[`func transformingAttributes<K1, K2, K3, K4>(K1.Type, K2.Type, K3.Type, K4.Type, (inout AttributedString.SingleAttributeTransformer<K1>, inout AttributedString.SingleAttributeTransformer<K2>, inout AttributedString.SingleAttributeTransformer<K3>, inout AttributedString.SingleAttributeTransformer<K4>) -> Void) -> AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring/transformingattributes\(_:_:_:_:_:\)-9uodg)
Returns an attributed string by calling a closure that transforms four attributes of a source attributed string.
[`func transformingAttributes<K1, K2, K3, K4>(KeyPath<AttributeDynamicLookup, K1>, KeyPath<AttributeDynamicLookup, K2>, KeyPath<AttributeDynamicLookup, K3>, KeyPath<AttributeDynamicLookup, K4>, (inout AttributedString.SingleAttributeTransformer<K1>, inout AttributedString.SingleAttributeTransformer<K2>, inout AttributedString.SingleAttributeTransformer<K3>, inout AttributedString.SingleAttributeTransformer<K4>) -> Void) -> AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring/transformingattributes\(_:_:_:_:_:\)-all0)
Returns an attributed string created by calling a closure that transforms four attributes, which key paths identify, of a source attributed string.
[`func transformingAttributes<K1, K2, K3, K4, K5>(K1.Type, K2.Type, K3.Type, K4.Type, K5.Type, (inout AttributedString.SingleAttributeTransformer<K1>, inout AttributedString.SingleAttributeTransformer<K2>, inout AttributedString.SingleAttributeTransformer<K3>, inout AttributedString.SingleAttributeTransformer<K4>, inout AttributedString.SingleAttributeTransformer<K5>) -> Void) -> AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring/transformingattributes\(_:_:_:_:_:_:\)-3i7ac)
Returns an attributed string created by calling a closure that transforms five attributes of a source attributed string.
[`func transformingAttributes<K1, K2, K3, K4, K5>(KeyPath<AttributeDynamicLookup, K1>, KeyPath<AttributeDynamicLookup, K2>, KeyPath<AttributeDynamicLookup, K3>, KeyPath<AttributeDynamicLookup, K4>, KeyPath<AttributeDynamicLookup, K5>, (inout AttributedString.SingleAttributeTransformer<K1>, inout AttributedString.SingleAttributeTransformer<K2>, inout AttributedString.SingleAttributeTransformer<K3>, inout AttributedString.SingleAttributeTransformer<K4>, inout AttributedString.SingleAttributeTransformer<K5>) -> Void) -> AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring/transformingattributes\(_:_:_:_:_:_:\)-9hppo)
Returns an attributed string created by calling a closure that transforms five attributes, which key paths identify, of a source attributed string.
[`struct SingleAttributeTransformer`](https://developer.apple.com/documentation/foundation/attributedstring/singleattributetransformer)
A type that transforms an attribute by altering its range or value, or by replacing it entirely.
### [Accessing Whole-String Attributes](https://developer.apple.com/documentation/Foundation/AttributedString#Accessing-Whole-String-Attributes)
[`enum AttributeDynamicLookup`](https://developer.apple.com/documentation/foundation/attributedynamiclookup)
A type to support dynamic member lookup of attributes and containers.
[`struct ScopedAttributeContainer`](https://developer.apple.com/documentation/foundation/scopedattributecontainer)
An attribute container that allows dynamic member lookup of its contents within the specified attribute scope.
### [Combining Attributed Strings](https://developer.apple.com/documentation/Foundation/AttributedString#Combining-Attributed-Strings)
[`func append(some AttributedStringProtocol)`](https://developer.apple.com/documentation/foundation/attributedstring/append\(_:\))
Appends a string to the attributed string.
[`static func + (AttributedString, AttributedString) -> AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring/+\(_:_:\)-8sbsq)
Concatenates two attributed strings.
[`static func + (AttributedString, some AttributedStringProtocol) -> AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring/+\(_:_:\)-drfc)
Concatenates two attributed strings or substrings.
[`static func += (inout AttributedString, AttributedString)`](https://developer.apple.com/documentation/foundation/attributedstring/+=\(_:_:\)-4dk88)
Appends an attributed string to another attributed string.
[`static func += (inout AttributedString, some AttributedStringProtocol)`](https://developer.apple.com/documentation/foundation/attributedstring/+=\(_:_:\)-6yimu)
Appends an attributed string or substring to another attributed string.
### [Performing Automatic Grammar Agreement](https://developer.apple.com/documentation/Foundation/AttributedString#Performing-Automatic-Grammar-Agreement)
[`func inflected() -> AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring/inflected\(\))
Applies automatic grammar agreement inflection rules to the attributed string and returns the result.
### [Performing String Interpolation](https://developer.apple.com/documentation/Foundation/AttributedString#Performing-String-Interpolation)
[`struct InterpolationOptions`](https://developer.apple.com/documentation/foundation/attributedstring/interpolationoptions)
Options that affect the behavior of string interpolation on the attributed string.
### [Encoding and Decoding](https://developer.apple.com/documentation/Foundation/AttributedString#Encoding-and-Decoding)
[`struct AttributeScopeCodableConfiguration`](https://developer.apple.com/documentation/foundation/attributescopecodableconfiguration)
A configuration type for encoding and decoding attributed strings.
[API Reference Encoding and Decoding Attributed String Keys](https://developer.apple.com/documentation/foundation/encoding-and-decoding-attributed-string-keys)
Protocols adopted by attribute keys to encode or decode data.
### [Structures](https://developer.apple.com/documentation/Foundation/AttributedString#Structures)
[`struct AdaptiveImageGlyph`](https://developer.apple.com/documentation/foundation/attributedstring/adaptiveimageglyph)
[`struct AttributeInvalidationCondition`](https://developer.apple.com/documentation/foundation/attributedstring/attributeinvalidationcondition)
[`struct LineHeight`](https://developer.apple.com/documentation/foundation/attributedstring/lineheight)
The line height definition of a paragraph.
[`struct LocalizationOptions`](https://developer.apple.com/documentation/foundation/attributedstring/localizationoptions)
Configuration options for the localization of text.
[`struct MarkdownSourcePosition`](https://developer.apple.com/documentation/foundation/attributedstring/markdownsourceposition)
The position of attributed string text in its original Markdown source string.
[`struct UTF16View`](https://developer.apple.com/documentation/foundation/attributedstring/utf16view)
A view of an attributed string’s contents as a collection of UTF-16 code units.
[`struct UTF8View`](https://developer.apple.com/documentation/foundation/attributedstring/utf8view)
A view of an attributed string’s contents as a collection of UTF-8 code units.
### [Initializers](https://developer.apple.com/documentation/Foundation/AttributedString#Initializers)
[`init(DiscontiguousAttributedSubstring)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(_:\)-83wi)
Creates an attributed string from a discontiguous attributed substring.
[`init(localized: StaticString, defaultValue: String.LocalizationValue, options: AttributedString.LocalizationOptions, table: String?, bundle: Bundle?, locale: Locale?, comment: StaticString?)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:defaultvalue:options:table:bundle:locale:comment:\)-2nmk8)
[`init<S>(localized: StaticString, defaultValue: String.LocalizationValue, options: AttributedString.LocalizationOptions, table: String?, bundle: Bundle?, locale: Locale?, comment: StaticString?, including: S.Type)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:defaultvalue:options:table:bundle:locale:comment:including:\)-6qaoe)
[`init<S>(localized: StaticString, defaultValue: String.LocalizationValue, options: AttributedString.LocalizationOptions, table: String?, bundle: Bundle?, locale: Locale?, comment: StaticString?, including: KeyPath<AttributeScopes, S.Type>)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:defaultvalue:options:table:bundle:locale:comment:including:\)-iisj)
[`init(localized: LocalizedStringResource, options: AttributedString.LocalizationOptions)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:options:\))
[`init<S>(localized: LocalizedStringResource, options: AttributedString.LocalizationOptions, including: S.Type)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:options:including:\)-3dycp)
[`init<S>(localized: LocalizedStringResource, options: AttributedString.LocalizationOptions, including: KeyPath<AttributeScopes, S.Type>)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:options:including:\)-4cbfv)
[`init(localized: String.LocalizationValue, options: AttributedString.LocalizationOptions, table: String?, bundle: Bundle?, locale: Locale?, comment: StaticString?)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:options:table:bundle:locale:comment:\)-1w4s)
[`init<S>(localized: String.LocalizationValue, options: AttributedString.LocalizationOptions, table: String?, bundle: Bundle?, locale: Locale?, comment: StaticString?, including: KeyPath<AttributeScopes, S.Type>)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:options:table:bundle:locale:comment:including:\)-3zy6h)
[`init<S>(localized: String.LocalizationValue, options: AttributedString.LocalizationOptions, table: String?, bundle: Bundle?, locale: Locale?, comment: StaticString?, including: S.Type)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:options:table:bundle:locale:comment:including:\)-8ao6x)
[`init(transferable: AttributedTextFormatting.Transferable, in: EnvironmentValues) throws`](https://developer.apple.com/documentation/foundation/attributedstring/init\(transferable:in:\))
Extract an attributed string from SwiftUI’s transferable representation in a certain environment.
### [Instance Methods](https://developer.apple.com/documentation/Foundation/AttributedString#Instance-Methods)
[`func inflected(locale: Locale, userTermOfAddress: TermOfAddress?, inflectionConcepts: [InflectionConcept]) -> AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring/inflected\(locale:usertermofaddress:inflectionconcepts:\))
Process automatic grammar agreement and formatting attributes.
[`func rangeOfAudioTimeRangeAttributes(intersecting: CMTimeRange) -> Range<AttributedString.Index>?`](https://developer.apple.com/documentation/foundation/attributedstring/rangeofaudiotimerangeattributes\(intersecting:\))
Returns the range of indices of the receiver that are part of given time range.
[`func removeSubranges(RangeSet<AttributedString.Index>)`](https://developer.apple.com/documentation/foundation/attributedstring/removesubranges\(_:\))
Removes the elements at the given indices.
[`func replaceSelection(inout AttributedTextSelection, with: some AttributedStringProtocol)`](https://developer.apple.com/documentation/foundation/attributedstring/replaceselection\(_:with:\))
Replace the selection with new attributed content.
[`func replaceSelection(inout AttributedTextSelection, withCharacters: some Collection<Character>)`](https://developer.apple.com/documentation/foundation/attributedstring/replaceselection\(_:withcharacters:\))
Replace the selection with new content, attributed with the typing attributes.
[`func transform<E>(updating: inout Range<AttributedString.Index>, body: (inout AttributedString) throws(E) -> Void) throws(E)`](https://developer.apple.com/documentation/foundation/attributedstring/transform\(updating:body:\)-1b6eb)
Tracks the location of the provided range throughout the mutation closure, updating the provided range to one that represents the same effective locations after the mutation.
[`func transform<E>(updating: inout [Range<AttributedString.Index>], body: (inout AttributedString) throws(E) -> Void) throws(E)`](https://developer.apple.com/documentation/foundation/attributedstring/transform\(updating:body:\)-3j625)
Tracks the location of the provided ranges throughout the mutation closure, updating them to new ranges that represent the same effective locations after the mutation.
[`func transform<E>(updating: Range<AttributedString.Index>, body: (inout AttributedString) throws(E) -> Void) throws(E) -> Range<AttributedString.Index>?`](https://developer.apple.com/documentation/foundation/attributedstring/transform\(updating:body:\)-79te9)
Tracks the location of the provided range throughout the mutation closure, returning a new, updated range that represents the same effective locations after the mutation.
[`func transform<E>(updating: [Range<AttributedString.Index>], body: (inout AttributedString) throws(E) -> Void) throws(E) -> [Range<AttributedString.Index>]?`](https://developer.apple.com/documentation/foundation/attributedstring/transform\(updating:body:\)-89r96)
Tracks the location of the provided ranges throughout the mutation closure, returning a new, updated range that represents the same effective locations after the mutation
[`func transform<E>(updating: inout AttributedTextSelection, body: (inout AttributedString) throws(E) -> Void) throws(E)`](https://developer.apple.com/documentation/foundation/attributedstring/transform\(updating:body:\)-9wpg2)
Tracks the location of the selection throughout the mutation closure, updating the selection so it represents the same effective locations after the mutation.
[`func transformAttributes<E>(in: inout AttributedTextSelection, body: (inout AttributeContainer) throws(E) -> Void) throws(E)`](https://developer.apple.com/documentation/foundation/attributedstring/transformattributes\(in:body:\))
Apply a change to the attributes in the entire selection.
### [Subscripts](https://developer.apple.com/documentation/Foundation/AttributedString#Subscripts)
[`subscript(AttributedTextSelection) -> DiscontiguousAttributedSubstring`](https://developer.apple.com/documentation/foundation/attributedstring/subscript\(_:\)-2yypq)
Obtain the discontiguous substring of a selection.
[`subscript(RangeSet<AttributedString.Index>) -> DiscontiguousAttributedSubstring`](https://developer.apple.com/documentation/foundation/attributedstring/subscript\(_:\)-ftoi)
Returns a discontiguous substring of this discontiguous attributed string using a set of ranges to indicate the discontiguous substring bounds.
### [Type Aliases](https://developer.apple.com/documentation/Foundation/AttributedString#Type-Aliases)
[`typealias Specification`](https://developer.apple.com/documentation/foundation/attributedstring/specification)
[`typealias UnwrappedType`](https://developer.apple.com/documentation/foundation/attributedstring/unwrappedtype)
[`typealias ValueType`](https://developer.apple.com/documentation/foundation/attributedstring/valuetype)
### [Type Properties](https://developer.apple.com/documentation/Foundation/AttributedString#Type-Properties)
[`static var defaultResolverSpecification: some ResolverSpecification`](https://developer.apple.com/documentation/foundation/attributedstring/defaultresolverspecification)
### [Enumerations](https://developer.apple.com/documentation/Foundation/AttributedString#Enumerations)
[`enum AttributeRunBoundaries`](https://developer.apple.com/documentation/foundation/attributedstring/attributerunboundaries)
[`enum TextAlignment`](https://developer.apple.com/documentation/foundation/attributedstring/textalignment)
The explicit alignment of text within its container.
[`enum WritingDirection`](https://developer.apple.com/documentation/foundation/attributedstring/writingdirection)
The writing direction of a piece of text.
### [Default Implementations](https://developer.apple.com/documentation/Foundation/AttributedString#Default-Implementations)
[API Reference AttributedStringProtocol Implementations](https://developer.apple.com/documentation/foundation/attributedstring/attributedstringprotocol-implementations)
## [Relationships](https://developer.apple.com/documentation/Foundation/AttributedString#relationships)
### [Conforms To](https://developer.apple.com/documentation/Foundation/AttributedString#conforms-to)
  * [`AttributedStringAttributeMutation`](https://developer.apple.com/documentation/foundation/attributedstringattributemutation)
  * [`AttributedStringProtocol`](https://developer.apple.com/documentation/foundation/attributedstringprotocol)
  * [`Copyable`](https://developer.apple.com/documentation/Swift/Copyable)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Decodable`](https://developer.apple.com/documentation/Swift/Decodable)
  * [`DecodableWithConfiguration`](https://developer.apple.com/documentation/foundation/decodablewithconfiguration)
  * [`Encodable`](https://developer.apple.com/documentation/Swift/Encodable)
  * [`EncodableWithConfiguration`](https://developer.apple.com/documentation/foundation/encodablewithconfiguration)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`ExpressibleByExtendedGraphemeClusterLiteral`](https://developer.apple.com/documentation/Swift/ExpressibleByExtendedGraphemeClusterLiteral)
  * [`ExpressibleByStringLiteral`](https://developer.apple.com/documentation/Swift/ExpressibleByStringLiteral)
  * [`ExpressibleByUnicodeScalarLiteral`](https://developer.apple.com/documentation/Swift/ExpressibleByUnicodeScalarLiteral)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)
  * [`Transferable`](https://developer.apple.com/documentation/CoreTransferable/Transferable)


## [See Also](https://developer.apple.com/documentation/Foundation/AttributedString#see-also)
### [Strings with Metadata](https://developer.apple.com/documentation/Foundation/AttributedString#Strings-with-Metadata)
[`struct AttributedSubstring`](https://developer.apple.com/documentation/foundation/attributedsubstring)
A portion of an attributed string.
[API Reference Attributed String Supporting Types](https://developer.apple.com/documentation/foundation/attributed-string-supporting-types)
Types that the attributed string, attributed substring, and helper types extend or conform to, for sharing common functionality.
[`class NSAttributedString`](https://developer.apple.com/documentation/foundation/nsattributedstring)
A string of text that manages data, layout, and stylistic information for ranges of characters to support rendering.
[`class NSMutableAttributedString`](https://developer.apple.com/documentation/foundation/nsmutableattributedstring)
A mutable string with associated attributes (such as visual style, hyperlinks, or accessibility data) for portions of its text.
Current page is AttributedString 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FFoundation%2FAttributedString).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
