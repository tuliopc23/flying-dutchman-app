Source: https://developer.apple.com/documentation/CreateML

[ Skip Navigation ](https://developer.apple.com/documentation/CreateML#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/CreateML#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/CreateML)
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
[ Open Menu ](https://developer.apple.com/documentation/CreateML)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/CreateML)
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
Framework
# Create ML
Create machine learning models for use in your app.
iOS 15.0+iPadOS 15.0+Mac Catalyst 15.0+macOS 10.14+tvOS 16.0+visionOS 1.0+
## [Overview](https://developer.apple.com/documentation/CreateML#Overview)
Use Create ML with familiar tools like Swift and macOS playgrounds to create and train custom machine learning models on your Mac. You can train models to perform tasks like recognizing images, extracting meaning from text, or finding relationships between numerical values.
![Diagram showing how you use images, text, and other structured data with Create ML to train a Core ML model.](https://docs-assets.developer.apple.com/published/eb03080ad7cc9d6f88eadc90b3bac920/create-ml-1%402x.png)
You train a model to recognize patterns by showing it representative samples. For example, you can train a model to recognize dogs by showing it lots of images of different dogs. After you’ve trained the model, you test it out on data it hasn’t seen before, and evaluate how well it performed the task. When the model is performing well enough, you’re ready to integrate it into your app using [Core ML](https://developer.apple.com/documentation/CoreML).
![Diagram showing the Create ML workflow: Gather data, train the model, and evaluate the trained model.](https://docs-assets.developer.apple.com/published/8140ce0ea19e9ada712c516d10436651/create-ml-2%402x.png)
Create ML leverages the machine learning infrastructure built in to Apple products like Photos and Siri. This means your image classification and natural language models are smaller and take much less time to train.
## [Topics](https://developer.apple.com/documentation/CreateML#topics)
### [Image models](https://developer.apple.com/documentation/CreateML#Image-models)
[Creating an Image Classifier Model](https://developer.apple.com/documentation/createml/creating-an-image-classifier-model)
Train a machine learning model to classify images, and add it to your Core ML app.
[`struct MLImageClassifier`](https://developer.apple.com/documentation/createml/mlimageclassifier)
A model you train to classify images.
[`struct MLObjectDetector`](https://developer.apple.com/documentation/createml/mlobjectdetector)
A model you train to classify one or more objects within an image.
[`struct MLHandPoseClassifier`](https://developer.apple.com/documentation/createml/mlhandposeclassifier)
A task that creates a hand pose classification model by training with images of people’s hands that you provide.
### [Video models](https://developer.apple.com/documentation/CreateML#Video-models)
[Creating an Action Classifier Model](https://developer.apple.com/documentation/createml/creating-an-action-classifier-model)
Train a machine learning model to recognize a person’s body movements.
[Detecting human actions in a live video feed](https://developer.apple.com/documentation/CreateML/detecting-human-actions-in-a-live-video-feed)
Identify body movements by sending a person’s pose data from a series of video frames to an action-classification model.
[`struct MLActionClassifier`](https://developer.apple.com/documentation/createml/mlactionclassifier)
A model you train with videos to classify a person’s body movements.
[`struct MLHandActionClassifier`](https://developer.apple.com/documentation/createml/mlhandactionclassifier)
A task that creates a hand action classification model by training with videos of people’s hand movements that you provide.
[`struct MLStyleTransfer`](https://developer.apple.com/documentation/createml/mlstyletransfer)
A model you train to apply an image’s style to other images or videos.
### [Text models](https://developer.apple.com/documentation/CreateML#Text-models)
[Creating a text classifier model](https://developer.apple.com/documentation/createml/creating-a-text-classifier-model)
Train a machine learning model to classify natural language text.
[Creating a word tagger model](https://developer.apple.com/documentation/createml/creating-a-word-tagger-model)
Train a machine learning model to tag individual words in natural language text.
[`struct MLTextClassifier`](https://developer.apple.com/documentation/createml/mltextclassifier)
A model you train to classify natural language text.
[`struct MLWordTagger`](https://developer.apple.com/documentation/createml/mlwordtagger)
A word-tagging model you train to classify natural language text at the word level.
[`struct MLGazetteer`](https://developer.apple.com/documentation/createml/mlgazetteer)
A collection of terms and their labels, which augments a tagger that analyzes natural language text.
[`struct MLWordEmbedding`](https://developer.apple.com/documentation/createml/mlwordembedding)
A map of strings in a vector space that enable your app to find similar strings by looking at a string’s neighbors.
### [Sound models](https://developer.apple.com/documentation/CreateML#Sound-models)
[`struct MLSoundClassifier`](https://developer.apple.com/documentation/createml/mlsoundclassifier)
A machine learning model you train with audio files to recognize and identify sounds on a device.
### [Motion models](https://developer.apple.com/documentation/CreateML#Motion-models)
[`struct MLActivityClassifier`](https://developer.apple.com/documentation/createml/mlactivityclassifier)
A model you train to classify motion sensor data.
### [Tabular models](https://developer.apple.com/documentation/CreateML#Tabular-models)
[Creating a model from tabular data](https://developer.apple.com/documentation/CreateML/creating-a-model-from-tabular-data)
Train a machine learning model by using Core ML to import and manage tabular data.
[`enum MLClassifier`](https://developer.apple.com/documentation/createml/mlclassifier)
A model you train to classify data into discrete categories.
[`enum MLRegressor`](https://developer.apple.com/documentation/createml/mlregressor)
A model you train to estimate continuous values.
[`struct MLRecommender`](https://developer.apple.com/documentation/createml/mlrecommender)
A model you train to make recommendations based on item similarity, grouping, and, optionally, item ratings.
### [Tabular data](https://developer.apple.com/documentation/CreateML#Tabular-data)
[`struct MLDataTable`](https://developer.apple.com/documentation/createml/mldatatable)
A table of data for training or evaluating a machine learning model.
[`enum MLDataValue`](https://developer.apple.com/documentation/createml/mldatavalue)
The value of a cell in a data table.
[API Reference Data visualizations](https://developer.apple.com/documentation/createml/data-visualizations)
Render images of data tables and columns in a playground.
### [Model accuracy](https://developer.apple.com/documentation/CreateML#Model-accuracy)
[Improving Your Model’s Accuracy](https://developer.apple.com/documentation/createml/improving-your-model-s-accuracy)
Use metrics to tune the performance of your machine learning model.
[`struct MLClassifierMetrics`](https://developer.apple.com/documentation/createml/mlclassifiermetrics)
Metrics you use to evaluate a classifier’s performance.
[`struct MLRegressorMetrics`](https://developer.apple.com/documentation/createml/mlregressormetrics)
Metrics you use to evaluate a regressor’s performance.
[`struct MLWordTaggerMetrics`](https://developer.apple.com/documentation/createml/mlwordtaggermetrics)
Metrics you use to evaluate a word tagger’s performance.
[`struct MLRecommenderMetrics`](https://developer.apple.com/documentation/createml/mlrecommendermetrics)
Metrics you use to evaluate a recommender’s performance.
[`struct MLObjectDetectorMetrics`](https://developer.apple.com/documentation/createml/mlobjectdetectormetrics)
Metrics you use to evaluate an object detector’s performance.
### [Model training Control](https://developer.apple.com/documentation/CreateML#Model-training-Control)
[`class MLJob`](https://developer.apple.com/documentation/createml/mljob)
The representation of a model’s asynchronous training session you use to monitor the session’s progress or terminate its execution.
[`class MLTrainingSession`](https://developer.apple.com/documentation/createml/mltrainingsession)
The current state of a model’s asynchronous training session.
[`struct MLTrainingSessionParameters`](https://developer.apple.com/documentation/createml/mltrainingsessionparameters)
The configuration settings for a training session.
[`struct MLCheckpoint`](https://developer.apple.com/documentation/createml/mlcheckpoint)
The state of a model’s asynchronous training session at a specific point in time during the feature extraction or training phase.
### [Supporting types](https://developer.apple.com/documentation/CreateML#Supporting-types)
[`enum MLCreateError`](https://developer.apple.com/documentation/createml/mlcreateerror)
The errors Create ML throws while performing various operations, such as training models, making predictions, writing models to a file system, and so on.
[`struct MLModelMetadata`](https://developer.apple.com/documentation/createml/mlmodelmetadata)
Information about a model that’s stored in a Core ML model file.
[`enum MLSplitStrategy`](https://developer.apple.com/documentation/createml/mlsplitstrategy)
Data partitioning approaches, typically for creating a validation dataset from a training dataset.
### [Articles](https://developer.apple.com/documentation/CreateML#Articles)
[API Reference Data visualizations](https://developer.apple.com/documentation/createml/create-ml-utilties)
Render images of data tables and columns in a playground.
[Detecting human actions in a live video feed](https://developer.apple.com/documentation/createml/detecting-human-actions-in-a-live-video-feed)
Identify body movements by sending a person’s pose data from a series of video frames to an action-classification model.
[Gathering Training Videos for an Action Classifier](https://developer.apple.com/documentation/createml/recording-or-choosing-training-videos)
Collect quality example videos that effectively train action classifiers.
### [Functions](https://developer.apple.com/documentation/CreateML#Functions)
[`func show(_:)`](https://developer.apple.com/documentation/createml/show\(_:\))
Generates a streaming visualization of the untyped column.
Deprecated
[`func show(_:_:)`](https://developer.apple.com/documentation/createml/show\(_:_:\))
Generates a streaming plot visualization of the two untyped columns.
Deprecated
### [Enumerations](https://developer.apple.com/documentation/CreateML#Enumerations)
[`enum MLBoundingBoxAnchor`](https://developer.apple.com/documentation/createml/mlboundingboxanchor)
A location within a bounding box that an annotation’s coordinates use as their reference point.
[`enum MLBoundingBoxCoordinatesOrigin`](https://developer.apple.com/documentation/createml/mlboundingboxcoordinatesorigin)
The location within an image that an annotation’s coordinates use as their origin.
[`enum MLBoundingBoxUnits`](https://developer.apple.com/documentation/createml/mlboundingboxunits)
The units a bounding box annotation uses to define its position and size.
Current page is Create ML 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FCreateML).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
