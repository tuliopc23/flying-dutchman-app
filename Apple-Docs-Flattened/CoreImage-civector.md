Source: https://developer.apple.com/documentation/coreimage/civector

[ Skip Navigation ](https://developer.apple.com/documentation/coreimage/civector#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/coreimage/civector#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/coreimage/civector)
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
[ Open Menu ](https://developer.apple.com/documentation/coreimage/civector)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/coreimage/civector)


[](https://developer.apple.com/documentation/coreimage/civector)
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
C
8 of 95 symbols inside <root> containing 29 symbols[CIColor](https://developer.apple.com/documentation/coreimage/cicolor)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
9 of 95 symbols inside <root> containing 21 symbols[CIVector](https://developer.apple.com/documentation/coreimage/civector)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 21 symbols inside -72031969 
Initializing a Vector
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 21 symbols inside -72031969 [init(values: UnsafePointer<CGFloat>, count: Int)](https://developer.apple.com/documentation/coreimage/civector/init\(values:count:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 21 symbols inside -72031969 [convenience init(x: CGFloat)](https://developer.apple.com/documentation/coreimage/civector/init\(x:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 21 symbols inside -72031969 [convenience init(x: CGFloat, y: CGFloat)](https://developer.apple.com/documentation/coreimage/civector/init\(x:y:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
5 of 21 symbols inside -72031969 [convenience init(x: CGFloat, y: CGFloat, z: CGFloat)](https://developer.apple.com/documentation/coreimage/civector/init\(x:y:z:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
6 of 21 symbols inside -72031969 [convenience init(x: CGFloat, y: CGFloat, z: CGFloat, w: CGFloat)](https://developer.apple.com/documentation/coreimage/civector/init\(x:y:z:w:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
7 of 21 symbols inside -72031969 [convenience init(string: String)](https://developer.apple.com/documentation/coreimage/civector/init\(string:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
8 of 21 symbols inside -72031969 [convenience init(cgAffineTransform: CGAffineTransform)](https://developer.apple.com/documentation/coreimage/civector/init\(cgaffinetransform:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
9 of 21 symbols inside -72031969 [convenience init(cgPoint: CGPoint)](https://developer.apple.com/documentation/coreimage/civector/init\(cgpoint:\))
116 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Core Image ](https://developer.apple.com/documentation/coreimage)
  * [ CIVector ](https://developer.apple.com/documentation/coreimage/civector)
  *     * CIVector 


Class
# CIVector
The Core Image class that defines a vector object.
iOS 5.0+iPadOS 5.0+Mac Catalyst 13.1+macOS 10.4+tvOSvisionOS 1.0+
```
class CIVector
```

## [Overview](https://developer.apple.com/documentation/coreimage/civector#overview)
A `CIVector` can store one or more `CGFloat` in one object. They can store a group of float values for a variety of different uses such as coordinate points, direction vectors, geometric rectangles, transform matrices, convolution weights, or just a list a parameter values.
You use `CIVector` objects in conjunction with other Core Image classes, such as [`CIFilter`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class) and [`CIKernel`](https://developer.apple.com/documentation/coreimage/cikernel). Many of the built-in Core Image filters have one or more `CIVector` inputs that you can set to affect the filter’s behavior.
## [Topics](https://developer.apple.com/documentation/coreimage/civector#topics)
### [Initializing a Vector](https://developer.apple.com/documentation/coreimage/civector#Initializing-a-Vector)
[`init(values: UnsafePointer<CGFloat>, count: Int)`](https://developer.apple.com/documentation/coreimage/civector/init\(values:count:\))
Initialize a Core Image vector object with the specified the values.
[`convenience init(x: CGFloat)`](https://developer.apple.com/documentation/coreimage/civector/init\(x:\))
Initialize a Core Image vector object with one value.
[`convenience init(x: CGFloat, y: CGFloat)`](https://developer.apple.com/documentation/coreimage/civector/init\(x:y:\))
Initialize a Core Image vector object with two values.
[`convenience init(x: CGFloat, y: CGFloat, z: CGFloat)`](https://developer.apple.com/documentation/coreimage/civector/init\(x:y:z:\))
Initialize a Core Image vector object with three values.
[`convenience init(x: CGFloat, y: CGFloat, z: CGFloat, w: CGFloat)`](https://developer.apple.com/documentation/coreimage/civector/init\(x:y:z:w:\))
Initialize a Core Image vector object with four values.
[`convenience init(string: String)`](https://developer.apple.com/documentation/coreimage/civector/init\(string:\))
Initialize a Core Image vector object with values provided in a string representation.
[`convenience init(cgAffineTransform: CGAffineTransform)`](https://developer.apple.com/documentation/coreimage/civector/init\(cgaffinetransform:\))
Initialize a Core Image vector object with six values provided by a `CGAffineTransform` structure.
[`convenience init(cgPoint: CGPoint)`](https://developer.apple.com/documentation/coreimage/civector/init\(cgpoint:\))
Initialize a Core Image vector object with two values provided by a `CGPoint` structure.
[`convenience init(cgRect: CGRect)`](https://developer.apple.com/documentation/coreimage/civector/init\(cgrect:\))
Initialize a Core Image vector object with four values provided by a `CGRect` structure.
### [Getting Values From a Vector](https://developer.apple.com/documentation/coreimage/civector#Getting-Values-From-a-Vector)
[`func value(at: Int) -> CGFloat`](https://developer.apple.com/documentation/coreimage/civector/value\(at:\))
Returns a value from a specific position in the vector.
[`var count: Int`](https://developer.apple.com/documentation/coreimage/civector/count)
The number of items in the vector.
[`var x: CGFloat`](https://developer.apple.com/documentation/coreimage/civector/x)
The value located in the first position in the vector.
[`var y: CGFloat`](https://developer.apple.com/documentation/coreimage/civector/y)
The value located in the second position in the vector.
[`var z: CGFloat`](https://developer.apple.com/documentation/coreimage/civector/z)
The value located in the third position in the vector.
[`var w: CGFloat`](https://developer.apple.com/documentation/coreimage/civector/w)
The value located in the forth position in the vector.
[`var stringRepresentation: String`](https://developer.apple.com/documentation/coreimage/civector/stringrepresentation)
Returns a formatted string with all the values of a `CIVector`.
[`var cgAffineTransformValue: CGAffineTransform`](https://developer.apple.com/documentation/coreimage/civector/cgaffinetransformvalue)
Returns the values in the vector as a `CGAffineTransformValue` structure.
[`var cgPointValue: CGPoint`](https://developer.apple.com/documentation/coreimage/civector/cgpointvalue)
Returns the values in the vector as a `CGPoint` structure.
[`var cgRectValue: CGRect`](https://developer.apple.com/documentation/coreimage/civector/cgrectvalue)
Returns the values in the vector as a `CGRect` structure.
## [Relationships](https://developer.apple.com/documentation/coreimage/civector#relationships)
### [Inherits From](https://developer.apple.com/documentation/coreimage/civector#inherits-from)
  * [`NSObject`](https://developer.apple.com/documentation/ObjectiveC/NSObject-swift.class)


### [Conforms To](https://developer.apple.com/documentation/coreimage/civector#conforms-to)
  * [`CVarArg`](https://developer.apple.com/documentation/Swift/CVarArg)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`NSCoding`](https://developer.apple.com/documentation/Foundation/NSCoding)
  * [`NSCopying`](https://developer.apple.com/documentation/Foundation/NSCopying)
  * [`NSObjectProtocol`](https://developer.apple.com/documentation/ObjectiveC/NSObjectProtocol)
  * [`NSSecureCoding`](https://developer.apple.com/documentation/Foundation/NSSecureCoding)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)


## [See Also](https://developer.apple.com/documentation/coreimage/civector#see-also)
### [Filters](https://developer.apple.com/documentation/coreimage/civector#Filters)
[`class CIFilter`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class)
An image processor that produces an image by manipulating one or more input images or by generating new image data.
[`class CIRAWFilter`](https://developer.apple.com/documentation/coreimage/cirawfilter)
A filter subclass that produces an image by manipulating RAW image sensor data from a digital camera or scanner.
[`class CIColor`](https://developer.apple.com/documentation/coreimage/cicolor)
The Core Image class that defines a color object.
Current page is CIVector 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fcoreimage%2Fcivector).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
