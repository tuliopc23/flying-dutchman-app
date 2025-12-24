Source: https://developer.apple.com/documentation/FoundationModels/generating-swift-data-structures-with-guided-generation

[ Skip Navigation ](https://developer.apple.com/documentation/FoundationModels/generating-swift-data-structures-with-guided-generation#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/FoundationModels/generating-swift-data-structures-with-guided-generation#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/FoundationModels/generating-swift-data-structures-with-guided-generation)
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
[ Open Menu ](https://developer.apple.com/documentation/FoundationModels/generating-swift-data-structures-with-guided-generation)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/FoundationModels/generating-swift-data-structures-with-guided-generation)
## [ Foundation Models  ](https://developer.apple.com/documentation/foundationmodels)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 24 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
7 of 24 symbols inside <root> containing 6 symbols[SystemLanguageModel.UseCase](https://developer.apple.com/documentation/foundationmodels/systemlanguagemodel/usecase)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 24 symbols inside <root>
Prompting
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 24 symbols inside <root> [Prompting an on-device foundation model](https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 24 symbols inside <root> [Analyzing the runtime performance of your Foundation Models app](https://developer.apple.com/documentation/foundationmodels/analyzing-the-runtime-performance-of-your-foundation-models-app)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
11 of 24 symbols inside <root> containing 41 symbols[LanguageModelSession](https://developer.apple.com/documentation/foundationmodels/languagemodelsession)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
12 of 24 symbols inside <root> containing 4 symbols[Instructions](https://developer.apple.com/documentation/foundationmodels/instructions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
13 of 24 symbols inside <root> containing 4 symbols[Prompt](https://developer.apple.com/documentation/foundationmodels/prompt)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
14 of 24 symbols inside <root> containing 15 symbols[Transcript](https://developer.apple.com/documentation/foundationmodels/transcript)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
15 of 24 symbols inside <root> containing 9 symbols[GenerationOptions](https://developer.apple.com/documentation/foundationmodels/generationoptions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
16 of 24 symbols inside <root>
Guided generation
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
17 of 24 symbols inside <root> [Generating Swift data structures with guided generation](https://developer.apple.com/documentation/foundationmodels/generating-swift-data-structures-with-guided-generation)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
18 of 24 symbols inside <root> containing 16 symbols[Generable](https://developer.apple.com/documentation/foundationmodels/generable)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
19 of 24 symbols inside <root>
Tool calling
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
20 of 24 symbols inside <root> [Expanding generation with tool calling](https://developer.apple.com/documentation/foundationmodels/expanding-generation-with-tool-calling)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
21 of 24 symbols inside <root> [Generate dynamic game content with guided generation and tools](https://developer.apple.com/documentation/foundationmodels/generate-dynamic-game-content-with-guided-generation-and-tools)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
22 of 24 symbols inside <root> containing 9 symbols[Tool](https://developer.apple.com/documentation/foundationmodels/tool)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
23 of 24 symbols inside <root>
Feedback
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
24 of 24 symbols inside <root> containing 4 symbols[LanguageModelFeedback](https://developer.apple.com/documentation/foundationmodels/languagemodelfeedback)
24 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Foundation Models ](https://developer.apple.com/documentation/foundationmodels)
  * [ Generating Swift data structures with guided generation ](https://developer.apple.com/documentation/FoundationModels/generating-swift-data-structures-with-guided-generation)
  *     * Generating Swift data structures with guided generation 


Article
# Generating Swift data structures with guided generation
Create robust apps by describing output you want programmatically.
## [Overview](https://developer.apple.com/documentation/FoundationModels/generating-swift-data-structures-with-guided-generation#overview)
When you perform a request, the model returns a raw string in its natural language format. Raw strings require you to manually parse the details you want. Instead of working with raw strings, the framework provides guided generation, which gives strong guarantees that the response is in a format you expect.
To use guided generation, describe the output you want as a new Swift type. When you make a request to the model, include your custom type and the framework performs the work necessary to fill in and return an object with the parameters filled in for you. The framework uses constrained sampling when generating output, which defines the rules on what the model can generate. Constrained sampling prevents the model from producing malformed output and provides you with results as a type you define.
For more information about creating a session and prompting the model, see [Generating content and performing tasks with Foundation Models](https://developer.apple.com/documentation/foundationmodels/generating-content-and-performing-tasks-with-foundation-models).
## [Conform your data type to Generable](https://developer.apple.com/documentation/FoundationModels/generating-swift-data-structures-with-guided-generation#Conform-your-data-type-to-Generable)
To conform your type to [`Generable`](https://developer.apple.com/documentation/foundationmodels/generable), describe the type and the parameters to guide the response of the model. The framework supports generating content with basic Swift types like `Bool`, `Int`, `Float`, `Double`, `Decimal`, and `Array`. For example, if you only want the model to return a numeric result, call [`respond(to:generating:includeSchemaInPrompt:options:)`](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/respond\(to:generating:includeschemainprompt:options:\)-13kji) using the type `Float`:
```
let prompt = "How many tablespoons are in a cup?"
let session = LanguageModelSession(model: .default)


// Generate a response with the type `Float`, instead of `String`.
let response = try await session.respond(to: prompt, generating: Float.self)

```

A schema provides the ability to control the values of a property, and you can specify guides to control values you associate with it. The framework provides two macros that help you with schema creation. Use [`Generable(description:)`](https://developer.apple.com/documentation/foundationmodels/generable\(description:\)) on structures, actors, and enumerations; and only use [`Guide(description:)`](https://developer.apple.com/documentation/foundationmodels/guide\(description:\)) with stored properties.
When you add descriptions to `Generable` properties, you help the model understand the semantics of the properties. Keep the descriptions as short as possible — long descriptions take up additional context size and can introduce latency. The following example creates a type that describes a cat and includes a name, an age that’s constrained to a range of values, and a short profile:
```
@Generable(description: "Basic profile information about a cat")
struct CatProfile {
    // A guide isn't necessary for basic fields.
    var name: String


    @Guide(description: "The age of the cat", .range(0...20))
    var age: Int


    @Guide(description: "A one sentence profile about the cat's personality")
    var profile: String
}

```

Note
The model generates `Generable` properties in the order they’re declared.
You can nest custom `Generable` types inside other `Generable` types, and mark enumerations with associated values as `Generable`. The `Generable` macro ensures that all associated and nested values are themselves generable. This allows for advanced use cases like creating complex data types or dynamically generating views at runtime.
## [Make a request with your custom data type](https://developer.apple.com/documentation/FoundationModels/generating-swift-data-structures-with-guided-generation#Make-a-request-with-your-custom-data-type)
After creating your type, use it along with a [`LanguageModelSession`](https://developer.apple.com/documentation/foundationmodels/languagemodelsession) to prompt the model. When you use a `Generable` type it prevents the model from producing malformed output and prevents the need for any manual string parsing.
```
// Generate a response using a custom type.
let response = try await session.respond(
    to: "Generate a cute rescue cat",
    generating: CatProfile.self
)

```

## [Define a dynamic schema at runtime](https://developer.apple.com/documentation/FoundationModels/generating-swift-data-structures-with-guided-generation#Define-a-dynamic-schema-at-runtime)
If you don’t know what you want the model to produce at compile time use [`DynamicGenerationSchema`](https://developer.apple.com/documentation/foundationmodels/dynamicgenerationschema) to define what you need. For example, when you’re working on a restaurant app and want to restrict the model to pick from menu options that a restaurant provides. Because each restaurant provides a different menu, the schema won’t be known in its entirety until runtime.
```
// Create the dynamic schema at runtime.
let menuSchema = DynamicGenerationSchema(
    name: "Menu",
    properties: [
        DynamicGenerationSchema.Property(
            name: "dailySoup",
            schema: DynamicGenerationSchema(
                name: "dailySoup",
                anyOf: ["Tomato", "Chicken Noodle", "Clam Chowder"]
            )
        )


        // Add additional properties.
    ]
)

```

After creating a dynamic schema, use it to create a [`GenerationSchema`](https://developer.apple.com/documentation/foundationmodels/generationschema) that you provide with your request. When you try to create a generation schema, it can throw an error if there are conflicting property names, undefined references, or duplicate types.
```
// Create the schema.
let schema = try GenerationSchema(root: menuSchema, dependencies: [])


// Pass the schema to the model to guide the output.
let response = try await session.respond(
    to: "The prompt you want to make.",
    schema: schema
)

```

The response you get is an instance of [`GeneratedContent`](https://developer.apple.com/documentation/foundationmodels/generatedcontent). You can decode the outputs from schemas you define at runtime by calling [`value(_:forProperty:)`](https://developer.apple.com/documentation/foundationmodels/generatedcontent/value\(_:forproperty:\)-3xsez) for the property you want.
## [See Also](https://developer.apple.com/documentation/FoundationModels/generating-swift-data-structures-with-guided-generation#see-also)
### [Guided generation](https://developer.apple.com/documentation/FoundationModels/generating-swift-data-structures-with-guided-generation#Guided-generation)
[`protocol Generable`](https://developer.apple.com/documentation/foundationmodels/generable)
A type that the model uses when responding to prompts.
Current page is Generating Swift data structures with guided generation 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FFoundationModels%2Fgenerating-swift-data-structures-with-guided-generation).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
