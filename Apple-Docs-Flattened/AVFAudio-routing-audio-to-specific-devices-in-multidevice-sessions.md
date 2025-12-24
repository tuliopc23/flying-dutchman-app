Source: https://developer.apple.com/documentation/avfaudio/routing-audio-to-specific-devices-in-multidevice-sessions

[ Skip Navigation ](https://developer.apple.com/documentation/avfaudio/routing-audio-to-specific-devices-in-multidevice-sessions#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/avfaudio/routing-audio-to-specific-devices-in-multidevice-sessions#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/avfaudio/routing-audio-to-specific-devices-in-multidevice-sessions)
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
[ Open Menu ](https://developer.apple.com/documentation/avfaudio/routing-audio-to-specific-devices-in-multidevice-sessions)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/avfaudio/routing-audio-to-specific-devices-in-multidevice-sessions)


[](https://developer.apple.com/documentation/avfaudio/routing-audio-to-specific-devices-in-multidevice-sessions)
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
  * [ Routing audio to specific devices in multidevice sessions ](https://developer.apple.com/documentation/avfaudio/routing-audio-to-specific-devices-in-multidevice-sessions)
  *     * Routing audio to specific devices in multidevice sessions 


Article
# Routing audio to specific devices in multidevice sessions
Map audio channels to specific devices in multiroute sessions for recording and playback.
## [Overview](https://developer.apple.com/documentation/avfaudio/routing-audio-to-specific-devices-in-multidevice-sessions#Overview)
When working with multiple audio devices simultaneously, such as recording from multiple microphones or routing playback to different speakers, you need precise control over which audio reaches which device.
[Core Audio](https://developer.apple.com/documentation/CoreAudio) provides channel mapping to bind specific audio channels to targeted devices. Use the input and output nodes from [`AVAudioEngine`](https://developer.apple.com/documentation/avfaudio/avaudioengine) for position-based routing with global channel indices, [Audio Queue Services](https://developer.apple.com/documentation/AudioToolbox/audio-queue-services) for device-based routing using device identifiers, or [`AVAudioPlayer`](https://developer.apple.com/documentation/avfaudio/avaudioplayer) and [`AVAudioRecorder`](https://developer.apple.com/documentation/avfaudio/avaudiorecorder) for high-level routing with audio session channel descriptions.
## [Route audio outputs using audio engine’s output node](https://developer.apple.com/documentation/avfaudio/routing-audio-to-specific-devices-in-multidevice-sessions#Route-audio-outputs-using-audio-engines-output-node)
Use [Audio Unit](https://developer.apple.com/documentation/AudioUnit) channel maps to route playback audio to specific devices by mapping to global channel positions. A channel map is an array where the index represents the destination channel and the value specifies which source channel to route to that destination. Use `-1` to specify silence for unused channels.
In multidevice configurations, [Core Audio](https://developer.apple.com/documentation/CoreAudio) flattens all device channels into a sequential global channel space. When multiple audio devices are active, Core Audio assigns channels sequentially based on port order. For example, with AirPods (2 channels) and built-in speaker (2 channels) connected:
```
Device 1 (AirPods): 2 channels > Global positions [0, 1]
Device 2 (Built-in): 2 channels > Global positions [2, 3]
Result: Global channel array [0, 1, 2, 3]

```

To route a stereo audio file to the built-in speaker at channels 2 and 3, create a channel map sized to match the total output channels:
```
var channelMap: [Int32] = [-1, -1, 0, 1]
// channelMap[0] = -1: AirPods left is silent.
// channelMap[1] = -1: AirPods right is silent.
// channelMap[2] = 0: Built-in left plays the file's left channel.
// channelMap[3] = 1: Built-in right plays the file's right channel.

```

Because port order can vary and channel counts differ between devices, first discover the actual port-to-channel mapping via [`currentRoute`](https://developer.apple.com/documentation/avfaudio/avaudiosession/currentroute). Calculate channel indices dynamically based on the current audio route configuration:
```
let audioSession = AVAudioSession.sharedInstance()


// Configure and activate the audio session for multiroute setup.


let currentRoute = audioSession.currentRoute
var outputChannelOffset: UInt32 = 0


for (portIndex, outputPort) in currentRoute.outputs.enumerated() {
    guard let channels = outputPort.channels else { continue }


    // The `outputChannelOffset` is the starting global channel index 
    // for this device.


    // Increase the `outputChannelOffset` by the number of 
    // channels in this port.
    outputChannelOffset += UInt32(channels.count)
}

```

This iterates through output ports, calculating their position in the global flattened channel array. Use these calculated indices to target specific devices in your channel mapping.
After discovering channel positions, configure the [Audio Unit](https://developer.apple.com/documentation/AudioUnit) with a channel map. This example routes a stereo audio file to the built-in speaker, assuming it occupies channels 2 and 3 in the global channel space:
```
let audioSession = AVAudioSession.sharedInstance()


// Configure and activate the audio session for multiroute setup.


// Configure audio IO.
let engine = AVAudioEngine()
let player = AVAudioPlayerNode()


engine.attach(player)
engine.connect(player, to: engine.mainMixerNode, format: nil)


guard let outputAudioUnit = engine.outputNode.audioUnit else {
    fatalError("Failed to get output AudioUnit")
}


// Get the total output channels from the 
// audio session.
let totalOutputChannels = audioSession.maximumOutputNumberOfChannels


// Create the channel map: 
// Silence all channels except target device.
var channelMap = Array<Int32>(repeating: -1, count: totalOutputChannels)


// Route stereo audio to built-in speaker at channels 2 and 3.
channelMap[2] = 0  // Route stream channel 0 (left) to output channel 2.
channelMap[3] = 1  // Route stream channel 1 (right) to output channel 3.


// Apply the channel map to `AudioUnit`.
let result = AudioUnitSetProperty(
    outputAudioUnit,
    kAudioOutputUnitProperty_ChannelMap,
    kAudioUnitScope_Output,
    0,
    channelMap,
    UInt32(channelMap.count * MemoryLayout<Int32>.size)
)


guard result == noErr else {
    fatalError("Failed to set channel map: \(result)")
}


// Start the audio engine and play audio.
try? engine.start()


guard let audioFileURL = Bundle.main.url(forResource: "sample", withExtension: "mp3"),
      let audioFile = try? AVAudioFile(forReading: audioFileURL) else {
    fatalError("Failed to load audio file")
}


player.scheduleFile(audioFile, at: nil)
player.play()

```

Note
The channel map array size must match the total number of output channels available. Each element specifies the source stream channel for that output position, or `-1` for silence.
## [Route audio inputs using audio engine’s input node](https://developer.apple.com/documentation/avfaudio/routing-audio-to-specific-devices-in-multidevice-sessions#Route-audio-inputs-using-audio-engines-input-node)
When recording from multiple input devices, channel map semantics differ from playback. The channel map array size must match your desired recording channel count (not the total hardware channel count), and each array element specifies which hardware channel to pull from.
In multidevice input configurations, similar to output, hardware channels are available sequentially. For example, with a device’s stereo built-in microphone (2 channels: front and back) and AirPods microphone (1 channel):
```
Device 1 (Built-in Mic): 2 channels > Hardware channels [0, 1] (front, back)
Device 2 (AirPods Mic): 1 channel > Hardware channel [2]
Result: Hardware channel array [0, 1, 2]

```

To record a two-channel file capturing audio from the device’s built-in front mic (channel 0) and AirPods (channel 2), set the input client format to 2 channels, then create a channel map sized to match the desired recording channel count:
```
var channelMap: [Int32] = [0, 2]
// channelMap[0] = 0: File channel 0 records from Built-in front mic (hardware channel 0).
// channelMap[1] = 2: File channel 1 records from AirPods mic (hardware channel 2).

```

Discover the available input channels:
```
let audioSession = AVAudioSession.sharedInstance()


// Configure and activate the audio session for multiroute setup.


let currentRoute = audioSession.currentRoute


for (portIndex, inputPort) in currentRoute.inputs.enumerated() {
    guard let channels = inputPort.channels else { continue }


    print("Port \(portIndex): \(inputPort.portName)")
    for (channelIndex, channel) in channels.enumerated() {
        print("  Hardware channel \(channelIndex): \(channel.channelName)")
    }
}

```

Configure the input channel map to select specific hardware channels for recording. This example records a two-channel file from hardware channels 0 and 2:
```
// Configure audio IO.
let engine = AVAudioEngine()
let inputNode = engine.inputNode


// Get the hardware input format to match the sample rate.
let hwFormat = inputNode.inputFormat(forBus: 0)


// Create the recording format with the desired channel count
// and hardware sample rate.
let recordingFormat = AVAudioFormat(
    standardFormatWithSampleRate: hwFormat.sampleRate,
    channels: 2
)!


// Configure the channel map using the underlying `AudioUnit`.
guard let inputAudioUnit = inputNode.audioUnit else {
    fatalError("Failed to get input AudioUnit")
}


var channelMap: [Int32] = [
    0, // File channel 0 < Hardware channel 0.
    2 // File channel 1 < Hardware channel 2.
]


let result = AudioUnitSetProperty(
    inputAudioUnit,
    kAudioOutputUnitProperty_ChannelMap,
    kAudioUnitScope_Input,
    1,
    channelMap,
    UInt32(channelMap.count * MemoryLayout<Int32>.size)
)


guard result == noErr else {
    fatalError("Failed to set input channel map: \(result)")
}


// Install tap with recording format to start capturing audio.
inputNode.installTap(onBus: 0, bufferSize: 4096, format: recordingFormat) { buffer, time in
    // Process the recorded audio buffer here.
    // Example: Write to file, analyze audio, and so on.
}


// Start the engine.
try engine.start()

```

Note
When using AVAudioEngine, set the client format by passing your desired format to `installTapOnBus`. The format’s channel count should match your channel map size, and the sample rate should match the hardware input format to avoid runtime errors.
## [Route audio with audio queue channel assignments](https://developer.apple.com/documentation/avfaudio/routing-audio-to-specific-devices-in-multidevice-sessions#Route-audio-with-audio-queue-channel-assignments)
Use [Audio Queue Services](https://developer.apple.com/documentation/AudioToolbox/audio-queue-services) channel assignments to route audio to specific device channels by device UID rather than global channel position. This approach provides direct device targeting without needing to calculate global channel indices.
Set the [`kAudioQueueProperty_ChannelAssignments`](https://developer.apple.com/documentation/AudioToolbox/kAudioQueueProperty_ChannelAssignments) property with an [`AudioQueueChannelAssignment`](https://developer.apple.com/documentation/AudioToolbox/AudioQueueChannelAssignment) structure specifying the target device UID and channel number:
```
// Get the device UID from `AVAudioSession`.
let audioSession = AVAudioSession.sharedInstance()


// Configure and activate the audio session for multiroute setup.


let outputPort = audioSession.currentRoute.outputs.first!


// Create the channel assignment for device channel 0.
var channelAssignment = AudioQueueChannelAssignment(
    mDeviceUID: outputPort.uid as CFString,
    mChannelNumber: 1  // 1-based indexing.
)


// Apply the channel assignments to `AudioQueue`
AudioQueueSetProperty(
    audioQueue,
    kAudioQueueProperty_ChannelAssignments,
    &channelAssignment,
    UInt32(MemoryLayout<AudioQueueChannelAssignment>.size)
)

```

## [Route high-level audio an audio player or recorder](https://developer.apple.com/documentation/avfaudio/routing-audio-to-specific-devices-in-multidevice-sessions#Route-high-level-audio-an-audio-player-or-recorder)
[`AVAudioPlayer`](https://developer.apple.com/documentation/avfaudio/avaudioplayer) and [`AVAudioRecorder`](https://developer.apple.com/documentation/avfaudio/avaudiorecorder) provide a high-level approach using the audio player’s [`channelAssignments`](https://developer.apple.com/documentation/avfaudio/avaudioplayer/channelassignments), or the audio recorder’s [`channelAssignments`](https://developer.apple.com/documentation/avfaudio/avaudiorecorder/channelassignments) property with [`AVAudioSessionChannelDescription`](https://developer.apple.com/documentation/avfaudio/avaudiosessionchanneldescription) objects directly from the audio session.
Note
For [`AVAudioPlayer`](https://developer.apple.com/documentation/avfaudio/avaudioplayer), the `channelAssignments` array count should match the audio format’s channel count.
For output [`AVAudioPlayer`](https://developer.apple.com/documentation/avfaudio/avaudioplayer):
```
let audioSession = AVAudioSession.sharedInstance()


// Configure and activate the audio session for multiroute setup.


let outputPort = audioSession.currentRoute.outputs.first!
let channelDescription = outputPort.channels!.first!


let player = try AVAudioPlayer(contentsOf: audioFileURL)
player.channelAssignments = [channelDescription]
player.play()

```

For input with [`AVAudioRecorder`](https://developer.apple.com/documentation/avfaudio/avaudiorecorder):
```
let audioSession = AVAudioSession.sharedInstance()


// Configure and activate the audio session for multiroute setup.


let inputPort = audioSession.currentRoute.inputs.first!
let channelDescription = inputPort.channels!.first!


let recorder = try AVAudioRecorder(url: outputURL, settings: settings)
recorder.channelAssignments = [channelDescription]
recorder.record()

```

## [See Also](https://developer.apple.com/documentation/avfaudio/routing-audio-to-specific-devices-in-multidevice-sessions#see-also)
### [System audio](https://developer.apple.com/documentation/avfaudio/routing-audio-to-specific-devices-in-multidevice-sessions#System-audio)
[Handling audio interruptions](https://developer.apple.com/documentation/avfaudio/handling-audio-interruptions)
Observe audio session notifications to ensure that your app responds appropriately to interruptions.
[Responding to audio route changes](https://developer.apple.com/documentation/avfaudio/responding-to-audio-route-changes)
Observe audio session notifications to ensure that your app responds appropriately to route changes.
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
Current page is Routing audio to specific devices in multidevice sessions 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Favfaudio%2Frouting-audio-to-specific-devices-in-multidevice-sessions).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
