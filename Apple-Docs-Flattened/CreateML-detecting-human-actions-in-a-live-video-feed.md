Source: https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed

[ Skip Navigation ](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed)
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
[ Open Menu ](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed)
## [ Create ML  ](https://developer.apple.com/documentation/createml)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 58 symbols inside <root>
Image models
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 58 symbols inside <root>
Image models
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 58 symbols inside <root> [Creating an Image Classifier Model](https://developer.apple.com/documentation/createml/creating-an-image-classifier-model)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
3 of 58 symbols inside <root> containing 36 symbols[MLImageClassifier](https://developer.apple.com/documentation/createml/mlimageclassifier)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
4 of 58 symbols inside <root> containing 40 symbols[MLObjectDetector](https://developer.apple.com/documentation/createml/mlobjectdetector)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
5 of 58 symbols inside <root> containing 34 symbols[MLHandPoseClassifier](https://developer.apple.com/documentation/createml/mlhandposeclassifier)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 58 symbols inside <root>
Video models
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 58 symbols inside <root> containing 3 symbols[Creating an Action Classifier Model](https://developer.apple.com/documentation/createml/creating-an-action-classifier-model)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 58 symbols inside <root> [Detecting human actions in a live video feed](https://developer.apple.com/documentation/createml/detecting-human-actions-in-a-live-video-feed)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
9 of 58 symbols inside <root> containing 35 symbols[MLActionClassifier](https://developer.apple.com/documentation/createml/mlactionclassifier)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
10 of 58 symbols inside <root> containing 35 symbols[MLHandActionClassifier](https://developer.apple.com/documentation/createml/mlhandactionclassifier)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
11 of 58 symbols inside <root> containing 27 symbols[MLStyleTransfer](https://developer.apple.com/documentation/createml/mlstyletransfer)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 58 symbols inside <root>
Text models
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
13 of 58 symbols inside <root> [Creating a text classifier model](https://developer.apple.com/documentation/createml/creating-a-text-classifier-model)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
14 of 58 symbols inside <root> [Creating a word tagger model](https://developer.apple.com/documentation/createml/creating-a-word-tagger-model)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
15 of 58 symbols inside <root> containing 31 symbols[MLTextClassifier](https://developer.apple.com/documentation/createml/mltextclassifier)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
16 of 58 symbols inside <root> containing 31 symbols[MLWordTagger](https://developer.apple.com/documentation/createml/mlwordtagger)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
17 of 58 symbols inside <root> containing 22 symbols[MLGazetteer](https://developer.apple.com/documentation/createml/mlgazetteer)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
18 of 58 symbols inside <root> containing 24 symbols[MLWordEmbedding](https://developer.apple.com/documentation/createml/mlwordembedding)
58 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Create ML ](https://developer.apple.com/documentation/createml)
  * [ Detecting human actions in a live video feed ](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed)
  *     * Detecting human actions in a live video feed 


Sample Code
# Detecting human actions in a live video feed
Identify body movements by sending a person’s pose data from a series of video frames to an action-classification model.
[ Download ](https://docs-assets.developer.apple.com/published/f1a45aa976a1/DetectingHumanActionsInALiveVideoFeed.zip)
iOS 14.0+iPadOS 14.0+Xcode 12.3+
## [Overview](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed#Overview)
This sample app recognizes a person’s body moves, called _actions_ , by analyzing a series of video frames with [Vision](https://developer.apple.com/documentation/Vision) and predicting the name of the movement by applying an action classifier. The action classifier in this sample recognizes three exercises:
  * Jumping jacks
  * Lunges
  * Burpees


![Flow diagram that illustrates the purpose of an action classifier starting with a human performing jumping jacks in front of the device’s camera and ending with a prediction label.](https://docs-assets.developer.apple.com/published/75929e2897662f60b99a1231b050d753/detecting-human-actions-1%402x.png)
The app continually presents its current action prediction on top of a live, full-screen video feed from the device’s camera. When the app recognizes one or more people in the frame, it overlays a wireframe body pose on each person. At the same time, the app predicts the _prominent_ person’s current action; typically this is the person closest to the camera.
![A diagram that represents the sample app’s main view.](https://docs-assets.developer.apple.com/published/7884307fabe284474a34bad3c1e1e742/detecting-human-actions-2%402x.png)
At launch, the app configures the device’s camera to generate video frames and then directs the frames through a series of methods it chains together with [Combine](https://developer.apple.com/documentation/Combine). These methods work together to analyze the frames and make action predictions by performing the following sequence of steps:
  1. Locate all human body poses in each frame.
  2. Isolate the prominent pose.
  3. Aggregate the prominent pose’s position data over time.
  4. Make action predictions by sending the aggregate data to the action classifier.


![A flow diagram that illustrates the path of video frames through the sample app,](https://docs-assets.developer.apple.com/published/d60ff302fc0e9dce6cb6b9011e42b408/detecting-human-actions-3%402x.png)
## [Configure the Sample Code Project](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed#Configure-the-Sample-Code-Project)
This sample app uses a camera, so you can’t run it in Simulator — you need to run it on an iOS or iPadOS device.
## [Start a Video Capture Session](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed#Start-a-Video-Capture-Session)
The app’s `VideoCapture`class configures the device’s camera to generate video frames by creating an [`AVCaptureSession`](https://developer.apple.com/documentation/AVFoundation/AVCaptureSession).
When the app first launches, or when the user rotates the device or switches between cameras, video capture configures a camera input, a frame output, and the connection between them in its `configureCaptureSession()` method.
```
let input = AVCaptureDeviceInput.createCameraInput(position: cameraPosition)


let output = AVCaptureVideoDataOutput.withPixelFormatType(kCVPixelFormatType_32BGRA)


let success = configureCaptureConnection(input, output)
return success ? output : nil

```

The `createCameraInput(position:frameRate:)` method selects the front- or rear-facing camera and configures its frame rate so it matches that of the action classifier.
Important
If you replace the `ExerciseClassifier.mlmodel` file with your own action classifier model, set the `frameRate` property to match the Frame Rate training parameter you used in the Create ML developer tool.
The `AVCaptureVideoDataOutput.withPixelFormatType(_:)` method creates an [`AVCaptureVideoDataOutput`](https://developer.apple.com/documentation/AVFoundation/AVCaptureVideoDataOutput) that produces frames with a specific pixel format.
The `configureCaptureConnection(_:_:)` method configures the relationship between the capture session’s camera input and video output by:
  * Selecting a video orientation
  * Deciding whether to horizontally flip the video
  * Enabling image stabilization when applicable


```
if connection.isVideoOrientationSupported {
    // Set the video capture's orientation to match that of the device.
    connection.videoOrientation = orientation
}


if connection.isVideoMirroringSupported {
    connection.isVideoMirrored = horizontalFlip
}


if connection.isVideoStabilizationSupported {
    if videoStabilizationEnabled {
        connection.preferredVideoStabilizationMode = .standard
    } else {
        connection.preferredVideoStabilizationMode = .off
    }
}

```

The method keeps the app operating in real time — and avoids building up a frame backlog — by setting the video output’s [`alwaysDiscardsLateVideoFrames`](https://developer.apple.com/documentation/AVFoundation/AVCaptureVideoDataOutput/alwaysDiscardsLateVideoFrames) property to `true`.
```
// Discard newer frames if the app is busy with an earlier frame.
output.alwaysDiscardsLateVideoFrames = true

```

See [Setting up a capture session](https://developer.apple.com/documentation/AVFoundation/setting-up-a-capture-session) for more information on how to configure capture sessions and connect their inputs and outputs.
## [Create a Frame Publisher](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed#Create-a-Frame-Publisher)
The video capture publishes frames from its capture session by creating a [`PassthroughSubject`](https://developer.apple.com/documentation/Combine/PassthroughSubject) in its `createVideoFramePublisher()` method.
```
// Create a new passthrough subject that publishes frames to subscribers.
let passthroughSubject = PassthroughSubject<Frame, Never>()


// Keep a reference to the publisher.
framePublisher = passthroughSubject

```

A passthrough subject is a concrete implementation of [`Subject`](https://developer.apple.com/documentation/Combine/Subject) that adapts imperative code to work with [Combine](https://developer.apple.com/documentation/Combine). It immediately publishes the instance you pass to its [`send(_:)`](https://developer.apple.com/documentation/Combine/Subject/send\(_:\)) method, if it has a subscriber at that time.
Next, the video capture registers itself as the video output’s delegate so it receives the video frames from the capture session by calling the output’s [`setSampleBufferDelegate(_:queue:)`](https://developer.apple.com/documentation/AVFoundation/AVCaptureVideoDataOutput/setSampleBufferDelegate\(_:queue:\)) method.
```
// Set the video capture as the video output's delegate.
videoDataOutput.setSampleBufferDelegate(self, queue: videoCaptureQueue)

```

The video capture forwards each frame it receives to its `framePublisher` by passing the frame to its [`send(_:)`](https://developer.apple.com/documentation/Combine/Subject/send\(_:\)) method.
```
extension VideoCapture: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(_ output: AVCaptureOutput,
                       didOutput frame: Frame,
                       from connection: AVCaptureConnection) {


        // Forward the frame through the publisher.
        framePublisher?.send(frame)
    }
}

```

## [Build a Publisher Chain](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed#Build-a-Publisher-Chain)
The sample processes each video frame, and its derivative data, with a series of methods that it connects together into a chain of [Combine](https://developer.apple.com/documentation/Combine) publishers in the `VideoProcessingChain` class.
Each time the video capture creates a new frame publisher it notifies the main view controller, which then assigns the publisher to the video-processing chain’s `upstreamFramePublisher` property:
```
func videoCapture(_ videoCapture: VideoCapture,
                  didCreate framePublisher: FramePublisher) {
    updateUILabelsWithPrediction(.startingPrediction)
    
    // Build a new video-processing chain by assigning the new frame publisher.
    videoProcessingChain.upstreamFramePublisher = framePublisher
}

```

Each time the property’s value changes, the video-processing chain creates a new daisy chain of publishers by calling its `buildProcessingChain()` method.
![Flow diagram of the video-processing chain that consumes video frames and produces information to the main view controller.](https://docs-assets.developer.apple.com/published/ab0288b62b5f7bc9fbf9aeb4f4391de5/build-publisher-chain%402x.png)
The method creates each new publisher by calling one of the following [`Publisher`](https://developer.apple.com/documentation/Combine/Publisher) methods:
  * [`map(_:)`](https://developer.apple.com/documentation/Combine/Publisher/map\(_:\)-99evh)
  * [`compactMap(_:)`](https://developer.apple.com/documentation/Combine/Publisher/compactMap\(_:\))
  * [`scan(_:_:)`](https://developer.apple.com/documentation/Combine/Publisher/scan\(_:_:\))
  * [`filter(_:)`](https://developer.apple.com/documentation/Combine/Publisher/filter\(_:\))


For example, the publisher that subscribes to the initial frame publisher is a [`Publishers.CompactMap`](https://developer.apple.com/documentation/Combine/Publishers/CompactMap) that converts each `Frame` (a type alias of [`CMSampleBuffer`](https://developer.apple.com/documentation/CoreMedia/CMSampleBuffer)) it receives into a [`CGImage`](https://developer.apple.com/documentation/CoreGraphics/CGImage) by calling the video-processing chain’s `imageFromFrame(_:)` method.
```
// Create the chain of publisher-subscribers that transform the raw video
// frames from upstreamFramePublisher.
frameProcessingChain = upstreamFramePublisher
    // ---- Frame (aka CMSampleBuffer) -- Frame ----


    // Convert each frame to a CGImage, skipping any that don't convert.
    .compactMap(imageFromFrame)


    // ---- CGImage -- CGImage ----


    // Detect any human body poses (or lack of them) in the frame.
    .map(findPosesInFrame)


    // ---- [Pose]? -- [Pose]? ----

```

The next sections explain the remaining publishers in the chain and the methods they use to transform their inputs.
## [Analyze Each Frame for Body Poses](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed#Analyze-Each-Frame-for-Body-Poses)
The next publisher in the chain is a [`Publishers.Map`](https://developer.apple.com/documentation/Combine/Publishers/Map) that receives each [`CGImage`](https://developer.apple.com/documentation/CoreGraphics/CGImage) from the previous publisher (the compact map) by subscribing to it. The map publisher locates any human body poses in the frame by using the video-processing chain’s `findPosesInFrame(_:)` method. The method invokes a [`VNDetectHumanBodyPoseRequest`](https://developer.apple.com/documentation/Vision/VNDetectHumanBodyPoseRequest) by creating a [`VNImageRequestHandler`](https://developer.apple.com/documentation/Vision/VNImageRequestHandler) with the image and submitting the video-processing chain’s `humanBodyPoseRequest` property to the handler’s [`perform(_:)`](https://developer.apple.com/documentation/Vision/VNImageRequestHandler/perform\(_:\))  
method.
Important
Improve your app’s efficiency by creating and reusing a single [`VNDetectHumanBodyPoseRequest`](https://developer.apple.com/documentation/Vision/VNDetectHumanBodyPoseRequest) instance.
```
// Create a request handler for the image.
let visionRequestHandler = VNImageRequestHandler(cgImage: frame)


// Use Vision to find human body poses in the frame.
do { try visionRequestHandler.perform([humanBodyPoseRequest]) } catch {
    assertionFailure("Human Pose Request failed: \(error)")
}

```

When the request completes, the method creates and returns a `Pose` array that contains one pose for every [`VNHumanBodyPoseObservation`](https://developer.apple.com/documentation/Vision/VNHumanBodyPoseObservation) instance in the request’s [`results`](https://developer.apple.com/documentation/Vision/VNDetectHumanBodyPoseRequest/results) property.
```
let poses = Pose.fromObservations(humanBodyPoseRequest.results)

```

The `Pose` structure in this sample serves three main purposes:
  * Calculating the observation’s area within a frame (see “Isolate A Body Pose”)
  * Storing the the observation’s multiarray (see “Retrieve the Multiarray”)
  * Drawing an observation as a wireframe of points and lines (see “Present the Poses to the User”)


For more information about using a [`VNDetectHumanBodyPoseRequest`](https://developer.apple.com/documentation/Vision/VNDetectHumanBodyPoseRequest), see [Detecting Human Body Poses in Images](https://developer.apple.com/documentation/Vision/detecting-human-body-poses-in-images).
## [Isolate a Body Pose](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed#Isolate-a-Body-Pose)
The next publisher in the chain is a map that chooses a single pose from the array of poses by using the video-processing chain’s `isolateLargestPose(_:)` method. This method selects the the most prominent pose by passing a closure to the pose array’s [`max(by:)`](https://developer.apple.com/documentation/Swift/Array/max\(by:\)) method.
```
private func isolateLargestPose(_ poses: [Pose]?) -> Pose? {
    return poses?.max(by:) { pose1, pose2 in pose1.area < pose2.area }
}

```

The closure compares the poses’ area estimates, with the goal of consistently selecting the same person’s pose over time, when multiple people are in frame.
Important
Get the most accurate predictions from an action classifier by using whatever technique you think best tracks a person from frame to frame, and use the multiarray from that person’s [`VNHumanBodyPoseObservation`](https://developer.apple.com/documentation/Vision/VNHumanBodyPoseObservation) result.
## [Retrieve the Multiarray](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed#Retrieve-the-Multiarray)
The next publisher in the chain is a map that publishes the [`MLMultiArray`](https://developer.apple.com/documentation/CoreML/MLMultiArray) from the pose’s `multiArray` property by using the video processing chain’s `multiArrayFromPose(_:)` method.
```
private func multiArrayFromPose(_ item: Pose?) -> MLMultiArray? {
    return item?.multiArray
}

```

The `Pose` initializer copies the multiarray from its [`VNHumanBodyPoseObservation`](https://developer.apple.com/documentation/Vision/VNHumanBodyPoseObservation) parameter by calling the observation’s [`keypointsMultiArray()`](https://developer.apple.com/documentation/Vision/VNRecognizedPointsObservation/keypointsMultiArray\(\)) method.
```
// Save the multiarray from the observation.
multiArray = try? observation.keypointsMultiArray()

```

## [Gather a Window of Multiarrays](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed#Gather-a-Window-of-Multiarrays)
The next publisher in the chain is a [`Publishers.Scan`](https://developer.apple.com/documentation/Combine/Publishers/Scan) that receives each multiarray from its upstream publisher and gathers them into an array by providing two arguments:
  * An empty multiarray-optional array as the scan publisher’s initial value.
  * The video-processing chain’s `gatherWindow(previousWindow:multiArray:)` method as the scan publisher’s transform.


```
// ---- MLMultiArray? -- MLMultiArray? ----


// Gather a window of multiarrays, starting with an empty window.
.scan([MLMultiArray?](), gatherWindow)


// ---- [MLMultiArray?] -- [MLMultiArray?] ----

```

A scan publisher behaves similarly to a map, but it also maintains a state. The following scan publisher’s state is an array of multiarray optionals that’s initially empty. As the scan publisher receives multiarray optionals from its upstream publisher, the scan publisher passes its previous state and the incoming multiarray optional as arguments to its transform.
```
private func gatherWindow(previousWindow: [MLMultiArray?],
                          multiArray: MLMultiArray?) -> [MLMultiArray?] {
    var currentWindow = previousWindow


    // If the previous window size is the target size, it
    // means sendWindowWhenReady() just published an array window.
    if previousWindow.count == predictionWindowSize {
        // Advance the sliding array window by stride elements.
        currentWindow.removeFirst(windowStride)
    }


    // Add the newest multiarray to the window.
    currentWindow.append(multiArray)


    // Publish the array window to the next subscriber.
    // The currentWindow becomes this method's next previousWindow when
    // it receives the next multiarray from the upstream publisher.
    return currentWindow
}

```

The method:
  1. Copies the `previousWindow` parameter to `currentWindow`
  2. Removes `windowStride` elements from the front of `currentWindow`, if it’s full
  3. Appends the `multiArray` parameter to the end of `currentWindow`
  4. Returns `currentWindow`, which becomes the new state of the scan publisher and the next value for `previousWindow` when the scan publisher receives the next value from its upstream publisher and invokes the method


The video-processing chain considers a window to be full if it contains `predictionWindowSize` elements. When the window is full, this method removes (in step 2) the oldest elements to make room for newer elements, effectively sliding the window forward in time.
The Exercise Classifier’s `calculatePredictionWindowSize()` method determines the value of the prediction window size at runtime by inspecting the model’s [`modelDescription`](https://developer.apple.com/documentation/CoreML/MLModel/modelDescription) property.
## [Monitor the Window Size](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed#Monitor-the-Window-Size)
The next publisher in the chain is a [`Publishers.Filter`](https://developer.apple.com/documentation/Combine/Publishers/Filter), which only publishes an array window when the `gateWindow(_:)` method returns `true`.
```
// Only publish a window when it grows to the correct size.
.filter(gateWindow)


// ---- [MLMultiArray?] -- [MLMultiArray?] ----

```

The method returns `true` if the window array contains exactly the number of elements defined in `predictionWindowSize`. Otherwise, the method returns `false`, which instructs the filter publisher to discard the current window and not publish it.
```
private func gateWindow(_ currentWindow: [MLMultiArray?]) -> Bool {
    return currentWindow.count == predictionWindowSize
}

```

This filter publisher, in combination with its upstream scan publisher, publishes an array of multiarray optionals once per each number of frames defined in `windowStride`.
## [Predict the Person’s Action](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed#Predict-the-Persons-Action)
The next publisher in the chain makes an `ActionPrediction` from the multiarray window by using the `predictActionWithWindow(_:)` method as its transform.
```
// Make an activity prediction from the window.
.map(predictActionWithWindow)


// ---- ActionPrediction -- ActionPrediction ----

```

The method’s input array contains multiarray optionals where each `nil` element represents a frame in which [Vision](https://developer.apple.com/documentation/Vision) wasn’t able to find any human body poses. An action classifier requires a valid, non-`nil` multiarray for every frame. To remove the `nil` elements in the array, the method creates a new multiarray, `filledWindow`, by:
  * Copying each each valid element in `currentWindow`
  * Replacing each `nil` element in `currentWindow` with an `emptyPoseMultiArray`


```
var poseCount = 0


// Fill the nil elements with an empty pose array.
let filledWindow: [MLMultiArray] = currentWindow.map { multiArray in
    if let multiArray = multiArray {
        poseCount += 1
        return multiArray
    } else {
        return Pose.emptyPoseMultiArray
    }
}

```

The empty pose multiarray has:
  * Every element set to zero
  * The same value for its [`shape`](https://developer.apple.com/documentation/CoreML/MLMultiArray/shape) property as a multiarray from a human body-pose observation


As the method iterates through each element in `currentWindow`, it tallies the number of non-`nil` elements with `poseCount`.
If the value of `poseCount` is too low, the method directly creates a `noPersonPrediction` action prediction.
```
// Only use windows with at least 60% real data to make a prediction
// with the action classifier.
let minimum = predictionWindowSize * 60 / 100
guard poseCount >= minimum else {
    return ActionPrediction.noPersonPrediction
}

```

Otherwise, the method merges the array of multiarrays into a single, combined multiarray by calling the [`init(byConcatenatingMultiArrays:alongAxis:dataType:)`](https://developer.apple.com/documentation/CoreML/MLMultiArray/init\(byConcatenatingMultiArrays:alongAxis:dataType:\)) initializer.
```
// Merge the array window of multiarrays into one multiarray.
let mergedWindow = MLMultiArray(concatenating: filledWindow,
                                axis: 0,
                                dataType: .float)

```

The method generates an action prediction by passing the combined multiarray to the action classifier’s `predictActionFromWindow(_:)` helper method.
```
// Make a genuine prediction with the action classifier.
let prediction = actionClassifier.predictActionFromWindow(mergedWindow)


// Return the model's prediction if the confidence is high enough.
// Otherwise, return a "Low Confidence" prediction.
return checkConfidence(prediction)

```

The method checks the prediction’s confidence by passing the prediction to the `checkConfidence(_:)` helper method, which returns the same prediction if its confidence is high enough; otherwise `lowConfidencePrediction`.
## [Present the Prediction to the User](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed#Present-the-Prediction-to-the-User)
The final component in the chain is a subscriber that notifies the video-processing chain’s delegate with the prediction using the `sendPrediction(_:)` method.
```
// Send the action prediction to the delegate.
.sink(receiveValue: sendPrediction)

```

The method sends the action prediction and the number of frames the prediction represents (`windowStride`) to the video-processing chain’s `delegate`, the main view controller.
```
// Send the prediction to the delegate on the main queue.
DispatchQueue.main.async {
    self.delegate?.videoProcessingChain(self,
                                        didPredict: actionPrediction,
                                        for: windowStride)
}

```

Each time the main view controller receives an action prediction, it updates the app’s UI with the prediction and confidence in a helper method.
```
func videoProcessingChain(_ chain: VideoProcessingChain,
                          didPredict actionPrediction: ActionPrediction,
                          for frameCount: Int) {


    if actionPrediction.isModelLabel {
        // Update the total number of frames for this action.
        addFrameCount(frameCount, to: actionPrediction.label)
    }


    // Present the prediction in the UI.
    updateUILabelsWithPrediction(actionPrediction)
}

```

The main view controller also updates its `actionFrameCounts` property for action labels that come from the model, which it later sends to the Summary View Controller when the user taps the `Summary` button.
## [Present the Poses to the User](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed#Present-the-Poses-to-the-User)
The app visualizes the result of each human body-pose request by drawing the poses on top of the frame in which [Vision](https://developer.apple.com/documentation/Vision) found them. Each time the video-processing chain’s `findPosesInFrame(_:)` creates an array of `Pose` instances, it sends the poses to its delegate, the main view controller.
```
// Send the frame and poses, if any, to the delegate on the main queue.
DispatchQueue.main.async {
    self.delegate?.videoProcessingChain(self, didDetect: poses, in: frame)
}

```

The main view controller’s `drawPoses(_:onto:)` method uses the frame as the background by first drawing the frame.
```
// Draw the camera image first as the background.
let imageRectangle = CGRect(origin: .zero, size: frameSize)
cgContext.draw(frame, in: imageRectangle)

```

Next, the method draws the poses by calling their `drawWireframeToContext(_:applying:)` method, which draws the pose as a wireframe of lines and circles.
```
// Draw all the poses Vision found in the frame.
for pose in poses {
    // Draw each pose as a wireframe at the scale of the image.
    pose.drawWireframeToContext(cgContext, applying: pointTransform)
}

```

The main view controller presents the finished image to the user by assigning it to its full-screen image view.
```
// Update the UI's full-screen image view on the main thread.
DispatchQueue.main.async { self.imageView.image = frameWithPosesRendering }

```

Current page is Detecting human actions in a live video feed 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FCreateML%2Fdetecting-human-actions-in-a-live-video-feed).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
