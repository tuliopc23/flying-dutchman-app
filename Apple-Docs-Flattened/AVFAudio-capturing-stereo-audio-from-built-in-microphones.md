Source: https://developer.apple.com/documentation/avfaudio/capturing-stereo-audio-from-built-in-microphones

[ Skip Navigation ](https://developer.apple.com/documentation/avfaudio/capturing-stereo-audio-from-built-in-microphones#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/avfaudio/capturing-stereo-audio-from-built-in-microphones#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/avfaudio/capturing-stereo-audio-from-built-in-microphones)
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
[ Open Menu ](https://developer.apple.com/documentation/avfaudio/capturing-stereo-audio-from-built-in-microphones)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/avfaudio/capturing-stereo-audio-from-built-in-microphones)


[](https://developer.apple.com/documentation/avfaudio/capturing-stereo-audio-from-built-in-microphones)
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
  * [ Capturing stereo audio from built-In microphones ](https://developer.apple.com/documentation/avfaudio/capturing-stereo-audio-from-built-in-microphones)
  *     * Capturing stereo audio from built-In microphones 


Sample Code
# Capturing stereo audio from built-In microphones
Configure an iOS device’s built-in microphones to add stereo recording capabilities to your app.
[ Download ](https://docs-assets.developer.apple.com/published/210be7e44cf2/CapturingStereoAudioFromBuiltInMicrophones.zip)
iOS 17.0+iPadOS 17.0+Xcode 15.4+
## [Overview](https://developer.apple.com/documentation/avfaudio/capturing-stereo-audio-from-built-in-microphones#Overview)
Stereo audio uses two channels to create the illusion of multidirectional sound, adding greater depth and dimension to your audio and resulting in an immersive listening experience. iOS provides a number of ways to record audio from the built-in microphones, but until now it’s been limited to mono audio only. Starting in iOS 14 and iPadOS 14, you can now capture stereo audio using the built-in microphones on supported devices.
Because a user can hold an iOS device in a variety of ways, you need to specify the orientation of the right and left channels in the stereo field. Set the built-in microphone’s directionality by configuring:
  * Polar pattern. The system represents the individual device microphones, and beamformers that use multiple microphones, as data sources. Select the front or back data source and set its polar pattern to stereo.
  * Input orientation. When recording video, set the input orientation to match the video orientation. When recording audio only, set the input orientation to match the user interface orientation. In both cases, don’t change the orientation during recording.


This sample app shows how to configure your app to record stereo audio, and helps you visualize changes to the input orientation and data-source selection.
Note
You must run the sample on a supported physical device running iOS 14, or later. To determine whether a device supports stereo recording, query the audio session’s selected data source to see if its [supportedPolarPatterns](https://developer.apple.com/documentation/AVFAudio/AVAudioSessionDataSourceDescription/supportedPolarPatterns) array contains the [stereo](https://developer.apple.com/documentation/AVFAudio/AVAudioSession/PolarPattern/stereo) polar pattern.
### [Configure the Audio Session Category](https://developer.apple.com/documentation/avfaudio/capturing-stereo-audio-from-built-in-microphones#Configure-the-Audio-Session-Category)
Recording stereo audio requires the app’s audio session to use either the [record](https://developer.apple.com/documentation/AVFAudio/AVAudioSession/Category-swift.struct/record) or [playAndRecord](https://developer.apple.com/documentation/AVFAudio/AVAudioSession/Category-swift.struct/playAndRecord) category. The sample uses the `playAndRecord` category so it can do both. It also passes the `defaultToSpeaker` and `allowBluetooth` options to route the audio to the speaker instead of the receiver, and to Bluetooth headphones.
```
func setupAudioSession() {
    do {
        let session = AVAudioSession.sharedInstance()
        try session.setCategory(.playAndRecord, options: [.defaultToSpeaker, .allowBluetooth])
        try session.setActive(true)
    } catch {
        fatalError("Failed to configure and activate session.")
    }
}

```

### [Select and Configure a Built-In Microphone](https://developer.apple.com/documentation/avfaudio/capturing-stereo-audio-from-built-in-microphones#Select-and-Configure-a-Built-In-Microphone)
An iOS device’s built-in microphone input consists of an array of physical microphones and beamformers, each represented as an instance of `AVAudioSessionDataSourceDescription`. The sample app finds the built-in microphone input by querying the available inputs for the one where the port type equals the built-in microphone, and sets it as the preferred input.
```
private func enableBuiltInMic() {
    // Get the shared audio session.
    let session = AVAudioSession.sharedInstance()
    
    // Find the built-in microphone input.
    guard let availableInputs = session.availableInputs,
          let builtInMicInput = availableInputs.first(where: { $0.portType == .builtInMic }) else {
        print("The device must have a built-in microphone.")
        return
    }
    
    // Make the built-in microphone input the preferred input.
    do {
        try session.setPreferredInput(builtInMicInput)
    } catch {
        print("Unable to set the built-in mic as the preferred input.")
    }
}

```

### [Configure the Microphone Input’s Directionality](https://developer.apple.com/documentation/avfaudio/capturing-stereo-audio-from-built-in-microphones#Configure-the-Microphone-Inputs-Directionality)
To configure the microphone input’s directionality, the sample sets its data source’s preferred polar pattern and the session’s input orientation. It performs this configuration in its `selectRecordingOption(_:orientation)` method, which it calls whenever the user rotates the device or changes the recording option selection.
```
func selectRecordingOption(_ option: RecordingOption, orientation: Orientation, completion: (StereoLayout) -> Void) {
    
    // Get the shared audio session.
    let session = AVAudioSession.sharedInstance()
    
    // Find the built-in microphone input's data sources,
    // and select the one that matches the specified name.
    guard let preferredInput = session.preferredInput,
          let dataSources = preferredInput.dataSources,
          let newDataSource = dataSources.first(where: { $0.dataSourceName == option.dataSourceName }),
          let supportedPolarPatterns = newDataSource.supportedPolarPatterns else {
        completion(.none)
        return
    }
    
    do {
        isStereoSupported = supportedPolarPatterns.contains(.stereo)
        // If the data source supports stereo, set it as the preferred polar pattern.
        if isStereoSupported {
            // Set the preferred polar pattern to stereo.
            try newDataSource.setPreferredPolarPattern(.stereo)
        }


        // Set the preferred data source and polar pattern.
        try preferredInput.setPreferredDataSource(newDataSource)
        
        // Update the input orientation to match the current user interface orientation.
        try session.setPreferredInputOrientation(orientation.inputOrientation)


    } catch {
        fatalError("Unable to select the \(option.dataSourceName) data source.")
    }
    
    // Call the completion handler with the updated stereo layout.
    completion(StereoLayout(orientation: newDataSource.orientation!,
                            stereoOrientation: session.inputOrientation))
}

```

This method finds the data source with the selected name, sets its preferred polar pattern to stereo, and then sets it as the input’s preferred data source. Finally, it sets the preferred input orientation to match the device’s user interface orientation.
## [See Also](https://developer.apple.com/documentation/avfaudio/capturing-stereo-audio-from-built-in-microphones#see-also)
### [System audio](https://developer.apple.com/documentation/avfaudio/capturing-stereo-audio-from-built-in-microphones#System-audio)
[Handling audio interruptions](https://developer.apple.com/documentation/avfaudio/handling-audio-interruptions)
Observe audio session notifications to ensure that your app responds appropriately to interruptions.
[Responding to audio route changes](https://developer.apple.com/documentation/avfaudio/responding-to-audio-route-changes)
Observe audio session notifications to ensure that your app responds appropriately to route changes.
[Routing audio to specific devices in multidevice sessions](https://developer.apple.com/documentation/avfaudio/routing-audio-to-specific-devices-in-multidevice-sessions)
Map audio channels to specific devices in multiroute sessions for recording and playback.
[Adding synthesized speech to calls](https://developer.apple.com/documentation/avfaudio/adding-synthesized-speech-to-calls)
Provide a more accessible experience by adding your app’s audio to a call.
[`class AVAudioSession`](https://developer.apple.com/documentation/avfaudio/avaudiosession)
An object that communicates to the system how you intend to use audio in your app.
[`class AVAudioApplication`](https://developer.apple.com/documentation/avfaudio/avaudioapplication)
An object that manages one or more audio sessions that belong to an app.
[`class AVAudioRoutingArbiter`](https://developer.apple.com/documentation/avfaudio/avaudioroutingarbiter)
An object for configuring macOS apps to participate in AirPods Automatic Switching.
Current page is Capturing stereo audio from built-In microphones 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Favfaudio%2Fcapturing-stereo-audio-from-built-in-microphones).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
