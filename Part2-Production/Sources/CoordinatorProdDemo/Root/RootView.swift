//
//  RootView.swift
//  CoordinatorProdDemo
//
//  Created by Hanushka Suren on 08/10/2026.
//

import SwiftUI

struct RootView: View {
    let root: RootCoordinator
    let tabs: TabCoordinator
    let repository: ItemRepository

    var body: some View {
        switch root.screen {
        case .launch:
            LaunchView(onFinish: { isLoggedIn in
                root.finishLaunch(isLoggedIn: isLoggedIn)
            })
        case .login:
            LoginView(onLogin: { root.didLogin() })
        case .main:
            MainTabView(tabs: tabs, repository: repository)
        }
    }
}
