Source: https://developer.apple.com/documentation/appkit/nsapplication

[ Skip Navigation ](https://developer.apple.com/documentation/appkit/nsapplication#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/appkit/nsapplication#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/appkit/nsapplication)
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
[ Open Menu ](https://developer.apple.com/documentation/appkit/nsapplication)
  * SwiftLanguage:  Swift  Objective-C 
Language: 
    * Swift 
    * [ Objective-C ](https://developer.apple.com/documentation/appkit/nsapplication)


[](https://developer.apple.com/documentation/appkit/nsapplication)
## [ AppKit  ](https://developer.apple.com/documentation/appkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 44 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 44 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 44 symbols inside <root> [Adopting Liquid Glass](https://developer.apple.com/documentation/technologyoverviews/adopting-liquid-glass)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 44 symbols inside <root> [AppKit updates](https://developer.apple.com/documentation/updates/appkit)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
4 of 44 symbols inside <root> [Protecting the User’s Privacy](https://developer.apple.com/documentation/uikit/protecting-the-user-s-privacy)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
5 of 44 symbols inside <root> [Porting your macOS apps to Apple silicon](https://developer.apple.com/documentation/apple-silicon/porting-your-macos-apps-to-apple-silicon)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 44 symbols inside <root>
App Structure
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
7 of 44 symbols inside <root> containing 26 symbols[App and Environment](https://developer.apple.com/documentation/appkit/app-and-environment)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 26 symbols inside -1174573736 
Life Cycle
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
2 of 26 symbols inside -1174573736 containing 120 symbols[NSApplication](https://developer.apple.com/documentation/appkit/nsapplication)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 120 symbols inside -1817745663 
Getting the shared app object
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
2 of 120 symbols inside -1817745663 [class var shared: NSApplication](https://developer.apple.com/documentation/appkit/nsapplication/shared)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
V
3 of 120 symbols inside -1817745663 [var NSApp: NSApplication!](https://developer.apple.com/documentation/appkit/nsapp)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 120 symbols inside -1817745663 
Managing the app’s behavior
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
5 of 120 symbols inside -1817745663 [var delegate: (any NSApplicationDelegate)?](https://developer.apple.com/documentation/appkit/nsapplication/delegate)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
6 of 120 symbols inside -1817745663 containing 68 symbols[NSApplicationDelegate](https://developer.apple.com/documentation/appkit/nsapplicationdelegate)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 120 symbols inside -1817745663 
Managing the event loop
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
8 of 120 symbols inside -1817745663 [func nextEvent(matching: NSEvent.EventTypeMask, until: Date?, inMode: RunLoop.Mode, dequeue: Bool) -> NSEvent?](https://developer.apple.com/documentation/appkit/nsapplication/nextevent\(matching:until:inmode:dequeue:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
9 of 120 symbols inside -1817745663 [func discardEvents(matching: NSEvent.EventTypeMask, before: NSEvent?)](https://developer.apple.com/documentation/appkit/nsapplication/discardevents\(matching:before:\))
190 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ AppKit ](https://developer.apple.com/documentation/appkit)
  * [ NSApplication ](https://developer.apple.com/documentation/appkit/nsapplication)
  *     * NSApplication 


Class
# NSApplication
An object that manages an app’s main event loop and resources used by all of that app’s objects.
macOS
```
@[MainActor](https://developer.apple.com/documentation/Swift/MainActor)
class NSApplication
```

## [ Mentioned in ](https://developer.apple.com/documentation/appkit/nsapplication#mentions)
[](https://developer.apple.com/documentation/appkit/choosing-a-specific-appearance-for-your-macos-app)
[](https://developer.apple.com/documentation/appkit/passing-control-from-one-app-to-another-with-cooperative-activation)
## [Overview](https://developer.apple.com/documentation/appkit/nsapplication#overview)
Every app uses a single instance of [`NSApplication`](https://developer.apple.com/documentation/appkit/nsapplication) to control the main event loop, keep track of the app’s windows and menus, distribute events to the appropriate objects (that’s, itself or one of its windows), set up autorelease pools, and receive notification of app-level events. An [`NSApplication`](https://developer.apple.com/documentation/appkit/nsapplication) object has a delegate (an object that you assign) that’s notified when the app starts or terminates, is hidden or activated, should open a file selected by the user, and so forth. By setting the delegate and implementing the delegate methods, you customize the behavior of your app without having to subclass [`NSApplication`](https://developer.apple.com/documentation/appkit/nsapplication). In your app’s `main()` function, create the [`NSApplication`](https://developer.apple.com/documentation/appkit/nsapplication) instance by calling the [`shared`](https://developer.apple.com/documentation/appkit/nsapplication/shared) class method. After creating the application object, the `main()` function should load your app’s main nib file and then start the event loop by sending the application object a [`run()`](https://developer.apple.com/documentation/appkit/nsapplication/run\(\)) message. If you create an Application project in Xcode, this `main()` function is created for you. The `main()` function Xcode creates begins by calling a function named `NSApplicationMain()`, which is functionally similar to the following:
```
void NSApplicationMain(int argc, char *argv[]) {
    [NSApplication sharedApplication];
    [NSBundle loadNibNamed:@"myMain" owner:NSApp];
    [NSApp run];
}

```

The [`shared`](https://developer.apple.com/documentation/appkit/nsapplication/shared) class method initializes the display environment and connects your program to the window server and the display server. The [`NSApplication`](https://developer.apple.com/documentation/appkit/nsapplication) object maintains a list of all the [`NSWindow`](https://developer.apple.com/documentation/appkit/nswindow) objects the app uses, so it can retrieve any of the app’s [`NSView`](https://developer.apple.com/documentation/appkit/nsview) objects. The [`shared`](https://developer.apple.com/documentation/appkit/nsapplication/shared) method also initializes the global variable `NSApp`, which you use to retrieve the [`NSApplication`](https://developer.apple.com/documentation/appkit/nsapplication) instance. [`shared`](https://developer.apple.com/documentation/appkit/nsapplication/shared) only performs the initialization once. If you invoke it more than once, it returns the application object it created previously.
The shared [`NSApplication`](https://developer.apple.com/documentation/appkit/nsapplication) object performs the important task of receiving events from the window server and distributing them to the proper [`NSResponder`](https://developer.apple.com/documentation/appkit/nsresponder) objects. `NSApp` translates an event into an [`NSEvent`](https://developer.apple.com/documentation/appkit/nsevent) object, then forwards the event object to the affected [`NSWindow`](https://developer.apple.com/documentation/appkit/nswindow) object. All keyboard and mouse events go directly to the [`NSWindow`](https://developer.apple.com/documentation/appkit/nswindow) object associated with the event. The only exception to this rule is if the Command key is pressed when a key-down event occurs; in this case, every [`NSWindow`](https://developer.apple.com/documentation/appkit/nswindow) object has an opportunity to respond to the event. When a window object receives an [`NSEvent`](https://developer.apple.com/documentation/appkit/nsevent) object from `NSApp`, it distributes it to the objects in its view hierarchy.
[`NSApplication`](https://developer.apple.com/documentation/appkit/nsapplication) is also responsible for dispatching certain Apple events received by the app. For example, macOS sends Apple events to your app at various times, such as when the app is launched or reopened. [`NSApplication`](https://developer.apple.com/documentation/appkit/nsapplication) installs Apple event handlers to handle these events by sending a message to the appropriate object. You can also use the [`NSAppleEventManager`](https://developer.apple.com/documentation/Foundation/NSAppleEventManager) class to register your own Apple event handlers. The [`applicationWillFinishLaunching(_:)`](https://developer.apple.com/documentation/appkit/nsapplicationdelegate/applicationwillfinishlaunching\(_:\)) method is generally the best place to do so. For more information on how events are handled and how you can modify the default behavior, including information on working with Apple events in scriptable apps, see [How Cocoa Applications Handle Apple Events](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ScriptableCocoaApplications/SApps_handle_AEs/SAppsHandleAEs.html#//apple_ref/doc/uid/20001239) in [Cocoa Scripting Guide](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ScriptableCocoaApplications/SApps_intro/SAppsIntro.html#//apple_ref/doc/uid/TP40002164).
The [`NSApplication`](https://developer.apple.com/documentation/appkit/nsapplication) class sets up `@autorelease` block during initialization and inside the event loop—specifically, within its initialization (or [`shared`](https://developer.apple.com/documentation/appkit/nsapplication/shared)) and [`run()`](https://developer.apple.com/documentation/appkit/nsapplication/run\(\)) methods. Similarly, the methods AppKit adds to [`Bundle`](https://developer.apple.com/documentation/Foundation/Bundle) employ `@autorelease` blocks during the loading of nib files. These `@autorelease` blocks aren’t accessible outside the scope of the respective [`NSApplication`](https://developer.apple.com/documentation/appkit/nsapplication) and [`Bundle`](https://developer.apple.com/documentation/Foundation/Bundle) methods. Typically, an app creates objects either while the event loop is running or by loading objects from nib files, so this lack of access usually isn’t a problem. However, if you do need to use Cocoa classes within the `main()` function itself (other than to load nib files or to instantiate [`NSApplication`](https://developer.apple.com/documentation/appkit/nsapplication)), you should create an `@autorelease` block to contain the code using the classes.
### [The delegate and notifications](https://developer.apple.com/documentation/appkit/nsapplication#The-delegate-and-notifications)
You can assign a delegate to your [`NSApplication`](https://developer.apple.com/documentation/appkit/nsapplication) object. The delegate responds to certain messages on behalf of the object. Some of these messages, such as [`application(_:openFile:)`](https://developer.apple.com/documentation/appkit/nsapplicationdelegate/application\(_:openfile:\)), ask the delegate to perform an action. Another message, [`applicationShouldTerminate(_:)`](https://developer.apple.com/documentation/appkit/nsapplicationdelegate/applicationshouldterminate\(_:\)), lets the delegate determine whether the app should be allowed to quit. The [`NSApplication`](https://developer.apple.com/documentation/appkit/nsapplication) class sends these messages directly to its delegate.
[`NSApplication`](https://developer.apple.com/documentation/appkit/nsapplication) also posts notifications to the app’s default notification center. Any object may register to receive one or more of the notifications posted by [`NSApplication`](https://developer.apple.com/documentation/appkit/nsapplication) by sending the message [`addObserver(_:selector:name:object:)`](https://developer.apple.com/documentation/Foundation/NotificationCenter/addObserver\(_:selector:name:object:\)) to the default notification center (an instance of the `NSNotificationCenter` class). The delegate of [`NSApplication`](https://developer.apple.com/documentation/appkit/nsapplication) is automatically registered to receive these notifications if it implements certain delegate methods. For example, [`NSApplication`](https://developer.apple.com/documentation/appkit/nsapplication) posts notifications when it’s about to be done launching the app and when it’s done launching the app ([`willFinishLaunchingNotification`](https://developer.apple.com/documentation/appkit/nsapplication/willfinishlaunchingnotification) and [`didFinishLaunchingNotification`](https://developer.apple.com/documentation/appkit/nsapplication/didfinishlaunchingnotification)). The delegate has an opportunity to respond to these notifications by implementing the methods [`applicationWillFinishLaunching(_:)`](https://developer.apple.com/documentation/appkit/nsapplicationdelegate/applicationwillfinishlaunching\(_:\)) and [`applicationDidFinishLaunching(_:)`](https://developer.apple.com/documentation/appkit/nsapplicationdelegate/applicationdidfinishlaunching\(_:\)). If the delegate wants to be informed of both events, it implements both methods. If it needs to know only when the app is finished launching, it implements only [`applicationDidFinishLaunching(_:)`](https://developer.apple.com/documentation/appkit/nsapplicationdelegate/applicationdidfinishlaunching\(_:\)).
### [System services](https://developer.apple.com/documentation/appkit/nsapplication#System-services)
`NSApplication` interacts with the system services architecture to provide services to your app through the Services menu.
### [Subclassing notes](https://developer.apple.com/documentation/appkit/nsapplication#Subclassing-notes)
You rarely should find a real need to create a custom `NSApplication` subclass. Unlike some object-oriented libraries, Cocoa doesn’t require you to subclass `NSApplication` to customize app behavior. Instead it gives you many other ways to customize an app. This section discusses both some of the possible reasons to subclass `NSApplication` and some of the reasons _not_ to subclass `NSApplication`.
To use a custom subclass of `NSApplication`, send [`shared`](https://developer.apple.com/documentation/appkit/nsapplication/shared) to your subclass rather than directly to `NSApplication`. If you create your app in Xcode, you can accomplish this by setting your custom app class to be the principal class. In Xcode, double-click the app target in the Groups and Files list to open the Info window for the target. Then display the Properties pane of the window and replace “NSApplication” in the Principal Class field with the name of your custom class. The `NSApplicationMain` function sends [`shared`](https://developer.apple.com/documentation/appkit/nsapplication/shared) to the principal class to obtain the global app instance (`NSApp`)—which in this case will be an instance of your custom subclass of `NSApplication`.
Important
Many AppKit classes rely on the `NSApplication` class and may not work properly until this class is fully initialized. As a result, you should not, for example, attempt to invoke methods of other AppKit classes from an initialization method of an `NSApplication` subclass.
#### [Methods to override](https://developer.apple.com/documentation/appkit/nsapplication#Methods-to-override)
Generally, you subclass `NSApplication` to provide your own special responses to messages that are routinely sent to the global app object (`NSApp`). `NSApplication` doesn’t have primitive methods in the sense of methods that you must override in your subclass. Here are four methods that are possible candidates for overriding:
  * Override [`run()`](https://developer.apple.com/documentation/appkit/nsapplication/run\(\)) if you want the app to manage the main event loop differently than it does by default. (This a critical and complex task, however, that you should only attempt with good reason).
  * Override [`sendEvent(_:)`](https://developer.apple.com/documentation/appkit/nsapplication/sendevent\(_:\)) if you want to change how events are dispatched or perform some special event processing.
  * Override [`requestUserAttention(_:)`](https://developer.apple.com/documentation/appkit/nsapplication/requestuserattention\(_:\)) if you want to modify how your app attracts the attention of the user (for example, offering an alternative to the bouncing app icon in the Dock).
  * Override [`target(forAction:)`](https://developer.apple.com/documentation/appkit/nsapplication/target\(foraction:\)) to substitute another object for the target of an action message.


#### [Special considerations](https://developer.apple.com/documentation/appkit/nsapplication#Special-considerations)
The global app object uses `@autorelease` blocks in its [`run()`](https://developer.apple.com/documentation/appkit/nsapplication/run\(\)) method; if you override this method, you’ll need to create your own `@autorelease` blocks.
Do not override [`shared`](https://developer.apple.com/documentation/appkit/nsapplication/shared). The default implementation, which is essential to app behavior, is too complex to duplicate on your own.
#### [Alternatives to subclassing](https://developer.apple.com/documentation/appkit/nsapplication#Alternatives-to-subclassing)
`NSApplication` defines numerous [Delegation](https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/Delegation.html#//apple_ref/doc/uid/TP40008195-CH14) methods that offer opportunities for modifying specific aspects of app behavior. Instead of making a custom subclass of `NSApplication`, your app delegate may be able to implement one or more of these methods to accomplish your design goals. In general, a better design than subclassing `NSApplication` is to put the code that expresses your app’s special behavior into one or more custom objects called controllers. Methods defined in your controllers can be invoked from a small dispatcher object without being closely tied to the global app object.
## [Topics](https://developer.apple.com/documentation/appkit/nsapplication#topics)
### [Getting the shared app object](https://developer.apple.com/documentation/appkit/nsapplication#Getting-the-shared-app-object)
[`class var shared: NSApplication`](https://developer.apple.com/documentation/appkit/nsapplication/shared)
Returns the application instance, creating it if it doesn’t exist yet.
[`var NSApp: NSApplication!`](https://developer.apple.com/documentation/appkit/nsapp)
The global variable for the shared app instance.
### [Managing the app’s behavior](https://developer.apple.com/documentation/appkit/nsapplication#Managing-the-apps-behavior)
[`var delegate: (any NSApplicationDelegate)?`](https://developer.apple.com/documentation/appkit/nsapplication/delegate)
The app delegate object.
[`protocol NSApplicationDelegate`](https://developer.apple.com/documentation/appkit/nsapplicationdelegate)
A set of methods that manage your app’s life cycle and its interaction with common system services.
### [Managing the event loop](https://developer.apple.com/documentation/appkit/nsapplication#Managing-the-event-loop)
[`func nextEvent(matching: NSEvent.EventTypeMask, until: Date?, inMode: RunLoop.Mode, dequeue: Bool) -> NSEvent?`](https://developer.apple.com/documentation/appkit/nsapplication/nextevent\(matching:until:inmode:dequeue:\))
Returns the next event matching a given mask, or `nil` if no such event is found before a specified expiration date.
[`func discardEvents(matching: NSEvent.EventTypeMask, before: NSEvent?)`](https://developer.apple.com/documentation/appkit/nsapplication/discardevents\(matching:before:\))
Removes all events matching the given mask and generated before the specified event.
[`var currentEvent: NSEvent?`](https://developer.apple.com/documentation/appkit/nsapplication/currentevent)
The last event object that the app retrieved from the event queue.
[`var isRunning: Bool`](https://developer.apple.com/documentation/appkit/nsapplication/isrunning)
A Boolean value indicating whether the main event loop is running.
[`func run()`](https://developer.apple.com/documentation/appkit/nsapplication/run\(\))
Starts the main event loop.
[`func finishLaunching()`](https://developer.apple.com/documentation/appkit/nsapplication/finishlaunching\(\))
Activates the app, opens any files specified by the `NSOpen` user default, and unhighlights the app’s icon.
[`func stop(Any?)`](https://developer.apple.com/documentation/appkit/nsapplication/stop\(_:\))
Stops the main event loop.
[`func sendEvent(NSEvent)`](https://developer.apple.com/documentation/appkit/nsapplication/sendevent\(_:\))
Dispatches an event to other objects.
[`func postEvent(NSEvent, atStart: Bool)`](https://developer.apple.com/documentation/appkit/nsapplication/postevent\(_:atstart:\))
Adds a given event to the receiver’s event queue.
### [Posting actions](https://developer.apple.com/documentation/appkit/nsapplication#Posting-actions)
[`func tryToPerform(Selector, with: Any?) -> Bool`](https://developer.apple.com/documentation/appkit/nsapplication/trytoperform\(_:with:\))
Dispatches an action message to the specified target.
[`func sendAction(Selector, to: Any?, from: Any?) -> Bool`](https://developer.apple.com/documentation/appkit/nsapplication/sendaction\(_:to:from:\))
Sends the given action message to the given target.
[`func target(forAction: Selector) -> Any?`](https://developer.apple.com/documentation/appkit/nsapplication/target\(foraction:\))
Returns the object that receives the action message specified by the given selector.
[`func target(forAction: Selector, to: Any?, from: Any?) -> Any?`](https://developer.apple.com/documentation/appkit/nsapplication/target\(foraction:to:from:\))
Searches for an object that can receive the message specified by the given selector.
### [Terminating the app](https://developer.apple.com/documentation/appkit/nsapplication#Terminating-the-app)
[`func terminate(Any?)`](https://developer.apple.com/documentation/appkit/nsapplication/terminate\(_:\))
Terminates the receiver.
[`func reply(toApplicationShouldTerminate: Bool)`](https://developer.apple.com/documentation/appkit/nsapplication/reply\(toapplicationshouldterminate:\))
Responds to `NSTerminateLater` once the app knows whether it can terminate.
### [Activating and deactivating the app](https://developer.apple.com/documentation/appkit/nsapplication#Activating-and-deactivating-the-app)
[Passing control from one app to another with cooperative activation](https://developer.apple.com/documentation/appkit/passing-control-from-one-app-to-another-with-cooperative-activation)
Request focus for your app, and coordinate passing control from one app to another.
[`func activate()`](https://developer.apple.com/documentation/appkit/nsapplication/activate\(\))
Activates the receiver app, if appropriate.
[`func deactivate()`](https://developer.apple.com/documentation/appkit/nsapplication/deactivate\(\))
Deactivates the receiver.
[`var isActive: Bool`](https://developer.apple.com/documentation/appkit/nsapplication/isactive)
A Boolean value indicating whether this is the active app.
[`func yieldActivation(to: NSRunningApplication)`](https://developer.apple.com/documentation/appkit/nsapplication/yieldactivation\(to:\))
Explicitly allows another app to make itself active.
[`func yieldActivation(toApplicationWithBundleIdentifier: String)`](https://developer.apple.com/documentation/appkit/nsapplication/yieldactivation\(toapplicationwithbundleidentifier:\))
Explicitly allows another app to make itself active.
[`struct ActivationOptions`](https://developer.apple.com/documentation/appkit/nsapplication/activationoptions)
The following flags are for [`activate(options:)`](https://developer.apple.com/documentation/appkit/nsrunningapplication/activate\(options:\)).
### [Managing relaunch on login](https://developer.apple.com/documentation/appkit/nsapplication#Managing-relaunch-on-login)
[`func disableRelaunchOnLogin()`](https://developer.apple.com/documentation/appkit/nsapplication/disablerelaunchonlogin\(\))
Disables relaunching the app on login.
[`func enableRelaunchOnLogin()`](https://developer.apple.com/documentation/appkit/nsapplication/enablerelaunchonlogin\(\))
Enables relaunching the app on login.
### [Managing remote notifications](https://developer.apple.com/documentation/appkit/nsapplication#Managing-remote-notifications)
[`func registerForRemoteNotifications()`](https://developer.apple.com/documentation/appkit/nsapplication/registerforremotenotifications\(\))
Register for notifications sent by Apple Push Notification service (APNs).
[`func unregisterForRemoteNotifications()`](https://developer.apple.com/documentation/appkit/nsapplication/unregisterforremotenotifications\(\))
Unregister for notifications received from Apple Push Notification service.
[`var enabledRemoteNotificationTypes: NSApplication.RemoteNotificationType`](https://developer.apple.com/documentation/appkit/nsapplication/enabledremotenotificationtypes)
The types of push notifications that the app accepts.
[`func registerForRemoteNotifications(matching: NSApplication.RemoteNotificationType)`](https://developer.apple.com/documentation/appkit/nsapplication/registerforremotenotifications\(matching:\))
Register to receive notifications of the specified types from a provider through the Apple Push Notification service.
[`var isRegisteredForRemoteNotifications: Bool`](https://developer.apple.com/documentation/appkit/nsapplication/isregisteredforremotenotifications)
A Boolean value indicating whether the app is registered with Apple Push Notification service (APNs).
[`struct RemoteNotificationType`](https://developer.apple.com/documentation/appkit/nsapplication/remotenotificationtype)
These constants determine whether apps launched by remote notifications display a badge.
### [Managing the app’s appearance](https://developer.apple.com/documentation/appkit/nsapplication#Managing-the-apps-appearance)
[`var appearance: NSAppearance?`](https://developer.apple.com/documentation/appkit/nsapplication/appearance)
The appearance associated with the app’s windows.
[`var effectiveAppearance: NSAppearance`](https://developer.apple.com/documentation/appkit/nsapplication/effectiveappearance)
The appearance that AppKit uses to draw the app’s interface.
[`var currentSystemPresentationOptions: NSApplication.PresentationOptions`](https://developer.apple.com/documentation/appkit/nsapplication/currentsystempresentationoptions)
The set of app presentation options that are currently in effect for the system.
[`var presentationOptions: NSApplication.PresentationOptions`](https://developer.apple.com/documentation/appkit/nsapplication/presentationoptions-swift.property)
The presentation options that should be in effect for the system when this app is active.
[`struct PresentationOptions`](https://developer.apple.com/documentation/appkit/nsapplication/presentationoptions-swift.struct)
Constants that control the presentation of the app, typically for fullscreen apps such as games or kiosks.
[`var applicationShouldSuppressHighDynamicRangeContent: Bool`](https://developer.apple.com/documentation/appkit/nsapplication/applicationshouldsuppresshighdynamicrangecontent)
A boolean value indicating whether your application should suppress HDR content based on established policy. Built-in AppKit components such as NSImageView will automatically behave correctly with HDR content. You should use this value in conjunction with notifications (`NSApplicationShouldBeginSuppressingHighDynamicRangeContentNotification` and `NSApplicationShouldEndSuppressingHighDynamicRangeContentNotification`) to suppress HDR content in your application when signaled to do so.
### [Managing windows, panels, and menus](https://developer.apple.com/documentation/appkit/nsapplication#Managing-windows-panels-and-menus)
[API Reference App Windows](https://developer.apple.com/documentation/appkit/app-windows)
Show, hide, minimize, arrange, and update your app’s windows.
[API Reference Modal Windows and Panels](https://developer.apple.com/documentation/appkit/modal-windows-and-panels)
Display a modal window or show one of the standard app panels, such as the app’s About panel.
[API Reference Menus](https://developer.apple.com/documentation/appkit/menus)
Access the app’s main menu items and update the window and services menus.
### [User interface layout direction](https://developer.apple.com/documentation/appkit/nsapplication#User-interface-layout-direction)
[`var userInterfaceLayoutDirection: NSUserInterfaceLayoutDirection`](https://developer.apple.com/documentation/appkit/nsapplication/userinterfacelayoutdirection)
The layout direction of the user interface.
[`enum NSUserInterfaceLayoutDirection`](https://developer.apple.com/documentation/appkit/nsuserinterfacelayoutdirection)
Specifies the directional flow of the user interface.
### [Accessing the dock tile](https://developer.apple.com/documentation/appkit/nsapplication#Accessing-the-dock-tile)
[`var dockTile: NSDockTile`](https://developer.apple.com/documentation/appkit/nsapplication/docktile)
The app’s Dock tile.
[`var applicationIconImage: NSImage!`](https://developer.apple.com/documentation/appkit/nsapplication/applicationiconimage)
The image used for the app’s icon.
### [Customizing the Touch Bar](https://developer.apple.com/documentation/appkit/nsapplication#Customizing-the-Touch-Bar)
[`func toggleTouchBarCustomizationPalette(Any?)`](https://developer.apple.com/documentation/appkit/nsapplication/toggletouchbarcustomizationpalette\(_:\))
Show or hides the interface for customizing the Touch Bar.
### [Managing user attention requests](https://developer.apple.com/documentation/appkit/nsapplication#Managing-user-attention-requests)
[`func requestUserAttention(NSApplication.RequestUserAttentionType) -> Int`](https://developer.apple.com/documentation/appkit/nsapplication/requestuserattention\(_:\))
Starts a user attention request.
[`enum RequestUserAttentionType`](https://developer.apple.com/documentation/appkit/nsapplication/requestuserattentiontype)
These constants specify the level of severity of a user attention request and are used by [`cancelUserAttentionRequest(_:)`](https://developer.apple.com/documentation/appkit/nsapplication/canceluserattentionrequest\(_:\)) and [`requestUserAttention(_:)`](https://developer.apple.com/documentation/appkit/nsapplication/requestuserattention\(_:\)).
[`func cancelUserAttentionRequest(Int)`](https://developer.apple.com/documentation/appkit/nsapplication/canceluserattentionrequest\(_:\))
Cancels a previous user attention request.
[`func reply(toOpenOrPrint: NSApplication.DelegateReply)`](https://developer.apple.com/documentation/appkit/nsapplication/reply\(toopenorprint:\))
Handles errors that might occur when the user attempts to open or print files.
[`enum DelegateReply`](https://developer.apple.com/documentation/appkit/nsapplication/delegatereply)
Constants that indicate whether a copy or print operation was successful, was canceled, or failed.
### [Providing help information](https://developer.apple.com/documentation/appkit/nsapplication#Providing-help-information)
[`func registerUserInterfaceItemSearchHandler(any NSUserInterfaceItemSearching)`](https://developer.apple.com/documentation/appkit/nsapplication/registeruserinterfaceitemsearchhandler\(_:\))
Register an object that provides help data to your app.
[`func searchString(String, inUserInterfaceItemString: String, range: NSRange, found: UnsafeMutablePointer<NSRange>?) -> Bool`](https://developer.apple.com/documentation/appkit/nsapplication/searchstring\(_:inuserinterfaceitemstring:range:found:\))
Searches for the string in the user interface.
[`func unregisterUserInterfaceItemSearchHandler(any NSUserInterfaceItemSearching)`](https://developer.apple.com/documentation/appkit/nsapplication/unregisteruserinterfaceitemsearchhandler\(_:\))
Unregister an object that provides help data to your app.
[`func showHelp(Any?)`](https://developer.apple.com/documentation/appkit/nsapplication/showhelp\(_:\))
If your project is properly registered, and the necessary keys have been set in the property list, this method launches Help Viewer and displays the first page of your app’s help book.
[`func activateContextHelpMode(Any?)`](https://developer.apple.com/documentation/appkit/nsapplication/activatecontexthelpmode\(_:\))
Places the receiver in context-sensitive help mode.
[`var helpMenu: NSMenu?`](https://developer.apple.com/documentation/appkit/nsapplication/helpmenu)
The help menu used by the app.
### [Providing services](https://developer.apple.com/documentation/appkit/nsapplication#Providing-services)
[`func validRequestor(forSendType: NSPasteboard.PasteboardType?, returnType: NSPasteboard.PasteboardType?) -> Any?`](https://developer.apple.com/documentation/appkit/nsapplication/validrequestor\(forsendtype:returntype:\))
Indicates whether the receiver can send and receive the specified pasteboard types.
[`var servicesProvider: Any?`](https://developer.apple.com/documentation/appkit/nsapplication/servicesprovider)
The object that provides the services the current app advertises in the Services menu of other apps.
### [Determining access to the keyboard](https://developer.apple.com/documentation/appkit/nsapplication#Determining-access-to-the-keyboard)
[`var isFullKeyboardAccessEnabled: Bool`](https://developer.apple.com/documentation/appkit/nsapplication/isfullkeyboardaccessenabled)
A Boolean value indicating whether Full Keyboard Access is enabled in the Keyboard preference pane.
### [Hiding apps](https://developer.apple.com/documentation/appkit/nsapplication#Hiding-apps)
[`func hideOtherApplications(Any?)`](https://developer.apple.com/documentation/appkit/nsapplication/hideotherapplications\(_:\))
Hides all apps, except the receiver.
[`func unhideAllApplications(Any?)`](https://developer.apple.com/documentation/appkit/nsapplication/unhideallapplications\(_:\))
Unhides all apps, including the receiver.
### [Managing threads](https://developer.apple.com/documentation/appkit/nsapplication#Managing-threads)
[`class func detachDrawingThread(Selector, toTarget: Any, with: Any?)`](https://developer.apple.com/documentation/appkit/nsapplication/detachdrawingthread\(_:totarget:with:\))
Creates and executes a new thread based on the specified target and selector.
### [Logging exceptions](https://developer.apple.com/documentation/appkit/nsapplication#Logging-exceptions)
[`func reportException(NSException)`](https://developer.apple.com/documentation/appkit/nsapplication/reportexception\(_:\))
Logs a given exception by calling `NSLog()`.
### [Configuring the activation policy](https://developer.apple.com/documentation/appkit/nsapplication#Configuring-the-activation-policy)
[`func activationPolicy() -> NSApplication.ActivationPolicy`](https://developer.apple.com/documentation/appkit/nsapplication/activationpolicy\(\))
Returns the app’s activation policy.
[`func setActivationPolicy(NSApplication.ActivationPolicy) -> Bool`](https://developer.apple.com/documentation/appkit/nsapplication/setactivationpolicy\(_:\))
Attempts to modify the app’s activation policy.
[`enum ActivationPolicy`](https://developer.apple.com/documentation/appkit/nsapplication/activationpolicy-swift.enum)
Activation policies (used by [`activationPolicy`](https://developer.apple.com/documentation/appkit/nsrunningapplication/activationpolicy)) that control whether and how an app may be activated.
### [Scripting your app](https://developer.apple.com/documentation/appkit/nsapplication#Scripting-your-app)
[`var orderedDocuments: [NSDocument]`](https://developer.apple.com/documentation/appkit/nsapplication/ordereddocuments)
An array of document objects arranged according to the front-to-back ordering of their associated windows.
[`var orderedWindows: [NSWindow]`](https://developer.apple.com/documentation/appkit/nsapplication/orderedwindows)
An array of window objects arranged according to their front-to-back ordering on the screen.
### [Notifications](https://developer.apple.com/documentation/appkit/nsapplication#Notifications)
These notifications apply to `NSApplication`. See Notifications in [`NSWorkspace`](https://developer.apple.com/documentation/appkit/nsworkspace) for additional, similar notifications.
[`class let didBecomeActiveNotification: NSNotification.Name`](https://developer.apple.com/documentation/appkit/nsapplication/didbecomeactivenotification)
Posted immediately after the app becomes active.
[`class let didChangeScreenParametersNotification: NSNotification.Name`](https://developer.apple.com/documentation/appkit/nsapplication/didchangescreenparametersnotification)
Posted when the configuration of the displays attached to the computer is changed.
[`class let didFinishLaunchingNotification: NSNotification.Name`](https://developer.apple.com/documentation/appkit/nsapplication/didfinishlaunchingnotification)
Posted at the end of the [`finishLaunching()`](https://developer.apple.com/documentation/appkit/nsapplication/finishlaunching\(\)) method to indicate that the app has completed launching and is ready to run.
[`class let didHideNotification: NSNotification.Name`](https://developer.apple.com/documentation/appkit/nsapplication/didhidenotification)
Posted at the end of the [`hide(_:)`](https://developer.apple.com/documentation/appkit/nsapplication/hide\(_:\)) method to indicate that the app is now hidden.
[`class let didResignActiveNotification: NSNotification.Name`](https://developer.apple.com/documentation/appkit/nsapplication/didresignactivenotification)
Posted immediately after the app gives up its active status to another app.
[`class let didUnhideNotification: NSNotification.Name`](https://developer.apple.com/documentation/appkit/nsapplication/didunhidenotification)
Posted at the end of the [`unhideWithoutActivation()`](https://developer.apple.com/documentation/appkit/nsapplication/unhidewithoutactivation\(\)) method to indicate that the app is now visible.
[`class let didUpdateNotification: NSNotification.Name`](https://developer.apple.com/documentation/appkit/nsapplication/didupdatenotification)
Posted at the end of the [`updateWindows()`](https://developer.apple.com/documentation/appkit/nsapplication/updatewindows\(\)) method to indicate that the app has finished updating its windows.
[`class let willBecomeActiveNotification: NSNotification.Name`](https://developer.apple.com/documentation/appkit/nsapplication/willbecomeactivenotification)
Posted immediately before the app becomes active.
[`class let willFinishLaunchingNotification: NSNotification.Name`](https://developer.apple.com/documentation/appkit/nsapplication/willfinishlaunchingnotification)
Posted at the start of the [`finishLaunching()`](https://developer.apple.com/documentation/appkit/nsapplication/finishlaunching\(\)) method to indicate that the app has completed its initialization process and is about to finish launching.
[`class let willHideNotification: NSNotification.Name`](https://developer.apple.com/documentation/appkit/nsapplication/willhidenotification)
Posted at the start of the [`hide(_:)`](https://developer.apple.com/documentation/appkit/nsapplication/hide\(_:\)) method to indicate that the app is about to be hidden.
[`class let willResignActiveNotification: NSNotification.Name`](https://developer.apple.com/documentation/appkit/nsapplication/willresignactivenotification)
Posted immediately before the app gives up its active status to another app.
[`class let willTerminateNotification: NSNotification.Name`](https://developer.apple.com/documentation/appkit/nsapplication/willterminatenotification)
Sends a notification to terminate the app.
[`class let willUnhideNotification: NSNotification.Name`](https://developer.apple.com/documentation/appkit/nsapplication/willunhidenotification)
Posted at the start of the [`unhideWithoutActivation()`](https://developer.apple.com/documentation/appkit/nsapplication/unhidewithoutactivation\(\)) method to indicate that the app is about to become visible.
[`class let willUpdateNotification: NSNotification.Name`](https://developer.apple.com/documentation/appkit/nsapplication/willupdatenotification)
Posted at the start of the [`updateWindows()`](https://developer.apple.com/documentation/appkit/nsapplication/updatewindows\(\)) method to indicate that the app is about to update its windows.
[`class let didFinishRestoringWindowsNotification: NSNotification.Name`](https://developer.apple.com/documentation/appkit/nsapplication/didfinishrestoringwindowsnotification)
Posted when the app has finished restoring windows.
[`class let didChangeOcclusionStateNotification: NSNotification.Name`](https://developer.apple.com/documentation/appkit/nsapplication/didchangeocclusionstatenotification)
Posted when the app’s occlusion state changes.
### [Loading Cocoa bundles](https://developer.apple.com/documentation/appkit/nsapplication#Loading-Cocoa-bundles)
[`static func loadApplication()`](https://developer.apple.com/documentation/appkit/nsapplication/loadapplication\(\))
### [Displaying high dynamic resolution (HDR) content](https://developer.apple.com/documentation/appkit/nsapplication#Displaying-high-dynamic-resolution-HDR-content)
[`var applicationShouldSuppressHighDynamicRangeContent: Bool`](https://developer.apple.com/documentation/appkit/nsapplication/applicationshouldsuppresshighdynamicrangecontent)
A boolean value indicating whether your application should suppress HDR content based on established policy. Built-in AppKit components such as NSImageView will automatically behave correctly with HDR content. You should use this value in conjunction with notifications (`NSApplicationShouldBeginSuppressingHighDynamicRangeContentNotification` and `NSApplicationShouldEndSuppressingHighDynamicRangeContentNotification`) to suppress HDR content in your application when signaled to do so.
[`struct ShouldBeginSuppressingHighDynamicRangeContent`](https://developer.apple.com/documentation/appkit/nsapplication/shouldbeginsuppressinghighdynamicrangecontent)
[`struct ShouldEndSuppressingHighDynamicRangeContent`](https://developer.apple.com/documentation/appkit/nsapplication/shouldendsuppressinghighdynamicrangecontent)
### [Deprecated](https://developer.apple.com/documentation/appkit/nsapplication#Deprecated)
Avoid using deprecated classes and protocols in your apps.
[API Reference Deprecated Symbols](https://developer.apple.com/documentation/appkit/nsapplication-deprecated-symbols)
Review symbols that are no longer supported, and find the replacements to use instead.
### [Instance Methods](https://developer.apple.com/documentation/appkit/nsapplication#Instance-Methods)
[`func addSceneRepresentation<C>(NSHostingSceneRepresentation<C>)`](https://developer.apple.com/documentation/appkit/nsapplication/addscenerepresentation\(_:\))
Adds the specified SwiftUI scene representation to the current application.
## [Relationships](https://developer.apple.com/documentation/appkit/nsapplication#relationships)
### [Inherits From](https://developer.apple.com/documentation/appkit/nsapplication#inherits-from)
  * [`NSResponder`](https://developer.apple.com/documentation/appkit/nsresponder)


### [Conforms To](https://developer.apple.com/documentation/appkit/nsapplication#conforms-to)
  * [`CVarArg`](https://developer.apple.com/documentation/Swift/CVarArg)
  * [`Copyable`](https://developer.apple.com/documentation/Swift/Copyable)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`NSAccessibilityElementProtocol`](https://developer.apple.com/documentation/appkit/nsaccessibilityelementprotocol)
  * [`NSAccessibilityProtocol`](https://developer.apple.com/documentation/appkit/nsaccessibilityprotocol)
  * [`NSAppearanceCustomization`](https://developer.apple.com/documentation/appkit/nsappearancecustomization)
  * [`NSCoding`](https://developer.apple.com/documentation/Foundation/NSCoding)
  * [`NSMenuItemValidation`](https://developer.apple.com/documentation/appkit/nsmenuitemvalidation)
  * [`NSObjectProtocol`](https://developer.apple.com/documentation/ObjectiveC/NSObjectProtocol)
  * [`NSStandardKeyBindingResponding`](https://developer.apple.com/documentation/appkit/nsstandardkeybindingresponding)
  * [`NSTouchBarProvider`](https://developer.apple.com/documentation/appkit/nstouchbarprovider)
  * [`NSUserActivityRestoring`](https://developer.apple.com/documentation/appkit/nsuseractivityrestoring)
  * [`NSUserInterfaceValidations`](https://developer.apple.com/documentation/appkit/nsuserinterfacevalidations)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)


## [See Also](https://developer.apple.com/documentation/appkit/nsapplication#see-also)
### [Life Cycle](https://developer.apple.com/documentation/appkit/nsapplication#Life-Cycle)
[`class NSRunningApplication`](https://developer.apple.com/documentation/appkit/nsrunningapplication)
An object that can manipulate and provide information for a single instance of an app.
[`protocol NSApplicationDelegate`](https://developer.apple.com/documentation/appkit/nsapplicationdelegate)
A set of methods that manage your app’s life cycle and its interaction with common system services.
[`func NSApplicationMain(Int32, UnsafeMutablePointer<UnsafeMutablePointer<CChar>?>) -> Int32`](https://developer.apple.com/documentation/appkit/nsapplicationmain\(_:_:\))
Called by the main function to create and run the application.
Current page is NSApplication 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2Fappkit%2Fnsapplication).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
