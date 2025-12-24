Source: https://developer.apple.com/documentation/AVFoundation/loading-media-data-asynchronously

[ Skip Navigation ](https://developer.apple.com/documentation/AVFoundation/loading-media-data-asynchronously#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/AVFoundation/loading-media-data-asynchronously#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/AVFoundation/loading-media-data-asynchronously)
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
[ Open Menu ](https://developer.apple.com/documentation/AVFoundation/loading-media-data-asynchronously)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/AVFoundation/loading-media-data-asynchronously)


[](https://developer.apple.com/documentation/AVFoundation/loading-media-data-asynchronously)
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
1 of 28 symbols inside -187755041 
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 28 symbols inside -187755041 [Loading media data asynchronously](https://developer.apple.com/documentation/avfoundation/loading-media-data-asynchronously)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 28 symbols inside -187755041 
Assets
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
4 of 28 symbols inside -187755041 containing 56 symbols[AVAsset](https://developer.apple.com/documentation/avfoundation/avasset)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
5 of 28 symbols inside -187755041 containing 30 symbols[AVURLAsset](https://developer.apple.com/documentation/avfoundation/avurlasset)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
6 of 28 symbols inside -187755041 containing 48 symbols[AVAssetTrack](https://developer.apple.com/documentation/avfoundation/avassettrack)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
7 of 28 symbols inside -187755041 containing 3 symbols[AVAssetTrackSegment](https://developer.apple.com/documentation/avfoundation/avassettracksegment)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
8 of 28 symbols inside -187755041 containing 2 symbols[AVAssetTrackGroup](https://developer.apple.com/documentation/avfoundation/avassettrackgroup)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 28 symbols inside -187755041 
Metadata
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 28 symbols inside -187755041 [Retrieving media metadata](https://developer.apple.com/documentation/avfoundation/retrieving-media-metadata)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
11 of 28 symbols inside -187755041 containing 41 symbols[AVMetadataItem](https://developer.apple.com/documentation/avfoundation/avmetadataitem)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
12 of 28 symbols inside -187755041 containing 20 symbols[AVMutableMetadataItem](https://developer.apple.com/documentation/avfoundation/avmutablemetadataitem)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
13 of 28 symbols inside -187755041 containing 305 symbols[AVMetadataIdentifier](https://developer.apple.com/documentation/avfoundation/avmetadataidentifier)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
14 of 28 symbols inside -187755041 containing 290 symbols[AVMetadataKey](https://developer.apple.com/documentation/avfoundation/avmetadatakey)
59 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ AVFoundation ](https://developer.apple.com/documentation/avfoundation)
  * [ Media assets ](https://developer.apple.com/documentation/avfoundation/media-assets)
  * [ Loading media data asynchronously ](https://developer.apple.com/documentation/AVFoundation/loading-media-data-asynchronously)
  *     * [ Media assets ](https://developer.apple.com/documentation/avfoundation/media-assets)
    * Loading media data asynchronously 


Article
# Loading media data asynchronously
Build responsive apps by using language-level concurrency features to efficiently load media data.
## [Overview](https://developer.apple.com/documentation/AVFoundation/loading-media-data-asynchronously#overview)
AVFoundation uses the [`AVAsset`](https://developer.apple.com/documentation/avfoundation/avasset) class to model timed audiovisual media. Creating an asset is a lightweight operation because it defers loading its media until it requires the data. How long it takes an asset to load its data depends on factors, including the media’s size, local device capabilities, and remote network conditions. To avoid blocking the calling thread, you must load media data asynchronously.
Important
Starting in iOS 16, tvOS 16, MacCatalyst 16, and macOS 13, AVFoundation deprecates using the synchronous properties and methods of [`AVAsset`](https://developer.apple.com/documentation/avfoundation/avasset), [`AVAssetTrack`](https://developer.apple.com/documentation/avfoundation/avassettrack), and [`AVMetadataItem`](https://developer.apple.com/documentation/avfoundation/avmetadataitem) for Swift clients. It also deprecates loading property values asynchronously using the [`loadValuesAsynchronously(forKeys:completionHandler:)`](https://developer.apple.com/documentation/avfoundation/avasynchronouskeyvalueloading/loadvaluesasynchronously\(forkeys:completionhandler:\)) method in favor of the syntax described below.
### [Load properties asynchronously](https://developer.apple.com/documentation/AVFoundation/loading-media-data-asynchronously#Load-properties-asynchronously)
The framework builds its asynchronous property-loading capabilities around two key types: [`AVAsyncProperty`](https://developer.apple.com/documentation/avfoundation/avasyncproperty) and [`AVAsynchronousKeyValueLoading`](https://developer.apple.com/documentation/avfoundation/avasynchronouskeyvalueloading). The framework uses the [`AVAsyncProperty`](https://developer.apple.com/documentation/avfoundation/avasyncproperty) class to define type-safe identifiers for properties with values that require asynchronous loading, and uses the [`AVAsynchronousKeyValueLoading`](https://developer.apple.com/documentation/avfoundation/avasynchronouskeyvalueloading) protocol to define the interface for objects to load properties asynchronously. [`AVAsset`](https://developer.apple.com/documentation/avfoundation/avasset), [`AVAssetTrack`](https://developer.apple.com/documentation/avfoundation/avassettrack), and [`AVMetadataItem`](https://developer.apple.com/documentation/avfoundation/avmetadataitem) adopt this protocol, which provides them an asynchronous [`load(_:isolation:)`](https://developer.apple.com/documentation/avfoundation/avasynchronouskeyvalueloading/load\(_:isolation:\)) method with the following signature:
```
public func load<T>(_ property: AVAsyncProperty<Self, T>) async throws -> T

```

Call this method from an asynchronous context, and specify the `await` keyword to indicate that execution can suspend until it finishes loading the data. The method returns a type-safe value if it successfully loads the property, or throws an error if it fails.
```
// A CMTime value.
let duration = try await asset.load(.duration)
// An array of AVMetadataItem for the asset.
let metadata = try await asset.load(.metadata)

```

If you know in advance that you require loading several asset properties, you can use a variation of the [`load(_:isolation:)`](https://developer.apple.com/documentation/avfoundation/avasynchronouskeyvalueloading/load\(_:isolation:\)) method that takes multiple identifiers and returns its result in a tuple. Like loading a single property value, loading several properties at the same time is also a type-safe operation.
```
// A CMTime value and an array of AVMetadataItem.
let (duration, metadata) = try await asset.load(.duration, .metadata)

```

Note
Loading several properties at the same time enables AVFoundation to optimize performance by batch-loading requests.
### [Determine a property status](https://developer.apple.com/documentation/AVFoundation/loading-media-data-asynchronously#Determine-a-property-status)
[`AVAsynchronousKeyValueLoading`](https://developer.apple.com/documentation/avfoundation/avasynchronouskeyvalueloading) also provides a [`status(of:)`](https://developer.apple.com/documentation/avfoundation/avasynchronouskeyvalueloading/status\(of:\)) method that returns the status of a property identifier. It returns an [`AVAsyncProperty.Status`](https://developer.apple.com/documentation/avfoundation/avasyncproperty/status) value that indicates the state of the property’s value using the cases shown in the example below:
```
// Determine the loaded status of the metadata property.
switch asset.status(of: .metadata) {
case .notYetLoaded:
    // The initial state of a property.
case .loading:
    // The asset is actively loading the property value.
case .loaded(let metadata):
    // The property is ready to use.
case .failed(let error):
    // The property value fails to load.
}

```

The `.loaded` and `.failed` cases provide an associated value. The `.loaded` case contains the previously loaded property value, and the `.failed` case contains an error that indicates the reason for the failure. Having access to an associated value enables you to perform operations like checking a property’s status and accessing its value in a single step.
```
// Verify the metadata property is in a loaded state.
if case .loaded(let metadata) = asset.status(of: .metadata) {
    // Process the loaded value.
    processMetadata(metadata)
}

```

### [Filter property collections](https://developer.apple.com/documentation/AVFoundation/loading-media-data-asynchronously#Filter-property-collections)
Some properties provide arrays of values, such as an asset’s [`tracks`](https://developer.apple.com/documentation/avfoundation/avpartialasyncproperty/tracks-44ptx) or its [`metadata`](https://developer.apple.com/documentation/avfoundation/avpartialasyncproperty/metadata-16qej). In many cases, you’re interested in only a subset of those values. [`AVAsset`](https://developer.apple.com/documentation/avfoundation/avasset) and [`AVAssetTrack`](https://developer.apple.com/documentation/avfoundation/avassettrack) also provide methods to filter their collections to only the values that you require. For example, the code listing below determines the audio sample rates that an asset contains. It calls the asset’s [`loadTracks(withMediaType:completionHandler:)`](https://developer.apple.com/documentation/avfoundation/avasset/loadtracks\(withmediatype:completionhandler:\)) to retrieve only its audio tracks. It iterates over each track and asynchronously loads the track’s format descriptions. Finally, it retrieves the sample rates from the stream description and sorts the results.
```
// Load the asset's audio tracks asynchronously.
let audioTracks = try await asset.loadTracks(withMediaType: .audio)
var allDescriptions = [CMFormatDescription]()
for track in audioTracks {
    // Load each audio track's format descriptions asynchronously.
    allDescriptions.append(contentsOf: try await track.load(.formatDescriptions))
}
// Collect the unique sample rates, and sort them from highest to lowest.
let sampleRates = Set(allDescriptions).map {
    Float($0.audioStreamBasicDescription?.mSampleRate ?? 0)
}.sorted(by: { $0 > $1 })

```

Using Swift concurrency and the AVFoundation asynchronous APIs makes performing even advanced inspection, as shown above, a simple, straight-line operation.
Current page is Loading media data asynchronously 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FAVFoundation%2Floading-media-data-asynchronously).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
