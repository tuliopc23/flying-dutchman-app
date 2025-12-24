Source: https://developer.apple.com/documentation/storekit/message

[ Skip Navigation ](https://developer.apple.com/documentation/storekit/message#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/storekit/message#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/storekit/message)
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
[ Open Menu ](https://developer.apple.com/documentation/storekit/message)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/storekit/message)
## [ StoreKit  ](https://developer.apple.com/documentation/storekit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 33 symbols inside <root>
In-App Purchase
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 33 symbols inside <root>
In-App Purchase
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
2 of 33 symbols inside <root> containing 60 symbols[In-App Purchase](https://developer.apple.com/documentation/storekit/in-app-purchase)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 33 symbols inside <root> [Understanding StoreKit workflows](https://developer.apple.com/documentation/storekit/understanding-storekit-workflows)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 33 symbols inside <root> [Getting started with In-App Purchase using StoreKit views](https://developer.apple.com/documentation/storekit/getting-started-with-in-app-purchases-using-storekit-views)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 33 symbols inside <root>
App transaction
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 33 symbols inside <root> [Supporting business model changes by using the app transaction](https://developer.apple.com/documentation/storekit/supporting-business-model-changes-by-using-the-app-transaction)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
7 of 33 symbols inside <root> containing 29 symbols[AppTransaction](https://developer.apple.com/documentation/storekit/apptransaction)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 33 symbols inside <root>
Messages
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
9 of 33 symbols inside <root> containing 7 symbols[Message](https://developer.apple.com/documentation/storekit/message)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 7 symbols inside 1584344176 
Getting messages and message reasons
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
2 of 7 symbols inside 1584344176 [static var messages: Message.Messages](https://developer.apple.com/documentation/storekit/message/messages-swift.type.property)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
3 of 7 symbols inside 1584344176 [let reason: Message.Reason](https://developer.apple.com/documentation/storekit/message/reason-swift.property)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
4 of 7 symbols inside 1584344176 [Message.Messages](https://developer.apple.com/documentation/storekit/message/messages-swift.struct)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
5 of 7 symbols inside 1584344176 containing 7 symbols[Message.Reason](https://developer.apple.com/documentation/storekit/message/reason-swift.struct)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 7 symbols inside 1584344176 
Displaying messages
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
7 of 7 symbols inside 1584344176 [func display(in: UIWindowScene) throws](https://developer.apple.com/documentation/storekit/message/display\(in:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
10 of 33 symbols inside <root> containing 7 symbols[Message.Reason](https://developer.apple.com/documentation/storekit/message/reason-swift.struct)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
11 of 33 symbols inside <root> containing 2 symbols[DisplayMessageAction](https://developer.apple.com/documentation/storekit/displaymessageaction)
40 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ StoreKit ](https://developer.apple.com/documentation/storekit)
  * [ Message ](https://developer.apple.com/documentation/storekit/message)
  *     * Message 


Structure
# Message
An instance for receiving and displaying App Store messages in your app.
iOS 16.0+iPadOS 16.0+Mac Catalyst 16.0+visionOS 1.0+
```
struct Message
```

## [ Mentioned in ](https://developer.apple.com/documentation/storekit/message#mentions)
[](https://developer.apple.com/documentation/storekit/merchandising-win-back-offers-in-your-app)
[](https://developer.apple.com/documentation/storekit/testing-win-back-offers-in-the-sandbox-environment)
[](https://developer.apple.com/documentation/storekit/choosing-a-storekit-api-for-in-app-purchases)
[](https://developer.apple.com/documentation/storekit/testing-failing-subscription-renewals-and-in-app-purchases)
## [Overview](https://developer.apple.com/documentation/storekit/message#overview)
A StoreKit message represents a sheet that appears over your app to display important information from the App Store. Messages have a reason, which the [`reason`](https://developer.apple.com/documentation/storekit/message/reason-swift.property) value indicates. StoreKit retrieves any messages from the App Store each time your app launches, and presents them by default.
Note
StoreKit displays messages from the App Store regardless of the SDK version you use to build your app. Apps built for iOS 16 and later can implement a message listener and delay or suppress messages.
You can optionally use the `Message` API to control message presentation by delaying or suppressing messages. Your app can listen for messages with the [`messages`](https://developer.apple.com/documentation/storekit/message/messages-swift.type.property) asynchronous sequence, and can display them at a particular time by calling [`display(in:)`](https://developer.apple.com/documentation/storekit/message/display\(in:\)), or [`DisplayMessageAction`](https://developer.apple.com/documentation/storekit/displaymessageaction) for SwiftUI views. For example, you may choose to delay messages in views where an interrupting sheet might confuse someone, such as in the middle of an onboarding flow, or if your app is providing real-time instructions.
StoreKit presents message sheets only if a message is still relevant. For example, if a person resolves the issue outside your app before it calls [`display(in:)`](https://developer.apple.com/documentation/storekit/message/display\(in:\)), StoreKit doesn’t present the message. StoreKit ensures that it presents each unique message once, even if the app asks to display messages multiple times.
### [Listen for and display messages](https://developer.apple.com/documentation/storekit/message#Listen-for-and-display-messages)
If you want to defer or suppress App Store messages, set up the message listener in your app when your app launches.
To control when a message may display, call [`display(in:)`](https://developer.apple.com/documentation/storekit/message/display\(in:\)) or [`DisplayMessageAction`](https://developer.apple.com/documentation/storekit/displaymessageaction) when your app’s ready to have StoreKit present the message. If your app doesn’t call either of these APIs after it listens for messages, it suppresses the messages. The following example is for apps that use [UIKit](https://developer.apple.com/documentation/UIKit):
```
// Listen for App Store messages.
for await message in StoreKit.Message.messages {
    // Call display on the message when the app is ready.
}


// Indicate the app is ready to display the message.
guard let windowScene = self.view.window?.windowScene else {
    fatalError("Could not get window scene.")
}
try? message.display(in: windowScene)

```

For a code example that uses SwiftUI, see [`DisplayMessageAction`](https://developer.apple.com/documentation/storekit/displaymessageaction).
## [Topics](https://developer.apple.com/documentation/storekit/message#topics)
### [Getting messages and message reasons](https://developer.apple.com/documentation/storekit/message#Getting-messages-and-message-reasons)
[`static var messages: Message.Messages`](https://developer.apple.com/documentation/storekit/message/messages-swift.type.property)
The asynchronous sequence that sends a message when the App Store creates it.
[`let reason: Message.Reason`](https://developer.apple.com/documentation/storekit/message/reason-swift.property)
The reason that the App Store sends the message.
[`struct Messages`](https://developer.apple.com/documentation/storekit/message/messages-swift.struct)
An asynchronous sequence of messages from the App Store.
[`struct Reason`](https://developer.apple.com/documentation/storekit/message/reason-swift.struct)
Reasons for the App Store messages.
### [Displaying messages](https://developer.apple.com/documentation/storekit/message#Displaying-messages)
[`func display(in: UIWindowScene) throws`](https://developer.apple.com/documentation/storekit/message/display\(in:\))
Requests the system to display the App Store message in the window scene.
## [Relationships](https://developer.apple.com/documentation/storekit/message#relationships)
### [Conforms To](https://developer.apple.com/documentation/storekit/message#conforms-to)
  * [`Copyable`](https://developer.apple.com/documentation/Swift/Copyable)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)


## [See Also](https://developer.apple.com/documentation/storekit/message#see-also)
### [Messages](https://developer.apple.com/documentation/storekit/message#Messages)
[`struct Reason`](https://developer.apple.com/documentation/storekit/message/reason-swift.struct)
Reasons for the App Store messages.
[`struct DisplayMessageAction`](https://developer.apple.com/documentation/storekit/displaymessageaction)
An instance that asks StoreKit to display an App Store message, if appropriate.
Current page is Message 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fstorekit%2Fmessage).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
