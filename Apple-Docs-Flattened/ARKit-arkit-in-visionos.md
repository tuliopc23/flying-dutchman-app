Source: https://developer.apple.com/documentation/arkit/arkit-in-visionos

[ Skip Navigation ](https://developer.apple.com/documentation/arkit/arkit-in-visionos#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/arkit/arkit-in-visionos#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/arkit/arkit-in-visionos)
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
[ Open Menu ](https://developer.apple.com/documentation/arkit/arkit-in-visionos)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/arkit/arkit-in-visionos)


[](https://developer.apple.com/documentation/arkit/arkit-in-visionos)
## [ ARKit  ](https://developer.apple.com/documentation/arkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 12 symbols inside <root>
visionOS
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 12 symbols inside <root>
visionOS
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 12 symbols inside <root> [Setting up access to ARKit data](https://developer.apple.com/documentation/visionos/setting-up-access-to-arkit-data)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
3 of 12 symbols inside <root> containing 19 symbols[ARKitSession](https://developer.apple.com/documentation/arkit/arkitsession)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
4 of 12 symbols inside <root> containing 5 symbols[DataProvider](https://developer.apple.com/documentation/arkit/dataprovider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
5 of 12 symbols inside <root> containing 7 symbols[Anchor](https://developer.apple.com/documentation/arkit/anchor)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
6 of 12 symbols inside <root> containing 70 symbols[ARKit in visionOS](https://developer.apple.com/documentation/arkit/arkit-in-visionos)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 70 symbols inside 432901808 
Setup
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 70 symbols inside 432901808 [Setting up access to ARKit data](https://developer.apple.com/documentation/visionos/setting-up-access-to-arkit-data)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
3 of 70 symbols inside 432901808 containing 19 symbols[ARKitSession](https://developer.apple.com/documentation/arkit/arkitsession)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
4 of 70 symbols inside 432901808 containing 5 symbols[DataProvider](https://developer.apple.com/documentation/arkit/dataprovider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
5 of 70 symbols inside 432901808 containing 7 symbols[DataProviderState](https://developer.apple.com/documentation/arkit/dataproviderstate)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
6 of 70 symbols inside 432901808 containing 7 symbols[Anchor](https://developer.apple.com/documentation/arkit/anchor)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
7 of 70 symbols inside 432901808 containing 2 symbols[TrackableAnchor](https://developer.apple.com/documentation/arkit/trackableanchor)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
8 of 70 symbols inside 432901808 containing 6 symbols[ARKitCoordinateSpace](https://developer.apple.com/documentation/arkit/arkitcoordinatespace)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 70 symbols inside 432901808 
Barcode detection
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
10 of 70 symbols inside 432901808 containing 9 symbols[BarcodeDetectionProvider](https://developer.apple.com/documentation/arkit/barcodedetectionprovider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
11 of 70 symbols inside 432901808 containing 10 symbols[BarcodeAnchor](https://developer.apple.com/documentation/arkit/barcodeanchor)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 70 symbols inside 432901808 
Camera sampling
82 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Collection
  * [ ARKit ](https://developer.apple.com/documentation/arkit)
  * [ ARKit in visionOS ](https://developer.apple.com/documentation/arkit/arkit-in-visionos)
  *     * ARKit in visionOS 


API Collection
# ARKit in visionOS
Create immersive augmented reality experiences.
## [Overview](https://developer.apple.com/documentation/arkit/arkit-in-visionos#overview)
ARKit in visionOS offers a new set of sensing capabilities that you adopt individually in your app, using data providers to deliver updates asynchronously. The available capabilities include:
  * **Plane detection.** Detect surfaces in a person’s surroundings and use them to anchor content.
  * **World tracking.** Determine the position and orientation of Apple Vision Pro relative to its surroundings, and add world anchors to place content.
  * **Hand tracking.** Use a person’s hand and finger positions as input for custom gestures and interactivity.
  * **Scene reconstruction.** Build a mesh of a person’s physical surroundings and incorporate it into your immersive spaces to support interactions.
  * **Image tracking.** Look for known images in a person’s surroundings and use them as anchor points for custom content.
  * **Object tracking.** Use 3D reference objects to find and track real-world objects in a person’s environment.
  * **Barcode detection.** Detect and scan QR codes and barcodes in a variety of formats in a person’s surroundings.
  * **Room tracking**. Use room anchors to identify specific rooms and implement per-room experiences.
  * **Light estimation.** Understand the lighting characteristics of a room to help improve the appearance of shiny or semi-reflective materials in your virtual content.
  * **Camera frames.** Access camera frames from a device in several formats.
  * **Accessory tracking.** Work with the real-time position and orientation of accessories that a person is using.


![An illustration showing a split view of someone using Apple Vision Pro; the left side shows a person’s perspective of the room and the right side depicts ARKit’s perspective of the room. The right side illustrates ARKit’s sensing capabilities, including the detected shape of the room and the individual joints of a person’s hand.](https://docs-assets.developer.apple.com/published/b1742d9029cfb818bd01ad8d395b7e7d/media-4330791%402x.png)
## [Topics](https://developer.apple.com/documentation/arkit/arkit-in-visionos#topics)
### [Setup](https://developer.apple.com/documentation/arkit/arkit-in-visionos#Setup)
[Setting up access to ARKit data](https://developer.apple.com/documentation/visionOS/setting-up-access-to-arkit-data)
Check whether your app can use ARKit and respect people’s privacy.
[`class ARKitSession`](https://developer.apple.com/documentation/arkit/arkitsession)
The main entry point for receiving data from ARKit.
[`protocol DataProvider`](https://developer.apple.com/documentation/arkit/dataprovider)
A source of live data from ARKit.
[`enum DataProviderState`](https://developer.apple.com/documentation/arkit/dataproviderstate)
The possible states of a data provider.
[`protocol Anchor`](https://developer.apple.com/documentation/arkit/anchor)
The identity, location, and orientation of an object in world space.
[`protocol TrackableAnchor`](https://developer.apple.com/documentation/arkit/trackableanchor)
An anchor that can gain and lose its tracking state over the course of a session.
[`struct ARKitCoordinateSpace`](https://developer.apple.com/documentation/arkit/arkitcoordinatespace)
An object which represents an ARKit coordinate space.
### [Barcode detection](https://developer.apple.com/documentation/arkit/arkit-in-visionos#Barcode-detection)
[`class BarcodeDetectionProvider`](https://developer.apple.com/documentation/arkit/barcodedetectionprovider)
An object that provides the real-time position of barcodes the framework detects in a person’s environment.
[`struct BarcodeAnchor`](https://developer.apple.com/documentation/arkit/barcodeanchor)
A barcode’s position in a person’s surroundings.
### [Camera sampling](https://developer.apple.com/documentation/arkit/arkit-in-visionos#Camera-sampling)
[`class CameraFrameProvider`](https://developer.apple.com/documentation/arkit/cameraframeprovider)
An object that provides camera streams.
[`struct CameraFrame`](https://developer.apple.com/documentation/arkit/cameraframe)
The representation of a camera frame.
[`struct CameraVideoFormat`](https://developer.apple.com/documentation/arkit/cameravideoformat)
A structure that represents a camera video format.
### [Rendering](https://developer.apple.com/documentation/arkit/arkit-in-visionos#Rendering)
[`class StereoPropertiesProvider`](https://developer.apple.com/documentation/arkit/stereopropertiesprovider)
The StereoPropertiesProvider serves the latest viewpoint properties on the device.
[`struct ViewpointProperties`](https://developer.apple.com/documentation/arkit/viewpointproperties)
The ViewpointProperties is a record of render camera transforms at some particular time.
### [Camera region](https://developer.apple.com/documentation/arkit/arkit-in-visionos#Camera-region)
[`class CameraRegionProvider`](https://developer.apple.com/documentation/arkit/cameraregionprovider)
A camera region provider. An enterprise license is required to use the CameraRegionProvider. The provider will not deliver any data without it. The app must include the following entitlement: `com.apple.developer.arkit.camera-region.allow`
[`struct CameraRegionAnchor`](https://developer.apple.com/documentation/arkit/cameraregionanchor)
Represents a region in space to capture a camera stream of.
### [Plane detection](https://developer.apple.com/documentation/arkit/arkit-in-visionos#Plane-detection)
[Placing content on detected planes](https://developer.apple.com/documentation/visionOS/placing-content-on-detected-planes)
Detect horizontal surfaces like tables and floors, as well as vertical planes like walls and doors.
[`class PlaneDetectionProvider`](https://developer.apple.com/documentation/arkit/planedetectionprovider)
A source of live data about planes in a person’s surroundings.
[`struct PlaneAnchor`](https://developer.apple.com/documentation/arkit/planeanchor)
An anchor that represents horizontal and vertical planes.
### [World tracking](https://developer.apple.com/documentation/arkit/arkit-in-visionos#World-tracking)
[Tracking specific points in world space](https://developer.apple.com/documentation/visionOS/tracking-points-in-world-space)
Retrieve the position and orientation of anchors your app stores in ARKit.
[`class WorldTrackingProvider`](https://developer.apple.com/documentation/arkit/worldtrackingprovider)
A source of live data about the device pose and anchors in a person’s surroundings.
[`struct WorldAnchor`](https://developer.apple.com/documentation/arkit/worldanchor)
A fixed location in a person’s surroundings.
[`struct DeviceAnchor`](https://developer.apple.com/documentation/arkit/deviceanchor)
The position and orientation of Apple Vision Pro.
### [Hand tracking](https://developer.apple.com/documentation/arkit/arkit-in-visionos#Hand-tracking)
[Happy Beam](https://developer.apple.com/documentation/visionOS/happybeam)
Leverage a Full Space to create a fun game using ARKit.
[`class HandTrackingProvider`](https://developer.apple.com/documentation/arkit/handtrackingprovider)
A source of live data about the position of a person’s hands and hand joints.
[`struct HandAnchor`](https://developer.apple.com/documentation/arkit/handanchor)
A hand’s position in a person’s surroundings.
[`struct HandSkeleton`](https://developer.apple.com/documentation/arkit/handskeleton)
A collection of joints in a hand.
### [Scene reconstruction](https://developer.apple.com/documentation/arkit/arkit-in-visionos#Scene-reconstruction)
[Incorporating real-world surroundings in an immersive experience](https://developer.apple.com/documentation/visionOS/incorporating-real-world-surroundings-in-an-immersive-experience)
Create an immersive experience by making your app’s content respond to the local shape of the world.
[`class SceneReconstructionProvider`](https://developer.apple.com/documentation/arkit/scenereconstructionprovider)
A source of live data about the shape of a person’s surroundings.
[`struct MeshAnchor`](https://developer.apple.com/documentation/arkit/meshanchor)
A volume of space that contains a mesh of a person’s surroundings.
### [Image tracking](https://developer.apple.com/documentation/arkit/arkit-in-visionos#Image-tracking)
[Tracking and altering images](https://developer.apple.com/documentation/arkit/tracking-and-altering-images)
Create images from rectangular shapes found in the user’s environment, and augment their appearance.
[Detecting Images in an AR Experience](https://developer.apple.com/documentation/arkit/detecting-images-in-an-ar-experience)
React to known 2D images in the user’s environment, and use their positions to place AR content.
[Tracking preregistered images in 3D space](https://developer.apple.com/documentation/visionOS/tracking-images-in-3d-space)
Place content based on the current position of a known image in a person’s surroundings.
[`class ImageTrackingProvider`](https://developer.apple.com/documentation/arkit/imagetrackingprovider)
A source of live data about a 2D image’s position in a person’s surroundings.
[`struct ImageAnchor`](https://developer.apple.com/documentation/arkit/imageanchor)
A 2D image’s position in a person’s surroundings.
[`struct ReferenceImage`](https://developer.apple.com/documentation/arkit/referenceimage)
A 2D image the system uses as a reference to find the same image in a person’s surroundings.
### [Geometry](https://developer.apple.com/documentation/arkit/arkit-in-visionos#Geometry)
[`struct GeometryElement`](https://developer.apple.com/documentation/arkit/geometryelement)
A container for vertex indices of lines or triangles.
[`struct GeometrySource`](https://developer.apple.com/documentation/arkit/geometrysource)
A container for geometrical vector data.
### [Lighting estimation](https://developer.apple.com/documentation/arkit/arkit-in-visionos#Lighting-estimation)
[`class EnvironmentLightEstimationProvider`](https://developer.apple.com/documentation/arkit/environmentlightestimationprovider)
A source of live data about lighting information in the environment.
[`struct EnvironmentProbeAnchor`](https://developer.apple.com/documentation/arkit/environmentprobeanchor)
An environment probe in the world.
### [Object tracking](https://developer.apple.com/documentation/arkit/arkit-in-visionos#Object-tracking)
[`class ObjectTrackingProvider`](https://developer.apple.com/documentation/arkit/objecttrackingprovider)
A source of real-time position of reference objects in a person’s environment.
[`struct ObjectAnchor`](https://developer.apple.com/documentation/arkit/objectanchor)
A reference object ARKit is tracking.
[Exploring object tracking with ARKit](https://developer.apple.com/documentation/visionOS/exploring_object_tracking_with_arkit)
Find and track real-world objects in visionOS using reference objects trained with Create ML.
[Implementing object tracking in your visionOS app](https://developer.apple.com/documentation/visionOS/implementing-object-tracking-in-your-visionOS-app)
Create engaging interactions by training models to recognize and track real-world objects in your app.
### [Accessory tracking](https://developer.apple.com/documentation/arkit/arkit-in-visionos#Accessory-tracking)
[`class AccessoryTrackingProvider`](https://developer.apple.com/documentation/arkit/accessorytrackingprovider)
Provides the real time position of accessories in the user’s environment.
[`struct Accessory`](https://developer.apple.com/documentation/arkit/accessory)
Represents an accessory to be tracked.
[`struct AccessoryAnchor`](https://developer.apple.com/documentation/arkit/accessoryanchor)
Represents a tracked accessory.
[Tracking accessories in volumetric windows](https://developer.apple.com/documentation/arkit/tracking-accessories-in-volumetric-windows)
Translate the position and velocity of tracked handheld accessories to throw virtual balls at a stack of cans.
[Tracking a handheld accessory as a virtual sculpting tool](https://developer.apple.com/documentation/arkit/tracking-a-handheld-accessory-as-a-virtual-sculpting-tool)
Use a tracked accessory with Apple Vision Pro to create a virtual sculpture.
### [Room tracking](https://developer.apple.com/documentation/arkit/arkit-in-visionos#Room-tracking)
[`class RoomTrackingProvider`](https://developer.apple.com/documentation/arkit/roomtrackingprovider)
A source of real-time information about the room that a person is currently in.
[`struct RoomAnchor`](https://developer.apple.com/documentation/arkit/roomanchor)
The representation of a room ARKit is currently tracking.
[`enum SurfaceClassification`](https://developer.apple.com/documentation/arkit/surfaceclassification)
A value describing the classification of a surface.
[Building local experiences with room tracking](https://developer.apple.com/documentation/visionOS/building-local-experiences-with-room-tracking)
Use room tracking in visionOS to provide custom interactions with physical spaces.
### [Shared coordinate spaces](https://developer.apple.com/documentation/arkit/arkit-in-visionos#Shared-coordinate-spaces)
[`class SharedCoordinateSpaceProvider`](https://developer.apple.com/documentation/arkit/sharedcoordinatespaceprovider)
Provides ability to establish a shared coordinate space among multiple participants.
## [See Also](https://developer.apple.com/documentation/arkit/arkit-in-visionos#see-also)
### [visionOS](https://developer.apple.com/documentation/arkit/arkit-in-visionos#visionOS)
[Setting up access to ARKit data](https://developer.apple.com/documentation/visionOS/setting-up-access-to-arkit-data)
Check whether your app can use ARKit and respect people’s privacy.
[`class ARKitSession`](https://developer.apple.com/documentation/arkit/arkitsession)
The main entry point for receiving data from ARKit.
[`protocol DataProvider`](https://developer.apple.com/documentation/arkit/dataprovider)
A source of live data from ARKit.
[`protocol Anchor`](https://developer.apple.com/documentation/arkit/anchor)
The identity, location, and orientation of an object in world space.
Current page is ARKit in visionOS 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Farkit%2Farkit-in-visionos).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
