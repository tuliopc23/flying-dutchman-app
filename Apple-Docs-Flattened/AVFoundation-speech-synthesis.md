Source: https://developer.apple.com/documentation/avfoundation/speech-synthesis

[ Skip Navigation ](https://developer.apple.com/documentation/avfoundation/speech-synthesis#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/avfoundation/speech-synthesis#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/avfoundation/speech-synthesis)
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
[ Open Menu ](https://developer.apple.com/documentation/avfoundation/speech-synthesis)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/avfoundation/speech-synthesis)


[](https://developer.apple.com/documentation/avfoundation/speech-synthesis)
## [ AVFoundation  ](https://developer.apple.com/documentation/avfoundation)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
29 of 31 symbols inside <root> containing 116 symbols[AVError](https://developer.apple.com/documentation/avfoundation/averror-swift.struct)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
19 of 31 symbols inside <root>
Editing
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
20 of 31 symbols inside <root> containing 7 symbols[Composite assets](https://developer.apple.com/documentation/avfoundation/composite-assets)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
21 of 31 symbols inside <root> containing 20 symbols[QuickTime movies](https://developer.apple.com/documentation/avfoundation/quicktime-movies)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
22 of 31 symbols inside <root> containing 14 symbols[Video effects](https://developer.apple.com/documentation/avfoundation/video-effects)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
23 of 31 symbols inside <root> containing 5 symbols[Audio mixing](https://developer.apple.com/documentation/avfoundation/audio-mixing)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
24 of 31 symbols inside <root>
Audio
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
25 of 31 symbols inside <root> containing 13 symbols[Audio playback, recording, and processing](https://developer.apple.com/documentation/avfoundation/audio-playback-recording-and-processing)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
26 of 31 symbols inside <root> containing 7 symbols[Speech synthesis](https://developer.apple.com/documentation/avfoundation/speech-synthesis)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 7 symbols inside -379275174 
Spoken text attributes
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
2 of 7 symbols inside -379275174 [AVSpeechUtterance](https://developer.apple.com/documentation/avfaudio/avspeechutterance)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
3 of 7 symbols inside -379275174 [AVSpeechSynthesisVoice](https://developer.apple.com/documentation/avfaudio/avspeechsynthesisvoice)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 7 symbols inside -379275174 
Speech synthesis controls
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
5 of 7 symbols inside -379275174 [AVSpeechSynthesizer](https://developer.apple.com/documentation/avfaudio/avspeechsynthesizer)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 7 symbols inside -379275174 
Speech synthesis audio unit
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
7 of 7 symbols inside -379275174 [AVSpeechSynthesisProviderAudioUnit](https://developer.apple.com/documentation/avfaudio/avspeechsynthesisprovideraudiounit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
27 of 31 symbols inside <root>
Errors
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
V
28 of 31 symbols inside <root> [let AVFoundationErrorDomain: String](https://developer.apple.com/documentation/avfoundation/avfoundationerrordomain)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
29 of 31 symbols inside <root> containing 116 symbols[AVError](https://developer.apple.com/documentation/avfoundation/averror-swift.struct)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
30 of 31 symbols inside <root>
Macros
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
31 of 31 symbols inside <root> containing 2 symbols[Macros](https://developer.apple.com/documentation/avfoundation/avfoundation-macros)
38 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Collection
  * [ AVFoundation ](https://developer.apple.com/documentation/avfoundation)
  * [ Speech synthesis ](https://developer.apple.com/documentation/avfoundation/speech-synthesis)
  *     * Speech synthesis 


# Speech synthesis
Configure voices to speak strings of text.
## [Overview](https://developer.apple.com/documentation/avfoundation/speech-synthesis#overview)
The Speech Synthesis framework manages voice and speech synthesis, and requires two primary tasks:
Create an [`AVSpeechUtterance`](https://developer.apple.com/documentation/AVFAudio/AVSpeechUtterance) instance that contains the text to speak. Optionally, configure speech parameters, such as voice and rate, for each utterance.
```
// Create an utterance.
let utterance = AVSpeechUtterance(string: "The quick brown fox jumped over the lazy dog.")


// Configure the utterance.
utterance.rate = 0.57
utterance.pitchMultiplier = 0.8
utterance.postUtteranceDelay = 0.2
utterance.volume = 0.8


// Retrieve the British English voice.
let voice = AVSpeechSynthesisVoice(language: "en-GB")


// Assign the voice to the utterance.
utterance.voice = voice

```

Pass the utterance to an [`AVSpeechSynthesizer`](https://developer.apple.com/documentation/AVFAudio/AVSpeechSynthesizer) instance to produce spoken audio.
```
// Create a speech synthesizer.
let synthesizer = AVSpeechSynthesizer()


// Tell the synthesizer to speak the utterance.
synthesizer.speak(utterance)

```

Optionally, use the speech synthesizer instance to control or respond to ongoing speech; for example, assign its [`delegate`](https://developer.apple.com/documentation/AVFAudio/AVSpeechSynthesizer/delegate) to receive speech event notifications.
Note
Speech generation occurs on device and isn’t sent to a server for processing.
## [Topics](https://developer.apple.com/documentation/avfoundation/speech-synthesis#topics)
### [Spoken text attributes](https://developer.apple.com/documentation/avfoundation/speech-synthesis#Spoken-text-attributes)
[`class AVSpeechUtterance`](https://developer.apple.com/documentation/AVFAudio/AVSpeechUtterance)
An object that encapsulates the text for speech synthesis and parameters that affect the speech.
[`class AVSpeechSynthesisVoice`](https://developer.apple.com/documentation/AVFAudio/AVSpeechSynthesisVoice)
A distinct voice for use in speech synthesis.
### [Speech synthesis controls](https://developer.apple.com/documentation/avfoundation/speech-synthesis#Speech-synthesis-controls)
[`class AVSpeechSynthesizer`](https://developer.apple.com/documentation/AVFAudio/AVSpeechSynthesizer)
An object that produces synthesized speech from text utterances and enables monitoring or controlling of ongoing speech.
### [Speech synthesis audio unit](https://developer.apple.com/documentation/avfoundation/speech-synthesis#Speech-synthesis-audio-unit)
[`class AVSpeechSynthesisProviderAudioUnit`](https://developer.apple.com/documentation/AVFAudio/AVSpeechSynthesisProviderAudioUnit)
An object that generates speech from text.
## [See Also](https://developer.apple.com/documentation/avfoundation/speech-synthesis#see-also)
### [Audio](https://developer.apple.com/documentation/avfoundation/speech-synthesis#Audio)
[API Reference Audio playback, recording, and processing](https://developer.apple.com/documentation/avfoundation/audio-playback-recording-and-processing)
Play, record, and process audio; configure your app’s system audio behavior.
Current page is Speech synthesis 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Favfoundation%2Fspeech-synthesis).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
