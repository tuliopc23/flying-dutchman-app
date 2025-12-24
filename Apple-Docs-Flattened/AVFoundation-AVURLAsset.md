Source: https://developer.apple.com/documentation/avfoundation/avurlasset

[ Skip Navigation ](https://developer.apple.com/documentation/avfoundation/avurlasset#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/avfoundation/avurlasset#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/avfoundation/avurlasset)
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
[ Open Menu ](https://developer.apple.com/documentation/avfoundation/avurlasset)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/avfoundation/avurlasset)


[](https://developer.apple.com/documentation/avfoundation/avurlasset)
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
1 of 30 symbols inside -299676590 
Creating an asset
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 30 symbols inside -299676590 [convenience init(url: URL)](https://developer.apple.com/documentation/avfoundation/avurlasset/init\(url:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 30 symbols inside -299676590 [init(url: URL, options: [String : Any]?)](https://developer.apple.com/documentation/avfoundation/avurlasset/init\(url:options:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
4 of 30 symbols inside -299676590 containing 13 symbols[Initialization options](https://developer.apple.com/documentation/avfoundation/avurlasset-initialization-options)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 30 symbols inside -299676590 
Loading tracks
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
6 of 30 symbols inside -299676590 [static var tracks: AVAsyncProperty<Root, [AVAssetTrack]>](https://developer.apple.com/documentation/avfoundation/avpartialasyncproperty/tracks-44ptx)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
7 of 30 symbols inside -299676590 [func findCompatibleTrack(for: AVCompositionTrack, completionHandler: (AVAssetTrack?, (any Error)?) -> Void)](https://developer.apple.com/documentation/avfoundation/avurlasset/findcompatibletrack\(for:completionhandler:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 30 symbols inside -299676590 
Loading variants
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
9 of 30 symbols inside -299676590 [static var variants: AVAsyncProperty<Root, [AVAssetVariant]>](https://developer.apple.com/documentation/avfoundation/avpartialasyncproperty/variants)
89 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ AVFoundation ](https://developer.apple.com/documentation/avfoundation)
  * [ AVURLAsset ](https://developer.apple.com/documentation/avfoundation/avurlasset)
  *     * AVURLAsset 


Class
# AVURLAsset
An asset that represents media at a local or remote URL.
iOS 4.0+iPadOS 4.0+Mac Catalyst 13.1+macOS 10.7+tvOS 9.0+visionOS 1.0+watchOS 1.0+
```
class AVURLAsset
```

## [Overview](https://developer.apple.com/documentation/avfoundation/avurlasset#overview)
This class is a concrete subclass of [`AVAsset`](https://developer.apple.com/documentation/avfoundation/avasset). When you create an asset as shown below, the system creates and returns an instance of [`AVURLAsset`](https://developer.apple.com/documentation/avfoundation/avurlasset).
```
// A local or remote asset URL.
guard let url: URL = Bundle.main.url(forResource: "Image",
                                     withExtension: "png") else { return }
let asset = AVAsset(url: url)

```

In many cases, this is an appropriate way to create asset instances, but you can also directly instantiate an [`AVURLAsset`](https://developer.apple.com/documentation/avfoundation/avurlasset) when you need more fine-grained control over its initialization. The initializer for [`AVURLAsset`](https://developer.apple.com/documentation/avfoundation/avurlasset) accepts an options dictionary, which you use to customize the asset’s initialization for your particular purpose. For example, if you’re creating an asset for an HLS stream, you may want to prevent it from retrieving its media when it connects over a cellular network. You can do this by providing the initialization option and value as shown below.
```
let url: URL = // A remote asset URL.
let options = [AVURLAssetAllowsCellularAccessKey: false]
let asset = AVURLAsset(url: url, options: options)

```

## [Topics](https://developer.apple.com/documentation/avfoundation/avurlasset#topics)
### [Creating an asset](https://developer.apple.com/documentation/avfoundation/avurlasset#Creating-an-asset)
[`convenience init(url: URL)`](https://developer.apple.com/documentation/avfoundation/avurlasset/init\(url:\))
Creates an asset that models the media at the specified URL.
[`init(url: URL, options: [String : Any]?)`](https://developer.apple.com/documentation/avfoundation/avurlasset/init\(url:options:\))
Creates an asset that models the media resource at the specified URL.
[API Reference Initialization options](https://developer.apple.com/documentation/avfoundation/avurlasset-initialization-options)
Specify options to configure the initialization of a media asset.
### [Loading tracks](https://developer.apple.com/documentation/avfoundation/avurlasset#Loading-tracks)
[`static var tracks: AVAsyncProperty<Root, [AVAssetTrack]>`](https://developer.apple.com/documentation/avfoundation/avpartialasyncproperty/tracks-44ptx)
The tracks an asset contains.
[`func findCompatibleTrack(for: AVCompositionTrack, completionHandler: (AVAssetTrack?, (any Error)?) -> Void)`](https://developer.apple.com/documentation/avfoundation/avurlasset/findcompatibletrack\(for:completionhandler:\))
Loads an asset track from which you can insert any time range into the composition track.
### [Loading variants](https://developer.apple.com/documentation/avfoundation/avurlasset#Loading-variants)
[`static var variants: AVAsyncProperty<Root, [AVAssetVariant]>`](https://developer.apple.com/documentation/avfoundation/avpartialasyncproperty/variants)
An array of variants that an asset contains.
### [Determining supported media types](https://developer.apple.com/documentation/avfoundation/avurlasset#Determining-supported-media-types)
[`class func audiovisualTypes() -> [AVFileType]`](https://developer.apple.com/documentation/avfoundation/avurlasset/audiovisualtypes\(\))
Returns an array of the file types the asset supports.
[`class func audiovisualMIMETypes() -> [String]`](https://developer.apple.com/documentation/avfoundation/avurlasset/audiovisualmimetypes\(\))
Returns an array of the MIME types the asset supports.
[`class func isPlayableExtendedMIMEType(String) -> Bool`](https://developer.apple.com/documentation/avfoundation/avurlasset/isplayableextendedmimetype\(_:\))
Returns a Boolean value that indicates whether the asset is playable with the specified codecs and container type.
[`class var audiovisualContentTypes: [UTType]`](https://developer.apple.com/documentation/avfoundation/avurlasset/audiovisualcontenttypes)
Provides the content types the AVURLAsset class understands.
### [Assisting with resource loading](https://developer.apple.com/documentation/avfoundation/avurlasset#Assisting-with-resource-loading)
[`var resourceLoader: AVAssetResourceLoader`](https://developer.apple.com/documentation/avfoundation/avurlasset/resourceloader)
The resource loader for the asset.
[`var mayRequireContentKeysForMediaDataProcessing: Bool`](https://developer.apple.com/documentation/avfoundation/avurlasset/mayrequirecontentkeysformediadataprocessing)
A Boolean value that indicates whether you can add this asset as a content key recipient to a content key session.
### [Working with offline assets](https://developer.apple.com/documentation/avfoundation/avurlasset#Working-with-offline-assets)
[`var assetCache: AVAssetCache?`](https://developer.apple.com/documentation/avfoundation/avurlasset/assetcache)
The asset’s associated asset cache, if it exists.
### [Accessing the media URL](https://developer.apple.com/documentation/avfoundation/avurlasset#Accessing-the-media-URL)
[`var url: URL`](https://developer.apple.com/documentation/avfoundation/avurlasset/url)
A URL to the asset’s media.
### [Accessing asset variants](https://developer.apple.com/documentation/avfoundation/avurlasset#Accessing-asset-variants)
[`var variants: [AVAssetVariant]`](https://developer.apple.com/documentation/avfoundation/avurlasset/variants)
An array of variants that an asset contains.
Deprecated
### [Accessing compatible tracks](https://developer.apple.com/documentation/avfoundation/avurlasset#Accessing-compatible-tracks)
[`func compatibleTrack(for: AVCompositionTrack) -> AVAssetTrack?`](https://developer.apple.com/documentation/avfoundation/avurlasset/compatibletrack\(for:\))
Returns an asset track from which you can insert any time range into a given composition track.
Deprecated
### [Accessing the session identifier](https://developer.apple.com/documentation/avfoundation/avurlasset#Accessing-the-session-identifier)
[`var httpSessionIdentifier: UUID`](https://developer.apple.com/documentation/avfoundation/avurlasset/httpsessionidentifier)
A session identifier that the asset sends in HTTP requests that it makes.
### [Accessing Media Extension properties](https://developer.apple.com/documentation/avfoundation/avurlasset#Accessing-Media-Extension-properties)
[`var mediaExtensionProperties: AVMediaExtensionProperties?`](https://developer.apple.com/documentation/avfoundation/avurlasset/mediaextensionproperties)
The properties of the media extension format reader that decodes the asset.
[`class AVMediaExtensionProperties`](https://developer.apple.com/documentation/avfoundation/avmediaextensionproperties)
An object that describes a Media Extension.
## [Relationships](https://developer.apple.com/documentation/avfoundation/avurlasset#relationships)
### [Inherits From](https://developer.apple.com/documentation/avfoundation/avurlasset#inherits-from)
  * [`AVAsset`](https://developer.apple.com/documentation/avfoundation/avasset)


### [Inherited By](https://developer.apple.com/documentation/avfoundation/avurlasset#inherited-by)
  * [`AVFragmentedAsset`](https://developer.apple.com/documentation/avfoundation/avfragmentedasset)


### [Conforms To](https://developer.apple.com/documentation/avfoundation/avurlasset#conforms-to)
  * [`AVAsynchronousKeyValueLoading`](https://developer.apple.com/documentation/avfoundation/avasynchronouskeyvalueloading)
  * [`AVContentKeyRecipient`](https://developer.apple.com/documentation/avfoundation/avcontentkeyrecipient)
  * [`CVarArg`](https://developer.apple.com/documentation/Swift/CVarArg)
  * [`Copyable`](https://developer.apple.com/documentation/Swift/Copyable)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`NSCopying`](https://developer.apple.com/documentation/Foundation/NSCopying)
  * [`NSItemProviderReading`](https://developer.apple.com/documentation/Foundation/NSItemProviderReading)
  * [`NSItemProviderWriting`](https://developer.apple.com/documentation/Foundation/NSItemProviderWriting)
  * [`NSObjectProtocol`](https://developer.apple.com/documentation/ObjectiveC/NSObjectProtocol)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)


## [See Also](https://developer.apple.com/documentation/avfoundation/avurlasset#see-also)
### [Assets](https://developer.apple.com/documentation/avfoundation/avurlasset#Assets)
[`class AVAsset`](https://developer.apple.com/documentation/avfoundation/avasset)
An object that models timed audiovisual media.
[`class AVAssetTrack`](https://developer.apple.com/documentation/avfoundation/avassettrack)
An object that models a track of media that an asset contains.
[`class AVAssetTrackSegment`](https://developer.apple.com/documentation/avfoundation/avassettracksegment)
An object that represents a time range segment of an asset track.
[`class AVAssetTrackGroup`](https://developer.apple.com/documentation/avfoundation/avassettrackgroup)
A group of related tracks in an asset.
Current page is AVURLAsset 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Favfoundation%2Favurlasset).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
