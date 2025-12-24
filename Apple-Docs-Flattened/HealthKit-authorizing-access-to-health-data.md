Source: https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data

[ Skip Navigation ](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data)
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
[ Open Menu ](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data)


[](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data)
## [ HealthKit  ](https://developer.apple.com/documentation/healthkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 31 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 31 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 31 symbols inside <root> [About the HealthKit framework](https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
3 of 31 symbols inside <root> containing 8 symbols[Setting up HealthKit](https://developer.apple.com/documentation/healthkit/setting-up-healthkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 31 symbols inside <root> [Authorizing access to health data](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 31 symbols inside <root> [Protecting user privacy](https://developer.apple.com/documentation/healthkit/protecting-user-privacy)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 31 symbols inside <root> [HealthKit updates](https://developer.apple.com/documentation/updates/healthkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 31 symbols inside <root> [HealthKitUI](https://developer.apple.com/documentation/healthkitui)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 31 symbols inside <root>
Health data
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 31 symbols inside <root> [Saving data to HealthKit](https://developer.apple.com/documentation/healthkit/saving-data-to-healthkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 31 symbols inside <root> [Reading data from HealthKit](https://developer.apple.com/documentation/healthkit/reading-data-from-healthkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
11 of 31 symbols inside <root> containing 58 symbols[HKHealthStore](https://developer.apple.com/documentation/healthkit/hkhealthstore)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
12 of 31 symbols inside <root> [Creating a Mobility Health App](https://developer.apple.com/documentation/healthkit/creating-a-mobility-health-app)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
13 of 31 symbols inside <root> containing 145 symbols[Data types](https://developer.apple.com/documentation/healthkit/data-types)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
14 of 31 symbols inside <root> containing 57 symbols[Samples](https://developer.apple.com/documentation/healthkit/samples)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
15 of 31 symbols inside <root> containing 64 symbols[Queries](https://developer.apple.com/documentation/healthkit/queries)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
16 of 31 symbols inside <root> [Visualizing HealthKit State of Mind in visionOS](https://developer.apple.com/documentation/healthkit/visualizing-healthkit-state-of-mind-in-visionos)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
17 of 31 symbols inside <root> [Logging symptoms associated with a medication](https://developer.apple.com/documentation/healthkit/logging-symptoms-associated-with-a-medication)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
18 of 31 symbols inside <root>
Workout data
31 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ HealthKit ](https://developer.apple.com/documentation/healthkit)
  * [ Authorizing access to health data ](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data)
  *     * Authorizing access to health data 


Article
# Authorizing access to health data
Request permission to read and share data in your app.
## [Overview](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data#overview)
To help protect people’s privacy, HealthKit requires fine-grained authorization. You need to request permission to both read and share each data type before your app attempts to use the data. However, you don’t need to request permission for all data types at once. Instead, it might make more sense to wait until you need to access the data before asking for permission.
As part of the privacy protections, your app doesn’t know whether someone granted or denied permission to read data from HealthKit. If they denied permission, attempts to read data from HealthKit return only samples that your app successfully saved to the HealthKit store. Additionally, in a Guest User session on Apple Vision Pro, the guest can view previously authorized data, but can’t access unauthorized data or change the authorizations.
Important
In iOS 17.2 and later, the Journal app encourages people to reflect on their day-to-day experiences, including physical accomplishments, workouts, and emotions and moods. If your app saves data to HealthKit, high-level summaries of that data can appear as suggestions in the Journal app, or in other apps that use the [Journaling Suggestions](https://developer.apple.com/documentation/JournalingSuggestions) framework.
Requesting permission to read and share data is only one part of protecting your user’s privacy. For more information, see [Protecting user privacy](https://developer.apple.com/documentation/healthkit/protecting-user-privacy).
### [Enable HealthKit](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data#Enable-HealthKit)
Before you can request authorization to read or save HealthKit data, you need to add the HealthKit capability to your app. You must also provide custom messages for the Health permissions sheet.
Xcode requires separate custom messages for reading and writing HealthKit data. Set the [`NSHealthShareUsageDescription`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/NSHealthShareUsageDescription) key to customize the message for reading data and the [`NSHealthUpdateUsageDescription`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/NSHealthUpdateUsageDescription) key to customize the message for writing data.
For projects created using Xcode 13 or later, set these keys in the Target Properties list on the app’s Info tab. For projects created with Xcode 12 or earlier, set these keys in the app’s `Info.plist` file. For more information, see [`Information Property List`](https://developer.apple.com/documentation/BundleResources/Information-Property-List).
Finally, check that Health data is available on the current device by calling [`isHealthDataAvailable()`](https://developer.apple.com/documentation/healthkit/hkhealthstore/ishealthdataavailable\(\)) before calling any other HealthKit methods. For more information, see [Setting up HealthKit](https://developer.apple.com/documentation/healthkit/setting-up-healthkit).
### [Request permission](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data#Request-permission)
To request permission to read or write data, start by creating the HealthKit data types that you want to read or write. The following example creates data types for active energy burned, distance cycling, distance walking or running, distance in a wheelchair, and heart rate.
```
// Create the HealthKit data types your app
// needs to read and write.
let allTypes: Set = [
    HKQuantityType.workoutType(),
    HKQuantityType(.activeEnergyBurned),
    HKQuantityType(.distanceCycling),
    HKQuantityType(.distanceWalkingRunning),
    HKQuantityType(.distanceWheelchair),
    HKQuantityType(.heartRate)
]

```

Next, you can request read or write access to that data. To request access from the HealthKit store, call [`requestAuthorization(toShare:read:)`](https://developer.apple.com/documentation/healthkit/hkhealthstore/requestauthorization\(toshare:read:\)).
```
do {
    // Check that Health data is available on the device.
    if HKHealthStore.isHealthDataAvailable() {
        
        // Asynchronously request authorization to the data.
        try await healthStore.requestAuthorization(toShare: allTypes, read: allTypes)
    }
} catch {
    
    // Typically, authorization requests only fail if you haven't set the
    // usage and share descriptions in your app's Info.plist, or if
    // Health data isn't available on the current device.
    fatalError("*** An unexpected error occurred while requesting authorization: \(error.localizedDescription) ***")
}

```

To request access from SwiftUI, use the [`healthDataAccessRequest(store:shareTypes:readTypes:trigger:completion:)`](https://developer.apple.com/documentation/SwiftUI/View/healthDataAccessRequest\(store:shareTypes:readTypes:trigger:completion:\)) `modifier.`
Important
The [`healthDataAccessRequest(store:shareTypes:readTypes:trigger:completion:)`](https://developer.apple.com/documentation/SwiftUI/View/healthDataAccessRequest\(store:shareTypes:readTypes:trigger:completion:\))
```
import SwiftUI
import HealthKitUI


struct MyView: View {
    @State var authenticated = false
    @State var trigger = false


    var body: some View {
        Button("Access health data") {
            // OK to read or write HealthKit data here.
        }
        .disabled(!authenticated)
        
        // If HealthKit data is available, request authorization
        // when this view appears.
        .onAppear() {
            
            // Check that Health data is available on the device.
            if HKHealthStore.isHealthDataAvailable() {
                // Modifying the trigger initiates the health data
                // access request.
                trigger.toggle()
            }
        }
        
        // Requests access to share and read HealthKit data types
        // when the trigger changes.
        .healthDataAccessRequest(store: healthStore,
                                 shareTypes: allTypes,
                                 readTypes: allTypes,
                                 trigger: trigger) { result in
            switch result {
                
            case .success(_):
                authenticated = true
            case .failure(let error):
                // Handle the error here.
                fatalError("*** An error occurred while requesting authentication: \(error) ***")
            }
        }
    }
}

```

Any time your app requests new permissions, the system displays a form with all the requested data types shown. People can toggle individual read and share permissions on and off.
![A screenshot of the permission sheet requesting permission to read and write the previously listed data types.](https://docs-assets.developer.apple.com/published/c12049160ce49f65c9d7cf6a469eb539/media-4328696%402x.png)
To learn how to provide a great experience when asking for permissions, see [Human Interface Guidelines > HealthKit](https://developer.apple.com/design/human-interface-guidelines/healthkit).
Important
People can change the permissions for your app at any time using either the Settings or the Health app. Your app appears in the Health app’s Sources tab, even if they didn’t allow permission to read or share data.
### [Check for authorization before saving data](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data#Check-for-authorization-before-saving-data)
If someone grants permission to share a data type, you can create new samples of that type and save them to the HealthKit store. However, before attempting to save any data, check to see if your app is authorized to share that data type by calling the [`authorizationStatus(for:)`](https://developer.apple.com/documentation/healthkit/hkhealthstore/authorizationstatus\(for:\)) method. If you haven’t yet requested permission, any attempts to save fail with an [`HKError.Code.errorAuthorizationNotDetermined`](https://developer.apple.com/documentation/healthkit/hkerror/code/errorauthorizationnotdetermined) error. If they’ve denied permission, attempts to save fail with an [`HKError.Code.errorAuthorizationDenied`](https://developer.apple.com/documentation/healthkit/hkerror/code/errorauthorizationdenied) error.
### [Support Guest User sessions on Vision Pro](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data#Support-Guest-User-sessions-on-Vision-Pro)
To protect their privacy, people can put their Vision Pro in a Guest User session before sharing it. This session lets the owner control which apps the guest can use, and what data they can see. For more information, refer to [Let another person use your Apple Vision Pro with Guest User](https://support.apple.com/en-us/117742).
A Guest User session has the following affects on HealthKit:
  * If the owner has already authorized access to the data, the guest can read that data from the HealthKit store.
  * The guest can’t authorize any additional data types.
  * The system obscures Health data in the Privacy and Security and Health Data panels in Settings.
  * Any attempts to save data or otherwise mutate data in the HealthKit store fails with an [`HKError.Code.errorNotPermissibleForGuestUserMode`](https://developer.apple.com/documentation/healthkit/hkerror/code/errornotpermissibleforguestusermode) error (or [`HKError.Code.errorHealthDataRestricted`](https://developer.apple.com/documentation/healthkit/hkerror/code/errorhealthdatarestricted) on apps running in iOS 17).


Important
An app’s permissions don’t change when an app runs in a Guest User session. Therefore, [`authorizationStatus(for:)`](https://developer.apple.com/documentation/healthkit/hkhealthstore/authorizationstatus\(for:\)) returns [`true`](https://developer.apple.com/documentation/Swift/true) if the owner previously granted authorization to write the data, even though the app can’t write it during a Guest User session.
Any attempt to request authorization for HealthKit data types fails silently. The system doesn’t display the authorization sheet during a Guest User session.
If your app receives an [`HKError.Code.errorNotPermissibleForGuestUserMode`](https://developer.apple.com/documentation/healthkit/hkerror/code/errornotpermissibleforguestusermode) error, you can silently ignore the error for passive or periodic saves. Silently dropping the changes ensures that they don’t persist past the Guest User session without interrupting the guest’s experience. However, if the guest performs an action that would obviously result in saving data (for example, tapping a Save button), you can display an alert telling them that the action isn’t available during a Guest User session.
### [Specify required clinical record types](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data#Specify-required-clinical-record-types)
If your app requires access to specific clinical record data to function properly, specify the required clinical record types in your app’s `Info.plist` file using the [`NSHealthRequiredReadAuthorizationTypeIdentifiers`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/NSHealthRequiredReadAuthorizationTypeIdentifiers) key. This key defines the data types that your app must have permission to read. Set the value to an array of strings containing the type identifiers for your required types. For a list of type identifiers, see [`HKClinicalTypeIdentifier`](https://developer.apple.com/documentation/healthkit/hkclinicaltypeidentifier).
To protect people’s privacy, you must specify three or more required clinical record types. If a person denies authorization to any of the types, authorization fails with an [`HKError.Code.errorRequiredAuthorizationDenied`](https://developer.apple.com/documentation/healthkit/hkerror/code/errorrequiredauthorizationdenied) error; the system doesn’t tell your app which record types the person denied access to.
## [See Also](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data#see-also)
### [Essentials](https://developer.apple.com/documentation/healthkit/authorizing-access-to-health-data#Essentials)
[About the HealthKit framework](https://developer.apple.com/documentation/healthkit/about-the-healthkit-framework)
Learn about the architecture and design of the HealthKit framework.
[API Reference Setting up HealthKit](https://developer.apple.com/documentation/healthkit/setting-up-healthkit)
Set up and configure your HealthKit store.
[Protecting user privacy](https://developer.apple.com/documentation/healthkit/protecting-user-privacy)
Respect and safeguard your user’s privacy.
[HealthKit updates](https://developer.apple.com/documentation/Updates/HealthKit)
Learn about important changes to HealthKit.
[HealthKitUI](https://developer.apple.com/documentation/healthkitui)
Display user interface that enables a person to view and interact with their health data.
Current page is Authorizing access to health data 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fhealthkit%2Fauthorizing-access-to-health-data).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
