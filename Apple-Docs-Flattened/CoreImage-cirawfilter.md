Source: https://developer.apple.com/documentation/coreimage/cirawfilter

[ Skip Navigation ](https://developer.apple.com/documentation/coreimage/cirawfilter#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/coreimage/cirawfilter#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/coreimage/cirawfilter)
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
[ Open Menu ](https://developer.apple.com/documentation/coreimage/cirawfilter)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/coreimage/cirawfilter)


[](https://developer.apple.com/documentation/coreimage/cirawfilter)
## [ Core Image  ](https://developer.apple.com/documentation/coreimage)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 95 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 95 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 95 symbols inside <root> [Processing an Image Using Built-in Filters](https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
3 of 95 symbols inside <root> containing 72 symbols[CIContext](https://developer.apple.com/documentation/coreimage/cicontext)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
4 of 95 symbols inside <root> containing 111 symbols[CIImage](https://developer.apple.com/documentation/coreimage/ciimage)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 95 symbols inside <root>
Filters
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
6 of 95 symbols inside <root> containing 77 symbols[CIFilter](https://developer.apple.com/documentation/coreimage/cifilter-swift.class)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
7 of 95 symbols inside <root> containing 53 symbols[CIRAWFilter](https://developer.apple.com/documentation/coreimage/cirawfilter)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 53 symbols inside -1799817898 
Creating a filter
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 53 symbols inside -1799817898 [convenience init?(cvPixelBuffer: CVPixelBuffer, properties: [AnyHashable : Any])](https://developer.apple.com/documentation/coreimage/cirawfilter/init\(cvpixelbuffer:properties:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 53 symbols inside -1799817898 [convenience init?(imageData: Data, identifierHint: String?)](https://developer.apple.com/documentation/coreimage/cirawfilter/init\(imagedata:identifierhint:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 53 symbols inside -1799817898 [convenience init?(imageURL: URL)](https://developer.apple.com/documentation/coreimage/cirawfilter/init\(imageurl:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 53 symbols inside -1799817898 
Inspecting supported camera models, decoders, and filters
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
6 of 53 symbols inside -1799817898 [class var supportedCameraModels: [String]](https://developer.apple.com/documentation/coreimage/cirawfilter/supportedcameramodels)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
7 of 53 symbols inside -1799817898 [var supportedDecoderVersions: [CIRAWDecoderVersion]](https://developer.apple.com/documentation/coreimage/cirawfilter/supporteddecoderversions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
8 of 53 symbols inside -1799817898 containing 12 symbols[CIRAWDecoderVersion](https://developer.apple.com/documentation/coreimage/cirawdecoderversion)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
9 of 53 symbols inside -1799817898 [var isColorNoiseReductionSupported: Bool](https://developer.apple.com/documentation/coreimage/cirawfilter/iscolornoisereductionsupported)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
10 of 53 symbols inside -1799817898 [var isContrastSupported: Bool](https://developer.apple.com/documentation/coreimage/cirawfilter/iscontrastsupported)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
11 of 53 symbols inside -1799817898 [var isDetailSupported: Bool](https://developer.apple.com/documentation/coreimage/cirawfilter/isdetailsupported)
148 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Core Image ](https://developer.apple.com/documentation/coreimage)
  * [ CIRAWFilter ](https://developer.apple.com/documentation/coreimage/cirawfilter)
  *     * CIRAWFilter 


Class
# CIRAWFilter
A filter subclass that produces an image by manipulating RAW image sensor data from a digital camera or scanner.
iOS 15.0+iPadOS 15.0+Mac Catalyst 15.0+macOS 12.0+tvOS 15.0+visionOS 1.0+
```
class CIRAWFilter
```

## [Overview](https://developer.apple.com/documentation/coreimage/cirawfilter#overview)
Use this class to generate a [`CIImage`](https://developer.apple.com/documentation/coreimage/ciimage) object based on the configuration parameters you provide.
You can use this object in conjunction with other Core Image classes—such as [`CIFilter`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class) and [`CIContext`](https://developer.apple.com/documentation/coreimage/cicontext)—to take advantage of the built-in Core Image filters when processing images or writing custom filters.
You can also query this object to find out about the supported camera models, decoders, and filters.
## [Topics](https://developer.apple.com/documentation/coreimage/cirawfilter#topics)
### [Creating a filter](https://developer.apple.com/documentation/coreimage/cirawfilter#Creating-a-filter)
[`convenience init?(cvPixelBuffer: CVPixelBuffer, properties: [AnyHashable : Any])`](https://developer.apple.com/documentation/coreimage/cirawfilter/init\(cvpixelbuffer:properties:\))
Creates a RAW filter from the pixel buffer and its properties that you specify.
[`convenience init?(imageData: Data, identifierHint: String?)`](https://developer.apple.com/documentation/coreimage/cirawfilter/init\(imagedata:identifierhint:\))
Creates a RAW filter from the image data and type hint that you specify.
[`convenience init?(imageURL: URL)`](https://developer.apple.com/documentation/coreimage/cirawfilter/init\(imageurl:\))
Creates a RAW filter from the image at the URL location that you specify.
### [Inspecting supported camera models, decoders, and filters](https://developer.apple.com/documentation/coreimage/cirawfilter#Inspecting-supported-camera-models-decoders-and-filters)
[`class var supportedCameraModels: [String]`](https://developer.apple.com/documentation/coreimage/cirawfilter/supportedcameramodels)
An array containing the names of all supported camera models.
[`var supportedDecoderVersions: [CIRAWDecoderVersion]`](https://developer.apple.com/documentation/coreimage/cirawfilter/supporteddecoderversions)
An array of all supported decoder versions for the given image type.
[`struct CIRAWDecoderVersion`](https://developer.apple.com/documentation/coreimage/cirawdecoderversion)
[`var isColorNoiseReductionSupported: Bool`](https://developer.apple.com/documentation/coreimage/cirawfilter/iscolornoisereductionsupported)
A Boolean that indicates if the current image supports color noise reduction adjustments.
[`var isContrastSupported: Bool`](https://developer.apple.com/documentation/coreimage/cirawfilter/iscontrastsupported)
A Boolean that indicates if the current image supports contrast adjustments.
[`var isDetailSupported: Bool`](https://developer.apple.com/documentation/coreimage/cirawfilter/isdetailsupported)
A Boolean that indicates if the current image supports detail enhancement adjustments.
[`var isLensCorrectionSupported: Bool`](https://developer.apple.com/documentation/coreimage/cirawfilter/islenscorrectionsupported)
A Boolean that indicates if you can enable lens correction for the current image.
[`var isLocalToneMapSupported: Bool`](https://developer.apple.com/documentation/coreimage/cirawfilter/islocaltonemapsupported)
A Boolean that indicates if the current image supports local tone curve adjustments.
[`var isLuminanceNoiseReductionSupported: Bool`](https://developer.apple.com/documentation/coreimage/cirawfilter/isluminancenoisereductionsupported)
A Boolean that indicates if the current image supports luminance noise reduction adjustments.
[`var isMoireReductionSupported: Bool`](https://developer.apple.com/documentation/coreimage/cirawfilter/ismoirereductionsupported)
A Boolean that indicates if the current image supports moire artifact reduction adjustments.
[`var isSharpnessSupported: Bool`](https://developer.apple.com/documentation/coreimage/cirawfilter/issharpnesssupported)
A Boolean that indicates if the current image supports sharpness adjustments.
[`var nativeSize: CGSize`](https://developer.apple.com/documentation/coreimage/cirawfilter/nativesize)
The full native size of the unscaled image.
### [Configuring a filter](https://developer.apple.com/documentation/coreimage/cirawfilter#Configuring-a-filter)
[`var baselineExposure: Float`](https://developer.apple.com/documentation/coreimage/cirawfilter/baselineexposure)
A value that indicates the baseline exposure to apply to the image.
[`var boostAmount: Float`](https://developer.apple.com/documentation/coreimage/cirawfilter/boostamount)
A value that indicates the amount of global tone curve to apply to the image.
[`var boostShadowAmount: Float`](https://developer.apple.com/documentation/coreimage/cirawfilter/boostshadowamount)
A value that indicates the amount to boost the shadow areas of the image.
[`var colorNoiseReductionAmount: Float`](https://developer.apple.com/documentation/coreimage/cirawfilter/colornoisereductionamount)
A value that indicates the amount of chroma noise reduction to apply to the image.
[`var contrastAmount: Float`](https://developer.apple.com/documentation/coreimage/cirawfilter/contrastamount)
A value that indicates the amount of local contrast to apply to the edges of the image.
[`var decoderVersion: CIRAWDecoderVersion`](https://developer.apple.com/documentation/coreimage/cirawfilter/decoderversion)
A value that indicates the decoder version to use.
[`var detailAmount: Float`](https://developer.apple.com/documentation/coreimage/cirawfilter/detailamount)
A value that indicates the amount of detail enhancement to apply to the edges of the image.
[`var exposure: Float`](https://developer.apple.com/documentation/coreimage/cirawfilter/exposure)
A value that indicates the amount of exposure to apply to the image.
[`var extendedDynamicRangeAmount: Float`](https://developer.apple.com/documentation/coreimage/cirawfilter/extendeddynamicrangeamount)
A value that indicates the amount of extended dynamic range (EDR) to apply to the image.
[`var isDraftModeEnabled: Bool`](https://developer.apple.com/documentation/coreimage/cirawfilter/isdraftmodeenabled)
A Boolean that indicates whether to enable draft mode.
[`var isGamutMappingEnabled: Bool`](https://developer.apple.com/documentation/coreimage/cirawfilter/isgamutmappingenabled)
A Boolean that indicates whether to enable gamut mapping.
[`var isLensCorrectionEnabled: Bool`](https://developer.apple.com/documentation/coreimage/cirawfilter/islenscorrectionenabled)
A Boolean that indicates whether to enable lens correction.
[`var linearSpaceFilter: CIFilter?`](https://developer.apple.com/documentation/coreimage/cirawfilter/linearspacefilter)
An optional filter you can apply to the RAW image while it’s in linear space.
[`var localToneMapAmount: Float`](https://developer.apple.com/documentation/coreimage/cirawfilter/localtonemapamount)
A value that indicates the amount of local tone curve to apply to the image.
[`var luminanceNoiseReductionAmount: Float`](https://developer.apple.com/documentation/coreimage/cirawfilter/luminancenoisereductionamount)
A value that indicates the amount of luminance noise reduction to apply to the image.
[`var moireReductionAmount: Float`](https://developer.apple.com/documentation/coreimage/cirawfilter/moirereductionamount)
A value that indicates the amount of moire artifact reduction to apply to high frequency areas of the image.
[`var neutralChromaticity: CGPoint`](https://developer.apple.com/documentation/coreimage/cirawfilter/neutralchromaticity)
A value that indicates the amount of white balance based on chromaticity values to apply to the image.
[`var neutralLocation: CGPoint`](https://developer.apple.com/documentation/coreimage/cirawfilter/neutrallocation)
A value that indicates the amount of white balance based on pixel coordinates to apply to the image.
[`var neutralTemperature: Float`](https://developer.apple.com/documentation/coreimage/cirawfilter/neutraltemperature)
A value that indicates the amount of white balance based on temperature values to apply to the image.
[`var neutralTint: Float`](https://developer.apple.com/documentation/coreimage/cirawfilter/neutraltint)
A value that indicates the amount of white balance based on tint values to apply to the image.
[`var orientation: CGImagePropertyOrientation`](https://developer.apple.com/documentation/coreimage/cirawfilter/orientation)
A value that indicates the orientation of the image.
[`var portraitEffectsMatte: CIImage?`](https://developer.apple.com/documentation/coreimage/cirawfilter/portraiteffectsmatte)
An optional auxiliary image that represents the portrait effects matte of the image.
[`var previewImage: CIImage?`](https://developer.apple.com/documentation/coreimage/cirawfilter/previewimage)
An optional auxiliary image that represents a preview of the original image.
[`var properties: [AnyHashable : Any]`](https://developer.apple.com/documentation/coreimage/cirawfilter/properties)
A dictionary that contains properties of the image source.
[`var scaleFactor: Float`](https://developer.apple.com/documentation/coreimage/cirawfilter/scalefactor)
A value that indicates the desired scale factor to draw the output image.
[`var semanticSegmentationGlassesMatte: CIImage?`](https://developer.apple.com/documentation/coreimage/cirawfilter/semanticsegmentationglassesmatte)
An optional auxiliary image that represents the semantic segmentation glasses matte of the image.
[`var semanticSegmentationHairMatte: CIImage?`](https://developer.apple.com/documentation/coreimage/cirawfilter/semanticsegmentationhairmatte)
An optional auxiliary image that represents the semantic segmentation hair matte of the image.
[`var semanticSegmentationSkinMatte: CIImage?`](https://developer.apple.com/documentation/coreimage/cirawfilter/semanticsegmentationskinmatte)
An optional auxiliary image that represents the semantic segmentation skin matte of the image.
[`var semanticSegmentationSkyMatte: CIImage?`](https://developer.apple.com/documentation/coreimage/cirawfilter/semanticsegmentationskymatte)
An optional auxiliary image that represents the semantic segmentation sky matte of the image.
[`var semanticSegmentationTeethMatte: CIImage?`](https://developer.apple.com/documentation/coreimage/cirawfilter/semanticsegmentationteethmatte)
An optional auxiliary image that represents the semantic segmentation teeth matte of the image.
[`var shadowBias: Float`](https://developer.apple.com/documentation/coreimage/cirawfilter/shadowbias)
A value that indicates the amount to subtract from the shadows in the image.
[`var sharpnessAmount: Float`](https://developer.apple.com/documentation/coreimage/cirawfilter/sharpnessamount)
A value that indicates the amount of sharpness to apply to the edges of the image.
### [Instance Properties](https://developer.apple.com/documentation/coreimage/cirawfilter#Instance-Properties)
[`var isHighlightRecoveryEnabled: Bool`](https://developer.apple.com/documentation/coreimage/cirawfilter/ishighlightrecoveryenabled)
[`var isHighlightRecoverySupported: Bool`](https://developer.apple.com/documentation/coreimage/cirawfilter/ishighlightrecoverysupported)
## [Relationships](https://developer.apple.com/documentation/coreimage/cirawfilter#relationships)
### [Inherits From](https://developer.apple.com/documentation/coreimage/cirawfilter#inherits-from)
  * [`CIFilter`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class)


### [Conforms To](https://developer.apple.com/documentation/coreimage/cirawfilter#conforms-to)
  * [`CVarArg`](https://developer.apple.com/documentation/Swift/CVarArg)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`NSCoding`](https://developer.apple.com/documentation/Foundation/NSCoding)
  * [`NSCopying`](https://developer.apple.com/documentation/Foundation/NSCopying)
  * [`NSObjectProtocol`](https://developer.apple.com/documentation/ObjectiveC/NSObjectProtocol)
  * [`NSSecureCoding`](https://developer.apple.com/documentation/Foundation/NSSecureCoding)


## [See Also](https://developer.apple.com/documentation/coreimage/cirawfilter#see-also)
### [Filters](https://developer.apple.com/documentation/coreimage/cirawfilter#Filters)
[`class CIFilter`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class)
An image processor that produces an image by manipulating one or more input images or by generating new image data.
[`class CIColor`](https://developer.apple.com/documentation/coreimage/cicolor)
The Core Image class that defines a color object.
[`class CIVector`](https://developer.apple.com/documentation/coreimage/civector)
The Core Image class that defines a vector object.
Current page is CIRAWFilter 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fcoreimage%2Fcirawfilter).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
