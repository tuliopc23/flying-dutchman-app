Source: https://developer.apple.com/documentation/CoreGraphics/CGContext

[ Skip Navigation ](https://developer.apple.com/documentation/CoreGraphics/CGContext#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/CoreGraphics/CGContext#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/CoreGraphics/CGContext)
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
[ Open Menu ](https://developer.apple.com/documentation/CoreGraphics/CGContext)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/CoreGraphics/CGContext)


[](https://developer.apple.com/documentation/CoreGraphics/CGContext)
## [ Core Graphics  ](https://developer.apple.com/documentation/coregraphics)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 48 symbols inside <root>
Geometric Data Types
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 48 symbols inside <root>
Geometric Data Types
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
2 of 48 symbols inside <root> [CGFloat](https://developer.apple.com/documentation/corefoundation/cgfloat-swift.struct)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
3 of 48 symbols inside <root> [CGPoint](https://developer.apple.com/documentation/corefoundation/cgpoint)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
4 of 48 symbols inside <root> [CGSize](https://developer.apple.com/documentation/corefoundation/cgsize)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
5 of 48 symbols inside <root> [CGRect](https://developer.apple.com/documentation/corefoundation/cgrect)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
6 of 48 symbols inside <root> [CGVector](https://developer.apple.com/documentation/corefoundation/cgvector)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
7 of 48 symbols inside <root> [CGAffineTransform](https://developer.apple.com/documentation/corefoundation/cgaffinetransform)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 48 symbols inside <root>
2D Drawing
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
9 of 48 symbols inside <root> containing 177 symbols[CGContext](https://developer.apple.com/documentation/coregraphics/cgcontext)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 177 symbols inside -100292855 
Creating Bitmap Graphics Contexts
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
2 of 177 symbols inside -100292855 [CGBitmapContextReleaseDataCallback](https://developer.apple.com/documentation/coregraphics/cgbitmapcontextreleasedatacallback)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 177 symbols inside -100292855 
Creating PDF Graphics Contexts
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 177 symbols inside -100292855 [init?(CFURL, mediaBox: UnsafePointer<CGRect>?, CFDictionary?)](https://developer.apple.com/documentation/coregraphics/cgcontext/init\(_:mediabox:_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
5 of 177 symbols inside -100292855 [init?(consumer: CGDataConsumer, mediaBox: UnsafePointer<CGRect>?, CFDictionary?)](https://developer.apple.com/documentation/coregraphics/cgcontext/init\(consumer:mediabox:_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
6 of 177 symbols inside -100292855 containing 26 symbols[Auxiliary Dictionary Keys](https://developer.apple.com/documentation/coregraphics/auxiliary-dictionary-keys)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 177 symbols inside -100292855 
Converting Between Coordinate Spaces
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
8 of 177 symbols inside -100292855 [var userSpaceToDeviceSpaceTransform: CGAffineTransform](https://developer.apple.com/documentation/coregraphics/cgcontext/userspacetodevicespacetransform)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
9 of 177 symbols inside -100292855 [func convertToDeviceSpace(CGPoint) -> CGPoint](https://developer.apple.com/documentation/coregraphics/cgcontext/converttodevicespace\(_:\)-53m7u)
225 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Core Graphics ](https://developer.apple.com/documentation/coregraphics)
  * [ CGContext ](https://developer.apple.com/documentation/CoreGraphics/CGContext)
  *     * CGContext 


Class
# CGContext
A Quartz 2D drawing environment.
iOSiPadOSMac CatalystmacOStvOSvisionOSwatchOS
```
class CGContext
```

## [Overview](https://developer.apple.com/documentation/CoreGraphics/CGContext#overview)
A `CGContext` instance represents a Quartz 2D drawing destination. A graphics context contains drawing parameters and all device-specific information needed to render the paint on a page to the destination, whether the destination is a window in an application, a bitmap image, a PDF document, or a printer.
## [Topics](https://developer.apple.com/documentation/CoreGraphics/CGContext#topics)
### [Creating Bitmap Graphics Contexts](https://developer.apple.com/documentation/CoreGraphics/CGContext#Creating-Bitmap-Graphics-Contexts)
[`typealias CGBitmapContextReleaseDataCallback`](https://developer.apple.com/documentation/coregraphics/cgbitmapcontextreleasedatacallback)
A callback function used to release data associate with the bitmap context.
### [Creating PDF Graphics Contexts](https://developer.apple.com/documentation/CoreGraphics/CGContext#Creating-PDF-Graphics-Contexts)
[`init?(CFURL, mediaBox: UnsafePointer<CGRect>?, CFDictionary?)`](https://developer.apple.com/documentation/coregraphics/cgcontext/init\(_:mediabox:_:\))
Creates a URL-based PDF graphics context.
[`init?(consumer: CGDataConsumer, mediaBox: UnsafePointer<CGRect>?, CFDictionary?)`](https://developer.apple.com/documentation/coregraphics/cgcontext/init\(consumer:mediabox:_:\))
Creates a PDF graphics context.
[API Reference Auxiliary Dictionary Keys](https://developer.apple.com/documentation/coregraphics/auxiliary-dictionary-keys)
Keys for the auxiliary info dictionary you specify when creating a PDF context.
### [Converting Between Coordinate Spaces](https://developer.apple.com/documentation/CoreGraphics/CGContext#Converting-Between-Coordinate-Spaces)
[`var userSpaceToDeviceSpaceTransform: CGAffineTransform`](https://developer.apple.com/documentation/coregraphics/cgcontext/userspacetodevicespacetransform)
Returns an affine transform that maps user space coordinates to device space coordinates.
[`func convertToDeviceSpace(CGPoint) -> CGPoint`](https://developer.apple.com/documentation/coregraphics/cgcontext/converttodevicespace\(_:\)-53m7u)
Returns a point that is transformed from user space coordinates to device space coordinates.
[`func convertToUserSpace(CGPoint) -> CGPoint`](https://developer.apple.com/documentation/coregraphics/cgcontext/converttouserspace\(_:\)-3mtg3)
Returns a point that is transformed from device space coordinates to user space coordinates.
[`func convertToDeviceSpace(CGRect) -> CGRect`](https://developer.apple.com/documentation/coregraphics/cgcontext/converttodevicespace\(_:\)-91x5g)
Returns a rectangle that is transformed from user space coordinate to device space coordinates.
[`func convertToUserSpace(CGRect) -> CGRect`](https://developer.apple.com/documentation/coregraphics/cgcontext/converttouserspace\(_:\)-1hk5r)
Returns a rectangle that is transformed from device space coordinate to user space coordinates.
[`func convertToDeviceSpace(CGSize) -> CGSize`](https://developer.apple.com/documentation/coregraphics/cgcontext/converttodevicespace\(_:\)-224h2)
Returns a size that is transformed from user space coordinates to device space coordinates.
[`func convertToUserSpace(CGSize) -> CGSize`](https://developer.apple.com/documentation/coregraphics/cgcontext/converttouserspace\(_:\)-693ur)
Returns a size that is transformed from device space coordinates to user space coordinates.
### [Constructing a Current Graphics Path](https://developer.apple.com/documentation/CoreGraphics/CGContext#Constructing-a-Current-Graphics-Path)
[`func beginPath()`](https://developer.apple.com/documentation/coregraphics/cgcontext/beginpath\(\))
Creates a new empty path in a graphics context.
[`func move(to: CGPoint)`](https://developer.apple.com/documentation/coregraphics/cgcontext/move\(to:\))
Begins a new subpath at the specified point.
[`func addLine(to: CGPoint)`](https://developer.apple.com/documentation/coregraphics/cgcontext/addline\(to:\))
Appends a straight line segment from the current point to the specified point.
[`func addLines(between: [CGPoint])`](https://developer.apple.com/documentation/coregraphics/cgcontext/addlines\(between:\))
Adds a sequence of connected straight-line segments to the current path.
[`func addRect(CGRect)`](https://developer.apple.com/documentation/coregraphics/cgcontext/addrect\(_:\))
Adds a rectangular path to the current path.
[`func addRects([CGRect])`](https://developer.apple.com/documentation/coregraphics/cgcontext/addrects\(_:\))
Adds a set of rectangular paths to the current path.
[`func addEllipse(in: CGRect)`](https://developer.apple.com/documentation/coregraphics/cgcontext/addellipse\(in:\))
Adds an ellipse that fits inside the specified rectangle.
[`func addArc(center: CGPoint, radius: CGFloat, startAngle: CGFloat, endAngle: CGFloat, clockwise: Bool)`](https://developer.apple.com/documentation/coregraphics/cgcontext/addarc\(center:radius:startangle:endangle:clockwise:\))
Adds an arc of a circle to the current path, specified with a radius and angles.
[`func addArc(tangent1End: CGPoint, tangent2End: CGPoint, radius: CGFloat)`](https://developer.apple.com/documentation/coregraphics/cgcontext/addarc\(tangent1end:tangent2end:radius:\))
Adds an arc of a circle to the current path, specified with a radius and two tangent lines.
[`func addCurve(to: CGPoint, control1: CGPoint, control2: CGPoint)`](https://developer.apple.com/documentation/coregraphics/cgcontext/addcurve\(to:control1:control2:\))
Adds a cubic Bézier curve to the current path, with the specified end point and control points.
[`func addQuadCurve(to: CGPoint, control: CGPoint)`](https://developer.apple.com/documentation/coregraphics/cgcontext/addquadcurve\(to:control:\))
Adds a quadratic Bézier curve to the current path, with the specified end point and control point.
[`func addPath(CGPath)`](https://developer.apple.com/documentation/coregraphics/cgcontext/addpath\(_:\))
Adds a previously created path object to the current path in a graphics context.
[`func closePath()`](https://developer.apple.com/documentation/coregraphics/cgcontext/closepath\(\))
Closes and terminates the current path’s subpath.
[`var path: CGPath?`](https://developer.apple.com/documentation/coregraphics/cgcontext/path)
Returns a path object built from the current path information in a graphics context.
[`func replacePathWithStrokedPath()`](https://developer.apple.com/documentation/coregraphics/cgcontext/replacepathwithstrokedpath\(\))
Replaces the path in the graphics context with the stroked version of the path.
### [Examining the Current Graphics Path](https://developer.apple.com/documentation/CoreGraphics/CGContext#Examining-the-Current-Graphics-Path)
[`var boundingBoxOfPath: CGRect`](https://developer.apple.com/documentation/coregraphics/cgcontext/boundingboxofpath)
Returns the smallest rectangle that contains the current path.
[`var currentPointOfPath: CGPoint`](https://developer.apple.com/documentation/coregraphics/cgcontext/currentpointofpath)
Returns the current point in a non-empty path.
[`var isPathEmpty: Bool`](https://developer.apple.com/documentation/coregraphics/cgcontext/ispathempty)
Indicates whether the current path contains any subpaths.
[`func pathContains(CGPoint, mode: CGPathDrawingMode) -> Bool`](https://developer.apple.com/documentation/coregraphics/cgcontext/pathcontains\(_:mode:\))
Checks to see whether the specified point is contained in the current path.
### [Drawing the Current Graphics Path](https://developer.apple.com/documentation/CoreGraphics/CGContext#Drawing-the-Current-Graphics-Path)
[`func drawPath(using: CGPathDrawingMode)`](https://developer.apple.com/documentation/coregraphics/cgcontext/drawpath\(using:\))
Draws the current path using the provided drawing mode.
[`enum CGPathDrawingMode`](https://developer.apple.com/documentation/coregraphics/cgpathdrawingmode)
Options for rendering a path.
[`func fillPath(using: CGPathFillRule)`](https://developer.apple.com/documentation/coregraphics/cgcontext/fillpath\(using:\))
Paints the area within the current path, as determined by the specified fill rule.
[`func strokePath()`](https://developer.apple.com/documentation/coregraphics/cgcontext/strokepath\(\))
Paints a line along the current path.
### [Drawing Shapes](https://developer.apple.com/documentation/CoreGraphics/CGContext#Drawing-Shapes)
[`func clear(CGRect)`](https://developer.apple.com/documentation/coregraphics/cgcontext/clear\(_:\))
Paints a transparent rectangle.
[`func fill(CGRect)`](https://developer.apple.com/documentation/coregraphics/cgcontext/fill\(_:\)-7a0rk)
Paints the area contained within the provided rectangle, using the fill color in the current graphics state.
[`func fill([CGRect])`](https://developer.apple.com/documentation/coregraphics/cgcontext/fill\(_:\)-6jc4y)
Paints the areas contained within the provided rectangles, using the fill color in the current graphics state.
[`func fillEllipse(in: CGRect)`](https://developer.apple.com/documentation/coregraphics/cgcontext/fillellipse\(in:\))
Paints the area of the ellipse that fits inside the provided rectangle, using the fill color in the current graphics state.
[`func stroke(CGRect)`](https://developer.apple.com/documentation/coregraphics/cgcontext/stroke\(_:\))
Paints a rectangular path.
[`func stroke(CGRect, width: CGFloat)`](https://developer.apple.com/documentation/coregraphics/cgcontext/stroke\(_:width:\))
Paints a rectangular path, using the specified line width.
[`func strokeEllipse(in: CGRect)`](https://developer.apple.com/documentation/coregraphics/cgcontext/strokeellipse\(in:\))
Strokes an ellipse that fits inside the specified rectangle.
[`func strokeLineSegments(between: [CGPoint])`](https://developer.apple.com/documentation/coregraphics/cgcontext/strokelinesegments\(between:\))
Strokes a sequence of line segments.
### [Drawing Images and PDF Content](https://developer.apple.com/documentation/CoreGraphics/CGContext#Drawing-Images-and-PDF-Content)
[`func draw(CGImage, in: CGRect, byTiling: Bool)`](https://developer.apple.com/documentation/coregraphics/cgcontext/draw\(_:in:bytiling:\))
Draws an image in the specified area.
[`func drawPDFPage(CGPDFPage)`](https://developer.apple.com/documentation/coregraphics/cgcontext/drawpdfpage\(_:\))
Draws the content of a PDF page into the current graphics context.
[`var interpolationQuality: CGInterpolationQuality`](https://developer.apple.com/documentation/coregraphics/cgcontext/interpolationquality)
Returns the current level of interpolation quality for a graphics context.
[`enum CGInterpolationQuality`](https://developer.apple.com/documentation/coregraphics/cginterpolationquality)
Levels of interpolation quality for rendering an image.
### [Drawing Gradients and Shadings](https://developer.apple.com/documentation/CoreGraphics/CGContext#Drawing-Gradients-and-Shadings)
[`func drawLinearGradient(CGGradient, start: CGPoint, end: CGPoint, options: CGGradientDrawingOptions)`](https://developer.apple.com/documentation/coregraphics/cgcontext/drawlineargradient\(_:start:end:options:\))
Paints a gradient fill that varies along the line defined by the provided starting and ending points.
[`func drawRadialGradient(CGGradient, startCenter: CGPoint, startRadius: CGFloat, endCenter: CGPoint, endRadius: CGFloat, options: CGGradientDrawingOptions)`](https://developer.apple.com/documentation/coregraphics/cgcontext/drawradialgradient\(_:startcenter:startradius:endcenter:endradius:options:\))
Paints a gradient fill that varies along the area defined by the provided starting and ending circles.
[`struct CGGradientDrawingOptions`](https://developer.apple.com/documentation/coregraphics/cggradientdrawingoptions)
Drawing locations for gradients.
[`func drawShading(CGShading)`](https://developer.apple.com/documentation/coregraphics/cgcontext/drawshading\(_:\))
Fills the clipping path of a context with the specified shading.
### [Drawing Text](https://developer.apple.com/documentation/CoreGraphics/CGContext#Drawing-Text)
[`var textMatrix: CGAffineTransform`](https://developer.apple.com/documentation/coregraphics/cgcontext/textmatrix)
Returns the current text matrix.
[`var textPosition: CGPoint`](https://developer.apple.com/documentation/coregraphics/cgcontext/textposition)
[`func selectFont(name: UnsafePointer<CChar>, size: CGFloat, textEncoding: CGTextEncoding)`](https://developer.apple.com/documentation/coregraphics/cgcontext/selectfont\(name:size:textencoding:\))
Sets the font and font size in a graphics context.
Deprecated
[`func setCharacterSpacing(CGFloat)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setcharacterspacing\(_:\))
Sets the current character spacing.
[`func setFont(CGFont)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setfont\(_:\))
Sets the platform font in a graphics context.
[`func setFontSize(CGFloat)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setfontsize\(_:\))
Sets the current font size.
[`func setTextDrawingMode(CGTextDrawingMode)`](https://developer.apple.com/documentation/coregraphics/cgcontext/settextdrawingmode\(_:\))
Sets the current text drawing mode.
[`func setAllowsFontSmoothing(Bool)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setallowsfontsmoothing\(_:\))
Sets whether or not to allow font smoothing for a graphics context.
[`func setAllowsFontSubpixelPositioning(Bool)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setallowsfontsubpixelpositioning\(_:\))
Sets whether or not to allow subpixel positioning for a graphics context.
[`func setAllowsFontSubpixelQuantization(Bool)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setallowsfontsubpixelquantization\(_:\))
Sets whether or not to allow subpixel quantization for a graphics context.
[`func setShouldSmoothFonts(Bool)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setshouldsmoothfonts\(_:\))
Enables or disables font smoothing in a graphics context.
[`func setShouldSubpixelPositionFonts(Bool)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setshouldsubpixelpositionfonts\(_:\))
Enables or disables subpixel positioning in a graphics context.
[`func setShouldSubpixelQuantizeFonts(Bool)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setshouldsubpixelquantizefonts\(_:\))
Enables or disables subpixel quantization in a graphics context.
[`func showGlyphs(g: UnsafePointer<CGGlyph>?, count: Int)`](https://developer.apple.com/documentation/coregraphics/cgcontext/showglyphs\(g:count:\))
Displays an array of glyphs at the current text position.
Deprecated
[`func showGlyphs([CGGlyph], at: [CGPoint])`](https://developer.apple.com/documentation/coregraphics/cgcontext/showglyphs\(_:at:\))
Draws a set of glyphs at a set of corresponding positions.
[`func showGlyphsAtPoint(x: CGFloat, y: CGFloat, glyphs: UnsafePointer<CGGlyph>?, count: Int)`](https://developer.apple.com/documentation/coregraphics/cgcontext/showglyphsatpoint\(x:y:glyphs:count:\))
Displays an array of glyphs at a position you specify.
Deprecated
[`func showGlyphsWithAdvances(glyphs: UnsafePointer<CGGlyph>?, advances: UnsafePointer<CGSize>?, count: Int)`](https://developer.apple.com/documentation/coregraphics/cgcontext/showglyphswithadvances\(glyphs:advances:count:\))
Draws an array of glyphs with varying offsets.
Deprecated
[`func showText(string: UnsafePointer<CChar>, length: Int)`](https://developer.apple.com/documentation/coregraphics/cgcontext/showtext\(string:length:\))
Displays a character array at the current text position, a point specified by the current text matrix.
Deprecated
[`func showTextAtPoint(x: CGFloat, y: CGFloat, string: UnsafePointer<CChar>, length: Int)`](https://developer.apple.com/documentation/coregraphics/cgcontext/showtextatpoint\(x:y:string:length:\))
Displays a character string at a position you specify.
Deprecated
[`enum CGTextDrawingMode`](https://developer.apple.com/documentation/coregraphics/cgtextdrawingmode)
Modes for rendering text.
### [Drawing Core Graphics Layers](https://developer.apple.com/documentation/CoreGraphics/CGContext#Drawing-Core-Graphics-Layers)
[`func draw(CGLayer, at: CGPoint)`](https://developer.apple.com/documentation/coregraphics/cgcontext/draw\(_:at:\))
Draws the contents of a layer object at the specified point.
[`func draw(CGLayer, in: CGRect)`](https://developer.apple.com/documentation/coregraphics/cgcontext/draw\(_:in:\))
Draws the contents of a layer object into the specified rectangle.
### [Setting Fill, Stroke, and Shadow Colors](https://developer.apple.com/documentation/CoreGraphics/CGContext#Setting-Fill-Stroke-and-Shadow-Colors)
[`func setFillColor(CGColor)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setfillcolor\(_:\)-8lhn8)
Sets the current fill color in a graphics context, using a CGColor.
[`func setFillColor(UnsafePointer<CGFloat>)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setfillcolor\(_:\)-756dy)
Sets the current fill color.
[`func setFillColor(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, black: CGFloat, alpha: CGFloat)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setfillcolor\(cyan:magenta:yellow:black:alpha:\))
Sets the current fill color to a value in the DeviceCMYK color space.
[`func setFillColor(gray: CGFloat, alpha: CGFloat)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setfillcolor\(gray:alpha:\))
Sets the current fill color to a value in the DeviceGray color space.
[`func setFillColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setfillcolor\(red:green:blue:alpha:\))
Sets the current fill color to a value in the DeviceRGB color space.
[`func setFillColorSpace(CGColorSpace)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setfillcolorspace\(_:\))
Sets the fill color space in a graphics context.
[`func setShadow(offset: CGSize, blur: CGFloat)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setshadow\(offset:blur:\))
Enables shadowing in a graphics context.
[`func setShadow(offset: CGSize, blur: CGFloat, color: CGColor?)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setshadow\(offset:blur:color:\))
Enables shadowing with color a graphics context.
[`func setStrokeColor(CGColor)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setstrokecolor\(_:\)-1sskg)
Sets the current stroke color in a context, using a CGColor.
[`func setStrokeColor(UnsafePointer<CGFloat>)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setstrokecolor\(_:\)-4pd8p)
Sets the current stroke color.
[`func setStrokeColor(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat, black: CGFloat, alpha: CGFloat)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setstrokecolor\(cyan:magenta:yellow:black:alpha:\))
Sets the current stroke color to a value in the DeviceCMYK color space.
[`func setStrokeColor(gray: CGFloat, alpha: CGFloat)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setstrokecolor\(gray:alpha:\))
Sets the current stroke color to a value in the DeviceGray color space.
[`func setStrokeColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setstrokecolor\(red:green:blue:alpha:\))
Sets the current stroke color to a value in the DeviceRGB color space.
[`func setStrokeColorSpace(CGColorSpace)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setstrokecolorspace\(_:\))
Sets the stroke color space in a graphics context.
[`func setStrokePattern(CGPattern, colorComponents: UnsafePointer<CGFloat>)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setstrokepattern\(_:colorcomponents:\))
Sets the stroke pattern in the specified graphics context.
[`func setAlpha(CGFloat)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setalpha\(_:\))
Sets the opacity level for objects drawn in a graphics context.
### [Working with the Current Clipping Path](https://developer.apple.com/documentation/CoreGraphics/CGContext#Working-with-the-Current-Clipping-Path)
[`func clip(using: CGPathFillRule)`](https://developer.apple.com/documentation/coregraphics/cgcontext/clip\(using:\))
Modifies the current clipping path.
[`func clip(to: CGRect)`](https://developer.apple.com/documentation/coregraphics/cgcontext/clip\(to:\)-7cbwq)
Sets the clipping path to the intersection of the current clipping path with the area defined by the specified rectangle.
[`func clip(to: [CGRect])`](https://developer.apple.com/documentation/coregraphics/cgcontext/clip\(to:\)-2eg0)
Sets the clipping path to the intersection of the current clipping path with the region defined by an array of rectangles.
[`func clip(to: CGRect, mask: CGImage)`](https://developer.apple.com/documentation/coregraphics/cgcontext/clip\(to:mask:\))
Maps a mask into the specified rectangle and intersects it with the current clipping area of the graphics context.
[`var boundingBoxOfClipPath: CGRect`](https://developer.apple.com/documentation/coregraphics/cgcontext/boundingboxofclippath)
Returns the bounding box of a clipping path.
### [Working with Transparency Layers](https://developer.apple.com/documentation/CoreGraphics/CGContext#Working-with-Transparency-Layers)
[`func beginTransparencyLayer(in: CGRect, auxiliaryInfo: CFDictionary?)`](https://developer.apple.com/documentation/coregraphics/cgcontext/begintransparencylayer\(in:auxiliaryinfo:\))
Begins a transparency layer whose contents are bounded by the specified rectangle.
[`func beginTransparencyLayer(auxiliaryInfo: CFDictionary?)`](https://developer.apple.com/documentation/coregraphics/cgcontext/begintransparencylayer\(auxiliaryinfo:\))
Begins a transparency layer.
[`func endTransparencyLayer()`](https://developer.apple.com/documentation/coregraphics/cgcontext/endtransparencylayer\(\))
Ends a transparency layer.
### [Working with the Current Transformation Matrix](https://developer.apple.com/documentation/CoreGraphics/CGContext#Working-with-the-Current-Transformation-Matrix)
[`var ctm: CGAffineTransform`](https://developer.apple.com/documentation/coregraphics/cgcontext/ctm)
Returns the current transformation matrix.
[`func rotate(by: CGFloat)`](https://developer.apple.com/documentation/coregraphics/cgcontext/rotate\(by:\))
Rotates the user coordinate system in a context.
[`func scaleBy(x: CGFloat, y: CGFloat)`](https://developer.apple.com/documentation/coregraphics/cgcontext/scaleby\(x:y:\))
Changes the scale of the user coordinate system in a context.
[`func translateBy(x: CGFloat, y: CGFloat)`](https://developer.apple.com/documentation/coregraphics/cgcontext/translateby\(x:y:\))
Changes the origin of the user coordinate system in a context.
[`func concatenate(CGAffineTransform)`](https://developer.apple.com/documentation/coregraphics/cgcontext/concatenate\(_:\))
Transforms the user coordinate system in a context using a specified matrix.
### [Setting Path Drawing Options](https://developer.apple.com/documentation/CoreGraphics/CGContext#Setting-Path-Drawing-Options)
[`func setAllowsAntialiasing(Bool)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setallowsantialiasing\(_:\))
Sets whether or not to allow antialiasing for a graphics context.
[`func setFlatness(CGFloat)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setflatness\(_:\))
Sets the accuracy of curved paths in a graphics context.
[`func setLineCap(CGLineCap)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setlinecap\(_:\))
Sets the style for the endpoints of lines drawn in a graphics context.
[`func setLineDash(phase: CGFloat, lengths: [CGFloat])`](https://developer.apple.com/documentation/coregraphics/cgcontext/setlinedash\(phase:lengths:\))
Sets the pattern for drawing dashed lines.
[`func setLineJoin(CGLineJoin)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setlinejoin\(_:\))
Sets the style for the joins of connected lines in a graphics context.
[`func setLineWidth(CGFloat)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setlinewidth\(_:\))
Sets the line width for a graphics context.
[`func setMiterLimit(CGFloat)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setmiterlimit\(_:\))
Sets the miter limit for the joins of connected lines in a graphics context.
[`func setPatternPhase(CGSize)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setpatternphase\(_:\))
Sets the pattern phase of a context.
[`func setFillPattern(CGPattern, colorComponents: UnsafePointer<CGFloat>)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setfillpattern\(_:colorcomponents:\))
Sets the fill pattern in the specified graphics context.
[`func setShouldAntialias(Bool)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setshouldantialias\(_:\))
Sets antialiasing on or off for a graphics context.
### [Saving and Restoring Graphics State](https://developer.apple.com/documentation/CoreGraphics/CGContext#Saving-and-Restoring-Graphics-State)
[`func saveGState()`](https://developer.apple.com/documentation/coregraphics/cgcontext/savegstate\(\))
Pushes a copy of the current graphics state onto the graphics state stack for the context.
[`func restoreGState()`](https://developer.apple.com/documentation/coregraphics/cgcontext/restoregstate\(\))
Sets the current graphics state to the state most recently saved.
### [Managing a Graphics Context](https://developer.apple.com/documentation/CoreGraphics/CGContext#Managing-a-Graphics-Context)
[`func flush()`](https://developer.apple.com/documentation/coregraphics/cgcontext/flush\(\))
Forces all pending drawing operations in a window context to be rendered immediately to the destination device.
[`func synchronize()`](https://developer.apple.com/documentation/coregraphics/cgcontext/synchronize\(\))
Marks a window context for update.
[`func setBlendMode(CGBlendMode)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setblendmode\(_:\))
Sets how sample values are composited by a graphics context.
[`enum CGBlendMode`](https://developer.apple.com/documentation/coregraphics/cgblendmode)
Compositing operations for images.
[`func setRenderingIntent(CGColorRenderingIntent)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setrenderingintent\(_:\))
Sets the rendering intent in the current graphics state.
### [Managing a Bitmap Graphics Context](https://developer.apple.com/documentation/CoreGraphics/CGContext#Managing-a-Bitmap-Graphics-Context)
These properties and methods are valid only when used with a `CGContext` object created with the initializers listed in [Creating Bitmap Graphics Contexts](https://developer.apple.com/documentation/coregraphics/cgcontext#Creating-Bitmap-Graphics-Contexts).
[`var bitmapInfo: CGBitmapInfo`](https://developer.apple.com/documentation/coregraphics/cgcontext/bitmapinfo)
Obtains the bitmap information associated with a bitmap graphics context.
[`var alphaInfo: CGImageAlphaInfo`](https://developer.apple.com/documentation/coregraphics/cgcontext/alphainfo)
Returns the alpha information associated with the context, which indicates how a bitmap context handles the alpha component.
[`var bitsPerComponent: Int`](https://developer.apple.com/documentation/coregraphics/cgcontext/bitspercomponent)
Returns the bits per component of a bitmap context.
[`var bitsPerPixel: Int`](https://developer.apple.com/documentation/coregraphics/cgcontext/bitsperpixel)
Returns the bits per pixel of a bitmap context.
[`var bytesPerRow: Int`](https://developer.apple.com/documentation/coregraphics/cgcontext/bytesperrow)
Returns the bytes per row of a bitmap context.
[`var colorSpace: CGColorSpace?`](https://developer.apple.com/documentation/coregraphics/cgcontext/colorspace)
Returns the color space of a bitmap context.
[`var data: UnsafeMutableRawPointer?`](https://developer.apple.com/documentation/coregraphics/cgcontext/data)
Returns a pointer to the image data associated with a bitmap context.
[`var height: Int`](https://developer.apple.com/documentation/coregraphics/cgcontext/height)
Returns the height in pixels of a bitmap context.
[`var width: Int`](https://developer.apple.com/documentation/coregraphics/cgcontext/width)
Returns the width in pixels of a bitmap context.
[`func makeImage() -> CGImage?`](https://developer.apple.com/documentation/coregraphics/cgcontext/makeimage\(\))
Creates and returns a CGImage from the pixel data in a bitmap graphics context.
### [Managing a PDF Graphics Context](https://developer.apple.com/documentation/CoreGraphics/CGContext#Managing-a-PDF-Graphics-Context)
These methods are valid only when used with a `CGContext` object created with the initializers listed in [Creating PDF Graphics Contexts](https://developer.apple.com/documentation/coregraphics/cgcontext#Creating-PDF-Graphics-Contexts).
[`func beginPDFPage(CFDictionary?)`](https://developer.apple.com/documentation/coregraphics/cgcontext/beginpdfpage\(_:\))
Begins a new page in a PDF graphics context.
[`func endPDFPage()`](https://developer.apple.com/documentation/coregraphics/cgcontext/endpdfpage\(\))
Ends the current page in the PDF graphics context.
[`func addDestination(CFString, at: CGPoint)`](https://developer.apple.com/documentation/coregraphics/cgcontext/adddestination\(_:at:\))
Sets a destination to jump to when a point in the current page of a PDF graphics context is clicked.
[`func setDestination(CFString, for: CGRect)`](https://developer.apple.com/documentation/coregraphics/cgcontext/setdestination\(_:for:\))
Sets a destination to jump to when a rectangle in the current PDF page is clicked.
[`func setURL(CFURL, for: CGRect)`](https://developer.apple.com/documentation/coregraphics/cgcontext/seturl\(_:for:\))
Sets the URL associated with a rectangle in a PDF graphics context.
[`func addDocumentMetadata(CFData?)`](https://developer.apple.com/documentation/coregraphics/cgcontext/adddocumentmetadata\(_:\))
Associates custom metadata with the PDF document.
[`func closePDF()`](https://developer.apple.com/documentation/coregraphics/cgcontext/closepdf\(\))
Closes a PDF document.
### [Managing a Page-Based Graphics Context](https://developer.apple.com/documentation/CoreGraphics/CGContext#Managing-a-Page-Based-Graphics-Context)
[`func beginPage(mediaBox: UnsafePointer<CGRect>?)`](https://developer.apple.com/documentation/coregraphics/cgcontext/beginpage\(mediabox:\))
Starts a new page in a page-based graphics context.
[`func endPage()`](https://developer.apple.com/documentation/coregraphics/cgcontext/endpage\(\))
Ends the current page in a page-based graphics context.
### [Working with Core Foundation Types](https://developer.apple.com/documentation/CoreGraphics/CGContext#Working-with-Core-Foundation-Types)
[`class var typeID: CFTypeID`](https://developer.apple.com/documentation/coregraphics/cgcontext/typeid)
Returns the type identifier for a graphics context.
### [Constants](https://developer.apple.com/documentation/CoreGraphics/CGContext#Constants)
[`enum CGPathFillRule`](https://developer.apple.com/documentation/coregraphics/cgpathfillrule)
Rules for determining which regions are interior to a path, used by the [`fillPath(using:)`](https://developer.apple.com/documentation/coregraphics/cgcontext/fillpath\(using:\)) and [`clip(using:)`](https://developer.apple.com/documentation/coregraphics/cgcontext/clip\(using:\)) methods.
[`enum CGTextEncoding`](https://developer.apple.com/documentation/coregraphics/cgtextencoding)
Text encodings for fonts.
### [Instance Methods](https://developer.apple.com/documentation/CoreGraphics/CGContext#Instance-Methods)
[`func draw(CGImage, in: CGRect, by: CGToneMapping, options: CFDictionary?) -> Bool`](https://developer.apple.com/documentation/coregraphics/cgcontext/draw\(_:in:by:options:\))
[`func resetClip()`](https://developer.apple.com/documentation/coregraphics/cgcontext/resetclip\(\))
[`func setEDRTargetHeadroom(Float) -> Bool`](https://developer.apple.com/documentation/coregraphics/cgcontext/setedrtargetheadroom\(_:\))
[`func synchronizeAttributes()`](https://developer.apple.com/documentation/coregraphics/cgcontext/synchronizeattributes\(\))
### [Structures](https://developer.apple.com/documentation/CoreGraphics/CGContext#Structures)
[`struct AuxiliaryInfo`](https://developer.apple.com/documentation/coregraphics/cgcontext/auxiliaryinfo)
### [Initializers](https://developer.apple.com/documentation/CoreGraphics/CGContext#Initializers)
[`init?(data: UnsafeMutableRawPointer?, width: Int, height: Int, bitsPerComponent: Int, bytesPerRow: Int, space: CGColorSpace?, bitmapInfo: CGBitmapInfo)`](https://developer.apple.com/documentation/coregraphics/cgcontext/init\(data:width:height:bitspercomponent:bytesperrow:space:bitmapinfo:\)-10b3i)
[`init?(data: UnsafeMutableRawPointer?, width: Int, height: Int, bitsPerComponent: Int, bytesPerRow: Int, space: CGColorSpace, bitmapInfo: UInt32)`](https://developer.apple.com/documentation/coregraphics/cgcontext/init\(data:width:height:bitspercomponent:bytesperrow:space:bitmapinfo:\)-4fkaf)Deprecated
[`init?(data: UnsafeMutableRawPointer?, width: Int, height: Int, bitsPerComponent: Int, bytesPerRow: Int, space: CGColorSpace?, bitmapInfo: CGBitmapInfo, releaseCallback: CGBitmapContextReleaseDataCallback?, releaseInfo: UnsafeMutableRawPointer?)`](https://developer.apple.com/documentation/coregraphics/cgcontext/init\(data:width:height:bitspercomponent:bytesperrow:space:bitmapinfo:releasecallback:releaseinfo:\)-4yzt5)
[`init?(data: UnsafeMutableRawPointer?, width: Int, height: Int, bitsPerComponent: Int, bytesPerRow: Int, space: CGColorSpace, bitmapInfo: UInt32, releaseCallback: CGBitmapContextReleaseDataCallback?, releaseInfo: UnsafeMutableRawPointer?)`](https://developer.apple.com/documentation/coregraphics/cgcontext/init\(data:width:height:bitspercomponent:bytesperrow:space:bitmapinfo:releasecallback:releaseinfo:\)-71ea9)Deprecated
### [Instance Properties](https://developer.apple.com/documentation/CoreGraphics/CGContext#Instance-Properties)
[`var contentToneMappingInfo: CGContentToneMappingInfo`](https://developer.apple.com/documentation/coregraphics/cgcontext/contenttonemappinginfo)
## [Relationships](https://developer.apple.com/documentation/CoreGraphics/CGContext#relationships)
### [Conforms To](https://developer.apple.com/documentation/CoreGraphics/CGContext#conforms-to)
  * [`Copyable`](https://developer.apple.com/documentation/Swift/Copyable)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)


## [See Also](https://developer.apple.com/documentation/CoreGraphics/CGContext#see-also)
### [Related Documentation](https://developer.apple.com/documentation/CoreGraphics/CGContext#Related-Documentation)
[Quartz 2D Programming Guide](https://developer.apple.com/library/archive/documentation/GraphicsImaging/Conceptual/drawingwithquartz2d/Introduction/Introduction.html#//apple_ref/doc/uid/TP30001066)
### [2D Drawing](https://developer.apple.com/documentation/CoreGraphics/CGContext#2D-Drawing)
[`class CGImage`](https://developer.apple.com/documentation/coregraphics/cgimage)
A bitmap image or image mask.
[`class CGPath`](https://developer.apple.com/documentation/coregraphics/cgpath)
An immutable graphics path: a mathematical description of shapes or lines to be drawn in a graphics context.
[`class CGMutablePath`](https://developer.apple.com/documentation/coregraphics/cgmutablepath)
A mutable graphics path: a mathematical description of shapes or lines to be drawn in a graphics context.
[`class CGLayer`](https://developer.apple.com/documentation/coregraphics/cglayer)
An offscreen context for reusing content drawn with Core Graphics.
Current page is CGContext 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FCoreGraphics%2FCGContext).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
