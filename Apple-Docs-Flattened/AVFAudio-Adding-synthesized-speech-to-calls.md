Source: https://developer.apple.com/documentation/avfaudio/adding-synthesized-speech-to-calls

[ Skip Navigation ](https://developer.apple.com/documentation/avfaudio/adding-synthesized-speech-to-calls#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/avfaudio/adding-synthesized-speech-to-calls#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/avfaudio/adding-synthesized-speech-to-calls)
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
[ Open Menu ](https://developer.apple.com/documentation/avfaudio/adding-synthesized-speech-to-calls)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/avfaudio/adding-synthesized-speech-to-calls)


[](https://developer.apple.com/documentation/avfaudio/adding-synthesized-speech-to-calls)
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
  * [ Adding synthesized speech to calls ](https://developer.apple.com/documentation/avfaudio/adding-synthesized-speech-to-calls)
  *     * Adding synthesized speech to calls 


Sample Code
# Adding synthesized speech to calls
Provide a more accessible experience by adding your app’s audio to a call.
[ Download ](https://docs-assets.developer.apple.com/published/77a3397c5287/AddingSynthesizedSpeechToCalls.zip)
iOS 18.2+iPadOS 18.2+Xcode 16.1+
## [Overview](https://developer.apple.com/documentation/avfaudio/adding-synthesized-speech-to-calls#Overview)
This sample shows how to create an accessibility app that supports augmentative and alternative communication (AAC) by adding synthesized speech to a call. This feature is available in iOS 18.2 and visionOS 2.2 and later, and is available to use with calling apps that capture microphone input using Apple’s voice processing like Phone, FaceTime, and most VoIP apps.
The sample app provides a basic user interface with a button to toggle the feature state and a text field. When you enter text into the field and press enter, the app speaks the phrase. If you have an active call in progress and you enable adding the app’s audio to it, you’ll hear the synthesized speech on the originating and receiving ends of the call.
## [Configure the sample code project](https://developer.apple.com/documentation/avfaudio/adding-synthesized-speech-to-calls#Configure-the-sample-code-project)
The sample requires running on an iOS device with iOS 18.2 or later. To test the sample, establish a phone or FaceTime call with another device.
## [Enable the accessibility service](https://developer.apple.com/documentation/avfaudio/adding-synthesized-speech-to-calls#Enable-the-accessibility-service)
Before an app can add its audio to calls, a person must turn on a system-level service in the Settings app by choosing Accessibility > Audio & Visual > Add Audio in Calls. This setting is global to the device and influences the availability of the service for all apps.
![A screenshot showing the Add Audio in Calls screen in the Settings app. At the top of the image is a navigation bar title of Add Audio in Calls and a Back button on its leading edge. Below the navigation bar is a toggle switch, in an enabled state, with the label of Allow Apps to Add Audio in Calls. Below the switch is a description of this feature with the text Any audio from apps, along with microphone input, will be audible during a call. Muting the microphone will silence all audio. This may be used by apps that help assist with speaking and communication.](https://docs-assets.developer.apple.com/published/794d40aef207b215a4d7518067f6713d/add_audio_in_calls%402x.png)
The sample determines the state of this setting by querying the shared [`AVAudioApplication`](https://developer.apple.com/documentation/avfaudio/avaudioapplication) object for its microphone injection permission:
```
// Retrieve the current microphone injection permission.
let permission = AVAudioApplication.shared.microphoneInjectionPermission

```

A permission value of [`AVAudioApplication.MicrophoneInjectionPermission.serviceDisabled`](https://developer.apple.com/documentation/avfaudio/avaudioapplication/microphoneinjectionpermission-swift.enum/servicedisabled) indicates the person hasn’t turned on the service, which means apps can’t add audio to calls. When the app retrieves this value, it presents an alert dialog that indicates the current state and provides the person an opportunity to update their setting. When you press the dialog’s Open Settings button, the app uses the Accessibility framework to directly open the Add Audio in Calls screen in the Settings app like shown below.
```
@ViewBuilder
var alertButtons: some View {
    Button("Open Settings") {
        Task {
            do {
                // Open the configuration screen for this feature in the Settings app.
                try await AccessibilitySettings.openSettings(for: .allowAppsToAddAudioToCalls)
            } catch {
                print("Unable to open Settings app: \(error)")
            }
        }
    }
    Button("Cancel", role: .cancel) {}
}

```

## [Request permission](https://developer.apple.com/documentation/avfaudio/adding-synthesized-speech-to-calls#Request-permission)
Turning on Add Audio in Calls makes the feature available to apps on the system, but apps must explicitly request and be granted permission to use the feature. The sample determines its permission by querying for the current microphone injection permission. A value of [`AVAudioApplication.MicrophoneInjectionPermission.undetermined`](https://developer.apple.com/documentation/avfaudio/avaudioapplication/microphoneinjectionpermission-swift.enum/undetermined) indicates the app hasn’t yet requested permission and needs to before it can use the feature.
For an app to request a person’s permission, it needs to provide an `NSMicrophoneInjectionUsageDescription` key in its `Info.plist` file with a description of why the app requests microphone access. The system displays this string when an app requests user permission. The sample app defines this entry as follows.
```
<key>NSMicrophoneInjectionUsageDescription</key>
<string>This app adds its audio to calls to support augmentative and alternative communication.</string>

```

Attempting to request permission without this usage string present results in the system quitting the app.
The app requests permission by calling the [`requestRecordPermission(completionHandler:)`](https://developer.apple.com/documentation/avfaudio/avaudioapplication/requestrecordpermission\(completionhandler:\)) method and awaiting a response:
```
// If undetermined, prompt the person to grant the app access, and turn on the feature, if allowed.
if await AVAudioApplication.requestMicrophoneInjectionPermission() == .granted {
    // If the person grants access, turn on adding app audio.
}

```

Calling this method causes the system to present a dialog that requests user permission. If a person grants the app permission, the call returns a value of [`AVAudioApplication.MicrophoneInjectionPermission.granted`](https://developer.apple.com/documentation/avfaudio/avaudioapplication/microphoneinjectionpermission-swift.enum/granted) and the app updates its state accordingly.
If a person denies the app permission, the system sets the microphone injection permission state to [`AVAudioApplication.MicrophoneInjectionPermission.denied`](https://developer.apple.com/documentation/avfaudio/avaudioapplication/microphoneinjectionpermission-swift.enum/denied), and the app is unable to use the feature. The app remains in this state until a person explicitly changes the permission from the Add Audio in Calls screen in the Settings app. If you attempt to turn on the feature in the app while in this state, the app presents an alert similar to the one shown in the previous section to update the app’s permission.
## [Enable adding audio to calls](https://developer.apple.com/documentation/avfaudio/adding-synthesized-speech-to-calls#Enable-adding-audio-to-calls)
When the app has permission to add audio and a person toggles the feature state in the user interface, the app responds by calling the shared [`AVAudioSession`](https://developer.apple.com/documentation/avfaudio/avaudiosession) object’s [`setPreferredMicrophoneInjectionMode(_:)`](https://developer.apple.com/documentation/avfaudio/avaudiosession/setpreferredmicrophoneinjectionmode\(_:\)) method. To turn on the feature, the app passes the method a value of [`AVAudioSession.MicrophoneInjectionMode.spokenAudio`](https://developer.apple.com/documentation/avfaudio/avaudiosession/microphoneinjectionmode/spokenaudio); to turn off the feature, it passes a value of [`AVAudioSession.MicrophoneInjectionMode.none`](https://developer.apple.com/documentation/avfaudio/avaudiosession/microphoneinjectionmode/none).
```
let mode: AVAudioSession.MicrophoneInjectionMode = // spoken audio or none
try AVAudioSession.sharedInstance().setPreferredMicrophoneInjectionMode(mode)

```

When turned on during an active call, the system plays the app’s audio locally and adds it to the microphone’s input stream.
Note
The `AVAudioSession/setPreferredMicrophoneInjectionMode(_:)` method uses the word _preferred_ to indicate that an app can set its preference, but a person ultimately determines whether they allow the feature’s use.
## [Monitor the availability of calls](https://developer.apple.com/documentation/avfaudio/adding-synthesized-speech-to-calls#Monitor-the-availability-of-calls)
To determine whether a call can use this feature, the sample awaits notification of changes to the state of the audio session’s microphone injection capabilities:
```
/// Monitor the active state of phone and FaceTime calls.
private func observeCallState() async {
    // Await notification of changes to the audio session's microphone injection capabilities.
    for await notification in NotificationCenter.default.notifications(named: AVAudioSession.microphoneInjectionCapabilitiesChangeNotification) {
        // Inspect the user information dictionary to determine whether microphone injection is available.
        isCallActive = notification.userInfo?[AVAudioSessionMicrophoneInjectionIsAvailableKey] as? Bool ?? false
    }
}

```

When a call begins or ends, the system posts a notification of the change. The app queries the notification’s user information dictionary for its [`AVAudioSessionMicrophoneInjectionIsAvailableKey`](https://developer.apple.com/documentation/avfaudio/avaudiosessionmicrophoneinjectionisavailablekey) value to determine whether there’s an active call. When the value is `true`, the app updates its UI to show a pulsing phone icon in the toolbar to indicate the call is active.
## [See Also](https://developer.apple.com/documentation/avfaudio/adding-synthesized-speech-to-calls#see-also)
### [System audio](https://developer.apple.com/documentation/avfaudio/adding-synthesized-speech-to-calls#System-audio)
[Handling audio interruptions](https://developer.apple.com/documentation/avfaudio/handling-audio-interruptions)
Observe audio session notifications to ensure that your app responds appropriately to interruptions.
[Responding to audio route changes](https://developer.apple.com/documentation/avfaudio/responding-to-audio-route-changes)
Observe audio session notifications to ensure that your app responds appropriately to route changes.
[Routing audio to specific devices in multidevice sessions](https://developer.apple.com/documentation/avfaudio/routing-audio-to-specific-devices-in-multidevice-sessions)
Map audio channels to specific devices in multiroute sessions for recording and playback.
[Capturing stereo audio from built-In microphones](https://developer.apple.com/documentation/avfaudio/capturing-stereo-audio-from-built-in-microphones)
Configure an iOS device’s built-in microphones to add stereo recording capabilities to your app.
[`class AVAudioSession`](https://developer.apple.com/documentation/avfaudio/avaudiosession)
An object that communicates to the system how you intend to use audio in your app.
[`class AVAudioApplication`](https://developer.apple.com/documentation/avfaudio/avaudioapplication)
An object that manages one or more audio sessions that belong to an app.
[`class AVAudioRoutingArbiter`](https://developer.apple.com/documentation/avfaudio/avaudioroutingarbiter)
An object for configuring macOS apps to participate in AirPods Automatic Switching.
Current page is Adding synthesized speech to calls 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Favfaudio%2Fadding-synthesized-speech-to-calls).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
