Source: https://developer.apple.com/documentation/createml/mlimageclassifier

[ Skip Navigation ](https://developer.apple.com/documentation/createml/mlimageclassifier#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/createml/mlimageclassifier#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/createml/mlimageclassifier)
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
[ Open Menu ](https://developer.apple.com/documentation/createml/mlimageclassifier)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/createml/mlimageclassifier)
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
1 of 36 symbols inside -1254931034 
Training an image classifier asynchronously
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 36 symbols inside -1254931034 [static func makeTrainingSession(trainingData: MLImageClassifier.DataSource, parameters: MLImageClassifier.ModelParameters, sessionParameters: MLTrainingSessionParameters) throws -> MLTrainingSession<MLImageClassifier>](https://developer.apple.com/documentation/createml/mlimageclassifier/maketrainingsession\(trainingdata:parameters:sessionparameters:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 36 symbols inside -1254931034 [static func train(trainingData: MLImageClassifier.DataSource, parameters: MLImageClassifier.ModelParameters, sessionParameters: MLTrainingSessionParameters) throws -> MLJob<MLImageClassifier>](https://developer.apple.com/documentation/createml/mlimageclassifier/train\(trainingdata:parameters:sessionparameters:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 36 symbols inside -1254931034 [static func resume(MLTrainingSession<MLImageClassifier>) throws -> MLJob<MLImageClassifier>](https://developer.apple.com/documentation/createml/mlimageclassifier/resume\(_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
5 of 36 symbols inside -1254931034 [static func restoreTrainingSession(sessionParameters: MLTrainingSessionParameters) throws -> MLTrainingSession<MLImageClassifier>](https://developer.apple.com/documentation/createml/mlimageclassifier/restoretrainingsession\(sessionparameters:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 36 symbols inside -1254931034 
Creating an image classifier from a checkpoint
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
7 of 36 symbols inside -1254931034 [init(checkpoint: MLCheckpoint) throws](https://developer.apple.com/documentation/createml/mlimageclassifier/init\(checkpoint:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 36 symbols inside -1254931034 
Training an image classifier synchronously
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
9 of 36 symbols inside -1254931034 [init(trainingData:parameters:)](https://developer.apple.com/documentation/createml/mlimageclassifier/init\(trainingdata:parameters:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 36 symbols inside -1254931034 
Evaluating an image classifier
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
11 of 36 symbols inside -1254931034 [func evaluation(on:)](https://developer.apple.com/documentation/createml/mlimageclassifier/evaluation\(on:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
12 of 36 symbols inside -1254931034 [var trainingMetrics: MLClassifierMetrics](https://developer.apple.com/documentation/createml/mlimageclassifier/trainingmetrics)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
13 of 36 symbols inside -1254931034 [var validationMetrics: MLClassifierMetrics](https://developer.apple.com/documentation/createml/mlimageclassifier/validationmetrics)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
14 of 36 symbols inside -1254931034 
Testing an image classifier
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
15 of 36 symbols inside -1254931034 [func prediction(from:)](https://developer.apple.com/documentation/createml/mlimageclassifier/prediction\(from:\))
94 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Create ML ](https://developer.apple.com/documentation/createml)
  * [ MLImageClassifier ](https://developer.apple.com/documentation/createml/mlimageclassifier)
  *     * MLImageClassifier 


Structure
# MLImageClassifier
A model you train to classify images.
iOS 15.0+iPadOS 15.0+Mac Catalyst 15.0+macOS 10.14+visionOS 1.0+
```
struct MLImageClassifier
```

## [ Mentioned in ](https://developer.apple.com/documentation/createml/mlimageclassifier#mentions)
[](https://developer.apple.com/documentation/createml/creating-an-image-classifier-model)
[](https://developer.apple.com/documentation/createml/improving-your-model-s-accuracy)
## [Overview](https://developer.apple.com/documentation/createml/mlimageclassifier#overview)
Use an image classifier to train a machine learning model that you can include in your app to categorize images.
When you create the model, you give it a training dataset made up of labeled images, along with parameters that control the training process. For example, you can provide the model with images of elephants and giraffes, in two folders labeled `Elephant` and `Giraffe`, to train it to recognize these animals.
After training completes, you evaluate the trained model by showing it a testing dataset containing labeled images that the model hasn’t seen before. The metrics that come from this evaluation tell you whether the model performs well enough. For example, you can see how often the elephant and giraffe classifier mistakes a giraffe for an elephant. When the model makes too many mistakes, you can add more or better training data, or change the parameters, and try again.
When your model does perform well enough, you save it as a Core ML model file with the `mlmodel` extension. You can then import this model file into an app—like the [Classifying Images with Vision and Core ML](https://developer.apple.com/documentation/CoreML/classifying-images-with-vision-and-core-ml) sample code project—that uses a Core ML model file to classify images.
## [Topics](https://developer.apple.com/documentation/createml/mlimageclassifier#topics)
### [Training an image classifier asynchronously](https://developer.apple.com/documentation/createml/mlimageclassifier#Training-an-image-classifier-asynchronously)
[`static func makeTrainingSession(trainingData: MLImageClassifier.DataSource, parameters: MLImageClassifier.ModelParameters, sessionParameters: MLTrainingSessionParameters) throws -> MLTrainingSession<MLImageClassifier>`](https://developer.apple.com/documentation/createml/mlimageclassifier/maketrainingsession\(trainingdata:parameters:sessionparameters:\))
Creates or restores a training session.
[`static func train(trainingData: MLImageClassifier.DataSource, parameters: MLImageClassifier.ModelParameters, sessionParameters: MLTrainingSessionParameters) throws -> MLJob<MLImageClassifier>`](https://developer.apple.com/documentation/createml/mlimageclassifier/train\(trainingdata:parameters:sessionparameters:\))
Begins an asynchronous image classifier training session with a training dataset represented by a data source.
[`static func resume(MLTrainingSession<MLImageClassifier>) throws -> MLJob<MLImageClassifier>`](https://developer.apple.com/documentation/createml/mlimageclassifier/resume\(_:\))
Begins or continues an asynchronous image classifier training session.
[`static func restoreTrainingSession(sessionParameters: MLTrainingSessionParameters) throws -> MLTrainingSession<MLImageClassifier>`](https://developer.apple.com/documentation/createml/mlimageclassifier/restoretrainingsession\(sessionparameters:\))
Creates an asynchronous training session for an image classifier by restoring an existing training session’s state from its parameters.
### [Creating an image classifier from a checkpoint](https://developer.apple.com/documentation/createml/mlimageclassifier#Creating-an-image-classifier-from-a-checkpoint)
[`init(checkpoint: MLCheckpoint) throws`](https://developer.apple.com/documentation/createml/mlimageclassifier/init\(checkpoint:\))
Creates an image classifier from a training session checkpoint.
### [Training an image classifier synchronously](https://developer.apple.com/documentation/createml/mlimageclassifier#Training-an-image-classifier-synchronously)
[`init(trainingData:parameters:)`](https://developer.apple.com/documentation/createml/mlimageclassifier/init\(trainingdata:parameters:\))
Creates an image classifier with a training dataset represented by a data source.
### [Evaluating an image classifier](https://developer.apple.com/documentation/createml/mlimageclassifier#Evaluating-an-image-classifier)
[`func evaluation(on:)`](https://developer.apple.com/documentation/createml/mlimageclassifier/evaluation\(on:\))
Generates metrics describing the image classifier’s performance on labeled images represented by a data source.
[`var trainingMetrics: MLClassifierMetrics`](https://developer.apple.com/documentation/createml/mlimageclassifier/trainingmetrics)
Measurements of the classifier’s performance on the training data set.
[`var validationMetrics: MLClassifierMetrics`](https://developer.apple.com/documentation/createml/mlimageclassifier/validationmetrics)
Measurements of the image classifier’s performance on the validation dataset.
### [Testing an image classifier](https://developer.apple.com/documentation/createml/mlimageclassifier#Testing-an-image-classifier)
[`func prediction(from:)`](https://developer.apple.com/documentation/createml/mlimageclassifier/prediction\(from:\))
Generates a prediction for an image.
[`func predictions(from: [URL]) throws -> [String]`](https://developer.apple.com/documentation/createml/mlimageclassifier/predictions\(from:\))
Generates predictions for an array of images.
### [Saving an image classifier](https://developer.apple.com/documentation/createml/mlimageclassifier#Saving-an-image-classifier)
[`func write(to: URL, metadata: MLModelMetadata?) throws`](https://developer.apple.com/documentation/createml/mlimageclassifier/write\(to:metadata:\))
Exports the image classifier as a Core ML model file to a location in the file system.
[`func write(toFile: String, metadata: MLModelMetadata?) throws`](https://developer.apple.com/documentation/createml/mlimageclassifier/write\(tofile:metadata:\))
Exports the image classifier as a Core ML model file to the file path.
### [Inspecting an image classifier model](https://developer.apple.com/documentation/createml/mlimageclassifier#Inspecting-an-image-classifier-model)
[`var model: MLModel`](https://developer.apple.com/documentation/createml/mlimageclassifier/model)
The underlying Core ML model of the image classifier stored in memory.
[`let modelParameters: MLImageClassifier.ModelParameters`](https://developer.apple.com/documentation/createml/mlimageclassifier/modelparameters-swift.property)
The model configuration parameters the image classifier used during its training session.
### [Describing an image classifier](https://developer.apple.com/documentation/createml/mlimageclassifier#Describing-an-image-classifier)
[`var description: String`](https://developer.apple.com/documentation/createml/mlimageclassifier/description)
A text representation of the image classifier.
[`var debugDescription: String`](https://developer.apple.com/documentation/createml/mlimageclassifier/debugdescription)
A text representation of the image classifier that’s suitable for output during debugging.
[`var playgroundDescription: Any`](https://developer.apple.com/documentation/createml/mlimageclassifier/playgrounddescription)
A description of the image classifier shown in a playground.
### [Supporting types](https://developer.apple.com/documentation/createml/mlimageclassifier#Supporting-types)
[`enum DataSource`](https://developer.apple.com/documentation/createml/mlimageclassifier/datasource)
A data source for an image classifier.
[`struct ModelParameters`](https://developer.apple.com/documentation/createml/mlimageclassifier/modelparameters-swift.struct)
Parameters that affect the process of training an image classifier model.
[`enum FeatureExtractorType`](https://developer.apple.com/documentation/createml/mlimageclassifier/featureextractortype)
The underlying base model that extracts image features for image classifier training session.
[`struct CustomFeatureExtractor`](https://developer.apple.com/documentation/createml/mlimageclassifier/customfeatureextractor)
A custom feature extractor a training session uses to train an image classifier.
[`struct ImageAugmentationOptions`](https://developer.apple.com/documentation/createml/mlimageclassifier/imageaugmentationoptions)
The variations that the training process can use to generate more training data from the training data you provide.
### [Default Implementations](https://developer.apple.com/documentation/createml/mlimageclassifier#Default-Implementations)
[API Reference CustomDebugStringConvertible Implementations](https://developer.apple.com/documentation/createml/mlimageclassifier/customdebugstringconvertible-implementations)
[API Reference CustomPlaygroundDisplayConvertible Implementations](https://developer.apple.com/documentation/createml/mlimageclassifier/customplaygrounddisplayconvertible-implementations)
[API Reference CustomStringConvertible Implementations](https://developer.apple.com/documentation/createml/mlimageclassifier/customstringconvertible-implementations)
## [Relationships](https://developer.apple.com/documentation/createml/mlimageclassifier#relationships)
### [Conforms To](https://developer.apple.com/documentation/createml/mlimageclassifier#conforms-to)
  * [`Copyable`](https://developer.apple.com/documentation/Swift/Copyable)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomPlaygroundDisplayConvertible`](https://developer.apple.com/documentation/Swift/CustomPlaygroundDisplayConvertible)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)


## [See Also](https://developer.apple.com/documentation/createml/mlimageclassifier#see-also)
### [Image models](https://developer.apple.com/documentation/createml/mlimageclassifier#Image-models)
[Creating an Image Classifier Model](https://developer.apple.com/documentation/createml/creating-an-image-classifier-model)
Train a machine learning model to classify images, and add it to your Core ML app.
[`struct MLObjectDetector`](https://developer.apple.com/documentation/createml/mlobjectdetector)
A model you train to classify one or more objects within an image.
[`struct MLHandPoseClassifier`](https://developer.apple.com/documentation/createml/mlhandposeclassifier)
A task that creates a hand pose classification model by training with images of people’s hands that you provide.
Current page is MLImageClassifier 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fcreateml%2Fmlimageclassifier).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
