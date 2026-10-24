//
//  NotificationLink.swift
//  CoordinatorProdDemo
//
//  Created by Hanushka Suren on 08/10/2026.
//

/// Turns the custom keys of a push notification into the screens to open and the tab they open on.
/// Returns nil for actions this app does not handle.
struct NotificationLink: Equatable {
    let routes: [Route]
    let tab: AppTab

    init?(action: String?, entityId: String?) {
        switch action {
        case "item_updated":
            guard let id = entityId.flatMap({ Int($0) }) else { return nil }
            routes = [.itemDetail(id: id)]
            tab = .home
        case "edit_item":
            guard let id = entityId.flatMap({ Int($0) }) else { return nil }
            routes = [.itemDetail(id: id), .editItem(id: id)]
            tab = .home
        case "settings_reminder":
            routes = [.settings]
            tab = .account
        default:
            return nil
        }
    }
}
