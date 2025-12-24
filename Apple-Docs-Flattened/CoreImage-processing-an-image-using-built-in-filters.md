Source: https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters

[ Skip Navigation ](https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters)
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
[ Open Menu ](https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters)


[](https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters)
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
10 of 95 symbols inside <root>
Filter Catalog
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
11 of 95 symbols inside <root> containing 30 symbols[Blur Filters](https://developer.apple.com/documentation/coreimage/blur-filters)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
12 of 95 symbols inside <root> containing 39 symbols[Color Adjustment Filters](https://developer.apple.com/documentation/coreimage/color-adjustment-filters)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
13 of 95 symbols inside <root> containing 60 symbols[Color Effect Filters](https://developer.apple.com/documentation/coreimage/color-effect-filters)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
14 of 95 symbols inside <root> containing 33 symbols[Composite Operations](https://developer.apple.com/documentation/coreimage/composite-operations)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
15 of 95 symbols inside <root> containing 13 symbols[Convolution Filters](https://developer.apple.com/documentation/coreimage/convolution-filters)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
16 of 95 symbols inside <root> containing 36 symbols[Distortion Filters](https://developer.apple.com/documentation/coreimage/distortion-filters)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
17 of 95 symbols inside <root> containing 37 symbols[Generator Filters](https://developer.apple.com/documentation/coreimage/generator-filters)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
18 of 95 symbols inside <root> containing 25 symbols[Geometry Adjustment Filters](https://developer.apple.com/documentation/coreimage/geometry-adjustment-filters)
95 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Core Image ](https://developer.apple.com/documentation/coreimage)
  * [ Processing an Image Using Built-in Filters ](https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters)
  *     * Processing an Image Using Built-in Filters 


Article
# Processing an Image Using Built-in Filters
Apply effects such as sepia tint, highlight strengthening, and scaling to images.
## [Overview](https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters#overview)
You can add effects to images by applying Core Image filters to [`CIImage`](https://developer.apple.com/documentation/coreimage/ciimage) objects. Figure 1 shows three filters chained together to achieve a cumulative effect:
  1. Apply the sepia filter to tint an image with a reddish-brown hue.
  2. Add the bloom filter to accentuate highlights.
  3. Use the Lanczos scale filter to scale an image down.


![Photo of a waterwheel filtered using sepia tone, bloom, and Lanczos scale filters](https://docs-assets.developer.apple.com/published/7a376b660d827864e4c029e5f8c5ec71/media-2955144.png)
### [Create a Context](https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters#Create-a-Context)
[`CIImage`](https://developer.apple.com/documentation/coreimage/ciimage) processing occurs in a [`CIContext`](https://developer.apple.com/documentation/coreimage/cicontext) object. Creating a [`CIContext`](https://developer.apple.com/documentation/coreimage/cicontext) is expensive, so create one during your initial setup and reuse it throughout your app.
```
CIContext* context = [CIContext context];

```

### [Load an Image to Process](https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters#Load-an-Image-to-Process)
The next step is to load an image to process. This example loads an image from the project bundle.
```
NSURL* imageURL = [[NSBundle mainBundle] URLForResource:@"YourImageName" withExtension:@"png"];
CIImage* originalCIImage = [CIImage imageWithContentsOfURL:imageURL];
self.imageView.image = [UIImage imageWithCIImage:originalCIImage];

```

The [`CIImage`](https://developer.apple.com/documentation/coreimage/ciimage) object isn’t itself a displayable image, but rather image data. To display it, you must convert it to another type, such as [`UIImage`](https://developer.apple.com/documentation/UIKit/UIImage).
### [Apply Built-In Core Image Filters](https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters#Apply-Built-In-Core-Image-Filters)
A [`CIFilter`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class) represents a single operation or recipe for a particular effect. To process a [`CIImage`](https://developer.apple.com/documentation/coreimage/ciimage) object, pass it through [`CIFilter`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class) objects. You can subclass [`CIFilter`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class) or draw from the existing library of built-in filters.
#### [Tint Reddish-Brown with the Sepia Filter](https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters#Tint-Reddish-Brown-with-the-Sepia-Filter)
Although you can chain filters without separating them into functions, the following example shows how to configure a single [`CIFilter`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class), the [`sepiaTone()`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/sepiatone\(\)) filter.
```
- (CIImage*) sepiaFilterImage: (CIImage*)inputImage withIntensity:(CGFloat)intensity {
    CIFilter<CISepiaTone>* sepiaFilter = CIFilter.sepiaToneFilter;
    sepiaFilter.inputImage = inputImage;
    sepiaFilter.intensity = intensity;
    return sepiaFilter.outputImage;
}

```

To pass the image through the filter, call the sepia filter function.
```
CIImage* sepiaCIImage = [self sepiaFilterImage:originalCIImage withIntensity:0.9];

```

You can check the intermediate result at any point in the filter chain by converting from [`CIImage`](https://developer.apple.com/documentation/coreimage/ciimage) to a [`UIImage`](https://developer.apple.com/documentation/UIKit/UIImage). You can then assign this [`UIImage`](https://developer.apple.com/documentation/UIKit/UIImage) to a [`UIImageView`](https://developer.apple.com/documentation/UIKit/UIImageView) for display.
```
_imageView.image = [UIImage imageWithCIImage:sepiaCIImage];

```

#### [Strengthen Highlights with the Bloom Filter](https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters#Strengthen-Highlights-with-the-Bloom-Filter)
The bloom filter accentuates the highlights of an image. You can apply it as part of a chain without factoring it into a separate function, but this example encapsulates its functionality into a function.
```
- (CIImage*) bloomFilterImage: (CIImage*)inputImage withIntensity:(CGFloat)intensity radius:(CGFloat)radius {
    CIFilter<CIBloom>* bloomFilter = CIFilter.bloomFilter;
    bloomFilter.inputImage = inputImage;
    bloomFilter.intensity = intensity;
    bloomFilter.radius = radius;
    return bloomFilter.outputImage;
}

```

Like the sepia filter, the intensity of the bloom filter’s effect ranges between 0 and 1, with 1 being the most intense effect. The bloom filter has an additional r`adius` parameter to determine how much the glowing regions expand. Experiment with a range to values to fine tune the effect, or assign the input parameter to a control like a [`UISlider`](https://developer.apple.com/documentation/UIKit/UISlider) to allow your users to tweak its values.
Note
The [`gloom()`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/gloom\(\)) filter performs the opposite effect.
To display the output, convert the [`CIImage`](https://developer.apple.com/documentation/coreimage/ciimage) to a [`UIImage`](https://developer.apple.com/documentation/UIKit/UIImage).
```
CIImage* bloomCIImage = [self bloomFilterImage:sepiaCIImage withIntensity:1 radius:10];
_filteredImageView.image = [UIImage imageWithCIImage:bloomCIImage];

```

#### [Scale Image Size with the Lanczos Scale Filter](https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters#Scale-Image-Size-with-the-Lanczos-Scale-Filter)
Apply the [`lanczosScaleTransform()`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/lanczosscaletransform\(\)) to obtain a high-quality downsampling of the image, preserving the original image’s aspect ratio through the [`lanczosScaleTransform()`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/lanczosscaletransform\(\)) filter’s parameter `aspectRatio`. For built-in Core Image filters, calculate the aspect ratio as the image’s width over height.
```
CGFloat imageWidth = originalUIImage.size.width;
CGFloat imageHeight = originalUIImage.size.height;
CGFloat aspectRatio = imageHeight / imageWidth;
CIImage* scaledCIImage = [self scaleFilterImage:bloomCIImage withAspectRatio:aspectRatio scale:0.05];

```

Like other built-in filters, the [`lanczosScaleTransform()`](https://developer.apple.com/documentation/coreimage/cifilter-swift.class/lanczosscaletransform\(\)) filter also outputs its result as a [`CIImage`](https://developer.apple.com/documentation/coreimage/ciimage).
```
- (CIImage*) scaleFilterImage: (CIImage*)inputImage withAspectRatio:(CGFloat)aspectRatio scale:(CGFloat)scale {
    CIFilter<CILanczosScaleTransform>* scaleFilter = CIFilter.lanczosScaleTransformFilter;
    scaleFilter.inputImage = inputImage;
    scaleFilter.scale = scale;
    scaleFilter.aspectRatio = aspectRatio;
    return scaleFilter.outputImage;
}

```

Important
To optimize computation, Core Image doesn’t actually render any intermediate [`CIImage`](https://developer.apple.com/documentation/coreimage/ciimage) result until you force the [`CIImage`](https://developer.apple.com/documentation/coreimage/ciimage) to display its content onscreen, as you might do using [`UIImageView`](https://developer.apple.com/documentation/UIKit/UIImageView).
```
_imageView.image = [UIImage imageWithCIImage:scaledCIImage];

```

Note
Core Image optimizes filtering by reordering the three chained filters and concatenating them into a single image processing kernel, saving computation and rendering cycles.
In addition to trying out the built-in filters for a fixed effect, you can combine filters in certain Filter Recipes to accomplish tasks such as [Applying a Chroma Key Effect](https://developer.apple.com/documentation/coreimage/applying-a-chroma-key-effect), [Selectively Focusing on an Image](https://developer.apple.com/documentation/coreimage/selectively-focusing-on-an-image), [Customizing Image Transitions](https://developer.apple.com/documentation/coreimage/customizing-image-transitions), and [Simulating Scratchy Analog Film](https://developer.apple.com/documentation/coreimage/simulating-scratchy-analog-film).
## [See Also](https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters#see-also)
### [Essentials](https://developer.apple.com/documentation/coreimage/processing-an-image-using-built-in-filters#Essentials)
[`class CIContext`](https://developer.apple.com/documentation/coreimage/cicontext)
The Core Image context class provides an evaluation context for Core Image processing with Metal, OpenGL, or OpenCL.
[`class CIImage`](https://developer.apple.com/documentation/coreimage/ciimage)
A representation of an image to be processed or produced by Core Image filters.
Current page is Processing an Image Using Built-in Filters 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fcoreimage%2Fprocessing-an-image-using-built-in-filters).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
