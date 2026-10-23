//
//  CoordinatorProdDemoApp.swift
//  CoordinatorProdDemo
//
//  Created by Hanushka Suren on 08/10/2026.
//

import SwiftUI

@main
struct CoordinatorProdDemoApp: App {
    @State private var root: RootCoordinator
    @State private var tabs: TabCoordinator

    private let repository: ItemRepository = LiveItemRepository()
    private let notifications: NotificationHandler

    init() {
        let root = RootCoordinator()

        // The tab coordinator reports logout up to its parent.
        // The weak capture means it can never keep the parent alive.
        let tabs = TabCoordinator(onLogout: { [weak root] in
            root?.didLogout()
        })

        _root = State(initialValue: root)
        _tabs = State(initialValue: tabs)

        notifications = NotificationHandler(tabs: tabs)
    }

    var body: some Scene {
        WindowGroup {
            RootView(root: root, tabs: tabs, repository: repository)
        }
    }
}
