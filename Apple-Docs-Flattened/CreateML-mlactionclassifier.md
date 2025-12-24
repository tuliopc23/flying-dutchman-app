Source: https://developer.apple.com/documentation/createml/mlactionclassifier

[ Skip Navigation ](https://developer.apple.com/documentation/createml/mlactionclassifier#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/createml/mlactionclassifier#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/createml/mlactionclassifier)
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
[ Open Menu ](https://developer.apple.com/documentation/createml/mlactionclassifier)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/createml/mlactionclassifier)
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
1 of 35 symbols inside 582011515 
Training an action classifier asynchronously
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 35 symbols inside 582011515 [static func train(trainingData: MLActionClassifier.DataSource, parameters: MLActionClassifier.ModelParameters, sessionParameters: MLTrainingSessionParameters) throws -> MLJob<MLActionClassifier>](https://developer.apple.com/documentation/createml/mlactionclassifier/train\(trainingdata:parameters:sessionparameters:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 35 symbols inside 582011515 [static func makeTrainingSession(trainingData: MLActionClassifier.DataSource, parameters: MLActionClassifier.ModelParameters, sessionParameters: MLTrainingSessionParameters) throws -> MLTrainingSession<MLActionClassifier>](https://developer.apple.com/documentation/createml/mlactionclassifier/maketrainingsession\(trainingdata:parameters:sessionparameters:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 35 symbols inside 582011515 [static func resume(MLTrainingSession<MLActionClassifier>) throws -> MLJob<MLActionClassifier>](https://developer.apple.com/documentation/createml/mlactionclassifier/resume\(_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
5 of 35 symbols inside 582011515 [static func restoreTrainingSession(sessionParameters: MLTrainingSessionParameters) throws -> MLTrainingSession<MLActionClassifier>](https://developer.apple.com/documentation/createml/mlactionclassifier/restoretrainingsession\(sessionparameters:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 35 symbols inside 582011515 
Creating an action classifier from a checkpoint
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
7 of 35 symbols inside 582011515 [init(checkpoint: MLCheckpoint) throws](https://developer.apple.com/documentation/createml/mlactionclassifier/init\(checkpoint:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 35 symbols inside 582011515 
Training an action classifier synchronously
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
9 of 35 symbols inside 582011515 [init(trainingData: MLActionClassifier.DataSource, parameters: MLActionClassifier.ModelParameters) throws](https://developer.apple.com/documentation/createml/mlactionclassifier/init\(trainingdata:parameters:\))
93 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Create ML ](https://developer.apple.com/documentation/createml)
  * [ MLActionClassifier ](https://developer.apple.com/documentation/createml/mlactionclassifier)
  *     * MLActionClassifier 


Structure
# MLActionClassifier
A model you train with videos to classify a person’s body movements.
macOS 11.0+
```
struct MLActionClassifier
```

## [Topics](https://developer.apple.com/documentation/createml/mlactionclassifier#topics)
### [Training an action classifier asynchronously](https://developer.apple.com/documentation/createml/mlactionclassifier#Training-an-action-classifier-asynchronously)
[`static func train(trainingData: MLActionClassifier.DataSource, parameters: MLActionClassifier.ModelParameters, sessionParameters: MLTrainingSessionParameters) throws -> MLJob<MLActionClassifier>`](https://developer.apple.com/documentation/createml/mlactionclassifier/train\(trainingdata:parameters:sessionparameters:\))
Begins an asynchronous action classifier training session.
[`static func makeTrainingSession(trainingData: MLActionClassifier.DataSource, parameters: MLActionClassifier.ModelParameters, sessionParameters: MLTrainingSessionParameters) throws -> MLTrainingSession<MLActionClassifier>`](https://developer.apple.com/documentation/createml/mlactionclassifier/maketrainingsession\(trainingdata:parameters:sessionparameters:\))
Creates an asynchronous training session for an action classifier.
[`static func resume(MLTrainingSession<MLActionClassifier>) throws -> MLJob<MLActionClassifier>`](https://developer.apple.com/documentation/createml/mlactionclassifier/resume\(_:\))
Begins or continues an asynchronous action classifier training session.
[`static func restoreTrainingSession(sessionParameters: MLTrainingSessionParameters) throws -> MLTrainingSession<MLActionClassifier>`](https://developer.apple.com/documentation/createml/mlactionclassifier/restoretrainingsession\(sessionparameters:\))
Creates an asynchronous training session for an action classifier by restoring an existing training session’s state from its parameters.
### [Creating an action classifier from a checkpoint](https://developer.apple.com/documentation/createml/mlactionclassifier#Creating-an-action-classifier-from-a-checkpoint)
[`init(checkpoint: MLCheckpoint) throws`](https://developer.apple.com/documentation/createml/mlactionclassifier/init\(checkpoint:\))
Creates an action classifier from a training session checkpoint.
### [Training an action classifier synchronously](https://developer.apple.com/documentation/createml/mlactionclassifier#Training-an-action-classifier-synchronously)
[`init(trainingData: MLActionClassifier.DataSource, parameters: MLActionClassifier.ModelParameters) throws`](https://developer.apple.com/documentation/createml/mlactionclassifier/init\(trainingdata:parameters:\))
Creates an action classifier with a training dataset represented by a data source.
### [Evaluating an action classifier](https://developer.apple.com/documentation/createml/mlactionclassifier#Evaluating-an-action-classifier)
[`func evaluation(on: MLActionClassifier.DataSource) throws -> MLClassifierMetrics`](https://developer.apple.com/documentation/createml/mlactionclassifier/evaluation\(on:\))
Generates metrics describing the action classifier’s performance on labeled videos represented by a data source.
[`var trainingMetrics: MLClassifierMetrics`](https://developer.apple.com/documentation/createml/mlactionclassifier/trainingmetrics)
Measurements of the action classifier’s performance on the training dataset.
[`var validationMetrics: MLClassifierMetrics`](https://developer.apple.com/documentation/createml/mlactionclassifier/validationmetrics)
Measurements of the action classifier’s performance on the validation dataset.
### [Testing an action classifier](https://developer.apple.com/documentation/createml/mlactionclassifier#Testing-an-action-classifier)
[`func prediction(from: URL) throws -> [MLActionClassifier.Prediction]`](https://developer.apple.com/documentation/createml/mlactionclassifier/prediction\(from:\))
Generates a prediction for each action the classifier recognizes in the video.
[`func predictions(from: [URL]) throws -> [[MLActionClassifier.Prediction]]`](https://developer.apple.com/documentation/createml/mlactionclassifier/predictions\(from:\))
Generates a sequence of predictions for each video input.
[`struct Prediction`](https://developer.apple.com/documentation/createml/mlactionclassifier/prediction)
A collection of predictions, each paired with its confidence, for a range of video frames.
### [Saving an action classifier](https://developer.apple.com/documentation/createml/mlactionclassifier#Saving-an-action-classifier)
[`func write(to: URL, metadata: MLModelMetadata?) throws`](https://developer.apple.com/documentation/createml/mlactionclassifier/write\(to:metadata:\))
Exports the action classifier as a Core ML model file to a location in the file system.
[`func write(toFile: String, metadata: MLModelMetadata?) throws`](https://developer.apple.com/documentation/createml/mlactionclassifier/write\(tofile:metadata:\))
Exports the action classifier as a Core ML model file to the file path.
### [Inspecting an action classifier model](https://developer.apple.com/documentation/createml/mlactionclassifier#Inspecting-an-action-classifier-model)
[`var model: MLModel`](https://developer.apple.com/documentation/createml/mlactionclassifier/model)
The underlying Core ML model of the action classifier stored in memory.
[`let modelParameters: MLActionClassifier.ModelParameters`](https://developer.apple.com/documentation/createml/mlactionclassifier/modelparameters-swift.property)
The model configuration parameters the action classifier used during its training session.
### [Describing an action classifier](https://developer.apple.com/documentation/createml/mlactionclassifier#Describing-an-action-classifier)
[`var description: String`](https://developer.apple.com/documentation/createml/mlactionclassifier/description)
A text representation of the action classifier.
[`var debugDescription: String`](https://developer.apple.com/documentation/createml/mlactionclassifier/debugdescription)
A text representation of the action classifier that’s suitable for output during debugging.
[`var playgroundDescription: Any`](https://developer.apple.com/documentation/createml/mlactionclassifier/playgrounddescription)
A description of the action classifier shown in a playground.
### [Supporting types](https://developer.apple.com/documentation/createml/mlactionclassifier#Supporting-types)
[`enum DataSource`](https://developer.apple.com/documentation/createml/mlactionclassifier/datasource)
A data source for an action classifier.
[`struct ModelParameters`](https://developer.apple.com/documentation/createml/mlactionclassifier/modelparameters-swift.struct)
Parameters that affect the training process of an action classifier.
[`struct VideoAugmentationOptions`](https://developer.apple.com/documentation/createml/mlactionclassifier/videoaugmentationoptions)
The video augmentations for an action classifier training session.
### [Default Implementations](https://developer.apple.com/documentation/createml/mlactionclassifier#Default-Implementations)
[API Reference CustomDebugStringConvertible Implementations](https://developer.apple.com/documentation/createml/mlactionclassifier/customdebugstringconvertible-implementations)
[API Reference CustomPlaygroundDisplayConvertible Implementations](https://developer.apple.com/documentation/createml/mlactionclassifier/customplaygrounddisplayconvertible-implementations)
[API Reference CustomStringConvertible Implementations](https://developer.apple.com/documentation/createml/mlactionclassifier/customstringconvertible-implementations)
## [Relationships](https://developer.apple.com/documentation/createml/mlactionclassifier#relationships)
### [Conforms To](https://developer.apple.com/documentation/createml/mlactionclassifier#conforms-to)
  * [`Copyable`](https://developer.apple.com/documentation/Swift/Copyable)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomPlaygroundDisplayConvertible`](https://developer.apple.com/documentation/Swift/CustomPlaygroundDisplayConvertible)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)


## [See Also](https://developer.apple.com/documentation/createml/mlactionclassifier#see-also)
### [Video models](https://developer.apple.com/documentation/createml/mlactionclassifier#Video-models)
[Creating an Action Classifier Model](https://developer.apple.com/documentation/createml/creating-an-action-classifier-model)
Train a machine learning model to recognize a person’s body movements.
[Detecting human actions in a live video feed](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed)
Identify body movements by sending a person’s pose data from a series of video frames to an action-classification model.
[`struct MLHandActionClassifier`](https://developer.apple.com/documentation/createml/mlhandactionclassifier)
A task that creates a hand action classification model by training with videos of people’s hand movements that you provide.
[`struct MLStyleTransfer`](https://developer.apple.com/documentation/createml/mlstyletransfer)
A model you train to apply an image’s style to other images or videos.
Current page is MLActionClassifier 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fcreateml%2Fmlactionclassifier).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
