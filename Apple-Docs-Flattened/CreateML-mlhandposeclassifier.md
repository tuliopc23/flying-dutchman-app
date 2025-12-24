Source: https://developer.apple.com/documentation/createml/mlhandposeclassifier

[ Skip Navigation ](https://developer.apple.com/documentation/createml/mlhandposeclassifier#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/createml/mlhandposeclassifier#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/createml/mlhandposeclassifier)
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
[ Open Menu ](https://developer.apple.com/documentation/createml/mlhandposeclassifier)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/createml/mlhandposeclassifier)
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
1 of 34 symbols inside -1689012799 
Training a hand pose classifier asynchronously
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 34 symbols inside -1689012799 [static func train(trainingData: MLHandPoseClassifier.DataSource, parameters: MLHandPoseClassifier.ModelParameters, sessionParameters: MLTrainingSessionParameters) throws -> MLJob<MLHandPoseClassifier>](https://developer.apple.com/documentation/createml/mlhandposeclassifier/train\(trainingdata:parameters:sessionparameters:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 34 symbols inside -1689012799 [static func makeTrainingSession(trainingData: MLHandPoseClassifier.DataSource, parameters: MLHandPoseClassifier.ModelParameters, sessionParameters: MLTrainingSessionParameters) throws -> MLTrainingSession<MLHandPoseClassifier>](https://developer.apple.com/documentation/createml/mlhandposeclassifier/maketrainingsession\(trainingdata:parameters:sessionparameters:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 34 symbols inside -1689012799 [static func resume(MLTrainingSession<MLHandPoseClassifier>) throws -> MLJob<MLHandPoseClassifier>](https://developer.apple.com/documentation/createml/mlhandposeclassifier/resume\(_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
5 of 34 symbols inside -1689012799 [static func restoreTrainingSession(sessionParameters: MLTrainingSessionParameters) throws -> MLTrainingSession<MLHandPoseClassifier>](https://developer.apple.com/documentation/createml/mlhandposeclassifier/restoretrainingsession\(sessionparameters:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 34 symbols inside -1689012799 
Creating a hand pose classifier from a checkpoint
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
7 of 34 symbols inside -1689012799 [init(checkpoint: MLCheckpoint) throws](https://developer.apple.com/documentation/createml/mlhandposeclassifier/init\(checkpoint:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 34 symbols inside -1689012799 
Training a hand pose classifier synchronously
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
9 of 34 symbols inside -1689012799 [init(trainingData: MLHandPoseClassifier.DataSource, parameters: MLHandPoseClassifier.ModelParameters) throws](https://developer.apple.com/documentation/createml/mlhandposeclassifier/init\(trainingdata:parameters:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 34 symbols inside -1689012799 
Evaluating a hand pose classifier
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
11 of 34 symbols inside -1689012799 [func evaluation(on: MLHandPoseClassifier.DataSource) throws -> MLClassifierMetrics](https://developer.apple.com/documentation/createml/mlhandposeclassifier/evaluation\(on:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
12 of 34 symbols inside -1689012799 [var trainingMetrics: MLClassifierMetrics](https://developer.apple.com/documentation/createml/mlhandposeclassifier/trainingmetrics)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
13 of 34 symbols inside -1689012799 [var validationMetrics: MLClassifierMetrics](https://developer.apple.com/documentation/createml/mlhandposeclassifier/validationmetrics)
92 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Create ML ](https://developer.apple.com/documentation/createml)
  * [ MLHandPoseClassifier ](https://developer.apple.com/documentation/createml/mlhandposeclassifier)
  *     * MLHandPoseClassifier 


Structure
# MLHandPoseClassifier
A task that creates a hand pose classification model by training with images of people’s hands that you provide.
iOS 15.0+iPadOS 15.0+Mac Catalyst 15.0+macOS 12.0+visionOS 1.0+
```
struct MLHandPoseClassifier
```

## [Topics](https://developer.apple.com/documentation/createml/mlhandposeclassifier#topics)
### [Training a hand pose classifier asynchronously](https://developer.apple.com/documentation/createml/mlhandposeclassifier#Training-a-hand-pose-classifier-asynchronously)
[`static func train(trainingData: MLHandPoseClassifier.DataSource, parameters: MLHandPoseClassifier.ModelParameters, sessionParameters: MLTrainingSessionParameters) throws -> MLJob<MLHandPoseClassifier>`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/train\(trainingdata:parameters:sessionparameters:\))
Begins an asynchronous hand pose classifier’s training session.
[`static func makeTrainingSession(trainingData: MLHandPoseClassifier.DataSource, parameters: MLHandPoseClassifier.ModelParameters, sessionParameters: MLTrainingSessionParameters) throws -> MLTrainingSession<MLHandPoseClassifier>`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/maketrainingsession\(trainingdata:parameters:sessionparameters:\))
Creates an asynchronous hand pose classifier’s training session.
[`static func resume(MLTrainingSession<MLHandPoseClassifier>) throws -> MLJob<MLHandPoseClassifier>`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/resume\(_:\))
Begins or continues an asynchronous hand pose classifier’s training session.
[`static func restoreTrainingSession(sessionParameters: MLTrainingSessionParameters) throws -> MLTrainingSession<MLHandPoseClassifier>`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/restoretrainingsession\(sessionparameters:\))
Recreates an asynchronous hand pose classifier’s training session by restoring its saved state from the file system.
### [Creating a hand pose classifier from a checkpoint](https://developer.apple.com/documentation/createml/mlhandposeclassifier#Creating-a-hand-pose-classifier-from-a-checkpoint)
[`init(checkpoint: MLCheckpoint) throws`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/init\(checkpoint:\))
Creates a hand pose classifier from a training session checkpoint.
### [Training a hand pose classifier synchronously](https://developer.apple.com/documentation/createml/mlhandposeclassifier#Training-a-hand-pose-classifier-synchronously)
[`init(trainingData: MLHandPoseClassifier.DataSource, parameters: MLHandPoseClassifier.ModelParameters) throws`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/init\(trainingdata:parameters:\))
Creates a hand pose classifier by starting a synchronous training session.
### [Evaluating a hand pose classifier](https://developer.apple.com/documentation/createml/mlhandposeclassifier#Evaluating-a-hand-pose-classifier)
[`func evaluation(on: MLHandPoseClassifier.DataSource) throws -> MLClassifierMetrics`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/evaluation\(on:\))
Generates metrics that describe the hand pose classifier’s performance with a dataset of labeled images.
[`var trainingMetrics: MLClassifierMetrics`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/trainingmetrics)
Measurements of the hand pose classifier’s performance on the training dataset.
[`var validationMetrics: MLClassifierMetrics`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/validationmetrics)
Measurements of the hand pose classifier’s performance on the validation dataset.
### [Testing a hand pose classifier](https://developer.apple.com/documentation/createml/mlhandposeclassifier#Testing-a-hand-pose-classifier)
[`func prediction(from: URL) throws -> [(label: String, confidence: Double)]`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/prediction\(from:\))
Generates a hand pose prediction for an image.
[`func predictions(from: [URL]) throws -> [[(label: String, confidence: Double)]]`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/predictions\(from:\))
Generates an array of hand pose predictions for each image in a URL array.
### [Saving a hand pose classifier](https://developer.apple.com/documentation/createml/mlhandposeclassifier#Saving-a-hand-pose-classifier)
[`func write(to: URL, metadata: MLModelMetadata?) throws`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/write\(to:metadata:\))
Exports the hand pose classifier as a CoreML model file.
[`func write(toFile: String, metadata: MLModelMetadata?) throws`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/write\(tofile:metadata:\))
Exports the hand pose classifier as a Core ML model file.
### [Inspecting a hand pose classifier model](https://developer.apple.com/documentation/createml/mlhandposeclassifier#Inspecting-a-hand-pose-classifier-model)
[`var model: MLModel`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/model)
The underlying Core ML model of the hand pose classifier stored in memory.
[`let modelParameters: MLHandPoseClassifier.ModelParameters`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/modelparameters-swift.property)
The hand pose model’s configuration parameters.
### [Describing a hand pose classifier](https://developer.apple.com/documentation/createml/mlhandposeclassifier#Describing-a-hand-pose-classifier)
[`var description: String`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/description)
A text representation of the hand pose classifier.
[`var debugDescription: String`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/debugdescription)
A text representation of the hand pose classifier suitable for debugging.
[`var playgroundDescription: Any`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/playgrounddescription)
A description of the hand pose classifier that’s viewable in a playground.
### [Supporting types](https://developer.apple.com/documentation/createml/mlhandposeclassifier#Supporting-types)
[`enum DataSource`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/datasource)
A hand pose classifier dataset that contains annotated images or hand joint location data.
[`struct ModelParameters`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/modelparameters-swift.struct)
A set of parameters that affect the training process of a hand pose classifier task.
[`struct ImageAugmentationOptions`](https://developer.apple.com/documentation/createml/mlhandposeclassifier/imageaugmentationoptions)
Options a hand pose classification training session can use to generate additional training data from the images you provide.
### [Default Implementations](https://developer.apple.com/documentation/createml/mlhandposeclassifier#Default-Implementations)
[API Reference CustomDebugStringConvertible Implementations](https://developer.apple.com/documentation/createml/mlhandposeclassifier/customdebugstringconvertible-implementations)
[API Reference CustomPlaygroundDisplayConvertible Implementations](https://developer.apple.com/documentation/createml/mlhandposeclassifier/customplaygrounddisplayconvertible-implementations)
[API Reference CustomStringConvertible Implementations](https://developer.apple.com/documentation/createml/mlhandposeclassifier/customstringconvertible-implementations)
## [Relationships](https://developer.apple.com/documentation/createml/mlhandposeclassifier#relationships)
### [Conforms To](https://developer.apple.com/documentation/createml/mlhandposeclassifier#conforms-to)
  * [`Copyable`](https://developer.apple.com/documentation/Swift/Copyable)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomPlaygroundDisplayConvertible`](https://developer.apple.com/documentation/Swift/CustomPlaygroundDisplayConvertible)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)


## [See Also](https://developer.apple.com/documentation/createml/mlhandposeclassifier#see-also)
### [Image models](https://developer.apple.com/documentation/createml/mlhandposeclassifier#Image-models)
[Creating an Image Classifier Model](https://developer.apple.com/documentation/createml/creating-an-image-classifier-model)
Train a machine learning model to classify images, and add it to your Core ML app.
[`struct MLImageClassifier`](https://developer.apple.com/documentation/createml/mlimageclassifier)
A model you train to classify images.
[`struct MLObjectDetector`](https://developer.apple.com/documentation/createml/mlobjectdetector)
A model you train to classify one or more objects within an image.
Current page is MLHandPoseClassifier 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fcreateml%2Fmlhandposeclassifier).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
