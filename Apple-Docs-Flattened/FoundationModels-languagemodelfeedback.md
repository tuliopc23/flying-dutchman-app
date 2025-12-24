Source: https://developer.apple.com/documentation/foundationmodels/languagemodelfeedback

[ Skip Navigation ](https://developer.apple.com/documentation/foundationmodels/languagemodelfeedback#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/foundationmodels/languagemodelfeedback#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/foundationmodels/languagemodelfeedback)
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
[ Open Menu ](https://developer.apple.com/documentation/foundationmodels/languagemodelfeedback)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/foundationmodels/languagemodelfeedback)
## [ Foundation Models  ](https://developer.apple.com/documentation/foundationmodels)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 24 symbols inside <root>
Essentials
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
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 4 symbols inside -1427969838 
Creating feedback
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
2 of 4 symbols inside -1427969838 containing 3 symbols[LanguageModelFeedback.Issue](https://developer.apple.com/documentation/foundationmodels/languagemodelfeedback/issue)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
3 of 4 symbols inside -1427969838 containing 4 symbols[LanguageModelFeedback.Sentiment](https://developer.apple.com/documentation/foundationmodels/languagemodelfeedback/sentiment)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 4 symbols inside -1427969838 [func logFeedbackAttachment(sentiment: LanguageModelFeedback.Sentiment?, issues: [LanguageModelFeedback.Issue], desiredOutput: Transcript.Entry?) -> Data](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/logfeedbackattachment\(sentiment:issues:desiredoutput:\))
28 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Foundation Models ](https://developer.apple.com/documentation/foundationmodels)
  * [ LanguageModelFeedback ](https://developer.apple.com/documentation/foundationmodels/languagemodelfeedback)
  *     * LanguageModelFeedback 


Structure
# LanguageModelFeedback
Feedback appropriate for logging or attaching to Feedback Assistant.
iOS 26.0+iPadOS 26.0+Mac Catalyst 26.0+macOS 26.0+visionOS 26.0+
```
struct LanguageModelFeedback
```

## [ Mentioned in ](https://developer.apple.com/documentation/foundationmodels/languagemodelfeedback#mentions)
[](https://developer.apple.com/documentation/foundationmodels/improving-the-safety-of-generative-model-output)
## [Overview](https://developer.apple.com/documentation/foundationmodels/languagemodelfeedback#overview)
`LanguageModelFeedback` is a namespace with structures for describing feedback in a consistent way. [`LanguageModelFeedback.Sentiment`](https://developer.apple.com/documentation/foundationmodels/languagemodelfeedback/sentiment) describes the sentiment of the feedback, while [`LanguageModelFeedback.Issue`](https://developer.apple.com/documentation/foundationmodels/languagemodelfeedback/issue) offers a standard template for issues.
Given a model session, use [`logFeedbackAttachment(sentiment:issues:desiredOutput:)`](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/logfeedbackattachment\(sentiment:issues:desiredoutput:\)) to produce structured feedback.
```
let session = LanguageModelSession()
let response = try await session.respond(to: "What is the capital of France?")


// Create feedback for a problematic response.
let feedbackData = session.logFeedbackAttachment(
    sentiment: LanguageModelFeedback.Sentiment.negative,
    issues: [
        LanguageModelFeedback.Issue(
            category: .incorrect,
            explanation: "The model provided outdated information"
        )
    ],
    desiredOutput: Transcript.Entry.response(...)
)

```

## [Topics](https://developer.apple.com/documentation/foundationmodels/languagemodelfeedback#topics)
### [Creating feedback](https://developer.apple.com/documentation/foundationmodels/languagemodelfeedback#Creating-feedback)
[`struct Issue`](https://developer.apple.com/documentation/foundationmodels/languagemodelfeedback/issue)
An issue with the model’s response.
[`enum Sentiment`](https://developer.apple.com/documentation/foundationmodels/languagemodelfeedback/sentiment)
A sentiment regarding the model’s response.
[`func logFeedbackAttachment(sentiment: LanguageModelFeedback.Sentiment?, issues: [LanguageModelFeedback.Issue], desiredOutput: Transcript.Entry?) -> Data`](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/logfeedbackattachment\(sentiment:issues:desiredoutput:\))
Logs and serializes data that includes session information that you attach when reporting feedback to Apple.
Current page is LanguageModelFeedback 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Ffoundationmodels%2Flanguagemodelfeedback).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
