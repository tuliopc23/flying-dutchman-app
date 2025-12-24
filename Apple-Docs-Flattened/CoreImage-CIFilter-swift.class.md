Source: https://developer.apple.com/documentation/coreimage/cifilter-swift.class

[ Skip Navigation ](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/coreimage/cifilter-swift.class)
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
[ Open Menu ](https://developer.apple.com/documentation/coreimage/cifilter-swift.class)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/coreimage/cifilter-swift.class)


[](https://developer.apple.com/documentation/coreimage/cifilter-swift.class)
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
1 of 77 symbols inside 271121761 
Creating a filter
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 77 symbols inside 271121761 [init?(name: String)](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/init\(name:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 77 symbols inside 271121761 [init?(name: String, withInputParameters: [String : Any]?)](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/init\(name:withinputparameters:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 77 symbols inside 271121761 
Configuring type-safe filters
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
5 of 77 symbols inside 271121761 containing 4 symbols[CIFilterProtocol](https://developer.apple.com/documentation/coreimage/cifilterprotocol)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
6 of 77 symbols inside 271121761 containing 30 symbols[Blur Filters](https://developer.apple.com/documentation/coreimage/blur-filters)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
7 of 77 symbols inside 271121761 containing 39 symbols[Color Adjustment Filters](https://developer.apple.com/documentation/coreimage/color-adjustment-filters)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
8 of 77 symbols inside 271121761 containing 60 symbols[Color Effect Filters](https://developer.apple.com/documentation/coreimage/color-effect-filters)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
9 of 77 symbols inside 271121761 containing 33 symbols[Composite Operations](https://developer.apple.com/documentation/coreimage/composite-operations)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
10 of 77 symbols inside 271121761 containing 13 symbols[Convolution Filters](https://developer.apple.com/documentation/coreimage/convolution-filters)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
11 of 77 symbols inside 271121761 containing 36 symbols[Distortion Filters](https://developer.apple.com/documentation/coreimage/distortion-filters)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
12 of 77 symbols inside 271121761 containing 37 symbols[Generator Filters](https://developer.apple.com/documentation/coreimage/generator-filters)
172 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Core Image ](https://developer.apple.com/documentation/coreimage)
  * [ CIFilter ](https://developer.apple.com/documentation/coreimage/cifilter-swift.class)
  *     * CIFilter 


Class
# CIFilter
An image processor that produces an image by manipulating one or more input images or by generating new image data.
iOS 5.0+iPadOS 5.0+Mac Catalyst 13.1+macOS 10.4+tvOSvisionOS 1.0+
```
class CIFilter
```

## [ Mentioned in ](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#mentions)
[](https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters)
[](https://developer.apple.com/documentation/coreimage/selectively-focusing-on-an-image)
[](https://developer.apple.com/documentation/coreimage/customizing-image-transitions)
## [Overview](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#overview)
The `CIFilter` class produces a [`CIImage`](https://developer.apple.com/documentation/coreimage/ciimage) object as output. Typically, a filter takes one or more images as input. Some filters, however, generate an image based on other types of input parameters. The par`CIFilter` swift.class` object are set and retrieved through the use of key-value pairs.
You use the `CIFilter` object in conjunction with other Core Image classes, such as `CIImage`, [`CIContext`](https://developer.apple.com/documentation/coreimage/cicontext), and [`CIColor`](https://developer.apple.com/documentation/coreimage/cicolor), to take advantage of the built-in Core Image filters when processing images, creating filter generators, or writing custom filters.
`CIFilter` objects are mutable, and thus cannot be shared safely among threads. Each thread must create its own `CIFilter` objects, but you can pass a filter’s immutable input and output `CIImage` objects between threads.
To get a quick overview of how to set up and use Core Image filters, see [Core Image Programming Guide](https://developer.apple.com/library/archive/documentation/GraphicsImaging/Conceptual/CoreImaging/ci_intro/ci_intro.html#//apple_ref/doc/uid/TP30001185).
### [Create type-safe filters](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#Create-type-safe-filters)
Core Image provides methods that create type-safe `CIFilter` instances. Use these filters to avoid run-time errors that can occur when relying on Core Image’s string-based API.
To use the type-safe API, import `CoreImage.CIFilterBuiltins`:
```
#import <CoreImage/CoreImage.h>
#import <CoreImage/CIFilterBuiltins.h>

```

The type-safe approach returns a non-optional filter. Because the returned filter conforms to the relevant protocol—for example, [`CIFalseColor`](https://developer.apple.com/documentation/coreimage/cifalsecolor) in the case of [`falseColor()`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/falsecolor\(\))—the parameters are available as properties. The following creates and applies a false color filter:
```
- (CIImage *) falseColorImage:(CIImage*) inputImage {
    CIFilter<CIFalseColor> *falseColorFilter = CIFilter.falseColorFilter;
    falseColorFilter.color0 = [CIColor colorWithRed:1 green:1 blue:0];
    falseColorFilter.color1 = [CIColor colorWithRed:0 green:0 blue:1];
    falseColorFilter.inputImage = inputImage;
    return falseColorFilter.outputImage;
}

```

The false color filter maps luminance to a color ramp of two colors:
![Two photographs showing a flower. The image on the left shows the original version of the flower. The image on the right shows the false color version of the flower.](https://docs-assets.developer.apple.com/published/31bc2cc68e11100dbfd10afe19552daa/media-4336877%402x.png)
### [Subclassing notes](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#Subclassing-notes)
You can subclass `CIFilter` in order to create custom filter effects:
  * By chaining together two or more built-in Core Image filters
  * By using an image-processing kernel that you write


Regardless of whether your subclass provides its effect by chaining filters or implementing its own kernel, you should:
  * Declare any input parameters as properties whose names are prefixed with `input`, such as `inputImage`.
  * Override the [`setDefaults()`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/setdefaults\(\)) methods to provide default values for any input parameters you’ve declared.
  * Implement an `outputImage` method to create a new `CIImage` with your filter’s effect.


The `CIFilter` class automatically manages input parameters when archiving, copying, and deallocating filters. For this reason, your subclass must obey the following guidelines to ensure proper behavior:
  * Store input parameters in instance variables whose names are prefixed with `input`.


Don’t use auto-synthesized instance variables, because their names are automatically prefixed with an underscore. Instead, synthesize the property manually. For example:
`@synthesize inputMyParameter;`
  * If using manual reference counting, don’t release input parameter instance variables in your [`dealloc`](https://developer.apple.com/documentation/ObjectiveC/NSObject-swift.class/dealloc) method implementation. The [`dealloc`](https://developer.apple.com/documentation/ObjectiveC/NSObject-swift.class/dealloc) implementation in the `CIFilter` class uses [Key-value coding](https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/KeyValueCoding.html#//apple_ref/doc/uid/TP40008195-CH25) to automatically set the values of all input parameters to `nil`.


## [Topics](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#topics)
### [Creating a filter](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#Creating-a-filter)
[`init?(name: String)`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/init\(name:\))
Creates a [`CIFilter`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class) object for a specific kind of filter.
[`init?(name: String, withInputParameters: [String : Any]?)`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/init\(name:withinputparameters:\))
Creates a [`CIFilter`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class) object for a specific kind of filter and initializes the input values.
### [Configuring type-safe filters](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#Configuring-type-safe-filters)
Configure Core Image filters that expose their attributes as properties.
[`protocol CIFilterProtocol`](https://developer.apple.com/documentation/coreimage/cifilterprotocol)
The properties you use to configure a Core Image filter.
[API Reference Blur Filters](https://developer.apple.com/documentation/coreimage/blur-filters)
Apply blurs, simulate motion and zoom effects, reduce noise, and erode and dilate image regions.
[API Reference Color Adjustment Filters](https://developer.apple.com/documentation/coreimage/color-adjustment-filters)
Apply color transformations, including exposure, hue, and tint adjustments.
[API Reference Color Effect Filters](https://developer.apple.com/documentation/coreimage/color-effect-filters)
Apply color effects, including photo effects, dithering, and color maps.
[API Reference Composite Operations](https://developer.apple.com/documentation/coreimage/composite-operations)
Composite images by using a range of blend modes and compositing operators.
[API Reference Convolution Filters](https://developer.apple.com/documentation/coreimage/convolution-filters)
Produce effects such as blurring, sharpening, edge detection, translation, and embossing.
[API Reference Distortion Filters](https://developer.apple.com/documentation/coreimage/distortion-filters)
Apply distortion to images.
[API Reference Generator Filters](https://developer.apple.com/documentation/coreimage/generator-filters)
Generate barcode, geometric, and special-effect images.
[API Reference Geometry Adjustment Filters](https://developer.apple.com/documentation/coreimage/geometry-adjustment-filters)
Translate, scale, and rotate images in 2D and 3D.
[API Reference Gradient Filters](https://developer.apple.com/documentation/coreimage/gradient-filters)
Generate linear and radial gradients.
[API Reference Halftone Effect Filters](https://developer.apple.com/documentation/coreimage/halftone-effect-filters)
Simulate monochrome and CMYK halftone screens.
[API Reference Reduction Filters](https://developer.apple.com/documentation/coreimage/reduction-filters)
Create statistical information about an image.
[API Reference Sharpening Filters](https://developer.apple.com/documentation/coreimage/sharpening-filters)
Apply sharpening to images.
[API Reference Stylizing Filters](https://developer.apple.com/documentation/coreimage/stylizing-filters)
Create stylized versions of images by applying effects including pixelation and line overlays.
[API Reference Tile Effect Filters](https://developer.apple.com/documentation/coreimage/tile-effect-filters)
Produce tiled images from source images.
[API Reference Transition Filters](https://developer.apple.com/documentation/coreimage/transition-filters)
Transition between two images by using effects including page curl and swipe.
### [Accessing registered filters](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#Accessing-registered-filters)
[`class func filterNames(inCategories: [String]?) -> [String]`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/filternames\(incategories:\))
Returns an array of all published filter names that match all the specified categories.
[`class func filterNames(inCategory: String?) -> [String]`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/filternames\(incategory:\))
Returns an array of all published filter names in the specified category.
### [Registering a filter](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#Registering-a-filter)
[`class func registerName(String, constructor: any CIFilterConstructor, classAttributes: [String : Any])`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/registername\(_:constructor:classattributes:\))
Publishes a custom filter that is not packaged as an image unit.
### [Getting filter parameters and attributes](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#Getting-filter-parameters-and-attributes)
[`var name: String`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/name)
A name associated with a filter.
[`var isEnabled: Bool`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/isenabled)
A Boolean value that determines whether the filter is enabled. Animatable.
[`var attributes: [String : Any]`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/attributes)
A dictionary of key-value pairs that describe the filter.
[`var inputKeys: [String]`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/inputkeys)
The names of all input parameters to the filter.
[`var outputKeys: [String]`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/outputkeys)
The names of all output parameters from the filter.
[`var outputImage: CIImage?`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/outputimage)
Returns a [`CIImage`](https://developer.apple.com/documentation/coreimage/ciimage) object that encapsulates the operations configured in the filter.
### [Setting default values](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#Setting-default-values)
[`func setDefaults()`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/setdefaults\(\))
Sets all input values for a filter to default values.
### [Applying a filter](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#Applying-a-filter)
[`func apply(CIKernel, arguments: [Any]?, options: [String : Any]?) -> CIImage?`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/apply\(_:arguments:options:\))
Produces a [`CIImage`](https://developer.apple.com/documentation/coreimage/ciimage) object by applying arguments to a kernel function and using options to control how the kernel function is evaluated.
### [Getting localized information for registered filters](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#Getting-localized-information-for-registered-filters)
[`class func localizedName(forFilterName: String) -> String?`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/localizedname\(forfiltername:\))
Returns the localized name for the specified filter name.
[`class func localizedName(forCategory: String) -> String`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/localizedname\(forcategory:\))
Returns the localized name for the specified filter category.
[`class func localizedDescription(forFilterName: String) -> String?`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/localizeddescription\(forfiltername:\))
Returns the localized description of a filter for display in the user interface.
[`class func localizedReferenceDocumentation(forFilterName: String) -> URL?`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/localizedreferencedocumentation\(forfiltername:\))
Returns the location of the localized reference documentation that describes the filter.
### [Creating a configuration view for a filter](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#Creating-a-configuration-view-for-a-filter)
[`func view(forUIConfiguration: [AnyHashable : Any]!, excludedKeys: [Any]!) -> IKFilterUIView!`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/view\(foruiconfiguration:excludedkeys:\))
Returns a filter view for the filter.
### [Applying system tone mapping modes](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#Applying-system-tone-mapping-modes)
[`struct CIDynamicRangeOption`](https://developer.apple.com/documentation/coreimage/cidynamicrangeoption)
An enum string type that your code can use to select different System Tone Mapping modes.
### [Constants](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#Constants)
[API Reference Filter Attribute Keys](https://developer.apple.com/documentation/coreimage/filter-attribute-keys)
Attributes for a filter and its parameters.
[API Reference Data Type Attributes](https://developer.apple.com/documentation/coreimage/data-type-attributes)
Numeric data types.
[API Reference Vector Quantity Attributes](https://developer.apple.com/documentation/coreimage/vector-quantity-attributes)
Vector data types.
[API Reference Color Attribute Keys](https://developer.apple.com/documentation/coreimage/color-attribute-keys)
Color types.
[API Reference Image Attribute Keys](https://developer.apple.com/documentation/coreimage/image-attribute-keys)
Image Types
[API Reference Filter Category Keys](https://developer.apple.com/documentation/coreimage/filter-category-keys)
Categories of filters.
[API Reference Options for Applying a Filter](https://developer.apple.com/documentation/coreimage/options-for-applying-a-filter)
Options that control the application of a custom Core Image filter.
[API Reference User Interface Control Options](https://developer.apple.com/documentation/coreimage/user-interface-control-options)
Sets of controls for various user scenarios.
[API Reference User Interface Options](https://developer.apple.com/documentation/coreimage/user-interface-options)
Keys or values for the size of the input parameter controls for a filter view.
[API Reference Filter Parameter Keys](https://developer.apple.com/documentation/coreimage/filter-parameter-keys)
Keys for input parameters to filters.
[API Reference RAW Image Options](https://developer.apple.com/documentation/coreimage/raw-image-options)
Options for creating a [`CIFilter`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class) object from RAW image data.
### [Deprecated](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#Deprecated)
[`init!(CVPixelBuffer: CVPixelBuffer!, properties: [AnyHashable : Any]!, options: [CIRAWFilterOption : Any]!)`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/init\(cvpixelbuffer:properties:options:\))
Creates a filter from a Core Video pixel buffer.
Deprecated
[`init!(imageData: Data!, options: [CIRAWFilterOption : Any]!)`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/init\(imagedata:options:\))
Creates a filter that allows the processing of RAW images.
Deprecated
[`init!(imageURL: URL!, options: [CIRAWFilterOption : Any]!)`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/init\(imageurl:options:\))
Creates a filter that allows the processing of RAW images.
Deprecated
[`struct CIRAWFilterOption`](https://developer.apple.com/documentation/coreimage/cirawfilteroption)Deprecated
[`class func serializedXMP(from: [CIFilter], inputImageExtent: CGRect) -> Data?`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/serializedxmp\(from:inputimageextent:\))
Serializes filter parameters into XMP form that is suitable for embedding in an image.
Deprecated
[`class func filterArray(fromSerializedXMP: Data, inputImageExtent: CGRect, error: NSErrorPointer) -> [CIFilter]`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/filterarray\(fromserializedxmp:inputimageextent:error:\))
Returns an array of filter objects de-serialized from XMP data.
Deprecated
[`class func supportedRawCameraModels() -> [String]!`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/supportedrawcameramodels\(\))Deprecated
### [Type methods](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#Type-methods)
[`class func areaAlphaWeightedHistogram() -> any CIFilter & CIAreaHistogram`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/areaalphaweightedhistogram\(\))
[`class func areaBoundsRed() -> any CIFilter & CIAreaBoundsRed`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/areaboundsred\(\))
[`class func maximumScaleTransform() -> any CIFilter & CIMaximumScaleTransform`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/maximumscaletransform\(\))
[`class func toneMapHeadroom() -> any CIFilter & CIToneMapHeadroom`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/tonemapheadroom\(\))
### [Type Methods](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#Type-Methods)
[`class func areaAverageMaximumRed() -> any CIFilter & CIAreaAverageMaximumRed`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/areaaveragemaximumred\(\))
[`class func blurredRoundedRectangleGenerator() -> any CIFilter & CIBlurredRoundedRectangleGenerator`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/blurredroundedrectanglegenerator\(\))
[`class func distanceGradientFromRedMask() -> any CIFilter & CIDistanceGradientFromRedMask`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/distancegradientfromredmask\(\))
[`class func roundedQRCodeGenerator() -> any CIFilter & CIRoundedQRCodeGenerator`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/roundedqrcodegenerator\(\))
[`class func signedDistanceGradientFromRedMask() -> any CIFilter & CISignedDistanceGradientFromRedMask`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/signeddistancegradientfromredmask\(\))
[`class func systemToneMap() -> any CIFilter & CISystemToneMap`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/systemtonemap\(\))
## [Relationships](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#relationships)
### [Inherits From](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#inherits-from)
  * [`NSObject`](https://developer.apple.com/documentation/ObjectiveC/NSObject-swift.class)


### [Inherited By](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#inherited-by)
  * [`CIRAWFilter`](https://developer.apple.com/documentation/coreimage/cirawfilter)


### [Conforms To](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#conforms-to)
  * [`CVarArg`](https://developer.apple.com/documentation/Swift/CVarArg)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`NSCoding`](https://developer.apple.com/documentation/Foundation/NSCoding)
  * [`NSCopying`](https://developer.apple.com/documentation/Foundation/NSCopying)
  * [`NSObjectProtocol`](https://developer.apple.com/documentation/ObjectiveC/NSObjectProtocol)
  * [`NSSecureCoding`](https://developer.apple.com/documentation/Foundation/NSSecureCoding)


## [See Also](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#see-also)
### [Filters](https://developer.apple.com/documentation/coreimage/cifilter-swift.class#Filters)
[`class CIRAWFilter`](https://developer.apple.com/documentation/coreimage/cirawfilter)
A filter subclass that produces an image by manipulating RAW image sensor data from a digital camera or scanner.
[`class CIColor`](https://developer.apple.com/documentation/coreimage/cicolor)
The Core Image class that defines a color object.
[`class CIVector`](https://developer.apple.com/documentation/coreimage/civector)
The Core Image class that defines a vector object.
Current page is CIFilter 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fcoreimage%2Fcifilter-swift.class).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
