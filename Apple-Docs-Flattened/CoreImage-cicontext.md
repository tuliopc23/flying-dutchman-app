Source: https://developer.apple.com/documentation/coreimage/cicontext

[ Skip Navigation ](https://developer.apple.com/documentation/coreimage/cicontext#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/coreimage/cicontext#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/coreimage/cicontext)
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
[ Open Menu ](https://developer.apple.com/documentation/coreimage/cicontext)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/coreimage/cicontext)


[](https://developer.apple.com/documentation/coreimage/cicontext)
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
1 of 72 symbols inside 1379438945 
Creating a Context Without Specifying a Destination
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 72 symbols inside 1379438945 [init()](https://developer.apple.com/documentation/coreimage/cicontext/init\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 72 symbols inside 1379438945 
Creating a Context for CPU-Based Rendering
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 72 symbols inside 1379438945 [init(cgContext: CGContext, options: [CIContextOption : Any]?)](https://developer.apple.com/documentation/coreimage/cicontext/init\(cgcontext:options:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 72 symbols inside 1379438945 
Creating a Context for GPU-Based Rendering
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
6 of 72 symbols inside 1379438945 [init(mtlDevice: any MTLDevice)](https://developer.apple.com/documentation/coreimage/cicontext/init\(mtldevice:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
7 of 72 symbols inside 1379438945 [init(mtlDevice: any MTLDevice, options: [CIContextOption : Any]?)](https://developer.apple.com/documentation/coreimage/cicontext/init\(mtldevice:options:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
8 of 72 symbols inside 1379438945 [init(mtlCommandQueue: any MTLCommandQueue)](https://developer.apple.com/documentation/coreimage/cicontext/init\(mtlcommandqueue:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
9 of 72 symbols inside 1379438945 [init(mtlCommandQueue: any MTLCommandQueue, options: [CIContextOption : Any]?)](https://developer.apple.com/documentation/coreimage/cicontext/init\(mtlcommandqueue:options:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 72 symbols inside 1379438945 
Rendering Images
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
11 of 72 symbols inside 1379438945 [func createCGImage(CIImage, from: CGRect) -> CGImage?](https://developer.apple.com/documentation/coreimage/cicontext/createcgimage\(_:from:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
12 of 72 symbols inside 1379438945 [func createCGImage(CIImage, from: CGRect, format: CIFormat, colorSpace: CGColorSpace?) -> CGImage?](https://developer.apple.com/documentation/coreimage/cicontext/createcgimage\(_:from:format:colorspace:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
13 of 72 symbols inside 1379438945 [func createCGImage(CIImage, from: CGRect, format: CIFormat, colorSpace: CGColorSpace?, deferred: Bool) -> CGImage?](https://developer.apple.com/documentation/coreimage/cicontext/createcgimage\(_:from:format:colorspace:deferred:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
14 of 72 symbols inside 1379438945 [func render(CIImage, toBitmap: UnsafeMutableRawPointer, rowBytes: Int, bounds: CGRect, format: CIFormat, colorSpace: CGColorSpace?)](https://developer.apple.com/documentation/coreimage/cicontext/render\(_:tobitmap:rowbytes:bounds:format:colorspace:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
15 of 72 symbols inside 1379438945 [func render(CIImage, to: CVPixelBuffer)](https://developer.apple.com/documentation/coreimage/cicontext/render\(_:to:\))
167 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Core Image ](https://developer.apple.com/documentation/coreimage)
  * [ CIContext ](https://developer.apple.com/documentation/coreimage/cicontext)
  *     * CIContext 


Class
# CIContext
The Core Image context class provides an evaluation context for Core Image processing with Metal, OpenGL, or OpenCL.
iOS 5.0+iPadOS 5.0+Mac Catalyst 13.1+macOS 10.4+tvOSvisionOS 1.0+
```
class CIContext
```

## [ Mentioned in ](https://developer.apple.com/documentation/coreimage/cicontext#mentions)
[](https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters)
## [Overview](https://developer.apple.com/documentation/coreimage/cicontext#overview)
You use a `CIContext` instance to render a [`CIImage`](https://developer.apple.com/documentation/coreimage/ciimage) instance which represents a graph of image processing operations which are built using other Core Image classes, such as [`CIFilter`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class), [`CIKernel`](https://developer.apple.com/documentation/coreimage/cikernel), [`CIColor`](https://developer.apple.com/documentation/coreimage/cicolor) and [`CIImage`](https://developer.apple.com/documentation/coreimage/ciimage). You can also use a `CIContext` with the [`CIDetector`](https://developer.apple.com/documentation/coreimage/cidetector) class to analyze images — for example, to detect faces or barcodes.
Contexts support automatic color management by performing all processing operations in a working color space. This means that unless told otherwise:
  * All input images are color matched from the input’s color space to the working space.
  * All renders are color matched from the working space to the destination space. (For more information on `CGColorSpace` see [`CGColorSpace`](https://developer.apple.com/documentation/CoreGraphics/CGColorSpace))


`CIContext` and [`CIImage`](https://developer.apple.com/documentation/coreimage/ciimage) instances are immutable, so multiple threads can use the same [`CIContext`](https://developer.apple.com/documentation/coreimage/cicontext) instance to render [`CIImage`](https://developer.apple.com/documentation/coreimage/ciimage) instances. However, [`CIFilter`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class) instances are mutable and thus cannot be shared safely among threads. Each thread must take case not to access or modify a [`CIFilter`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class) instance while it is being used by another thread.
The `CIContext` manages various internal state such as `MTLCommandQueue` and caches for compiled kernels and intermediate buffers. For this reason it is not recommended to create many `CIContext` instances. As a rule, it recommended that you create one `CIContext` instance for each view that renders [`CIImage`](https://developer.apple.com/documentation/coreimage/ciimage) or each background task.
## [Topics](https://developer.apple.com/documentation/coreimage/cicontext#topics)
### [Creating a Context Without Specifying a Destination](https://developer.apple.com/documentation/coreimage/cicontext#Creating-a-Context-Without-Specifying-a-Destination)
[`init()`](https://developer.apple.com/documentation/coreimage/cicontext/init\(\))
Initializes a context without a specific rendering destination, using default options.
### [Creating a Context for CPU-Based Rendering](https://developer.apple.com/documentation/coreimage/cicontext#Creating-a-Context-for-CPU-Based-Rendering)
[`init(cgContext: CGContext, options: [CIContextOption : Any]?)`](https://developer.apple.com/documentation/coreimage/cicontext/init\(cgcontext:options:\))
Creates a Core Image context from a Quartz context, using the specified options.
### [Creating a Context for GPU-Based Rendering](https://developer.apple.com/documentation/coreimage/cicontext#Creating-a-Context-for-GPU-Based-Rendering)
[`init(mtlDevice: any MTLDevice)`](https://developer.apple.com/documentation/coreimage/cicontext/init\(mtldevice:\))
Creates a Core Image context using the specified Metal device.
[`init(mtlDevice: any MTLDevice, options: [CIContextOption : Any]?)`](https://developer.apple.com/documentation/coreimage/cicontext/init\(mtldevice:options:\))
Creates a Core Image context using the specified Metal device and options.
[`init(mtlCommandQueue: any MTLCommandQueue)`](https://developer.apple.com/documentation/coreimage/cicontext/init\(mtlcommandqueue:\))
[`init(mtlCommandQueue: any MTLCommandQueue, options: [CIContextOption : Any]?)`](https://developer.apple.com/documentation/coreimage/cicontext/init\(mtlcommandqueue:options:\))
### [Rendering Images](https://developer.apple.com/documentation/coreimage/cicontext#Rendering-Images)
[`func createCGImage(CIImage, from: CGRect) -> CGImage?`](https://developer.apple.com/documentation/coreimage/cicontext/createcgimage\(_:from:\))
Creates a Core Graphics image from a region of a Core Image image instance.
[`func createCGImage(CIImage, from: CGRect, format: CIFormat, colorSpace: CGColorSpace?) -> CGImage?`](https://developer.apple.com/documentation/coreimage/cicontext/createcgimage\(_:from:format:colorspace:\))
Creates a Core Graphics image from a region of a Core Image image instance with an option for controlling the pixel format and color space of the `CGImage`.
[`func createCGImage(CIImage, from: CGRect, format: CIFormat, colorSpace: CGColorSpace?, deferred: Bool) -> CGImage?`](https://developer.apple.com/documentation/coreimage/cicontext/createcgimage\(_:from:format:colorspace:deferred:\))
Creates a Core Graphics image from a region of a Core Image image instance with an option for controlling when the image is rendered.
[`func render(CIImage, toBitmap: UnsafeMutableRawPointer, rowBytes: Int, bounds: CGRect, format: CIFormat, colorSpace: CGColorSpace?)`](https://developer.apple.com/documentation/coreimage/cicontext/render\(_:tobitmap:rowbytes:bounds:format:colorspace:\))
Renders to the given bitmap.
[`func render(CIImage, to: CVPixelBuffer)`](https://developer.apple.com/documentation/coreimage/cicontext/render\(_:to:\))
Renders an image into a pixel buffer.
[`func render(CIImage, to: CVPixelBuffer, bounds: CGRect, colorSpace: CGColorSpace?)`](https://developer.apple.com/documentation/coreimage/cicontext/render\(_:to:bounds:colorspace:\)-2k8l2)
Renders a region of an image into a pixel buffer.
[`func render(CIImage, to: IOSurfaceRef, bounds: CGRect, colorSpace: CGColorSpace?)`](https://developer.apple.com/documentation/coreimage/cicontext/render\(_:to:bounds:colorspace:\)-54b9l)
Renders a region of an image into an IOSurface object.
[`func render(CIImage, to: any MTLTexture, commandBuffer: (any MTLCommandBuffer)?, bounds: CGRect, colorSpace: CGColorSpace)`](https://developer.apple.com/documentation/coreimage/cicontext/render\(_:to:commandbuffer:bounds:colorspace:\))
Renders a region of an image to a Metal texture.
### [Drawing Images](https://developer.apple.com/documentation/coreimage/cicontext#Drawing-Images)
[`func draw(CIImage, in: CGRect, from: CGRect)`](https://developer.apple.com/documentation/coreimage/cicontext/draw\(_:in:from:\))
Renders a region of an image to a rectangle in the context destination.
### [Determining the Allowed Extents for Images Used by a Context](https://developer.apple.com/documentation/coreimage/cicontext#Determining-the-Allowed-Extents-for-Images-Used-by-a-Context)
[`func inputImageMaximumSize() -> CGSize`](https://developer.apple.com/documentation/coreimage/cicontext/inputimagemaximumsize\(\))
Returns the maximum size allowed for any image rendered into the context.
[`func outputImageMaximumSize() -> CGSize`](https://developer.apple.com/documentation/coreimage/cicontext/outputimagemaximumsize\(\))
Returns the maximum size allowed for any image created by the context.
### [Managing Resources](https://developer.apple.com/documentation/coreimage/cicontext#Managing-Resources)
[`func clearCaches()`](https://developer.apple.com/documentation/coreimage/cicontext/clearcaches\(\))
Frees any cached data, such as temporary images, associated with the context and runs the garbage collector.
[`func reclaimResources()`](https://developer.apple.com/documentation/coreimage/cicontext/reclaimresources\(\))
Runs the garbage collector to reclaim any resources that the context no longer requires.
[`class func offlineGPUCount() -> UInt32`](https://developer.apple.com/documentation/coreimage/cicontext/offlinegpucount\(\))
Returns the number of GPUs not currently driving a display.
[`var workingColorSpace: CGColorSpace?`](https://developer.apple.com/documentation/coreimage/cicontext/workingcolorspace)
The working color space of the Core Image context.
[`var workingFormat: CIFormat`](https://developer.apple.com/documentation/coreimage/cicontext/workingformat)
The working pixel format of the Core Image context.
### [Rendering Images for Data or File Export](https://developer.apple.com/documentation/coreimage/cicontext#Rendering-Images-for-Data-or-File-Export)
[`func tiffRepresentation(of: CIImage, format: CIFormat, colorSpace: CGColorSpace, options: [CIImageRepresentationOption : Any]) -> Data?`](https://developer.apple.com/documentation/coreimage/cicontext/tiffrepresentation\(of:format:colorspace:options:\))
Renders the image and exports the resulting image data in TIFF format.
[`func jpegRepresentation(of: CIImage, colorSpace: CGColorSpace, options: [CIImageRepresentationOption : Any]) -> Data?`](https://developer.apple.com/documentation/coreimage/cicontext/jpegrepresentation\(of:colorspace:options:\))
Renders the image and exports the resulting image data in JPEG format.
[`func pngRepresentation(of: CIImage, format: CIFormat, colorSpace: CGColorSpace, options: [CIImageRepresentationOption : Any]) -> Data?`](https://developer.apple.com/documentation/coreimage/cicontext/pngrepresentation\(of:format:colorspace:options:\))
Renders the image and exports the resulting image data in PNG format.
[`func heifRepresentation(of: CIImage, format: CIFormat, colorSpace: CGColorSpace, options: [CIImageRepresentationOption : Any]) -> Data?`](https://developer.apple.com/documentation/coreimage/cicontext/heifrepresentation\(of:format:colorspace:options:\))
Renders the image and exports the resulting image data in HEIF format.
[`func heif10Representation(of: CIImage, colorSpace: CGColorSpace, options: [CIImageRepresentationOption : Any]) throws -> Data`](https://developer.apple.com/documentation/coreimage/cicontext/heif10representation\(of:colorspace:options:\))
Renders the image and exports the resulting image data in HEIF10 format.
[`func openEXRRepresentation(of: CIImage, options: [CIImageRepresentationOption : Any]) throws -> Data`](https://developer.apple.com/documentation/coreimage/cicontext/openexrrepresentation\(of:options:\))
Renders the image and exports the resulting image data in open EXR format.
[`func writeTIFFRepresentation(of: CIImage, to: URL, format: CIFormat, colorSpace: CGColorSpace, options: [CIImageRepresentationOption : Any]) throws`](https://developer.apple.com/documentation/coreimage/cicontext/writetiffrepresentation\(of:to:format:colorspace:options:\))
Renders the image and exports the resulting image data as a file in TIFF format.
[`func writeJPEGRepresentation(of: CIImage, to: URL, colorSpace: CGColorSpace, options: [CIImageRepresentationOption : Any]) throws`](https://developer.apple.com/documentation/coreimage/cicontext/writejpegrepresentation\(of:to:colorspace:options:\))
Renders the image and exports the resulting image data as a file in JPEG format.
[`func writePNGRepresentation(of: CIImage, to: URL, format: CIFormat, colorSpace: CGColorSpace, options: [CIImageRepresentationOption : Any]) throws`](https://developer.apple.com/documentation/coreimage/cicontext/writepngrepresentation\(of:to:format:colorspace:options:\))
Renders the image and exports the resulting image data as a file in PNG format.
[`func writeHEIFRepresentation(of: CIImage, to: URL, format: CIFormat, colorSpace: CGColorSpace, options: [CIImageRepresentationOption : Any]) throws`](https://developer.apple.com/documentation/coreimage/cicontext/writeheifrepresentation\(of:to:format:colorspace:options:\))
Renders the image and exports the resulting image data as a file in HEIF format.
[`func writeHEIF10Representation(of: CIImage, to: URL, colorSpace: CGColorSpace, options: [CIImageRepresentationOption : Any]) throws`](https://developer.apple.com/documentation/coreimage/cicontext/writeheif10representation\(of:to:colorspace:options:\))
Renders the image and exports the resulting image data as a file in HEIF10 format.
[`func writeOpenEXRRepresentation(of: CIImage, to: URL, options: [CIImageRepresentationOption : Any]) throws`](https://developer.apple.com/documentation/coreimage/cicontext/writeopenexrrepresentation\(of:to:options:\))
Renders the image and exports the resulting image data as a file in open EXR format.
[`struct CIImageRepresentationOption`](https://developer.apple.com/documentation/coreimage/ciimagerepresentationoption)
### [Creating Depth Blur Filters](https://developer.apple.com/documentation/coreimage/cicontext#Creating-Depth-Blur-Filters)
[`func depthBlurEffectFilter(for: CIImage, disparityImage: CIImage, portraitEffectsMatte: CIImage?, hairSemanticSegmentation: CIImage?, glassesMatte: CIImage?, gainMap: CIImage?, orientation: CGImagePropertyOrientation, options: [AnyHashable : Any]?) -> CIFilter?`](https://developer.apple.com/documentation/coreimage/cicontext/depthblureffectfilter\(for:disparityimage:portraiteffectsmatte:hairsemanticsegmentation:glassesmatte:gainmap:orientation:options:\))
[`func depthBlurEffectFilter(for: CIImage, disparityImage: CIImage, portraitEffectsMatte: CIImage?, hairSemanticSegmentation: CIImage?, orientation: CGImagePropertyOrientation, options: [AnyHashable : Any]?) -> CIFilter?`](https://developer.apple.com/documentation/coreimage/cicontext/depthblureffectfilter\(for:disparityimage:portraiteffectsmatte:hairsemanticsegmentation:orientation:options:\))
[`func depthBlurEffectFilter(for: CIImage, disparityImage: CIImage, portraitEffectsMatte: CIImage?, orientation: CGImagePropertyOrientation, options: [AnyHashable : Any]?) -> CIFilter?`](https://developer.apple.com/documentation/coreimage/cicontext/depthblureffectfilter\(for:disparityimage:portraiteffectsmatte:orientation:options:\))
[`func depthBlurEffectFilter(forImageData: Data, options: [AnyHashable : Any]?) -> CIFilter?`](https://developer.apple.com/documentation/coreimage/cicontext/depthblureffectfilter\(forimagedata:options:\))
[`func depthBlurEffectFilter(forImageURL: URL, options: [AnyHashable : Any]?) -> CIFilter?`](https://developer.apple.com/documentation/coreimage/cicontext/depthblureffectfilter\(forimageurl:options:\))
### [Constants](https://developer.apple.com/documentation/coreimage/cicontext#Constants)
Keys to be used in the `options` dictionary when creating a `CIContext` object.
[`struct CIContextOption`](https://developer.apple.com/documentation/coreimage/cicontextoption)
An enum string type that your code can use to select different options when creating a Core Image context.
### [Customizing Render Destination](https://developer.apple.com/documentation/coreimage/cicontext#Customizing-Render-Destination)
[`func prepareRender(CIImage, from: CGRect, to: CIRenderDestination, at: CGPoint) throws`](https://developer.apple.com/documentation/coreimage/cicontext/preparerender\(_:from:to:at:\))
An optional call to warm up a [`CIContext`](https://developer.apple.com/documentation/coreimage/cicontext) so that subsequent calls to render with the same arguments run more efficiently.
[`func startTask(toClear: CIRenderDestination) throws -> CIRenderTask`](https://developer.apple.com/documentation/coreimage/cicontext/starttask\(toclear:\))
Fills the entire destination with black or clear depending on its [`alphaMode`](https://developer.apple.com/documentation/coreimage/cirenderdestination/alphamode).
[`func startTask(toRender: CIImage, from: CGRect, to: CIRenderDestination, at: CGPoint) throws -> CIRenderTask`](https://developer.apple.com/documentation/coreimage/cicontext/starttask\(torender:from:to:at:\))
Renders a portion of an image to a point in the destination.
[`func startTask(toRender: CIImage, to: CIRenderDestination) throws -> CIRenderTask`](https://developer.apple.com/documentation/coreimage/cicontext/starttask\(torender:to:\))
Renders an image to a destination so that point (0, 0) of the image maps to point (0, 0) of the destination.
### [Deprecated](https://developer.apple.com/documentation/coreimage/cicontext#Deprecated)
[`init(cglContext: CGLContextObj, pixelFormat: CGLPixelFormatObj?, colorSpace: CGColorSpace?, options: [CIContextOption : Any]?)`](https://developer.apple.com/documentation/coreimage/cicontext/init\(cglcontext:pixelformat:colorspace:options:\))
Creates a Core Image context from a CGL context, using the specified options, color space, and pixel format object.
Deprecated
[`init(eaglContext: EAGLContext)`](https://developer.apple.com/documentation/coreimage/cicontext/init\(eaglcontext:\))
Creates a Core Image context from an EAGL context.
Deprecated
[`init(eaglContext: EAGLContext, options: [CIContextOption : Any]?)`](https://developer.apple.com/documentation/coreimage/cicontext/init\(eaglcontext:options:\))
Creates a Core Image context from an EAGL context using the specified options.
Deprecated
[`init?(forOfflineGPUAtIndex: UInt32)`](https://developer.apple.com/documentation/coreimage/cicontext/init\(forofflinegpuatindex:\))
Creates an OpenGL-based Core Image context using a GPU that is not currently driving a display.
Deprecated
[`init?(forOfflineGPUAtIndex: UInt32, colorSpace: CGColorSpace?, options: [CIContextOption : Any]?, sharedContext: CGLContextObj?)`](https://developer.apple.com/documentation/coreimage/cicontext/init\(forofflinegpuatindex:colorspace:options:sharedcontext:\))
Creates an OpenGL-based Core Image context using a GPU that is not currently driving a display, with the specified options.
Deprecated
[`func createCGLayer(with: CGSize, info: CFDictionary?) -> CGLayer?`](https://developer.apple.com/documentation/coreimage/cicontext/createcglayer\(with:info:\))
Creates a CGLayer object from the provided parameters.
Deprecated
[`func draw(CIImage, at: CGPoint, from: CGRect)`](https://developer.apple.com/documentation/coreimage/cicontext/draw\(_:at:from:\))
Renders a region of an image to a point in the context destination.
Deprecated
### [Initializers](https://developer.apple.com/documentation/coreimage/cicontext#Initializers)
[`init(options: [CIContextOption : Any]?)`](https://developer.apple.com/documentation/coreimage/cicontext/init\(options:\))
Initializes a context without a specific rendering destination, using the specified options.
### [Instance Methods](https://developer.apple.com/documentation/coreimage/cicontext#Instance-Methods)
[`func calculateHDRStats(for: CGImage) -> CGImage`](https://developer.apple.com/documentation/coreimage/cicontext/calculatehdrstats\(for:\)-3ia7r)
Given a Core Graphics image, use the receiving Core Image context to calculate its HDR statistics (content headroom and content average light level) and then return a new Core Graphics image that has the calculated values.
[`func calculateHDRStats(for: IOSurfaceRef)`](https://developer.apple.com/documentation/coreimage/cicontext/calculatehdrstats\(for:\)-6lwmz)
Given an IOSurface, use the receiving Core Image context to calculate its HDR statistics (content headroom and content average light level) and then update the surface’s attachments to store the values.
[`func calculateHDRStats(for: CVPixelBuffer)`](https://developer.apple.com/documentation/coreimage/cicontext/calculatehdrstats\(for:\)-7bcki)
Given a CVPixelBuffer, use the receiving Core Image context to calculate its HDR statistics (content headroom and content average light level) and then update the buffers’s attachments to store the values.
[`func calculateHDRStats(for: CIImage) -> CIImage?`](https://developer.apple.com/documentation/coreimage/cicontext/calculatehdrstats\(for:\)-l1rj)
Given a Core Image image, use the receiving Core Image context to calculate its HDR statistics (content headroom and content average light level) and then return a new Core Image image that has the calculated values.
[`func createCGImage(CIImage, from: CGRect, format: CIFormat, colorSpace: CGColorSpace?, deferred: Bool, calculateHDRStats: Bool) -> CGImage?`](https://developer.apple.com/documentation/coreimage/cicontext/createcgimage\(_:from:format:colorspace:deferred:calculatehdrstats:\))
Creates a Core Graphics image from a region of a Core Image image instance with an option for calculating HDR statistics.
## [Relationships](https://developer.apple.com/documentation/coreimage/cicontext#relationships)
### [Inherits From](https://developer.apple.com/documentation/coreimage/cicontext#inherits-from)
  * [`NSObject`](https://developer.apple.com/documentation/ObjectiveC/NSObject-swift.class)


### [Conforms To](https://developer.apple.com/documentation/coreimage/cicontext#conforms-to)
  * [`CVarArg`](https://developer.apple.com/documentation/Swift/CVarArg)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`NSObjectProtocol`](https://developer.apple.com/documentation/ObjectiveC/NSObjectProtocol)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)


## [See Also](https://developer.apple.com/documentation/coreimage/cicontext#see-also)
### [Essentials](https://developer.apple.com/documentation/coreimage/cicontext#Essentials)
[Processing an Image Using Built-in Filters](https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters)
Apply effects such as sepia tint, highlight strengthening, and scaling to images.
[`class CIImage`](https://developer.apple.com/documentation/coreimage/ciimage)
A representation of an image to be processed or produced by Core Image filters.
Current page is CIContext 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fcoreimage%2Fcicontext).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
