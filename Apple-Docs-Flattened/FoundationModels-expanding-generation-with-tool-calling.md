Source: https://developer.apple.com/documentation/FoundationModels/expanding-generation-with-tool-calling

[ Skip Navigation ](https://developer.apple.com/documentation/FoundationModels/expanding-generation-with-tool-calling#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/FoundationModels/expanding-generation-with-tool-calling#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/FoundationModels/expanding-generation-with-tool-calling)
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
[ Open Menu ](https://developer.apple.com/documentation/FoundationModels/expanding-generation-with-tool-calling)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/FoundationModels/expanding-generation-with-tool-calling)
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
  * [ Expanding generation with tool calling ](https://developer.apple.com/documentation/FoundationModels/expanding-generation-with-tool-calling)
  *     * Expanding generation with tool calling 


Article
# Expanding generation with tool calling
Build tools that enable the model to perform tasks that are specific to your use case.
## [Overview](https://developer.apple.com/documentation/FoundationModels/expanding-generation-with-tool-calling#overview)
Tools provide a way to extend the functionality of the model for your own use cases. Tool-calling allows the model to interact with external code you create to fetch up-to-date information, ground responses in sources of truth that you provide, and perform side effects, like turning on dark mode.
You can create tools that enable the model to:
  * Query entries from your app’s database and reference them in its answer.
  * Perform actions within your app, like adjusting the difficulty in a game or making a web request to get additional information.
  * Integrate with other frameworks, like [Contacts](https://developer.apple.com/documentation/Contacts) or [HealthKit](https://developer.apple.com/documentation/HealthKit), that use existing privacy and security mechanisms.


## [Create a custom tool for your task](https://developer.apple.com/documentation/FoundationModels/expanding-generation-with-tool-calling#Create-a-custom-tool-for-your-task)
When you prompt the model with a question or make a request, the model decides whether it can provide an answer or if it needs the help of a tool. When the model determines that a tool can help, it calls the tool with additional arguments that the tool can use. After the tool completes the task, it returns control back to the model with information about what the tool did. The model can then use the output of the tool when it provides the final response.
Before creating a tool, it’s helpful to understand the pattern the framework follows when using the tool you provide. The framework processes a request in six phases:
  1. You present a list of available tools and their parameters to the model.
  2. You submit your prompt to the model.
  3. The model generates arguments to the tool(s) it wants to invoke.
  4. Your tool runs code on behalf of the model, using the model’s generated arguments.
  5. Your tool passes its output back to the model.
  6. The model produces a final response to the prompt, based on the tool output.


A tool conforms to [`Tool`](https://developer.apple.com/documentation/foundationmodels/tool) and contains the arguments that the tool accepts, and a method that the model calls when it wants to use the tool. You can call [`call(arguments:)`](https://developer.apple.com/documentation/foundationmodels/tool/call\(arguments:\)) concurrently with itself or with other tools. The following example shows a tool that accepts a search term and a number of recipes to retrieve:
```
struct BreadDatabaseTool: Tool {
    let name = "searchBreadDatabase"
    let description = "Searches a local database for bread recipes."


    @Generable
    struct Arguments {
        @Guide(description: "The type of bread to search for")
        var searchTerm: String
        @Guide(description: "The number of recipes to get", .range(1...6))
        var limit: Int
    }


    struct Recipe {
        var name: String
        var description: String
        var link: URL
    }
    
    func call(arguments: Arguments) async throws -> [String] {
        var recipes: [Recipe] = []
        
        // Put your code here to retrieve a list of recipes from your database.
        
        let formattedRecipes = recipes.map {
            "Recipe for '\($0.name)': \($0.description) Link: \($0.link)"
        }
        return formattedRecipes
    }
}

```

When you provide descriptions to generable properties, you help the model understand the semantics of the arguments. Keep descriptions as short as possible because long descriptions take up context size and can introduce latency. For more information on managing the context window size, see [TN3193: Managing the on-device foundation model’s context window](https://developer.apple.com/documentation/Technotes/tn3193-managing-the-on-device-foundation-model-s-context-window).
Tools use guided generation for the [`Arguments`](https://developer.apple.com/documentation/foundationmodels/tool/arguments) property. For more information about guided generation, see [Generating Swift data structures with guided generation](https://developer.apple.com/documentation/foundationmodels/generating-swift-data-structures-with-guided-generation).
## [Provide a session with the tool you create](https://developer.apple.com/documentation/FoundationModels/expanding-generation-with-tool-calling#Provide-a-session-with-the-tool-you-create)
When you create a session, you can provide a list of tools that are relevant to the task you want to complete. The tools you provide are available for all future interactions with the session. The following example initializes a session with a tool that the model can call when it determines that it would help satisfy the prompt:
```
let session = LanguageModelSession(
    tools: [BreadDatabaseTool()]
)


let response = try await session.respond(
    to: "Find three sourdough bread recipes"
)

```

Tool output can be a string, or a [`GeneratedContent`](https://developer.apple.com/documentation/foundationmodels/generatedcontent) object. The model can call a tool multiple times in parallel to satisfy the request, like when retrieving weather details for several cities:
```
struct WeatherTool: Tool {
  let name = "getWeather"
  let description = "Retrieve the latest weather information for a city"


  @Generable
  struct Arguments {
      @Guide(description: "The city to get weather information for")
      var city: String
  }


  struct Forecast: Encodable {
      var city: String
      var temperature: Int
  }


  func call(arguments: Arguments) async throws -> String {
      // Get a random temperature value. Use `WeatherKit` to get 
      // a temperature for the city.
      let temperature = Int.random(in: 30...100)
      let formattedResult = """
          The forecast for '\(arguments.city)' is '\(temperature)' \
          degrees Fahrenheit. 
          """
      return formattedResult
  }
}


// Create a session with default instructions that guide the requests.
let session = LanguageModelSession(
    tools: [WeatherTool()],
    instructions: "Help the person with getting weather information"
)


// Make a request that compares the temperature between several locations.
let response = try await session.respond(
    to: "Is it hotter in Boston, Wichita, or Pittsburgh?"
)

```

## [Handle errors thrown by a tool](https://developer.apple.com/documentation/FoundationModels/expanding-generation-with-tool-calling#Handle-errors-thrown-by-a-tool)
When an error happens during tool calling, the session throws a [`LanguageModelSession.ToolCallError`](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/toolcallerror) with the underlying error and includes the tool that throws the error. This helps you understand the error that happened during the tool call, and any custom error types that your tool produces. You can throw errors from your tools to escape calls when you detect something is wrong, like when the person using your app doesn’t allow access to the required data or a network call is taking longer than expected. Alternatively, your tool can return a string that briefly tells the model what didn’t work, like “Cannot access the database.”
```
do {
    let answer = try await session.respond("Find a recipe for tomato soup.")
} catch let error as LanguageModelSession.ToolCallError {
        
    // Access the name of the tool, like BreadDatabaseTool.
    print(error.tool.name) 
        
    // Access an underlying error that your tool throws and check if the tool 
    // encounters a specific condition.
    if case .databaseIsEmpty = error.underlyingError as? SearchBreadDatabaseToolError {
        // Display an error in the UI.
    }


} catch {
    print("Some other error: \(error)")
}

```

## [Inspect the call graph](https://developer.apple.com/documentation/FoundationModels/expanding-generation-with-tool-calling#Inspect-the-call-graph)
A session contains an observable [`transcript`](https://developer.apple.com/documentation/foundationmodels/languagemodelsession/transcript) property that allows you to track when, and how many times, the model calls your tools. A transcript also provides the ability to construct a representation of the call graph for debugging purposes and pairs well with [SwiftUI](https://developer.apple.com/documentation/SwiftUI) to visualize session history.
```
struct MyHistoryView: View {


    @State
    var session = LanguageModelSession(
        tools: [BreadDatabaseTool()]
    )
    
    var body: some View {
        List(session.transcript) { entry in
            switch entry {       
            case .instructions(let instructions):
                // Display the instructions the model uses.
            case .prompt(let prompt):
                // Display the prompt made to the model.
            case .toolCall(let call):
                // Display the call details for a tool, like the tool name and arguments.        
            case .toolOutput(let output):
                // Display the output that a tool provides back to the model.        
            case .response(let response):
                // Display the response from the model.
            }
        }.task {
            do {
                try await session.respond(to: "Find a milk bread recipe.")
            } catch let error {
                // Handle the error.
            }
        }
    }
    
}

```

## [See Also](https://developer.apple.com/documentation/FoundationModels/expanding-generation-with-tool-calling#see-also)
### [Tool calling](https://developer.apple.com/documentation/FoundationModels/expanding-generation-with-tool-calling#Tool-calling)
[Generate dynamic game content with guided generation and tools](https://developer.apple.com/documentation/foundationmodels/generate-dynamic-game-content-with-guided-generation-and-tools)
Make gameplay more lively with AI generated dialog and encounters personalized to the player.
[`protocol Tool`](https://developer.apple.com/documentation/foundationmodels/tool)
A tool that a model can call to gather information at runtime or perform side effects.
Current page is Expanding generation with tool calling 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FFoundationModels%2Fexpanding-generation-with-tool-calling).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
