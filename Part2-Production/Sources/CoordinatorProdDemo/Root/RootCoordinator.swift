//
//  RootCoordinator.swift
//  CoordinatorProdDemo
//
//  Created by Hanushka Suren on 08/10/2026.
//

import Observation

enum RootScreen {
    case launch
    case login
    case main
}

@MainActor
@Observable
final class RootCoordinator {
    private(set) var screen: RootScreen = .launch

    func finishLaunch(isLoggedIn: Bool) {
        screen = isLoggedIn ? .main : .login
    }

    func didLogin() {
        screen = .main
    }

    func didLogout() {
        screen = .login
    }
}
