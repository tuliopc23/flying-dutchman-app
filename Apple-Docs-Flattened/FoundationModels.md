Source: https://developer.apple.com/documentation/foundationmodels

[ Skip Navigation ](https://developer.apple.com/documentation/foundationmodels#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/foundationmodels#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/foundationmodels)
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
[ Open Menu ](https://developer.apple.com/documentation/foundationmodels)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/foundationmodels)
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
Framework
# Foundation Models
Perform tasks with the on-device model that specializes in language understanding, structured output, and tool calling.
iOS 26.0+iPadOS 26.0+Mac Catalyst 26.0+macOS 26.0+visionOS 26.0+
## [Overview](https://developer.apple.com/documentation/foundationmodels#overview)
The Foundation Models framework provides access to Apple’s on-device large language model that powers Apple Intelligence to help you perform intelligent tasks specific to your use case. The text-based on-device model identifies patterns that allow for generating new text that’s appropriate for the request you make, and it can make decisions to call code you write to perform specialized tasks.
![An illustration that represents a foundation model.](https://docs-assets.developer.apple.com/published/3231d467ff68acf50b438e1e0f799459/foundation-models-hero%402x.png)
Generate text content based on requests you make. The on-device model excels at a diverse range of text generation tasks, like summarization, entity extraction, text understanding, refinement, dialog for games, generating creative content, and more.
Generate entire Swift data structures with guided generation. With the `@Generable` macro, you can define custom data structures and the framework provides strong guarantees that the model generates instances of your type.
To expand what the on-device foundation model can do, use [`Tool`](https://developer.apple.com/documentation/foundationmodels/tool) to create custom tools that the model can call to assist with handling your request. For example, the model can call a tool that searches a local or online database for information, or calls a service in your app.
To use the on-device language model, people need to turn on Apple Intelligence on their device. For a list of supported devices, see [Apple Intelligence](https://www.apple.com/apple-intelligence/).
For more information about acceptable usage of the Foundation Models framework, see [Acceptable use requirements for the Foundation Models framework](https://developer.apple.com/apple-intelligence/acceptable-use-requirements-for-the-foundation-models-framework).
### [Related videos](https://developer.apple.com/documentation/foundationmodels#Related-videos)
[![](https://devimages-cdn.apple.com/wwdc-services/images/3055294D-836B-4513-B7B0-0BC5666246B0/5647196D-90F3-4FC0-851F-7CF0F69BE7D2/9965_wide_250x141_1x.jpg) Meet the Foundation Models framework  ](https://developer.apple.com/videos/play/wwdc2025/286)
[![](https://devimages-cdn.apple.com/wwdc-services/images/3055294D-836B-4513-B7B0-0BC5666246B0/7313793F-4445-4EB0-A94B-B05549BCD658/9967_wide_250x141_1x.jpg) Deep dive into the Foundation Models framework  ](https://developer.apple.com/videos/play/wwdc2025/301)
[![](https://devimages-cdn.apple.com/wwdc-services/images/3055294D-836B-4513-B7B0-0BC5666246B0/35DFBB3F-0CA9-4722-BDB1-EDC5860F638E/9966_wide_250x141_1x.jpg) Code-along: Bring on-device AI to your app using the Foundation Models framework  ](https://developer.apple.com/videos/play/wwdc2025/259)
## [Topics](https://developer.apple.com/documentation/foundationmodels#topics)
### [Essentials](https://developer.apple.com/documentation/foundationmodels#Essentials)
[Generating content and performing tasks with Foundation Models](https://developer.apple.com/documentation/foundationmodels/generating-content-and-performing-tasks-with-foundation-models)
Enhance the experience in your app by prompting an on-device large language model.
[Improving the safety of generative model output](https://developer.apple.com/documentation/foundationmodels/improving-the-safety-of-generative-model-output)
Create generative experiences that appropriately handle sensitive inputs and respect people.
[Supporting languages and locales with Foundation Models](https://developer.apple.com/documentation/foundationmodels/supporting-languages-and-locales-with-foundation-models)
Generate content in the language people prefer when they interact with your app.
[Adding intelligent app features with generative models](https://developer.apple.com/documentation/foundationmodels/adding-intelligent-app-features-with-generative-models)
Build robust apps with guided generation and tool calling by adopting the Foundation Models framework.
[`class SystemLanguageModel`](https://developer.apple.com/documentation/foundationmodels/systemlanguagemodel)
An on-device large language model capable of text generation tasks.
[`struct UseCase`](https://developer.apple.com/documentation/foundationmodels/systemlanguagemodel/usecase)
A type that represents the use case for prompting.
### [Prompting](https://developer.apple.com/documentation/foundationmodels#Prompting)
[Prompting an on-device foundation model](https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model)
Tailor your prompts to get effective results from an on-device model.
[Analyzing the runtime performance of your Foundation Models app](https://developer.apple.com/documentation/foundationmodels/analyzing-the-runtime-performance-of-your-foundation-models-app)
Optimize token consumption and improve response times by profiling your app’s model usage with Instruments.
[`class LanguageModelSession`](https://developer.apple.com/documentation/foundationmodels/languagemodelsession)
An object that represents a session that interacts with a language model.
[`struct Instructions`](https://developer.apple.com/documentation/foundationmodels/instructions)
Details you provide that define the model’s intended behavior on prompts.
[`struct Prompt`](https://developer.apple.com/documentation/foundationmodels/prompt)
A prompt from a person to the model.
[`struct Transcript`](https://developer.apple.com/documentation/foundationmodels/transcript)
A linear history of entries that reflect an interaction with a session.
[`struct GenerationOptions`](https://developer.apple.com/documentation/foundationmodels/generationoptions)
Options that control how the model generates its response to a prompt.
### [Guided generation](https://developer.apple.com/documentation/foundationmodels#Guided-generation)
[Generating Swift data structures with guided generation](https://developer.apple.com/documentation/foundationmodels/generating-swift-data-structures-with-guided-generation)
Create robust apps by describing output you want programmatically.
[`protocol Generable`](https://developer.apple.com/documentation/foundationmodels/generable)
A type that the model uses when responding to prompts.
### [Tool calling](https://developer.apple.com/documentation/foundationmodels#Tool-calling)
[Expanding generation with tool calling](https://developer.apple.com/documentation/foundationmodels/expanding-generation-with-tool-calling)
Build tools that enable the model to perform tasks that are specific to your use case.
[Generate dynamic game content with guided generation and tools](https://developer.apple.com/documentation/foundationmodels/generate-dynamic-game-content-with-guided-generation-and-tools)
Make gameplay more lively with AI generated dialog and encounters personalized to the player.
[`protocol Tool`](https://developer.apple.com/documentation/foundationmodels/tool)
A tool that a model can call to gather information at runtime or perform side effects.
### [Feedback](https://developer.apple.com/documentation/foundationmodels#Feedback)
[`struct LanguageModelFeedback`](https://developer.apple.com/documentation/foundationmodels/languagemodelfeedback)
Feedback appropriate for logging or attaching to Feedback Assistant.
Current page is Foundation Models 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Ffoundationmodels).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
