Source: https://developer.apple.com/documentation/corelocation/configuring-your-app-to-use-location-services

[ Skip Navigation ](https://developer.apple.com/documentation/corelocation/configuring-your-app-to-use-location-services#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/corelocation/configuring-your-app-to-use-location-services#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/corelocation/configuring-your-app-to-use-location-services)
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
[ Open Menu ](https://developer.apple.com/documentation/corelocation/configuring-your-app-to-use-location-services)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/corelocation/configuring-your-app-to-use-location-services)


[](https://developer.apple.com/documentation/corelocation/configuring-your-app-to-use-location-services)
## [ Core Location  ](https://developer.apple.com/documentation/corelocation)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 63 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 63 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 63 symbols inside <root> [Configuring your app to use location services](https://developer.apple.com/documentation/corelocation/configuring-your-app-to-use-location-services)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 63 symbols inside <root> [Supporting live updates in SwiftUI and Mac Catalyst apps](https://developer.apple.com/documentation/corelocation/supporting-live-updates-in-swiftui-and-mac-catalyst-apps)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
4 of 63 symbols inside <root> containing 70 symbols[CLLocationManager](https://developer.apple.com/documentation/corelocation/cllocationmanager)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
5 of 63 symbols inside <root> containing 10 symbols[CLBackgroundActivitySession](https://developer.apple.com/documentation/corelocation/clbackgroundactivitysession-3mzv3)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
6 of 63 symbols inside <root> containing 17 symbols[CLLocationUpdate](https://developer.apple.com/documentation/corelocation/cllocationupdate)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 63 symbols inside <root> [Adopting live updates in Core Location](https://developer.apple.com/documentation/corelocation/adopting-live-updates-in-core-location)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 63 symbols inside <root> [Monitoring location changes with Core Location](https://developer.apple.com/documentation/corelocation/monitoring-location-changes-with-core-location)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 63 symbols inside <root>
Authorization
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
10 of 63 symbols inside <root> [Requesting authorization to use location services](https://developer.apple.com/documentation/corelocation/requesting-authorization-to-use-location-services)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
11 of 63 symbols inside <root> [Suspending authorization requests](https://developer.apple.com/documentation/corelocation/suspending-authorization-requests)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
12 of 63 symbols inside <root> containing 9 symbols[CLAuthorizationStatus](https://developer.apple.com/documentation/corelocation/clauthorizationstatus)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
E
13 of 63 symbols inside <root> containing 5 symbols[CLAccuracyAuthorization](https://developer.apple.com/documentation/corelocation/claccuracyauthorization)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
14 of 63 symbols inside <root> [NSLocationAlwaysAndWhenInUseUsageDescription](https://developer.apple.com/documentation/bundleresources/information-property-list/nslocationalwaysandwheninuseusagedescription)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
15 of 63 symbols inside <root> [NSLocationWhenInUseUsageDescription](https://developer.apple.com/documentation/bundleresources/information-property-list/nslocationwheninuseusagedescription)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
16 of 63 symbols inside <root> [NSLocationUsageDescription](https://developer.apple.com/documentation/bundleresources/information-property-list/nslocationusagedescription)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
17 of 63 symbols inside <root> [NSLocationDefaultAccuracyReduced](https://developer.apple.com/documentation/bundleresources/information-property-list/nslocationdefaultaccuracyreduced)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
T
18 of 63 symbols inside <root> [NSLocationAlwaysUsageDescription](https://developer.apple.com/documentation/bundleresources/information-property-list/nslocationalwaysusagedescription)Deprecated
63 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Core Location ](https://developer.apple.com/documentation/corelocation)
  * [ Configuring your app to use location services ](https://developer.apple.com/documentation/corelocation/configuring-your-app-to-use-location-services)
  *     * Configuring your app to use location services 


Article
# Configuring your app to use location services
Prepare your app to start collecting location data.
## [Overview](https://developer.apple.com/documentation/corelocation/configuring-your-app-to-use-location-services#overview)
The location data available on most Apple devices gives you additional context and information to incorporate into your app’s content. You might use that data to show someone’s physical location on a map and help them navigate their environment. Or you might apply location data to a list of restaurants and shops to eliminate choices that aren’t nearby. You might also use location data to alert someone when they’re near a particular device or geographic region. For all of these use cases and more, the Core Location framework provides access to the location data you need.
When you add code to support Core Location, plan for situations where location data isn’t available. The system also requires apps to gain permission to use location data, and prevents apps from acquiring locations without permission. If location data is unavailable for any reason, make the best app experience you can without it. Disable features that rely on location data or provide alternatives to get the behavior you need.
Important
Location data is sensitive information, and it’s important for you to secure any location data you collect. Encrypt any location data you store on disk or send over the network. In addition, provide a clear privacy policy that explains how you use someone’s location data.
### [Check the availability of services your app uses](https://developer.apple.com/documentation/corelocation/configuring-your-app-to-use-location-services#Check-the-availability-of-services-your-app-uses)
Always verify that location services are available before you attempt to use them. Services might be unavailable for many different reasons, including:
  * The device is in Airplane mode.
  * The device doesn’t have the required hardware.
  * The device doesn’t support a specific service.
  * Your app doesn’t have authorization to use the service.


If a service isn’t available, disable any app-specific features that rely on that service. Disabling features in advance is a more reliable approach than using a service and responding to errors.
The [`CLLocationManager`](https://developer.apple.com/documentation/corelocation/cllocationmanager) class provides methods to determine the availability of each service. Call the appropriate method for a given service immediately before you try to use that service. For example, an app that offers compass heading information might call the [`headingAvailable()`](https://developer.apple.com/documentation/corelocation/cllocationmanager/headingavailable\(\)) method before starting the service. If your app uses multiple services, call the appropriate method for each service.
```
// Check if heading data is available.
if CLLocationManager.headingAvailable() {
    locationManager.startUpdatingHeading()
} else {
    // Disable compass features.
}

```

If your app can’t function without specific location services, declare those requirements in advance using your app’s Information Property list. For more information, see Declare the device capabilities your app requires below.
### [Start receiving location updates and authorization status changes](https://developer.apple.com/documentation/corelocation/configuring-your-app-to-use-location-services#Start-receiving-location-updates-and-authorization-status-changes)
You can request location updates in your code immediately. If the system hasn’t requested authorization for your app, it does so when your code starts iterating over the asynchronous stream of updates. Because location data is sensitive personal information, the owner of a device controls which apps give access. They can grant or deny access to apps separately, and can change an app’s access at any time in system settings.
Tip
Begin requesting location updates where your app uses location data, such as from the view that displays location-related data. Don’t make requests at launch time or from a part of your app that isn’t connected to location, unless absolutely necessary. Someone might not fully understand why your app is asking for authorization and deny the request.
Location updates and authorization status changes arrive in an asynchronous fashion. Check for both the presence of a location update and authorization status changes within the loop. The loop doesn’t terminate unless you explicitly use `return`, `break`, or throw an exception.
```
// Obtain an asynchronous stream of updates.
let stream = CLLocationUpdate.liveUpdates()


// Iterate over the stream and handle incoming updates.
for try await update in stream {
     if update.location != nil {
          // Process the location.
     } else if update.authorizationDenied {
          // Process the authorization denied state change.
     } else {
          // Process other state changes.
     }
}

```

If your app always needs authorization, it needs to create and hold a privileged session offered by [`CLServiceSession`](https://developer.apple.com/documentation/corelocation/clservicesession-pt7n). This class provides a single opportunity to upgrade from “While using” to “Always.”
### [Declare the device capabilities your app requires](https://developer.apple.com/documentation/corelocation/configuring-your-app-to-use-location-services#Declare-the-device-capabilities-your-app-requires)
Core Location generates location updates using a combination of Wi-Fi, cellular, and GPS hardware, and it generates compass updates using magnetometer hardware. For location updates, Core Location doesn’t use every piece of hardware every time. You specify the level of precision you want in your [`CLLocationManager`](https://developer.apple.com/documentation/corelocation/cllocationmanager) object, and Core Location turns on the hardware it needs to deliver that data in the most power-efficient way.
If your app can’t function without a particular piece of hardware, add the [`UIRequiredDeviceCapabilities`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/UIRequiredDeviceCapabilities) key to your app’s Information Property List. The presence of this key tells the App Store to prevent the installation of your app on devices without the specified hardware or capabilities. The value of the key is an array of strings, and you can include one of the following strings for location-related requirements: `location-services`, `gps`, or `magnetometer`.
Include the `gps` key only if you require the highest level of precision for location data. Typically, only navigation apps require that kind of precision, but other apps might also need it to ensure precise location is available when needed. If your app requires heading information, include the `magnetometer` key.
Don’t include the [`UIRequiredDeviceCapabilities`](https://developer.apple.com/documentation/BundleResources/Information-Property-List/UIRequiredDeviceCapabilities) key if people can still use your app without location data. For example, don’t include the key if your app uses location data to filter search results for nearby restaurants. When location data isn’t available, you can find alternatives to get you what you need or work without that data. For example, if you want to filter search results by location, you might prompt someone to enter a postal code or other geographic information explicitly.
### [Start the location services](https://developer.apple.com/documentation/corelocation/configuring-your-app-to-use-location-services#Start-the-location-services)
After you perform the initial checks and verify the authorization status of your app, start the location services you need. Core Location offers several different ways to access location-related information:
  * **Get the current location.** Offer navigation instructions, filter data sets based on location, share someone’s location with friends, or perform other tasks that use someone’s current location. See [Getting the current location of a device](https://developer.apple.com/documentation/corelocation/getting-the-current-location-of-a-device).
  * **Detect when the device enters or exits a geographical region.** Alert someone to points-of-interest, deliver location-sensitive reminders, and more. See [Monitoring the user’s proximity to geographic regions](https://developer.apple.com/documentation/corelocation/monitoring-the-user-s-proximity-to-geographic-regions).
  * **Determine the current compass heading.** Offer course-based navigation or display an onscreen compass. See [Getting heading and course information](https://developer.apple.com/documentation/corelocation/getting-heading-and-course-information).
  * **Detect nearby iBeacon hardware.** Determine someone’s proximity to Bluetooth devices. See [Determining the proximity to an iBeacon device](https://developer.apple.com/documentation/corelocation/determining-the-proximity-to-an-ibeacon-device).


## [See Also](https://developer.apple.com/documentation/corelocation/configuring-your-app-to-use-location-services#see-also)
### [Essentials](https://developer.apple.com/documentation/corelocation/configuring-your-app-to-use-location-services#Essentials)
[Supporting live updates in SwiftUI and Mac Catalyst apps](https://developer.apple.com/documentation/corelocation/supporting-live-updates-in-swiftui-and-mac-catalyst-apps)
Enable background events by adding lifecycle event support.
[`class CLLocationManager`](https://developer.apple.com/documentation/corelocation/cllocationmanager)
The object you use to start and stop the delivery of location-related events to your app.
[`class CLBackgroundActivitySession`](https://developer.apple.com/documentation/corelocation/clbackgroundactivitysession-3mzv3)
An object that manages a visual indicator that keeps your app in use in the background, allowing it to receive updates or events.
[`struct CLLocationUpdate`](https://developer.apple.com/documentation/corelocation/cllocationupdate)
A structure that contains the location information the framework delivers with each update.
[Adopting live updates in Core Location](https://developer.apple.com/documentation/corelocation/adopting-live-updates-in-core-location)
Simplify location delivery using asynchronous events in Swift.
[Monitoring location changes with Core Location](https://developer.apple.com/documentation/corelocation/monitoring-location-changes-with-core-location)
Define boundaries and act on user location updates.
Current page is Configuring your app to use location services 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fcorelocation%2Fconfiguring-your-app-to-use-location-services).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
