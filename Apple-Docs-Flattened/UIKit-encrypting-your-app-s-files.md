Source: https://developer.apple.com/documentation/uikit/encrypting-your-app-s-files

[ Skip Navigation ](https://developer.apple.com/documentation/uikit/encrypting-your-app-s-files#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/uikit/encrypting-your-app-s-files#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/uikit/encrypting-your-app-s-files)
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
[ Open Menu ](https://developer.apple.com/documentation/uikit/encrypting-your-app-s-files)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/uikit/encrypting-your-app-s-files)


[](https://developer.apple.com/documentation/uikit/encrypting-your-app-s-files)
## [ UIKit  ](https://developer.apple.com/documentation/uikit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 46 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 46 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 46 symbols inside <root> [Adopting Liquid Glass](https://developer.apple.com/documentation/technologyoverviews/adopting-liquid-glass)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 46 symbols inside <root> [UIKit updates](https://developer.apple.com/documentation/updates/uikit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 46 symbols inside <root> [About App Development with UIKit](https://developer.apple.com/documentation/uikit/about-app-development-with-uikit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
5 of 46 symbols inside <root> containing 3 symbols[Protecting the User’s Privacy](https://developer.apple.com/documentation/uikit/protecting-the-user-s-privacy)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 3 symbols inside 1309780962 
Supporting Privacy
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 3 symbols inside 1309780962 [Requesting access to protected resources](https://developer.apple.com/documentation/uikit/requesting-access-to-protected-resources)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 3 symbols inside 1309780962 [Encrypting Your App’s Files](https://developer.apple.com/documentation/uikit/encrypting-your-app-s-files)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 46 symbols inside <root>
App structure
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
7 of 46 symbols inside <root> containing 26 symbols[App and environment](https://developer.apple.com/documentation/uikit/app-and-environment)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
8 of 46 symbols inside <root> containing 15 symbols[Documents, data, and pasteboard](https://developer.apple.com/documentation/uikit/documents-data-and-pasteboard)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
9 of 46 symbols inside <root> containing 11 symbols[Resource management](https://developer.apple.com/documentation/uikit/resource-management)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
10 of 46 symbols inside <root> containing 12 symbols[App extensions](https://developer.apple.com/documentation/uikit/app-extensions)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
11 of 46 symbols inside <root> containing 8 symbols[Interprocess communication](https://developer.apple.com/documentation/uikit/interprocess-communication)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
12 of 46 symbols inside <root> containing 27 symbols[Mac Catalyst](https://developer.apple.com/documentation/uikit/mac-catalyst)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
13 of 46 symbols inside <root>
User interface
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
14 of 46 symbols inside <root> containing 70 symbols[Views and controls](https://developer.apple.com/documentation/uikit/views-and-controls)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
15 of 46 symbols inside <root> containing 80 symbols[View controllers](https://developer.apple.com/documentation/uikit/view-controllers)
49 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ UIKit ](https://developer.apple.com/documentation/uikit)
  * [ Protecting the User’s Privacy ](https://developer.apple.com/documentation/uikit/protecting-the-user-s-privacy)
  * [ Encrypting Your App’s Files ](https://developer.apple.com/documentation/uikit/encrypting-your-app-s-files)
  *     * [ Protecting the User’s Privacy ](https://developer.apple.com/documentation/uikit/protecting-the-user-s-privacy)
    * Encrypting Your App’s Files 


Article
# Encrypting Your App’s Files
Protect the user’s data in iOS by encrypting it on disk.
## [Overview](https://developer.apple.com/documentation/uikit/encrypting-your-app-s-files#overview)
Data protection is an iOS feature that you use to secure your app’s files and prevent unauthorized access to them. Data protection is enabled automatically when the user sets an active passcode for the device. You read and write your files normally, but the system encrypts and decrypts your content behind the scenes. The encryption and decryption processes are automatic and hardware accelerated.
You specify the level of data protection that you want to apply to each of your files. There are four levels available, each of which determines when you may access the file. If you do not specify a protection level when creating a file, iOS applies the default protection level automatically.
  * **No protection.** The file is always accessible.
  * **Complete until first user authentication.** (Default) The file is inaccessible until the first time the user unlocks the device. After the first unlocking of the device, the file remains accessible until the device shuts down or reboots.
  * **Complete unless open.** You can open existing files only when the device is unlocked. If you have a file already open, you may continue to access that file even after the user locks the device. You can also create new files and access them while the device is locked or unlocked.
  * **Complete.** The file is accessible only when the device is unlocked.


To create and encrypt a new file in one step, construct a data object with the file’s contents and call the [`write(to:options:)`](https://developer.apple.com/documentation/Foundation/Data/write\(to:options:\)) method. When calling the method, specify the data protection option that you want applied to the file. The following code shows an example of how to write out the contents of a [`Data`](https://developer.apple.com/documentation/Foundation/Data) instance to a file and encrypt it using the complete protection level.
```
do {
   try data.write(to: fileURL, options: .completeFileProtection)
}
catch {
   // Handle errors.
}

```

To change the data protection level of an existing file, use the [`setResourceValue(_:forKey:)`](https://developer.apple.com/documentation/Foundation/NSURL/setResourceValue\(_:forKey:\)) method of [`NSURL`](https://developer.apple.com/documentation/Foundation/NSURL). When calling this method, assign the new data protection option to the [`fileProtectionKey`](https://developer.apple.com/documentation/Foundation/URLResourceKey/fileProtectionKey) resource key. The following code shows an example that adds this key to an existing file.
```
do {
   try (fileURL as NSURL).setResourceValue( 
                  URLFileProtection.complete,
                  forKey: .fileProtectionKey)
}
catch {
   // Handle errors.
}

```

### [Manage Your Access to Encrypted Files](https://developer.apple.com/documentation/uikit/encrypting-your-app-s-files#Manage-Your-Access-to-Encrypted-Files)
Depending on a file’s protection level, attempts to read or write its contents could fail when the user subsequently locks the device. To ensure that your app is able to access files, do the following:
  * Choose the right data protection level for your needs.
  * Use the app delegate’s [`applicationProtectedDataWillBecomeUnavailable(_:)`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/applicationprotecteddatawillbecomeunavailable\(_:\)) and [`applicationProtectedDataDidBecomeAvailable(_:)`](https://developer.apple.com/documentation/uikit/uiapplicationdelegate/applicationprotecteddatadidbecomeavailable\(_:\)) methods to close and reopen files with the [`completeFileProtection`](https://developer.apple.com/documentation/Foundation/NSData/WritingOptions/completeFileProtection) level.


Assign the complete protection level to files that your app accesses only when it is in the foreground. If your app supports background capabilities, such as handling location updates, assign a different protection level for files that you might access while in the background. For example, a fitness app might use the complete unless open protection level on a file that it uses to log location events in the background.
Files containing personal information about the user, or files created directly by the user, always warrant the strongest level of protection. Assign the complete protection level to user data files and manage access to those files using the app delegate methods. The app delegate methods give you time to close the files before they become inaccessible to your app.
## [See Also](https://developer.apple.com/documentation/uikit/encrypting-your-app-s-files#see-also)
### [Supporting Privacy](https://developer.apple.com/documentation/uikit/encrypting-your-app-s-files#Supporting-Privacy)
[Requesting access to protected resources](https://developer.apple.com/documentation/uikit/requesting-access-to-protected-resources)
Provide a purpose string that explains to a person why you need access to protected resources on their device.
Current page is Encrypting Your App’s Files 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fuikit%2Fencrypting-your-app-s-files).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
