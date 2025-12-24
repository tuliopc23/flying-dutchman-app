Source: https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model

[ Skip Navigation ](https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model)
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
[ Open Menu ](https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model)
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
  * [ Prompting an on-device foundation model ](https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model)
  *     * Prompting an on-device foundation model 


Article
# Prompting an on-device foundation model
Tailor your prompts to get effective results from an on-device model.
## [Overview](https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model#overview)
Many prompting techniques are designed for server-based “frontier” foundation models, because they have a larger context window and thinking capabilities. However, when prompting an on-device model, your prompt engineering technique is even more critical because the model you access is much smaller.
To generate accurate, hallucination-free responses, your prompt needs to be concise and specific. To get a better output from the model, some techniques you can use include:
  * Use simple, clear instructions
  * Iterate and improve your prompt based on the output you receive in testing
  * Provide the model with a reasoning field before answering a prompt
  * Reduce the thinking the model needs to do
  * Split complex prompts into a series of simpler requests
  * Add “logic” to conditional prompts with “if-else” statements
  * Leverage shot-based prompting — such as one-shot, few-shot, or zero-shot prompts — to provide the model with specific examples of what you need


You’ll need to test your prompts throughout development and evaluate the output to provide a great user experience.
## [Concepts for creating great prompts](https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model#Concepts-for-creating-great-prompts)
With prompt engineering, you structure your requests by refining how you phrase questions, provide context, and format instructions. It also requires testing and iteration of your input to get the results your app needs.
You can also structure prompts to make the model’s response depend on specific conditions or criteria in the input. For example, instead of giving one fixed instruction you can include different conditions, like:
_If it’s a question, answer it directly. If it’s a statement, ask a follow-up question._
## [Keep prompts simple and clear](https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model#Keep-prompts-simple-and-clear)
Effective prompts use simple language that tells the model what output you want it to provide. The model processes text in units, called _tokens_ , and each model has a maximum number of tokens it can process — the context window size. An on-device model has fewer parameters and a small context window, so it doesn’t have the resources to handle long or confusing prompts. Input to a frontier model might be the length of a full document, but your input to the on-device model needs to be short and succinct. Ask yourself whether your prompt is understandable to a human if they read it quickly, and consider additional strategies to adjust your tone and writing style:
✅ Prompting strategies to use | 🚫 Prompting strategies to avoid  
---|---  
Focus on a single, well-defined goal | Combining multiple unrelated requests  
Be direct with imperative verbs like “List” or “Create” | Unnecessary politeness or hedging  
Tell the model what role to play, for example, an interior designer | Passive voice, for example, “code needs to be optimized”  
Write in direct, conversational tone with simple, clear sentences | Jargon the model might not understand or interpret incorrectly  
State your request clearly | Too short of a prompt that doesn’t outline the task  
Limit your prompt to one to three paragraphs | Too long of a prompt that makes it hard to identify what the task is  
An on-device model may get confused with a long and indirect instruction because it contains unnecessary language that doesn’t add value. Instead of indirectly implying what the model needs to do, write a direct command to improve the clarity of the prompt for better results. This clarity also reduces the complexity and context window size for the on-device model.
✅ **Concise and direct**
_Given a person’s home-decor transactions and search history, generate three categories they might be interested in, starting with the most relevant category. Generate two more categories related to home-decor but that are not in their transaction or search history._
🚫 **Long and indirect**
_The person’s input contains their recent home-decor transaction history along with their recent search history. The response should be a list of existing categories of content the person might be interested relevant to their search and transactions, ordered so that the first categories in the list are most relevant. For inspiration, the response should also include new categories that spark creative ideas that aren’t covered in any of the categories you generate._
For more information on managing the context window size, see [TN3193: Managing the on-device foundation model’s context window](https://developer.apple.com/documentation/Technotes/tn3193-managing-the-on-device-foundation-model-s-context-window).
## [Give the model a role, persona, and tone](https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model#Give-the-model-a-role-persona-and-tone)
By default, the on-device model typically responds to questions in a neutral and respectful tone, with a business-casual persona. Similar to frontier models, you can provide a role or persona to dramatically change how the on-device model responds to your prompt.
A _role_ is the functional position or job that you instruct the model to assume, while a _persona_ reflects the personality of the model. You often use both in prompts; for example:
_You are a senior software engineer who values mentoring junior developers._
Here the role is “a senior software engineer,” and the persona is “mentoring junior developers.”
The model phrases its response differently to match a persona, for example, “mentoring junior developers” or “evaluating developer coding” even when you give it the same input for the same task.
To give the model a role, use the phrase “you are”:
**English Teacher**
_You are an expert English teacher. Provide feedback on the person’s sentence to help them improve clarity._
**Cowboy**
_You are a lively cowboy who loves to chat about horses and make jokes. Provide feedback on the person’s sentence to help them improve clarity._
Use the phrase “expert” to get the model to speak with more authority and detail on a topic.
Similarly, change the model’s behavior by providing a role or persona for the person using your app. By default, the on-device model thinks it’s talking to a person, so tell the model more about who _that_ person is:
**Student**
_The person is a first-grade English student. Give the person feedback on their writing._
**Ghost**
_Greet a customer who enters your alchemy shop. The customer is a friendly ghost._
The student persona causes the model to respond as if speaking to a child in the first grade, while the ghost persona causes the model to respond as if speaking to a ghost in an alchemy shop.
Change the model’s tone by writing your prompt in a voice you want the model to match. For example, if you write your prompt in a peppy and cheerful way, or talk like a cowboy, the model responds with a matching tone.
**Professional**
_Communicate as an experienced interior designer consulting with a client. Occasionally reference design elements like harmony, proportion, or focal points._
**Medieval Scholar**
_Communicate as a learned scribe from a medieval library. Use slightly archaic language (“thou shalt,” “wherein,” “henceforth”) but keep it readable.”_
## [Iterate and improve instruction following](https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model#Iterate-and-improve-instruction-following)
_Instruction following_ refers to a foundation model’s ability to carry out a request exactly as written in your [`Prompt`](https://developer.apple.com/documentation/foundationmodels/prompt) and [`Instructions`](https://developer.apple.com/documentation/foundationmodels/instructions). Prompt engineering involves iteration to test and refine input — based on the results you get — to improve accuracy and consistency. If you notice the model isn’t following instructions as well as you need, consider the following strategies:
Strategy | Approach  
---|---  
Improve clarity | Improve the wording of your input to make it more direct, concise, and easier to read.  
Use emphasis | Emphasize the importance of a command by adding words like “must, “should”, “do not” or avoid”.  
Repeat yourself | Try repeating key instructions at the end of your input to emphasize the importance.  
Instead of trying to enforce accuracy, use a succinct prompt like “Answer this question” and evaluate the results you get.
After you try any strategy, take the time to evaluate it to see if the result gets closer to what you need. If the model can’t follow your prompt, it might be unreliable in some use cases. Try cutting back the number of times you repeat a phrase, or the number of words you emphasize, to make your prompt more effective. Unreliable prompts break easily when conditions change slightly.
Another prompting strategy is to split your request into a series of simpler requests. This is particularly useful after trying different strategies that don’t improve the quality of the results.
## [Reduce how much thinking the model needs to do](https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model#Reduce-how-much-thinking-the-model-needs-to-do)
A model’s reasoning ability is how well it thinks through a problem like a human, handles logical puzzles, or creates a logical plan to handle a request. Because of their smaller size, on-device models have limited reasoning abilities. You may be able to help an on-device model _think through_ a challenging task by providing additional support for its reasoning.
For complex tasks, simple language prompts might not have enough detail about how the model can accomplish a task. Instead, reduce the reasoning burden on the model by giving it a step-by-step plan. This approach tells the model more precisely how to do the task:
**Step-by-step**
_Given a person’s home-decor transactions and search history related to couches:_
_1. Choose four home furniture categories that are most relevant to this person._
_2. Recommend two more categories related to home-decor._
_3. Return a list of relevant and recommended categories, ordered by most relevant to least._
If you find the model isn’t accomplishing the task reliably, break up the steps across multiple [`LanguageModelSession`](https://developer.apple.com/documentation/foundationmodels/languagemodelsession) instances to focus on one part at a time with a new context window. Typically, it’s a best practice to start with a single request because multiple requests can result in longer inference time. But, if the result doesn’t meet your expectations, try splitting steps into multiple requests.
## [Turn conditional prompting into programming logic](https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model#Turn-conditional-prompting-into-programming-logic)
_Conditional_ prompting is where you embed if-else logic into your prompt. A server-based frontier model has the context window and reasoning abilities to handle a lengthy list of instructions for how to handle different requests. An on-device model can handle some conditionals or light reasoning, like:
_Use the weather tool if the person asks about the weather and the calendar tool if the person asks about events._
But, too much conditional complexity can affect the on-device model’s ability to follow instructions.
When the on-device model output doesn’t meet your expectations, try customizing your conditional prompt to the current context. For example, the following conditional prompt contains several sentences that break up what the model needs to do:
```
let instructions = """
    You are a friendly innkeeper. Generate a greeting to a new guest that walks in the door.
    IF the guest is a sorcerer, comment on their magical appearance.
    IF the guest is a bard, ask if they're willing to play music for the inn tonight.
    IF the guest is a soldier, ask if there’s been any dangerous activity in the area.
    There is one single and one double room available.
    """

```

Instead, use programming logic to customize the prompt based on known information:
```
var customGreeting = ""
switch role {
case .bard:
    customGreeting = """
        This guest is a bard. Ask if they’re willing to play music for the inn tonight.
        """
case .soldier:
    customGreeting = """
        This guest is a soldier. Ask if there’s been any dangerous activity in the area.
        """
case .sorcerer:
    customGreeting = """
        This guest is a sorcerer. Comment on their magical appearance.
        """
default:
    customGreeting = "This guest is a weary traveler."
}


let instructions = """
    You are a friendly inn keeper. Generate a greeting to a new guest that walks in the door.
    \(customGreeting)
    There is one single and one double room available.
    """

```

When you customize instructions programmatically, the model doesn’t get distracted or confused by conditionals that don’t apply in the situation. This approach also reduces the context window size.
## [Provide simple input-output examples](https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model#Provide-simple-input-output-examples)
_Few-shot_ prompting is when you provide the on-device model with a few examples of the output you want. For example, the following shows the model different kinds of coffee shop customers it needs to generate:
```
// Instructions that contain JSON key-value pairs that represent the structure
// of a customer. The structure tells the model that each customer must have
// a `name`, `imageDescription`, and `coffeeOrder` fields.
let instructions = """
    Create an NPC customer with a fun personality suitable for the dream realm. \
    Have the customer order coffee. Here are some examples to inspire you:

    {name: "Thimblefoot", imageDescription: "A horse with a rainbow mane", \
    coffeeOrder: "I would like a coffee that's refreshing and sweet, like the grass in a summer meadow."}
    {name: "Spiderkid", imageDescription: "A furry spider with a cool baseball cap", \
    coffeeOrder: "An iced coffee please, that's as spooky as I am!"}
    {name: "Wise Fairy", imageDescription: "A blue, glowing fairy that radiates wisdom and sparkles", \
    coffeeOrder: "Something simple and plant-based, please. A beverage that restores my wise energy."}
    """

```

Few-shot prompting also works with _guided generation_ , which formats the model’s output by using a custom type you define. In the previous prompt, each example might correspond to a [`Generable`](https://developer.apple.com/documentation/foundationmodels/generable) structure you create named `NPC`:
```
@Generable
struct NPC: Equatable {
    let name: String
    let coffeeOrder: String
    let imageDescription: String
}

```

On-device models need simpler examples for few-shot prompts than what you can use with server-based frontier models. Try giving the model between 2-15 examples, and keep each example as simple as possible. If you provide a long or complex example, the on-device model may start to repeat your example or hallucinate details of your example in its response.
For more information on guided generation, see [Generating Swift data structures with guided generation](https://developer.apple.com/documentation/foundationmodels/generating-swift-data-structures-with-guided-generation).
## [Handle on-device reasoning](https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model#Handle-on-device-reasoning)
Reasoning prompt techniques, like “think through this problem step by step”, can result in unexpected text being inserted into your [`Generable`](https://developer.apple.com/documentation/foundationmodels/generable) structure if the model doesn’t have a place for its reasoning. To keep reasoning explanations out of your structure, try giving the model a specific field where it can put its reasoning. Make sure the reasoning field is the first property so the model can provide reasoning details before answering the prompt:
```
@Generable
struct ReasonableAnswer {
    // A property the model uses for reasoning.
    var reasoningSteps: String
    
    @Guide(description: "The answer only.")
    var answer: MyCustomGenerableType // Replace with your custom generable type.
}

```

Using your custom [`Generable`](https://developer.apple.com/documentation/foundationmodels/generable) type, prompt the model:
```
let instructions = """
    Answer the person's question.
    1. Begin your response with a plan to solve this question.
    2. Follow your plan's steps and show your work.
    3. Deliver the final answer in `answer`.
    """
var session = LanguageModelSession(instructions: instructions)


// The answer should be 30 days.
let prompt = "How many days are in the month of September?"
let response = try await session.respond(
    to: prompt,
    generating: ReasonableAnswer.self
)

```

You may see the model fail to reason its way to a correct answer, or it may answer unreliably — occasionally answering correctly, and sometimes not. If this happens, the tasks in your prompt may be too difficult for the on-device model to process, regardless of how you structure the prompt.
## [Provide actionable feedback](https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model#Provide-actionable-feedback)
When you encounter something with the on-device model that you expect to work but it doesn’t, file a report that includes your prompt with Feedback Assistant to help improve the system model. To submit feedback about model behavior through Feedback Assistant, see [`logFeedbackAttachment(sentiment:issues:desiredOutput:)`](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/logfeedbackattachment\(sentiment:issues:desiredoutput:\)).
## [See Also](https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model#see-also)
### [Prompting](https://developer.apple.com/documentation/foundationmodels/prompting-an-on-device-foundation-model#Prompting)
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
Current page is Prompting an on-device foundation model 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Ffoundationmodels%2Fprompting-an-on-device-foundation-model).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
