Source: https://developer.apple.com/documentation/avfoundation/avassetexportsession

[ Skip Navigation ](https://developer.apple.com/documentation/avfoundation/avassetexportsession#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/avfoundation/avassetexportsession#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/avfoundation/avassetexportsession)
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
[ Open Menu ](https://developer.apple.com/documentation/avfoundation/avassetexportsession)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/avfoundation/avassetexportsession)


[](https://developer.apple.com/documentation/avfoundation/avassetexportsession)
## [ AVFoundation  ](https://developer.apple.com/documentation/avfoundation)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 31 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 31 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 31 symbols inside <root> [AVFoundation updates](https://developer.apple.com/documentation/updates/avfoundation)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 31 symbols inside <root>
Common
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
4 of 31 symbols inside <root> containing 28 symbols[Media assets](https://developer.apple.com/documentation/avfoundation/media-assets)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
5 of 31 symbols inside <root> containing 31 symbols[Media reading and writing](https://developer.apple.com/documentation/avfoundation/media-reading-and-writing)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 31 symbols inside 480790132 
Media export
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 31 symbols inside 480790132 [Exporting video to alternative formats](https://developer.apple.com/documentation/avfoundation/exporting-video-to-alternative-formats)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
3 of 31 symbols inside 480790132 containing 50 symbols[AVAssetExportSession](https://developer.apple.com/documentation/avfoundation/avassetexportsession)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 50 symbols inside 2009122668 
Creating an export session
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 50 symbols inside 2009122668 [init?(asset: AVAsset, presetName: String)](https://developer.apple.com/documentation/avfoundation/avassetexportsession/init\(asset:presetname:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
3 of 50 symbols inside 2009122668 containing 39 symbols[Export presets](https://developer.apple.com/documentation/avfoundation/export-presets)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 50 symbols inside 2009122668 
Accessing export presets
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
5 of 50 symbols inside 2009122668 [var presetName: String](https://developer.apple.com/documentation/avfoundation/avassetexportsession/presetname)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
6 of 50 symbols inside 2009122668 [func determineCompatibleFileTypes(completionHandler: ([AVFileType]) -> Void)](https://developer.apple.com/documentation/avfoundation/avassetexportsession/determinecompatiblefiletypes\(completionhandler:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
7 of 50 symbols inside 2009122668 [class func allExportPresets() -> [String]](https://developer.apple.com/documentation/avfoundation/avassetexportsession/allexportpresets\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
8 of 50 symbols inside 2009122668 [class func determineCompatibility(ofExportPreset: String, with: AVAsset, outputFileType: AVFileType?, completionHandler: (Bool) -> Void)](https://developer.apple.com/documentation/avfoundation/avassetexportsession/determinecompatibility\(ofexportpreset:with:outputfiletype:completionhandler:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
9 of 50 symbols inside 2009122668 [class func exportPresets(compatibleWith: AVAsset) -> [String]](https://developer.apple.com/documentation/avfoundation/avassetexportsession/exportpresets\(compatiblewith:\))Deprecated
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 50 symbols inside 2009122668 
Configuring output
112 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ AVFoundation ](https://developer.apple.com/documentation/avfoundation)
  * [ AVAssetExportSession ](https://developer.apple.com/documentation/avfoundation/avassetexportsession)
  *     * AVAssetExportSession 


Class
# AVAssetExportSession
An object that exports assets in a format that you specify using an export preset.
iOS 4.0+iPadOS 4.0+Mac Catalyst 13.1+macOS 10.7+tvOS 9.0+visionOS 1.0+
```
class AVAssetExportSession
```

## [ Mentioned in ](https://developer.apple.com/documentation/avfoundation/avassetexportsession#mentions)
[](https://developer.apple.com/documentation/avfoundation/exporting-video-to-alternative-formats)
## [Overview](https://developer.apple.com/documentation/avfoundation/avassetexportsession#overview)
You configure this object to export an instance of [`AVAsset`](https://developer.apple.com/documentation/avfoundation/avasset) by setting an export preset, an output file type, and an output URL.
## [Topics](https://developer.apple.com/documentation/avfoundation/avassetexportsession#topics)
### [Creating an export session](https://developer.apple.com/documentation/avfoundation/avassetexportsession#Creating-an-export-session)
[`init?(asset: AVAsset, presetName: String)`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/init\(asset:presetname:\))
Creates an export session with a preset configuration.
[API Reference Export presets](https://developer.apple.com/documentation/avfoundation/export-presets)
Configure an export session to output media in standard sizes and formats.
### [Accessing export presets](https://developer.apple.com/documentation/avfoundation/avassetexportsession#Accessing-export-presets)
[`var presetName: String`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/presetname)
The name of the preset that the asset export session uses.
[`func determineCompatibleFileTypes(completionHandler: ([AVFileType]) -> Void)`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/determinecompatiblefiletypes\(completionhandler:\))
Determines the output file types an asset export session supports writing in its current configuration.
[`class func allExportPresets() -> [String]`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/allexportpresets\(\))
Returns all available export preset names.
[`class func determineCompatibility(ofExportPreset: String, with: AVAsset, outputFileType: AVFileType?, completionHandler: (Bool) -> Void)`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/determinecompatibility\(ofexportpreset:with:outputfiletype:completionhandler:\))
Determines an export preset’s compatibility to export the asset in a container of the output file type.
[`class func exportPresets(compatibleWith: AVAsset) -> [String]`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/exportpresets\(compatiblewith:\))
Returns compatible export presets for the asset.
Deprecated
### [Configuring output](https://developer.apple.com/documentation/avfoundation/avassetexportsession#Configuring-output)
[`var outputURL: URL?`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/outputurl)
A URL where an asset export session writes its output.
Deprecated
[`var outputFileType: AVFileType?`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/outputfiletype)
The file type of the output an asset export session writes.
Deprecated
[`var supportedFileTypes: [AVFileType]`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/supportedfiletypes)
An array containing the types of files the session can write.
[`var allowsParallelizedExport: Bool`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/allowsparallelizedexport)
A Boolean value that indicates whether the session can parallelize its export operation.
[`var shouldOptimizeForNetworkUse: Bool`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/shouldoptimizefornetworkuse)
A Boolean value that indicates whether to optimize the movie for network use.
[`var canPerformMultiplePassesOverSourceMediaData: Bool`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/canperformmultiplepassesoversourcemediadata)
A Boolean value that indicates whether the export session can perform multiple passes over the source media to achieve better results.
[`var timeRange: CMTimeRange`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/timerange)
The time range of the source asset to export.
[`var fileLengthLimit: Int64`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/filelengthlimit)
The file length that the output of the session must not exceed.
[`var directoryForTemporaryFiles: URL?`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/directoryfortemporaryfiles)
A directory suitable to store temporary files that the export process generates.
### [Configuring metadata](https://developer.apple.com/documentation/avfoundation/avassetexportsession#Configuring-metadata)
[`var metadata: [AVMetadataItem]?`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/metadata)
The metadata an export session writes to the output container file.
[`var metadataItemFilter: AVMetadataItemFilter?`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/metadataitemfilter)
An object the export session uses to filter the metadata items it transfers to the output asset.
### [Configuring video output](https://developer.apple.com/documentation/avfoundation/avassetexportsession#Configuring-video-output)
[`var videoComposition: AVVideoComposition?`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/videocomposition)
An optional object that provides instructions for how to composite frames of video.
[`var customVideoCompositor: (any AVVideoCompositing)?`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/customvideocompositor)
An optional custom object to use when compositing video frames.
### [Configuring track groups](https://developer.apple.com/documentation/avfoundation/avassetexportsession#Configuring-track-groups)
[`var audioTrackGroupHandling: AVAssetTrackGroupOutputHandling`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/audiotrackgrouphandling)
A policy that defines how the session exports alternate audio tracks.
[`struct AVAssetTrackGroupOutputHandling`](https://developer.apple.com/documentation/avfoundation/avassettrackgroupoutputhandling)
A type that specifies policies for how an export session processes alternate tracks in a track group.
### [Configuring audio output](https://developer.apple.com/documentation/avfoundation/avassetexportsession#Configuring-audio-output)
[`var audioMix: AVAudioMix?`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/audiomix)
The parameters for audio mixing and an indication of whether to enable nondefault audio mixing for export.
[`var audioTimePitchAlgorithm: AVAudioTimePitchAlgorithm`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/audiotimepitchalgorithm)
A processing algorithm for managing audio pitch for scaled audio edits.
### [Exporting media](https://developer.apple.com/documentation/avfoundation/avassetexportsession#Exporting-media)
[`func export(to: URL, as: AVFileType, isolation: isolated (any Actor)?) async throws`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/export\(to:as:isolation:\))
Exports the asset to the output location in the specified file type.
[`func cancelExport()`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/cancelexport\(\))
Cancels the execution of an export session.
[`func exportAsynchronously(completionHandler: () -> Void)`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/exportasynchronously\(completionhandler:\))
Starts the asynchronous execution of an export session.
Deprecated
### [Monitoring export progress](https://developer.apple.com/documentation/avfoundation/avassetexportsession#Monitoring-export-progress)
[`func states(updateInterval: TimeInterval) -> some Sendable & AsyncSequence<AVAssetExportSession.State, Never> `](https://developer.apple.com/documentation/avfoundation/avassetexportsession/states\(updateinterval:\))
Monitors the progress state of an export operation.
[`enum State`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/state)
Constants that indicate the state of an export operation.
[`var status: AVAssetExportSession.Status`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/status-swift.property)
The status of the export session.
Deprecated
[`enum Status`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/status-swift.enum)
Values that indicate the state of an export session.
[`var progress: Float`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/progress)
A value that indicates the progress of the export.
Deprecated
[`var error: (any Error)?`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/error)
An optional error object.
Deprecated
### [Estimating file length and duration](https://developer.apple.com/documentation/avfoundation/avassetexportsession#Estimating-file-length-and-duration)
[`func estimateOutputFileLength(completionHandler: (Int64, (any Error)?) -> Void)`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/estimateoutputfilelength\(completionhandler:\))
Starts estimating the output file length of the export while considering the asset, preset, and time range configuration of the export session.
[`var estimatedOutputFileLength: Int64`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/estimatedoutputfilelength)
The estimated length of the exported file, in bytes.
Deprecated
### [Estimating duration](https://developer.apple.com/documentation/avfoundation/avassetexportsession#Estimating-duration)
[`func estimateMaximumDuration(completionHandler: (CMTime, (any Error)?) -> Void)`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/estimatemaximumduration\(completionhandler:\))
Starts estimating the maximum duration of the export while considering the asset, preset, and time range configuration of the export session.
[`var maxDuration: CMTime`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/maxduration)
Provides an estimate of the maximum duration of the exported media.
Deprecated
### [Accessing the asset](https://developer.apple.com/documentation/avfoundation/avassetexportsession#Accessing-the-asset)
[`var asset: AVAsset`](https://developer.apple.com/documentation/avfoundation/avassetexportsession/asset)
An asset that a session exports.
## [Relationships](https://developer.apple.com/documentation/avfoundation/avassetexportsession#relationships)
### [Inherits From](https://developer.apple.com/documentation/avfoundation/avassetexportsession#inherits-from)
  * [`NSObject`](https://developer.apple.com/documentation/ObjectiveC/NSObject-swift.class)


### [Conforms To](https://developer.apple.com/documentation/avfoundation/avassetexportsession#conforms-to)
  * [`CVarArg`](https://developer.apple.com/documentation/Swift/CVarArg)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`NSObjectProtocol`](https://developer.apple.com/documentation/ObjectiveC/NSObjectProtocol)


## [See Also](https://developer.apple.com/documentation/avfoundation/avassetexportsession#see-also)
### [Media export](https://developer.apple.com/documentation/avfoundation/avassetexportsession#Media-export)
[Exporting video to alternative formats](https://developer.apple.com/documentation/avfoundation/exporting-video-to-alternative-formats)
Convert an existing movie file to a different format.
Current page is AVAssetExportSession 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Favfoundation%2Favassetexportsession).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
