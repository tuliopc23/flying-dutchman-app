Source: https://developer.apple.com/documentation/foundation/building_a_localized_food-ordering_app

[ Skip Navigation ](https://developer.apple.com/documentation/foundation/building_a_localized_food-ordering_app#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/foundation/building_a_localized_food-ordering_app#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/foundation/building_a_localized_food-ordering_app)
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
[ Open Menu ](https://developer.apple.com/documentation/foundation/building_a_localized_food-ordering_app)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/foundation/building_a_localized_food-ordering_app)
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
Collection
8 of 64 symbols inside <root> containing 21 symbols[Filters and Sorting](https://developer.apple.com/documentation/foundation/filters-and-sorting)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 64 symbols inside <root>
App Support
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
10 of 64 symbols inside <root> containing 27 symbols[Task Management](https://developer.apple.com/documentation/foundation/task-management)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
11 of 64 symbols inside <root> containing 5 symbols[Resources](https://developer.apple.com/documentation/foundation/resources)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
12 of 64 symbols inside <root> containing 8 symbols[Notifications](https://developer.apple.com/documentation/foundation/notifications)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
13 of 64 symbols inside <root> containing 12 symbols[App Extension Support](https://developer.apple.com/documentation/foundation/app-extension-support)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
14 of 64 symbols inside <root> containing 13 symbols[Errors and Exceptions](https://developer.apple.com/documentation/foundation/errors-and-exceptions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
15 of 64 symbols inside <root> containing 45 symbols[Scripting Support](https://developer.apple.com/documentation/foundation/scripting-support)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
16 of 64 symbols inside <root>
Files and Data Persistence
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
17 of 64 symbols inside <root> containing 17 symbols[File System](https://developer.apple.com/documentation/foundation/file-system)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
18 of 64 symbols inside <root> containing 32 symbols[Archives and Serialization](https://developer.apple.com/documentation/foundation/archives-and-serialization)
64 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Foundation ](https://developer.apple.com/documentation/foundation)
  * [ Building a Localized Food-Ordering App ](https://developer.apple.com/documentation/foundation/building_a_localized_food-ordering_app)
  *     * Building a Localized Food-Ordering App 


Sample Code
# Building a Localized Food-Ordering App
Format, style, and localize your app’s text for use in multiple languages with string formatting, attributed strings, and automatic grammar agreement.
[ Download ](https://docs-assets.developer.apple.com/published/decc79ee4b/BuildingALocalizedFoodOrderingApp.zip)
iOS 15.0+iPadOS 15.0+Xcode 13.0+watchOS 8.0+
## [Overview](https://developer.apple.com/documentation/foundation/building_a_localized_food-ordering_app#overview)
Note
This sample code project is associated with WWDC21 session [10109: What’s New in Foundation](https://developer.apple.com/wwdc21/10109/).
The Caffé sample app presents a list of menu items — each of which are available in a variety of sizes — that users can order from a café. In presenting the various food items and helping to prepare an order, the app uses various Foundation APIs to localize and stylize the app’s text:
  * `FormatStyle`-based formatting customizes the display of currency values, dates and times, and lists of strings.
  * Attributed strings allow the app to easily create styled text with Markdown for display in SwiftUI views. The app also uses localized attributed strings to build strings at runtime, even when the word order changes in different languages.
  * Automatic grammar agreement handles localization situations when strings need to adjust at runtime to match grammatical gender or number in certain languages.


### [Use Formatters to Format Strings at Runtime](https://developer.apple.com/documentation/foundation/building_a_localized_food-ordering_app#3885683)
When the app launches, the user can choose one of several foods to add to their order. When the user chooses a food item, a new view shows the item’s ingredients and the available sizes with corresponding prices.
The ingredient list shows an example of formatting a list of items, using the [`formatted(_:)`](https://developer.apple.com/documentation/swift/sequence/formatted\(_:\)) method defined on the Swift [`Sequence`](https://developer.apple.com/documentation/swift/sequence) type. It starts with the an array of `ingredients` defined by the `Food` type. In `FoodHeaderView`, the `ingredientText` variable takes the ingredient strings, maps each to a localized string, and then uses the `formatted(_:)` method to create a comma-separated list. By adding the [`ListFormatStyle`](https://developer.apple.com/documentation/foundation/listformatstyle) list type [`ListFormatStyle.ListType.and`](https://developer.apple.com/documentation/foundation/listformatstyle/listtype-swift.enum/and) as a format style parameter, the formatter places an “and” (or its localized equivalent) before last member of the list.
```
private var ingredientText: String {
    food.ingredients.map(\.localizedDescription).formatted(.list(type: .and))
}

```

In English, the ingredient text reads “Our pizza is made from: prosciutto, cheese, flour, and tomatoes.” In Spanish, the list reads “Nuestro pizza está hecho de: prosciutto, queso, harina y tomates.”
The app also uses string formatters to present the price of each item, as seen here:
```
func localizedPrice(_ size: FoodSize) -> String {
    price[size]!.formatted(.currency(code: "USD"))
}

```

As with the list of ingredients earlier, the [`formatted(_:)`](https://developer.apple.com/documentation/swift/binaryinteger/formatted\(_:\)-73k3e) method applies directly to the type it formats. In this case, the formatted type is a [`Decimal`](https://developer.apple.com/documentation/foundation/decimal); this type conforms to Swift’s [`BinaryInteger`](https://developer.apple.com/documentation/swift/binaryinteger), which defines the `formatted(_:)` method. A [`FormatStyle`](https://developer.apple.com/documentation/foundation/formatstyle) parameter indicates that the formatting should format the price as a currency, using U.S. dollars.
For more sophisticated formatting needs, some format styles support chaining modifier methods to customize a default style. The Caffé app includes a companion app for Apple Watch that shows the next date when the user is eligible to receive a free coffee. The [`Date`](https://developer.apple.com/documentation/foundation/date) presented in this view customizes the default `dateTime` format style to show only the weekday, hour, and minute:
```
var str = date.formatted(.dateTime
                            .locale(locale)
                            .minute()
                            .hour()
                            .weekday()
                            .attributed)

```

### [Use Attributed Strings to Style Text](https://developer.apple.com/documentation/foundation/building_a_localized_food-ordering_app#3885684)
The previous listing also uses the [`attributed`](https://developer.apple.com/documentation/foundation/date/formatstyle/attributed-swift.property) modifier to return an [`AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring). Attributed strings contain text and metadata that applies to ranges of that text. In this case, the attributed string returned by the formatter uses the [`dateField`](https://developer.apple.com/documentation/foundation/attributescopes/foundationattributes/datefield) attribute to mark which ranges of text correspond to which parts of the formatted date. This allows the app to find the weekday attribute in the attribute container and change it to an orange foreground color attribute. The SwiftUI view can then use this attribute when styling the watch display.
```
let weekday = AttributeContainer
    .dateField(.weekday)


let color = AttributeContainer
    .foregroundColor(.orange)


str.replaceAttributes(weekday, with: color)

```

[`AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring) is strongly-typed, meaning that all attributes must have defined names and value types. `AttributedString` defines attributes for Foundation, SwiftUI, AppKit, and UIKit in its [`AttributeScopes`](https://developer.apple.com/documentation/foundation/attributescopes) type. For common inline attributes like emphasis and links, attributed strings support initialization from with Markdown syntax, either in source or in `.strings` files. The following entry from the Spanish localization’s `Localizable.strings` file shows Markdown formatting for strong emphasis (`**`), regular emphasis (`_`), and links (`[]` for link text, followed by a URL in parentheses):
```
"**Thank you!**" = "**¡Gracias!**";
"_Please visit our [website](https://www.example.com)._" = "_Visita nuestro [sitio web](https://www.example.com)._";

```

An app can also define custom attributes, as Caffé does with its `RainbowAttribute` type, an attribute that indicates a range of text to display in multiple colors. The Caffé app adds this attribute by:
  1. Defining the `RainbowAttribute` as an extension of [`CodableAttributedStringKey`](https://developer.apple.com/documentation/foundation/codableattributedstringkey), and providing the name and value type of the attribute.
  2. Extending [`AttributeScopes`](https://developer.apple.com/documentation/foundation/attributescopes) to define a new [`AttributeScope`](https://developer.apple.com/documentation/foundation/attributescope) called `CaffeAppAttributes`, whose one member is `rainbow`, of type `RainbowAttribute`. The app also extends `AttributeScopes` with `caffeApp`, a variable of the `CaffeAppAttributes` type, that allows access to the Caffé app’s custom attributes with dynamic member lookup syntax.
  3. Extending [`AttributeDynamicLookup`](https://developer.apple.com/documentation/foundation/attributedynamiclookup) to provide a subscript method that takes key paths of type `CaffeAppAttributes`. This allows code to use dot syntax when looking up the members of `CaffeAppAttributes`.


```
enum RainbowAttribute: CodableAttributedStringKey, MarkdownDecodableAttributedStringKey {
    enum Value: String, Codable, Hashable {
        case plain
        case fun
        case extreme
    }
    
    static var name: String = "rainbow"
}


extension AttributeScopes {
    struct CaffeAppAttributes: AttributeScope {
        let rainbow: RainbowAttribute
    }
    
    var caffeApp: CaffeAppAttributes.Type { CaffeAppAttributes.self }
}


extension AttributeDynamicLookup {
    subscript<T: AttributedStringKey>(dynamicMember keyPath: KeyPath<AttributeScopes.CaffeAppAttributes, T>) -> T {
        self[T.self]
    }
}

```

The implementation of `RainbowText` uses these attributes by creating an [`AttributedString`](https://developer.apple.com/documentation/foundation/attributedstring) and calling a private `annotateRainbowColors(from:)` method to apply its color attributes. To create an `AttributedString` that uses custom attribute scopes, Caffé uses the [`init(localized:options:table:bundle:locale:comment:including:)`](https://developer.apple.com/documentation/foundation/attributedstring/init\(localized:options:table:bundle:locale:comment:including:\)-5jzpg) initializer, passing the key path to the custom attribute name as the `including:` parameter:
```
init(_ localizedKey: String.LocalizationValue) {
    attributedString = RainbowText.annotateRainbowColors(
        from: AttributedString(localized: localizedKey, including: \.caffeApp))
}

```

To apply a custom attribute in a string, a caller uses the Markdown extension syntax, as seen in the following example, which applies two different values of the rainbow attribute:
```
RainbowText("^[Fast](rainbow: 'fun') & ^[Delicious](rainbow: 'extreme') Food")
    .font(.slogan)
    .frame(maxWidth: 260, alignment: .leading)

```

### [Simplify Localization by Performing Grammar Agreement Automatically](https://developer.apple.com/documentation/foundation/building_a_localized_food-ordering_app#3885685)
Some languages’ grammar require that nouns, adjectives, articles, and other parts of speech agree in number or gender with other parts of a sentence. Localized attributed strings can perform this agreement by using a template string to format the values at runtime.
In Caffé, each food’s detail view has a button indicating how many of each item the user has selected to add to their order. The app fills in this button text with the number, size, and food item to add to the order:
```
Button(
    "Add ^[\(quantity) \(foodSizeSelection.localizedName) \(food.localizedName)](inflect: true) to your order",
    action: orderButtonTapped
)

```

The syntax `^[text](inflect:true)` tells the generated attributed string to _inflect_ the string, meaning to perform automatic grammar agreement on the range of text within the square braces. This process takes into account the value of any numeric substitutions and grammatical gender of string substitutions. In English, this causes the food name to pluralize when `quantity` is not equal to `1`.
In Spanish, the localized string in the `.strings` file uses the parameter reordering syntax to place the noun before the adjective, like the following:
```
"Añadir ^[%1$lld %3$@ %2$@](inflect: true) a tu pedido";

```

When the automatic grammar engine inflects the generated string for Spanish, it pluralizes the food name, as it does in English. In Spanish, it also adjusts the adjective (`foodSizeSelection.localizedName`) to match the number of `quantity` and the grammatical gender of `food.localizedName`. For example, one small salad becomes “1 ensalada pequeña” in Spanish, while two small salads is “2 ensaladas pequeñas”. In both cases, the grammar engine changes the adjective “pequeño” to match the feminine gender of “ensalada”.
In some languages, an app may need to provide part-of-speech information to the inflection engine. This happens in English, where the words “sandwich” and “juice” are both a noun and a verb. In Spanish, the food size terms “grande” and “enorme” can be used as both adjectives and nouns. The inflection engine logs a warning when it encounters this type of ambiguity. To clarify intent, the inflection engine accepts a grammar markup that wraps the substitution with the syntax `^[…](morphology: {…})` and provides part-of-speech information. The following entry from the English strings file shows an example of this disambiguation:
```
"Add ^[%lld %@ %@](inflect: true) to your order" = "Add ^[%lld %@ ^[%@](morphology: { partOfSpeech: \"noun\" })](inflect: true) to your order";

```

Current page is Building a Localized Food-Ordering App 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Ffoundation%2Fbuilding_a_localized_food-ordering_app).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
