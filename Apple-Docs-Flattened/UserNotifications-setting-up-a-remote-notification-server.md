Source: https://developer.apple.com/documentation/UserNotifications/setting-up-a-remote-notification-server

[ Skip Navigation ](https://developer.apple.com/documentation/UserNotifications/setting-up-a-remote-notification-server#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/UserNotifications/setting-up-a-remote-notification-server#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/UserNotifications/setting-up-a-remote-notification-server)
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
[ Open Menu ](https://developer.apple.com/documentation/UserNotifications/setting-up-a-remote-notification-server)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/UserNotifications/setting-up-a-remote-notification-server)


[](https://developer.apple.com/documentation/UserNotifications/setting-up-a-remote-notification-server)
## [ User Notifications  ](https://developer.apple.com/documentation/usernotifications)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 53 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 53 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 53 symbols inside <root> [User Notifications updates](https://developer.apple.com/documentation/updates/usernotifications)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 53 symbols inside <root> [Asking permission to use notifications](https://developer.apple.com/documentation/usernotifications/asking-permission-to-use-notifications)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 53 symbols inside <root>
Notification management
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
5 of 53 symbols inside <root> containing 27 symbols[UNUserNotificationCenter](https://developer.apple.com/documentation/usernotifications/unusernotificationcenter)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
6 of 53 symbols inside <root> containing 9 symbols[UNUserNotificationCenterDelegate](https://developer.apple.com/documentation/usernotifications/unusernotificationcenterdelegate)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
7 of 53 symbols inside <root> containing 23 symbols[UNNotificationSettings](https://developer.apple.com/documentation/usernotifications/unnotificationsettings)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 53 symbols inside <root>
Remote notifications
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
9 of 53 symbols inside <root> containing 19 symbols[Setting up a remote notification server](https://developer.apple.com/documentation/usernotifications/setting-up-a-remote-notification-server)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 19 symbols inside -1484906498 
Server tasks
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 19 symbols inside -1484906498 [Registering your app with APNs](https://developer.apple.com/documentation/usernotifications/registering-your-app-with-apns)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 19 symbols inside -1484906498 [Generating a remote notification](https://developer.apple.com/documentation/usernotifications/generating-a-remote-notification)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 19 symbols inside -1484906498 [Pushing background updates to your App](https://developer.apple.com/documentation/usernotifications/pushing-background-updates-to-your-app)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
5 of 19 symbols inside -1484906498 [Establishing a connection to Apple Push Notification service (APNs)](https://developer.apple.com/documentation/usernotifications/establishing-a-connection-to-apns)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 19 symbols inside -1484906498 
Security
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 19 symbols inside -1484906498 [Establishing a token-based connection to APNs](https://developer.apple.com/documentation/usernotifications/establishing-a-token-based-connection-to-apns)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 19 symbols inside -1484906498 [Establishing a certificate-based connection to APNs](https://developer.apple.com/documentation/usernotifications/establishing-a-certificate-based-connection-to-apns)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
9 of 19 symbols inside -1484906498 
Device push notifications
72 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
Collection
  * [ User Notifications ](https://developer.apple.com/documentation/usernotifications)
  * [ Setting up a remote notification server ](https://developer.apple.com/documentation/UserNotifications/setting-up-a-remote-notification-server)
  *     * Setting up a remote notification server 


# Setting up a remote notification server
Generate notifications and push them to user devices.
## [Overview](https://developer.apple.com/documentation/UserNotifications/setting-up-a-remote-notification-server#overview)
Use remote notifications (also known as _push notifications_) to push small amounts of data to devices that use your app, even when your app isn’t running. Apps use notifications to provide important information to users. For example, a messaging service sends remote notifications when new messages arrive.
The delivery of remote notifications involves several key components:
  * Your company’s server, known as the _provider server_
  * Apple Push Notification service (APNs)
  * The user’s device
  * Your app running on the user’s device


Remote notifications begin with your company’s server. You decide which notifications you want to send to your users, and when to send them. When it’s time to send a notification, you generate a request that contains the notification data and a unique identifier for the user’s device. You then forward your request to APNs, which handles the delivery of the notification to the user’s device. Upon receipt of the notification, the operating system on the user’s device handles any user interactions and delivers the notification to your app.
![Your company’s provider server communicates with Apple Push Notification service, which in turn communicates with the user’s devices.](https://docs-assets.developer.apple.com/published/a8aa0ea03600ff29e4b9634c3de1ebf1/media-2953615.png)
You’re responsible for setting up a provider server (or servers) and for configuring your app to handle notifications on the user’s device. Apple manages everything in between, including the presentation of notifications to the user. You must also have an app running on the user’s device that can communicate with your server and provide necessary information. For information about how to configure your app to handle remote notifications, see [Registering your app with APNs](https://developer.apple.com/documentation/usernotifications/registering-your-app-with-apns).
Tip
If you’re setting up a provider server to send push notifications to users in Safari and other browsers, see [Sending web push notifications in web apps and browsers](https://developer.apple.com/documentation/usernotifications/sending-web-push-notifications-in-web-apps-and-browsers).
### [Build custom infrastructure for notifications](https://developer.apple.com/documentation/UserNotifications/setting-up-a-remote-notification-server#Build-custom-infrastructure-for-notifications)
Setting up a remote notification server consists of a few key tasks. How you implement these tasks depends on your infrastructure. Use the technologies that are appropriate for your company:
  * Write code to receive device tokens from instances of your app running on user devices, and to associate those tokens with your users’ accounts. See [Registering your app with APNs](https://developer.apple.com/documentation/usernotifications/registering-your-app-with-apns).
  * Determine when to send notifications to your users, and write code to generate notification payloads. See [Generating a remote notification](https://developer.apple.com/documentation/usernotifications/generating-a-remote-notification).
  * Manage a connection to APNs using HTTP/2 and TLS. See [Sending notification requests to APNs](https://developer.apple.com/documentation/usernotifications/sending-notification-requests-to-apns).
  * Write code to generate POST requests that contain your payloads, and send those requests over your HTTP/2 connection. See [Sending notification requests to APNs](https://developer.apple.com/documentation/usernotifications/sending-notification-requests-to-apns).
  * Regenerate your token periodically for token-based authentication. See [Establishing a token-based connection to APNs](https://developer.apple.com/documentation/usernotifications/establishing-a-token-based-connection-to-apns).


### [Establish a trusted connection to APNs](https://developer.apple.com/documentation/UserNotifications/setting-up-a-remote-notification-server#Establish-a-trusted-connection-to-APNs)
Communication between your provider server and APNs must take place over a secure connection. Creating a secure connection requires installing the [AAA Certificate Services root certificate](https://comodoca.my.salesforce.com/sfc/dist/version/download/?oid=00D1N000002Ljih&ids=0683l00000G9fLm&d=%2Fa%2F3l000000VbG0%2Fh70Hv.GWfGuD79pR_if0MtGjJFcUj.NRZS_RLqEyC_4&asPdf=false) and [SHA-2 Root : USERTrust RSA Certification Authority certificate](https://www.sectigo.com/knowledge-base/detail/Sectigo-Intermediate-Certificates/kA01N000000rfBO) on each of your provider servers.
If your provider server runs macOS Sequoia or later, both AAA and UserTrust Certificate Services root certificate are in the keychain by default. On other systems, you might need to install this certificate yourself. You can download the “AAACertificateServices 5/12/2020” certificate from the [Sectigo KnowledgeBase](https://support.sectigo.com/Com_KnowledgeDetailPage?Id=kA03l00000117cL) website and “SHA-2 Root : USERTrust RSA Certification Authority” certificate from the [Sectigo KnowledgeBase](https://www.sectigo.com/knowledge-base/detail/Sectigo-Intermediate-Certificates/kA01N000000rfBO) website.
Tip
APNs is migrating from AAA to UserTrust Certificate Services root certificate. For migration dates, consult [Developer News](https://developer.apple.com/news/?id=09za8wzy).
To send notifications, your provider server must establish either token-based or certificate-based trust with APNs using HTTP/2 and TLS. Both techniques have advantages and disadvantages, so decide which technique is best for your company.
  * To set up token-based trust with APNs, see [Establishing a token-based connection to APNs](https://developer.apple.com/documentation/usernotifications/establishing-a-token-based-connection-to-apns).
  * To set up certificate-based trust with APNs, see [Establishing a certificate-based connection to APNs](https://developer.apple.com/documentation/usernotifications/establishing-a-certificate-based-connection-to-apns).


### [Understand what APNs provides](https://developer.apple.com/documentation/UserNotifications/setting-up-a-remote-notification-server#Understand-what-APNs-provides)
APNs makes every effort to deliver your notifications, and to deliver them with the best user experience:
  * APNs manages an accredited, encrypted, and persistent IP connection to the user’s device.
  * APNs can store notifications for a device that’s currently offline. APNs then forwards the stored notifications when the device comes online.
  * If APNs doesn’t deliver a notification immediately, either for device power considerations or because the destination is offline, it may coalesce notifications for the same bundle ID.


## [Topics](https://developer.apple.com/documentation/UserNotifications/setting-up-a-remote-notification-server#topics)
### [Server tasks](https://developer.apple.com/documentation/UserNotifications/setting-up-a-remote-notification-server#Server-tasks)
[Registering your app with APNs](https://developer.apple.com/documentation/usernotifications/registering-your-app-with-apns)
Communicate with Apple Push Notification service (APNs) and receive a unique device token that identifies your app.
[Generating a remote notification](https://developer.apple.com/documentation/usernotifications/generating-a-remote-notification)
Send notifications to the user’s device with a JSON payload.
[Pushing background updates to your App](https://developer.apple.com/documentation/usernotifications/pushing-background-updates-to-your-app)
Deliver notifications that wake your app and update it in the background.
[Establishing a connection to Apple Push Notification service (APNs)](https://developer.apple.com/documentation/usernotifications/establishing-a-connection-to-apns)
Secure your communications with APNs to send API requests.
### [Security](https://developer.apple.com/documentation/UserNotifications/setting-up-a-remote-notification-server#Security)
Create a secure connection between your provider server and APNs.
[Establishing a token-based connection to APNs](https://developer.apple.com/documentation/usernotifications/establishing-a-token-based-connection-to-apns)
Secure your communications with Apple Push Notification service (APNs) by using stateless authentication tokens.
[Establishing a certificate-based connection to APNs](https://developer.apple.com/documentation/usernotifications/establishing-a-certificate-based-connection-to-apns)
Secure your communications with Apple Push Notification service (APNs) by installing a certificate on your provider server.
### [Device push notifications](https://developer.apple.com/documentation/UserNotifications/setting-up-a-remote-notification-server#Device-push-notifications)
[Sending notification requests to APNs](https://developer.apple.com/documentation/usernotifications/sending-notification-requests-to-apns)
Transmit your remote notification payload and device token information to Apple Push Notification service (APNs).
[Handling notification responses from APNs](https://developer.apple.com/documentation/usernotifications/handling-notification-responses-from-apns)
Respond to the status codes that the APNs servers return.
[Viewing the status of push notifications using Metrics and APNs](https://developer.apple.com/documentation/usernotifications/viewing-the-status-of-push-notifications-using-metrics-and-apns)
Monitor and interpret the status of your push notifications with Apple Push Notification service (APNs).
### [Broadcast push notifications](https://developer.apple.com/documentation/UserNotifications/setting-up-a-remote-notification-server#Broadcast-push-notifications)
[Setting up broadcast push notifications](https://developer.apple.com/documentation/usernotifications/setting-up-broadcast-push-notifications)
Enable broadcast capability for Apple Push Notifications service (APNs).
[Sending channel management requests to APNs](https://developer.apple.com/documentation/usernotifications/sending-channel-management-requests-to-apns)
Manage channels that your application uses for broadcast push notifications.
[Sending broadcast push notification requests to APNs](https://developer.apple.com/documentation/usernotifications/sending-broadcast-push-notification-requests-to-apns)
Transmit your broadcast notification payload to Apple Push Notifications service (APNs).
[Handling error responses from Apple Push Notification service](https://developer.apple.com/documentation/usernotifications/handling-error-responses-from-apns)
Respond to the status codes returned by APNs servers.
### [Troubleshooting](https://developer.apple.com/documentation/UserNotifications/setting-up-a-remote-notification-server#Troubleshooting)
[Troubleshooting push notifications](https://developer.apple.com/documentation/usernotifications/troubleshooting-push-notifications)
Debug your server to send push notifications with device and broadcast push notifications.
## [See Also](https://developer.apple.com/documentation/UserNotifications/setting-up-a-remote-notification-server#see-also)
### [Remote notifications](https://developer.apple.com/documentation/UserNotifications/setting-up-a-remote-notification-server#Remote-notifications)
[Sending push notifications using command-line tools](https://developer.apple.com/documentation/usernotifications/sending-push-notifications-using-command-line-tools)
Use basic macOS command-line tools to send push notifications to Apple Push Notification service (APNs).
[Testing notifications using the Push Notification Console](https://developer.apple.com/documentation/usernotifications/testing-notifications-using-the-push-notification-console)
Send test notifications and access delivery logs to test your app’s integration with Apple Push Notification service (APNs).
Current page is Setting up a remote notification server 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FUserNotifications%2Fsetting-up-a-remote-notification-server).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
