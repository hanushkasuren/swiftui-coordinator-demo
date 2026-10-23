//
//  NotificationHandler.swift
//  CoordinatorProdDemo
//
//  Created by Hanushka Suren on 23/10/2026.
//

import UserNotifications

/// Receives notification taps and hands them to the tab coordinator.
/// A tap on a closed app arrives before the tabs exist, and
/// `TabCoordinator.open(_:in:)` holds it until they appear.
@MainActor
final class NotificationHandler: NSObject, UNUserNotificationCenterDelegate {
    private let tabs: TabCoordinator

    init(tabs: TabCoordinator) {
        self.tabs = tabs

        super.init()

        UNUserNotificationCenter.current().delegate = self

        Task {
            _ = try? await UNUserNotificationCenter.current()
                .requestAuthorization(options: [.alert, .sound])
        }
    }

    /// Shows the banner even when the app is in the foreground.
    nonisolated func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.banner, .sound])
    }

    // The completion handler version is used on purpose. The async version
    // can finish off the main thread, which crashes when a notification is tapped.
    nonisolated func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        let userInfo = response.notification.request.content.userInfo
        let action = userInfo["action"] as? String
        let entityId = userInfo["entityId"] as? String

        Task { @MainActor in
            open(action: action, entityId: entityId)
            completionHandler()
        }
    }

    private func open(action: String?, entityId: String?) {
        guard let link = NotificationLink(action: action, entityId: entityId) else { return }
        tabs.open(link.route, in: link.tab)
    }
}
