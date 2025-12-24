Source: https://developer.apple.com/documentation/foundationmodels/supporting-languages-and-locales-with-foundation-models

[ Skip Navigation ](https://developer.apple.com/documentation/foundationmodels/supporting-languages-and-locales-with-foundation-models#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/foundationmodels/supporting-languages-and-locales-with-foundation-models#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/foundationmodels/supporting-languages-and-locales-with-foundation-models)
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
[ Open Menu ](https://developer.apple.com/documentation/foundationmodels/supporting-languages-and-locales-with-foundation-models)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/foundationmodels/supporting-languages-and-locales-with-foundation-models)
## [ Foundation Models  ](https://developer.apple.com/documentation/foundationmodels)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 24 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 24 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 24 symbols inside <root> [Generating content and performing tasks with Foundation Models](https://developer.apple.com/documentation/foundationmodels/generating-content-and-performing-tasks-with-foundation-models)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 24 symbols inside <root> [Improving the safety of generative model output](https://developer.apple.com/documentation/foundationmodels/improving-the-safety-of-generative-model-output)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 24 symbols inside <root> [Supporting languages and locales with Foundation Models](https://developer.apple.com/documentation/foundationmodels/supporting-languages-and-locales-with-foundation-models)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 24 symbols inside <root> [Adding intelligent app features with generative models](https://developer.apple.com/documentation/foundationmodels/adding-intelligent-app-features-with-generative-models)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
6 of 24 symbols inside <root> containing 19 symbols[SystemLanguageModel](https://developer.apple.com/documentation/foundationmodels/systemlanguagemodel)
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
24 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Foundation Models ](https://developer.apple.com/documentation/foundationmodels)
  * [ Supporting languages and locales with Foundation Models ](https://developer.apple.com/documentation/foundationmodels/supporting-languages-and-locales-with-foundation-models)
  *     * Supporting languages and locales with Foundation Models 


Article
# Supporting languages and locales with Foundation Models
Generate content in the language people prefer when they interact with your app.
## [Overview](https://developer.apple.com/documentation/foundationmodels/supporting-languages-and-locales-with-foundation-models#overview)
The on-device system language model is multilingual, which means the same model understands and generates text in any language that Apple Intelligence supports. The model supports using different languages for prompts, instructions, and the output that the model produces.
When you enhance your app with multilingual support, generate content in the language people prefer to use when they interact with your app by:
  * Prompting the model with the language you prefer.
  * Including the target language for your app in the instructions you provide the model.
  * Determining the language or languages a person wants to use when they interact with your app.
  * Gracefully handling languages that Apple Intelligence doesn’t support.


For more information about the languages and locales that Apple Intelligence supports, see the “Supported languages” section in [How to get Apple Intelligence](https://support.apple.com/en-us/121115).
## [Prompt the model in the language you prefer](https://developer.apple.com/documentation/foundationmodels/supporting-languages-and-locales-with-foundation-models#Prompt-the-model-in-the-language-you-prefer)
Write your app’s built-in prompts in the language with which you normally write code, if Apple Intelligence supports that language. Translate your prompts into a supported language if your preferred language isn’t supported. In the code below, _all_ inputs need to be in supported language for the model to understand, including all `Generable` types and descriptions:
```
@Generable(description: "Basic profile information about a cat")
struct CatProfile {
    var name: String


    @Guide(description: "The age of the cat", .range(0...20))
    var age: Int


    @Guide(description: "One sentence about this cat's personality")
    var profile: String
}


#Playground {
    let response = try await LanguageModelSession().respond(
        to: "Generate a rescue cat",
        generating: CatProfile.self
    )
}

```

Because the framework treats `Generable` types as model inputs, the names of properties like `age` or `profile` are just as important as the `@Guide` descriptions for helping the model understand your request.
## [Check a person’s language settings for your app](https://developer.apple.com/documentation/foundationmodels/supporting-languages-and-locales-with-foundation-models#Check-a-persons-language-settings-for-your-app)
People can use the Settings app on their device to configure the language they prefer to use on a per-app basis, which might differ from their default language. If your app supports a language that Apple Intelligence doesn’t, you need to verify that the current language setting of your app is supported before you call the model. Keep in mind that language support improves over time in newer model and OS versions. Thus, someone using your app with an older OS may not have the latest language support.
Before you call the model, run [`supportsLocale(_:)`](https://developer.apple.com/documentation/foundationmodels/systemlanguagemodel/supportslocale\(_:\)) to verify the support for a locale. By default, the method uses [`current`](https://developer.apple.com/documentation/Foundation/Locale/current), which takes into account a person’s current language and app-specific settings. This method returns true if the model supports this locale, or if this locale is considered similar enough to a supported locale, such as `en-AU` and `en-NZ`:
```
if SystemLanguageModel.default.supportsLocale() {
    // Language is supported.
}

```

For advanced use cases where you need full language support details, use [`supportedLanguages`](https://developer.apple.com/documentation/foundationmodels/systemlanguagemodel/supportedlanguages) to retrieve a list of languages supported by the on-device model.
## [Handle an unsupported language or locale errors](https://developer.apple.com/documentation/foundationmodels/supporting-languages-and-locales-with-foundation-models#Handle-an-unsupported-language-or-locale-errors)
When you call [`respond(to:options:)`](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/respond\(to:options:\)) on a [`LanguageModelSession`](https://developer.apple.com/documentation/foundationmodels/languagemodelsession), the Foundation Models framework checks the language or languages of the input prompt text, and whether your prompt asks the model to respond in any specific language or languages. If the model detects a language it doesn’t support, the session throws [`LanguageModelSession.GenerationError.unsupportedLanguageOrLocale(_:)`](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/generationerror/unsupportedlanguageorlocale\(_:\)). Handle the error by communicating to the person using your app that a language in their request is unsupported.
If your app supports languages or locales that Apple Intelligence doesn’t, help people that use your app by:
  * Explaining that their language isn’t supported by Apple Intelligence in your app.
  * Disabling your Foundation Models framework feature.
  * Providing an alternative app experience, if possible.


Important
Guardrails for model input and output safety are only for supported languages and locales. If a prompt contains sensitive content in an unsupported language, which typically is a short phrase mixed-in with text in a supported language, it might not throw a [`LanguageModelSession.GenerationError.unsupportedLanguageOrLocale(_:)`](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/generationerror/unsupportedlanguageorlocale\(_:\)) error. If unsupported-language detection fails, the guardrails may also fail to flag that short, unsupported content. For more on guardrails, see [Improving the safety of generative model output](https://developer.apple.com/documentation/foundationmodels/improving-the-safety-of-generative-model-output).
## [Use Instructions to set the locale and language](https://developer.apple.com/documentation/foundationmodels/supporting-languages-and-locales-with-foundation-models#Use-Instructions-to-set-the-locale-and-language)
For locales other than United States English, you can improve response quality by telling the model which locale to use by detailing a set of [`Instructions`](https://developer.apple.com/documentation/foundationmodels/instructions). Start with the _exact_ phrase in English. This special phrase comes from the model’s training, and reduces the possibility of hallucinations in multilingual situations:
```
func localeInstructions(for locale: Locale = Locale.current) -> String {
    if Locale.Language(identifier: "en_US").isEquivalent(to: locale.language) {
        // Skip the locale phrase for U.S. English.
        return "" 
    } else {
        // Specify the person's locale with the exact phrase format.
        return "The person's locale is \(locale.identifier)."
    }
}

```

After you set the locale in `Instructions`, you may need to explicitly set the model output language. By default, the model responds in the language or languages of its inputs. If your app supports multiple languages, prompts that you write and inputs from people using your app might be in different languages. For example, if you write your built-in prompts in Spanish, but someone using your app writes inputs in Dutch, the model may respond in either or both languages.
Use `Instructions` to explicity tell the model which language or languages with witch it needs to respond. You can phrase this request in different ways, for example: “You MUST respond in Italian” or “You MUST respond in Italian and be mindful of Italian spelling, vocabulary, entities, and other cultural contexts of Italy.” These instructions can be in the language you prefer.
```
let session = LanguageModelSession(
    instructions: "You MUST respond in U.S. English."
)
let prompt = // A prompt that contains Spanish and Italian.
let response = try await session.respond(to: prompt)

```

Finally, thoroughly test your instructions to ensure the model is responding in the way you expect. If the model isn’t following your instructions, try capitalized words like “MUST” or “ALWAYS” to strengthen your instructions.
## [See Also](https://developer.apple.com/documentation/foundationmodels/supporting-languages-and-locales-with-foundation-models#see-also)
### [Essentials](https://developer.apple.com/documentation/foundationmodels/supporting-languages-and-locales-with-foundation-models#Essentials)
[Generating content and performing tasks with Foundation Models](https://developer.apple.com/documentation/foundationmodels/generating-content-and-performing-tasks-with-foundation-models)
Enhance the experience in your app by prompting an on-device large language model.
[Improving the safety of generative model output](https://developer.apple.com/documentation/foundationmodels/improving-the-safety-of-generative-model-output)
Create generative experiences that appropriately handle sensitive inputs and respect people.
[Adding intelligent app features with generative models](https://developer.apple.com/documentation/foundationmodels/adding-intelligent-app-features-with-generative-models)
Build robust apps with guided generation and tool calling by adopting the Foundation Models framework.
[`class SystemLanguageModel`](https://developer.apple.com/documentation/foundationmodels/systemlanguagemodel)
An on-device large language model capable of text generation tasks.
[`struct UseCase`](https://developer.apple.com/documentation/foundationmodels/systemlanguagemodel/usecase)
A type that represents the use case for prompting.
Current page is Supporting languages and locales with Foundation Models 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Ffoundationmodels%2Fsupporting-languages-and-locales-with-foundation-models).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
