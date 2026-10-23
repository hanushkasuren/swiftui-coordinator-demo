//
//  NotificationLink.swift
//  CoordinatorProdDemo
//
//  Created by Hanushka Suren on 08/10/2026.
//

/// Turns the custom keys of a push notification into a route and the tab it opens on.
/// Returns nil for actions this app does not handle.
struct NotificationLink: Equatable {
    let route: Route
    let tab: AppTab

    init?(action: String?, entityId: String?) {
        switch action {
        case "item_updated":
            guard let id = entityId.flatMap({ Int($0) }) else { return nil }
            route = .itemDetail(id: id)
            tab = .home
        case "settings_reminder":
            route = .settings
            tab = .account
        default:
            return nil
        }
    }
}
