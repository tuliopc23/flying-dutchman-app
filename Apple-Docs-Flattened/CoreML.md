Source: https://developer.apple.com/documentation/CoreML

[ Skip Navigation ](https://developer.apple.com/documentation/CoreML#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/CoreML#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/CoreML)
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
[ Open Menu ](https://developer.apple.com/documentation/CoreML)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/CoreML)


[](https://developer.apple.com/documentation/CoreML)
## [ Core ML  ](https://developer.apple.com/documentation/coreml)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 54 symbols inside <root>
Core ML models
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 54 symbols inside <root>
Core ML models
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 54 symbols inside <root> [Getting a Core ML Model](https://developer.apple.com/documentation/coreml/getting-a-core-ml-model)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 54 symbols inside <root> [Updating a Model File to a Model Package](https://developer.apple.com/documentation/coreml/updating-a-model-file-to-a-model-package)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 54 symbols inside <root> [Integrating a Core ML Model into Your App](https://developer.apple.com/documentation/coreml/integrating-a-core-ml-model-into-your-app)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
5 of 54 symbols inside <root> containing 32 symbols[MLModel](https://developer.apple.com/documentation/coreml/mlmodel)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
6 of 54 symbols inside <root> containing 7 symbols[Model Customization](https://developer.apple.com/documentation/coreml/model-customization)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
7 of 54 symbols inside <root> containing 4 symbols[Model Personalization](https://developer.apple.com/documentation/coreml/model-personalization)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 54 symbols inside <root>
Model inputs and outputs
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 54 symbols inside <root> [Making Predictions with a Sequence of Inputs](https://developer.apple.com/documentation/coreml/making-predictions-with-a-sequence-of-inputs)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
10 of 54 symbols inside <root> containing 47 symbols[MLFeatureValue](https://developer.apple.com/documentation/coreml/mlfeaturevalue)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
11 of 54 symbols inside <root> containing 18 symbols[MLSendableFeatureValue](https://developer.apple.com/documentation/coreml/mlsendablefeaturevalue)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
12 of 54 symbols inside <root> containing 3 symbols[MLFeatureProvider](https://developer.apple.com/documentation/coreml/mlfeatureprovider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
13 of 54 symbols inside <root> containing 5 symbols[MLDictionaryFeatureProvider](https://developer.apple.com/documentation/coreml/mldictionaryfeatureprovider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
14 of 54 symbols inside <root> containing 3 symbols[MLBatchProvider](https://developer.apple.com/documentation/coreml/mlbatchprovider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
15 of 54 symbols inside <root> containing 5 symbols[MLArrayBatchProvider](https://developer.apple.com/documentation/coreml/mlarraybatchprovider)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
16 of 54 symbols inside <root> containing 9 symbols[MLModelAsset](https://developer.apple.com/documentation/coreml/mlmodelasset)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
17 of 54 symbols inside <root>
App integration
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
18 of 54 symbols inside <root> [Downloading and Compiling a Model on the User’s Device](https://developer.apple.com/documentation/coreml/downloading-and-compiling-a-model-on-the-user-s-device)
54 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Framework
# Core ML
Integrate machine learning models into your app.
iOS 11.0+iPadOS 11.0+Mac Catalyst 13.0+macOS 10.13+tvOS 11.0+visionOS 1.0+watchOS 4.0+
## [Overview](https://developer.apple.com/documentation/CoreML#overview)
Use [Core ML](https://developer.apple.com/documentation/coreml) to integrate machine learning models into your app. [Core ML](https://developer.apple.com/documentation/coreml) provides a unified representation for all models. Your app uses [Core ML](https://developer.apple.com/documentation/coreml) APIs and user data to make predictions, and to train or fine-tune models, all on a person’s device.
![Flow diagram going from left to right. Starting on the left is a Core ML model file icon. Next, in the center is the Core ML framework icon, and on the right is a generic app icon, labeled “your app”.](https://docs-assets.developer.apple.com/published/ae17ffa70ecbce075dc4b57539ec6dde/media-3901331%402x.png)
A model is the result of applying a machine learning algorithm to a set of training data. You use a model to make predictions based on new input data. Models can accomplish a wide variety of tasks that would be difficult or impractical to write in code. For example, you can train a model to categorize photos, or detect specific objects within a photo directly from its pixels.
You build and train a model with the [Create ML app](https://developer.apple.com/machine-learning/create-ml/) bundled with Xcode. Models trained using [Create ML](https://developer.apple.com/documentation/CreateML) are in the [Core ML](https://developer.apple.com/documentation/coreml) model format and are ready to use in your app. Alternatively, you can use a wide variety of other machine learning libraries and then use [Core ML Tools](https://coremltools.readme.io) to convert the model into the [Core ML](https://developer.apple.com/documentation/coreml) format. Once a model is on a person’s device, you can use [Core ML](https://developer.apple.com/documentation/coreml) to retrain or fine-tune it on-device, with that person’s data.
[Core ML](https://developer.apple.com/documentation/coreml) optimizes on-device performance by leveraging the CPU, GPU, and Neural Engine while minimizing its memory footprint and power consumption. Running a model strictly on a person’s device removes any need for a network connection, which helps keep a person’s data private and your app responsive.
The framework is the foundation for domain-specific frameworks and functionality. It supports [Vision](https://developer.apple.com/documentation/Vision) for analyzing images, [Natural Language](https://developer.apple.com/documentation/NaturalLanguage) for processing text, [Speech](https://developer.apple.com/documentation/Speech) for converting audio to text, and [Sound Analysis](https://developer.apple.com/documentation/SoundAnalysis) for identifying sounds in audio. [Core ML](https://developer.apple.com/documentation/coreml) itself builds on top of low-level primitives like [Accelerate](https://developer.apple.com/documentation/Accelerate) and [BNNS](https://developer.apple.com/documentation/Accelerate/bnns-library), as well as [Metal Performance Shaders](https://developer.apple.com/documentation/MetalPerformanceShaders).
![A block diagram of the machine learning stack. The top layer is a single block labeled “Your app,” which spans the entire width of the block diagram. The second layer has four blocks labeled “Vision,” “Natural Language,” “Speech,” and “Sound Analysis.” The third layer is labeled “Core ML,” which also spans the entire width. The fourth and final layer has two blocks, “Accelerate and BNNS” and “Metal Performance Shaders.”](https://docs-assets.developer.apple.com/published/2ab0327b082af0332b528cc4171ee629/media-3330367%402x.png)
## [Topics](https://developer.apple.com/documentation/CoreML#topics)
### [Core ML models](https://developer.apple.com/documentation/CoreML#Core-ML-models)
[Getting a Core ML Model](https://developer.apple.com/documentation/coreml/getting-a-core-ml-model)
Obtain a Core ML model to use in your app.
[Updating a Model File to a Model Package](https://developer.apple.com/documentation/coreml/updating-a-model-file-to-a-model-package)
Convert a Core ML model file into a model package in Xcode.
[Integrating a Core ML Model into Your App](https://developer.apple.com/documentation/coreml/integrating-a-core-ml-model-into-your-app)
Add a simple model to an app, pass input data to the model, and process the model’s predictions.
[`class MLModel`](https://developer.apple.com/documentation/coreml/mlmodel)
An encapsulation of all the details of your machine learning model.
[API Reference Model Customization](https://developer.apple.com/documentation/coreml/model-customization)
Expand and modify your model with new layers.
[API Reference Model Personalization](https://developer.apple.com/documentation/coreml/model-personalization)
Update your model to adapt to new data.
### [Model inputs and outputs](https://developer.apple.com/documentation/CoreML#Model-inputs-and-outputs)
[Making Predictions with a Sequence of Inputs](https://developer.apple.com/documentation/coreml/making-predictions-with-a-sequence-of-inputs)
Integrate a recurrent neural network model to process sequences of inputs.
[`class MLFeatureValue`](https://developer.apple.com/documentation/coreml/mlfeaturevalue)
A generic wrapper around an underlying value and the value’s type.
[`struct MLSendableFeatureValue`](https://developer.apple.com/documentation/coreml/mlsendablefeaturevalue)
A sendable feature value.
[`protocol MLFeatureProvider`](https://developer.apple.com/documentation/coreml/mlfeatureprovider)
An interface that represents a collection of values for either a model’s input or its output.
[`class MLDictionaryFeatureProvider`](https://developer.apple.com/documentation/coreml/mldictionaryfeatureprovider)
A convenience wrapper for the given dictionary of data.
[`protocol MLBatchProvider`](https://developer.apple.com/documentation/coreml/mlbatchprovider)
An interface that represents a collection of feature providers.
[`class MLArrayBatchProvider`](https://developer.apple.com/documentation/coreml/mlarraybatchprovider)
A convenience wrapper for batches of feature providers.
[`class MLModelAsset`](https://developer.apple.com/documentation/coreml/mlmodelasset)
An abstraction of a compiled Core ML model asset.
### [App integration](https://developer.apple.com/documentation/CoreML#App-integration)
[Downloading and Compiling a Model on the User’s Device](https://developer.apple.com/documentation/coreml/downloading-and-compiling-a-model-on-the-user-s-device)
Install Core ML models on the user’s device dynamically at runtime.
[API Reference Model Integration Samples](https://developer.apple.com/documentation/coreml/model-integration-samples)
Integrate tabular, image, and text classifcation models into your app.
### [Model encryption](https://developer.apple.com/documentation/CoreML#Model-encryption)
[Generating a Model Encryption Key](https://developer.apple.com/documentation/coreml/generating-a-model-encryption-key)
Create a model encryption key to encrypt a compiled model or model archive.
[Encrypting a Model in Your App](https://developer.apple.com/documentation/coreml/encrypting-a-model-in-your-app)
Encrypt your app’s built-in model at compile time by adding a compiler flag.
### [Compute devices](https://developer.apple.com/documentation/CoreML#Compute-devices)
[`enum MLComputeDevice`](https://developer.apple.com/documentation/coreml/mlcomputedevice)
Compute devices for framework operations.
[`class MLCPUComputeDevice`](https://developer.apple.com/documentation/coreml/mlcpucomputedevice)
An object that represents a CPU compute device.
[`class MLGPUComputeDevice`](https://developer.apple.com/documentation/coreml/mlgpucomputedevice)
An object that represents a GPU compute device.
[`class MLNeuralEngineComputeDevice`](https://developer.apple.com/documentation/coreml/mlneuralenginecomputedevice)
An object that represents a Neural Engine compute device.
[`protocol MLComputeDeviceProtocol`](https://developer.apple.com/documentation/coreml/mlcomputedeviceprotocol)
An interface that represents a compute device type.
### [Compute plan](https://developer.apple.com/documentation/CoreML#Compute-plan)
[`class MLComputePlan`](https://developer.apple.com/documentation/coreml/mlcomputeplan-1w21n)
A class representing the compute plan of a model.
[`enum MLModelStructure`](https://developer.apple.com/documentation/coreml/mlmodelstructure-swift.enum)
An enum representing the structure of a model.
[`struct MLComputePolicy`](https://developer.apple.com/documentation/coreml/mlcomputepolicy)
The compute policy determining what compute device, or compute devices, to execute ML workloads on.
[`func withMLTensorComputePolicy<R>(MLComputePolicy, () async throws -> R) async rethrows -> R`](https://developer.apple.com/documentation/coreml/withmltensorcomputepolicy\(_:_:\)-8stx9)
Calls the given closure within a task-local context using the specified compute policy to influence what compute device tensor operations are executed on.
[`func withMLTensorComputePolicy<Result>(MLComputePolicy, () throws -> Result) rethrows -> Result`](https://developer.apple.com/documentation/coreml/withmltensorcomputepolicy\(_:_:\)-6z33x)
Calls the given closure within a task-local context using the specified compute policy to influence what compute device tensor operations are executed on.
### [Model state](https://developer.apple.com/documentation/CoreML#Model-state)
[`class MLState`](https://developer.apple.com/documentation/coreml/mlstate)
Handle to the state buffers.
[`class MLStateConstraint`](https://developer.apple.com/documentation/coreml/mlstateconstraint)
Constraint of a state feature value.
### [Model tensor](https://developer.apple.com/documentation/CoreML#Model-tensor)
[`struct MLTensor`](https://developer.apple.com/documentation/coreml/mltensor)
A multi-dimensional array of numerical or Boolean scalars tailored to ML use cases, containing methods to perform transformations and mathematical operations efficiently using a ML compute device.
[`protocol MLTensorScalar`](https://developer.apple.com/documentation/coreml/mltensorscalar)
A type that represents the tensor scalar types supported by the framework. Don’t use this type directly.
[`protocol MLTensorRangeExpression`](https://developer.apple.com/documentation/coreml/mltensorrangeexpression)
A type that can be used to slice a dimension of a tensor. Don’t use this type directly.
[`func pointwiseMin(_:_:)`](https://developer.apple.com/documentation/coreml/pointwisemin\(_:_:\))
Computes the element-wise minimum of two tensors.
[`func pointwiseMax(_:_:)`](https://developer.apple.com/documentation/coreml/pointwisemax\(_:_:\))
Computes the element-wise minimum between two tensors.
[`func withMLTensorComputePolicy(_:_:)`](https://developer.apple.com/documentation/coreml/withmltensorcomputepolicy\(_:_:\))
Calls the given closure within a task-local context using the specified compute policy to influence what compute device tensor operations are executed on.
### [Model structure](https://developer.apple.com/documentation/CoreML#Model-structure)
[`enum MLModelStructure`](https://developer.apple.com/documentation/coreml/mlmodelstructure-swift.enum)
An enum representing the structure of a model.
### [Model errors](https://developer.apple.com/documentation/CoreML#Model-errors)
[`struct MLModelError`](https://developer.apple.com/documentation/coreml/mlmodelerror-swift.struct)
Information about a Core ML model error.
[`enum Code`](https://developer.apple.com/documentation/coreml/mlmodelerror-swift.struct/code)
Information about a Core ML model error.
[`let MLModelErrorDomain: String`](https://developer.apple.com/documentation/coreml/mlmodelerrordomain)
The domain for Core ML errors.
### [Model deployments](https://developer.apple.com/documentation/CoreML#Model-deployments)
[`class MLModelCollection`](https://developer.apple.com/documentation/coreml/mlmodelcollection)
A set of Core ML models from a model deployment.
Deprecated
### [Reference](https://developer.apple.com/documentation/CoreML#Reference)
[API Reference CoreML Enumerations](https://developer.apple.com/documentation/coreml/coreml-enumerations)
Current page is Core ML 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FCoreML).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
