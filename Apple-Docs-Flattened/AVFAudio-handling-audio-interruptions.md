Source: https://developer.apple.com/documentation/avfaudio/handling-audio-interruptions

[ Skip Navigation ](https://developer.apple.com/documentation/avfaudio/handling-audio-interruptions#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/avfaudio/handling-audio-interruptions#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/avfaudio/handling-audio-interruptions)
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
[ Open Menu ](https://developer.apple.com/documentation/avfaudio/handling-audio-interruptions)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/avfaudio/handling-audio-interruptions)


[](https://developer.apple.com/documentation/avfaudio/handling-audio-interruptions)
## [ AVFAudio  ](https://developer.apple.com/documentation/avfaudio)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 21 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 21 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 21 symbols inside <root> [AVFAudio updates](https://developer.apple.com/documentation/updates/avfaudio)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 21 symbols inside <root>
System audio
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 21 symbols inside <root> [Handling audio interruptions](https://developer.apple.com/documentation/avfaudio/handling-audio-interruptions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 21 symbols inside <root> [Responding to audio route changes](https://developer.apple.com/documentation/avfaudio/responding-to-audio-route-changes)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 21 symbols inside <root> [Routing audio to specific devices in multidevice sessions](https://developer.apple.com/documentation/avfaudio/routing-audio-to-specific-devices-in-multidevice-sessions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 21 symbols inside <root> [Adding synthesized speech to calls](https://developer.apple.com/documentation/avfaudio/adding-synthesized-speech-to-calls)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 21 symbols inside <root> [Capturing stereo audio from built-In microphones](https://developer.apple.com/documentation/avfaudio/capturing-stereo-audio-from-built-in-microphones)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
9 of 21 symbols inside <root> containing 101 symbols[AVAudioSession](https://developer.apple.com/documentation/avfaudio/avaudiosession)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
10 of 21 symbols inside <root> containing 15 symbols[AVAudioApplication](https://developer.apple.com/documentation/avfaudio/avaudioapplication)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
11 of 21 symbols inside <root> containing 6 symbols[AVAudioRoutingArbiter](https://developer.apple.com/documentation/avfaudio/avaudioroutingarbiter)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 21 symbols inside <root>
Basic playback and recording
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
13 of 21 symbols inside <root> containing 43 symbols[AVAudioPlayer](https://developer.apple.com/documentation/avfaudio/avaudioplayer)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
14 of 21 symbols inside <root> containing 30 symbols[AVAudioRecorder](https://developer.apple.com/documentation/avfaudio/avaudiorecorder)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
15 of 21 symbols inside <root> containing 14 symbols[AVMIDIPlayer](https://developer.apple.com/documentation/avfaudio/avmidiplayer)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
16 of 21 symbols inside <root>
Advanced audio processing
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
17 of 21 symbols inside <root> containing 45 symbols[Audio Engine](https://developer.apple.com/documentation/avfaudio/audio-engine)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
18 of 21 symbols inside <root>
Speech synthesis
21 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ AVFAudio ](https://developer.apple.com/documentation/avfaudio)
  * [ Handling audio interruptions ](https://developer.apple.com/documentation/avfaudio/handling-audio-interruptions)
  *     * Handling audio interruptions 


Article
# Handling audio interruptions
Observe audio session notifications to ensure that your app responds appropriately to interruptions.
## [Overview](https://developer.apple.com/documentation/avfaudio/handling-audio-interruptions#overview)
Interruptions are a common part of the iOS and watchOS user experiences. For example, consider the scenario of receiving a phone call while you’re watching a movie in the TV app on your iPhone. In this case, the movie’s audio fades out, playback pauses, and the sound of the call’s ringtone fades in. If you decline the call, control returns to the TV app, and playback begins again as the movie’s audio fades in.
At the center of this behavior is your app’s audio session. As interruptions begin and end, the audio session notifies any registered observers so they can take appropriate action. For example, [`AVPlayer`](https://developer.apple.com/documentation/AVFoundation/AVPlayer) monitors your app’s audio session and automatically pauses playback in response to interruption events. You can monitor these changes by key-value observing the player’s [`timeControlStatus`](https://developer.apple.com/documentation/AVFoundation/AVPlayer/timeControlStatus-swift.property) property, and update your user interface as necessary when the player pauses and resumes playback.
### [Customize the interruption behavior](https://developer.apple.com/documentation/avfaudio/handling-audio-interruptions#Customize-the-interruption-behavior)
Most apps rely on the system’s default interruption behavior. However, [`AVAudioSession`](https://developer.apple.com/documentation/avfaudio/avaudiosession) provides ways to customize the default behavior to better accommodate your app’s needs:
  * Recent iPad models provide a feature that mutes the built-in microphone at the hardware level when the user closes the device’s Smart Folio cover. If your app plays and records audio, you may want to continue playback even if the system mutes the microphone. You can disable the default interruption behavior by setting the [`overrideMutedMicrophoneInterruption`](https://developer.apple.com/documentation/avfaudio/avaudiosession/categoryoptions-swift.struct/overridemutedmicrophoneinterruption) option when configuring your audio session.
  * System alerts, such as receiving an incoming phone call, interrupt the active audio session. If you prefer that the system not interrupt your app’s audio session in these cases, you can indicate this preference by setting a value for the [`setPrefersNoInterruptionsFromSystemAlerts(_:)`](https://developer.apple.com/documentation/avfaudio/avaudiosession/setprefersnointerruptionsfromsystemalerts\(_:\)) method.


### [Observe audio session interruptions](https://developer.apple.com/documentation/avfaudio/handling-audio-interruptions#Observe-audio-session-interruptions)
You can directly observe interruption notifications that [`AVAudioSession`](https://developer.apple.com/documentation/avfaudio/avaudiosession) posts. This might be useful if you want to know when the system pauses playback due to an interruption or another reason, such as a route change. To respond to audio interruptions, observe notifications of type [`interruptionNotification`](https://developer.apple.com/documentation/avfaudio/avaudiosession/interruptionnotification).
```
func observeInterruptions() async {
    // Observe interruption notifications using async sequences.
    for await notification in NotificationCenter.default.notifications(
        named: AVAudioSession.interruptionNotification,
        object: AVAudioSession.sharedInstance()
    ) {
        handleInterruption(notification: notification)
    }
}


func handleInterruption(notification: Notification) {
    // To implement.
}

```

### [Handle audio session interruptions](https://developer.apple.com/documentation/avfaudio/handling-audio-interruptions#Handle-audio-session-interruptions)
The posted [`Notification`](https://developer.apple.com/documentation/Foundation/Notification) object contains a populated user-information dictionary that provides the details of the interruption. You determine the type of interruption by retrieving the [`AVAudioSession.InterruptionType`](https://developer.apple.com/documentation/avfaudio/avaudiosession/interruptiontype) value from the [`userInfo`](https://developer.apple.com/documentation/Foundation/Notification/userInfo) dictionary. The interruption type indicates whether the interruption is beginning or ending.
```
func handleInterruption(notification: Notification) {
    guard let userInfo = notification.userInfo,
        let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
        let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
            return
    }


    // Switch over the interruption type.
    switch type {


    case .began:
        // An interruption began. Update the UI as necessary.


    case .ended:
       // An interruption ended. Resume playback, if appropriate.


        guard let optionsValue = userInfo[AVAudioSessionInterruptionOptionKey] as? UInt else { return }
        let options = AVAudioSession.InterruptionOptions(rawValue: optionsValue)
        if options.contains(.shouldResume) {
            // An interruption ended. Resume playback.
        } else {
            // An interruption ended. Don't resume playback.
        }


    default: ()
    }
}

```

If the interruption type is [`AVAudioSession.InterruptionType.ended`](https://developer.apple.com/documentation/avfaudio/avaudiosession/interruptiontype/ended), the [`userInfo`](https://developer.apple.com/documentation/Foundation/Notification/userInfo) dictionary contains an [`AVAudioSession.InterruptionOptions`](https://developer.apple.com/documentation/avfaudio/avaudiosession/interruptionoptions) value, which you use to determine whether playback automatically resumes.
## [See Also](https://developer.apple.com/documentation/avfaudio/handling-audio-interruptions#see-also)
### [System audio](https://developer.apple.com/documentation/avfaudio/handling-audio-interruptions#System-audio)
[Responding to audio route changes](https://developer.apple.com/documentation/avfaudio/responding-to-audio-route-changes)
Observe audio session notifications to ensure that your app responds appropriately to route changes.
[Routing audio to specific devices in multidevice sessions](https://developer.apple.com/documentation/avfaudio/routing-audio-to-specific-devices-in-multidevice-sessions)
Map audio channels to specific devices in multiroute sessions for recording and playback.
[Adding synthesized speech to calls](https://developer.apple.com/documentation/avfaudio/adding-synthesized-speech-to-calls)
Provide a more accessible experience by adding your app’s audio to a call.
[Capturing stereo audio from built-In microphones](https://developer.apple.com/documentation/avfaudio/capturing-stereo-audio-from-built-in-microphones)
Configure an iOS device’s built-in microphones to add stereo recording capabilities to your app.
[`class AVAudioSession`](https://developer.apple.com/documentation/avfaudio/avaudiosession)
An object that communicates to the system how you intend to use audio in your app.
[`class AVAudioApplication`](https://developer.apple.com/documentation/avfaudio/avaudioapplication)
An object that manages one or more audio sessions that belong to an app.
[`class AVAudioRoutingArbiter`](https://developer.apple.com/documentation/avfaudio/avaudioroutingarbiter)
An object for configuring macOS apps to participate in AirPods Automatic Switching.
Current page is Handling audio interruptions 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Favfaudio%2Fhandling-audio-interruptions).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
