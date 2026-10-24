//
//  TabCoordinator.swift
//  CoordinatorProdDemo
//
//  Created by Hanushka Suren on 08/10/2026.
//

import Observation

enum AppTab: Hashable {
    case home
    case account
}

@MainActor
@Observable
final class TabCoordinator {
    var selectedTab: AppTab = .home
    var homePath: [Route] = []
    var accountPath: [Route] = []
    private(set) var isMainVisible = false

    @ObservationIgnored private var pendingLink: (routes: [Route], tab: AppTab)?

    private let onLogout: () -> Void

    init(onLogout: @escaping () -> Void) {
        self.onLogout = onLogout
    }

    func show(_ route: Route) {
        show(route, in: selectedTab)
    }

    func show(_ route: Route, in tab: AppTab) {
        selectedTab = tab
        switch tab {
        case .home:
            guard homePath.last != route else { return }
            homePath.append(route)
        case .account:
            guard accountPath.last != route else { return }
            accountPath.append(route)
        }
    }

    func back() {
        switch selectedTab {
        case .home:
            if !homePath.isEmpty { homePath.removeLast() }
        case .account:
            if !accountPath.isEmpty { accountPath.removeLast() }
        }
    }

    func backToRoot() {
        switch selectedTab {
        case .home:
            homePath.removeAll()
        case .account:
            accountPath.removeAll()
        }
    }
}

extension TabCoordinator {
    func logout() {
        selectedTab = .home
        homePath.removeAll()
        accountPath.removeAll()
        isMainVisible = false

        onLogout()
    }
}

extension TabCoordinator {
    func open(_ routes: [Route], in tab: AppTab) {
        guard isMainVisible else {
            pendingLink = (routes, tab)
            return
        }

        selectedTab = tab
        
        switch tab {
        case .home:
            homePath = routes
        case .account:
            accountPath = routes
        }
    }

    func mainDidAppear() {
        isMainVisible = true

        if let pendingLink {
            self.pendingLink = nil
            open(pendingLink.routes, in: pendingLink.tab)
        }
    }
}
