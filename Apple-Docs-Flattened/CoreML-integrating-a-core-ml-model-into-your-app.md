Source: https://developer.apple.com/documentation/CoreML/integrating-a-core-ml-model-into-your-app

[ Skip Navigation ](https://developer.apple.com/documentation/CoreML/integrating-a-core-ml-model-into-your-app#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/CoreML/integrating-a-core-ml-model-into-your-app#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/CoreML/integrating-a-core-ml-model-into-your-app)
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
[ Open Menu ](https://developer.apple.com/documentation/CoreML/integrating-a-core-ml-model-into-your-app)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/CoreML/integrating-a-core-ml-model-into-your-app)


[](https://developer.apple.com/documentation/CoreML/integrating-a-core-ml-model-into-your-app)
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
  * [ Core ML ](https://developer.apple.com/documentation/coreml)
  * [ Integrating a Core ML Model into Your App ](https://developer.apple.com/documentation/CoreML/integrating-a-core-ml-model-into-your-app)
  *     * Integrating a Core ML Model into Your App 


Sample Code
# Integrating a Core ML Model into Your App
Add a simple model to an app, pass input data to the model, and process the model’s predictions.
[ Download ](https://docs-assets.developer.apple.com/published/daeacfd7a9fd/IntegratingACoreMLModelIntoYourApp.zip)
iOS 12.0+iPadOS 12.0+Xcode 15.2+
## [Overview](https://developer.apple.com/documentation/CoreML/integrating-a-core-ml-model-into-your-app#Overview)
This sample app uses a trained model, `MarsHabitatPricer.mlmodel`, to predict habitat prices on Mars.
### [Add a model to your Xcode project](https://developer.apple.com/documentation/CoreML/integrating-a-core-ml-model-into-your-app#Add-a-model-to-your-Xcode-project)
Add the model to your Xcode project by dragging the model into the project navigator.
You can see information about the model—including the model type and its expected inputs and outputs—by opening the model in Xcode. In this sample, the inputs are the number of solar panels and greenhouses, as well as the lot size of the habitat (in acres). The output is the predicted price of the habitat.
### [Create the model in code](https://developer.apple.com/documentation/CoreML/integrating-a-core-ml-model-into-your-app#Create-the-model-in-code)
Xcode also uses information about the model’s inputs and outputs to automatically generate a custom programmatic interface to the model, which you use to interact with the model in your code. For `MarsHabitatPricer.mlmodel`, Xcode generates interfaces to represent the model (`MarsHabitatPricer`), the model’s inputs (`MarsHabitatPricerInput`), and the model’s output (`MarsHabitatPricerOutput`).
Use the generated `MarsHabitatPricer` class’s initializer to create the model:
```
let marsHabitatPricer = try? MarsHabitatPricer(configuration: .init())

```

### [Get input values to pass to the model](https://developer.apple.com/documentation/CoreML/integrating-a-core-ml-model-into-your-app#Get-input-values-to-pass-to-the-model)
This sample app uses a `UIPickerView` to get the model’s input values from the user:
```
func selectedRow(for feature: Feature) -> Int {
    return pickerView.selectedRow(inComponent: feature.rawValue)
}


let solarPanels = pickerDataSource.value(for: selectedRow(for: .solarPanels), feature: .solarPanels)
let greenhouses = pickerDataSource.value(for: selectedRow(for: .greenhouses), feature: .greenhouses)
let size = pickerDataSource.value(for: selectedRow(for: .size), feature: .size)

```

### [Use the model to make predictions](https://developer.apple.com/documentation/CoreML/integrating-a-core-ml-model-into-your-app#Use-the-model-to-make-predictions)
The `MarsHabitatPricer` class has a generated `prediction(solarPanels:greenhouses:size:)` method that’s used to predict a price from the model’s input values—in this case, the number of solar panels, the number of greenhouses, and the size of the habitat (in acres). The result of this method is a `MarsHabitatPricerOutput` instance.
```
// Use the model to make a price prediction.
let output = try marsHabitatPricer.prediction(solarPanels: solarPanels,
                                              greenhouses: greenhouses,
                                              size: size)

```

Access the `price` property of `marsHabitatPricerOutput` to get a predicted price and display the result in the app’s UI.
```
// Format the price for display in the UI.
let price = output.price
priceLabel.text = priceFormatter.string(for: price)

```

Note
The generated `prediction(solarPanels:greenhouses:size:)` method can throw an error. The most common type of error you’ll encounter when working with Core ML occurs when the details of the input data don’t match the details the model is expecting—for example, an image in the wrong format.
### [Build and run a Core ML app](https://developer.apple.com/documentation/CoreML/integrating-a-core-ml-model-into-your-app#Build-and-run-a-Core-ML-app)
Xcode compiles the Core ML model into a resource that’s been optimized to run on a device. This optimized representation of the model is included in your app bundle and is what’s used to make predictions while the app is running on a device.
## [See Also](https://developer.apple.com/documentation/CoreML/integrating-a-core-ml-model-into-your-app#see-also)
### [Core ML models](https://developer.apple.com/documentation/CoreML/integrating-a-core-ml-model-into-your-app#Core-ML-models)
[Getting a Core ML Model](https://developer.apple.com/documentation/coreml/getting-a-core-ml-model)
Obtain a Core ML model to use in your app.
[Updating a Model File to a Model Package](https://developer.apple.com/documentation/coreml/updating-a-model-file-to-a-model-package)
Convert a Core ML model file into a model package in Xcode.
[`class MLModel`](https://developer.apple.com/documentation/coreml/mlmodel)
An encapsulation of all the details of your machine learning model.
[API Reference Model Customization](https://developer.apple.com/documentation/coreml/model-customization)
Expand and modify your model with new layers.
[API Reference Model Personalization](https://developer.apple.com/documentation/coreml/model-personalization)
Update your model to adapt to new data.
Current page is Integrating a Core ML Model into Your App 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FCoreML%2Fintegrating-a-core-ml-model-into-your-app).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
