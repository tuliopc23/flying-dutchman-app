import Foundation

public enum AppUpdateRequests {
    public static let checkForUpdatesNotification = Notification.Name("AppUpdateRequests.checkForUpdates")

    public static func checkForUpdates() {
        NotificationCenter.default.post(name: checkForUpdatesNotification, object: nil)
    }
}
