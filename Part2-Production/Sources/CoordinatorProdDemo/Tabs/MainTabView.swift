//
//  MainTabView.swift
//  CoordinatorProdDemo
//
//  Created by Hanushka Suren on 08/10/2026.
//

import SwiftUI

struct MainTabView: View {
    @Bindable var tabs: TabCoordinator
    let repository: ItemRepository

    var body: some View {
        TabView(selection: $tabs.selectedTab) {
            NavigationStack(path: $tabs.homePath) {
                ItemListView(
                    onSelect: { id in
                        tabs.show(.itemDetail(id: id))
                    }
                )
                .navigationDestination(for: Route.self) { route in
                    destination(for: route)
                }
            }
            .tabItem { Label("Home", systemImage: "house") }
            .tag(AppTab.home)

            NavigationStack(path: $tabs.accountPath) {
                AccountView(
                    onSelectItem: { id in
                        tabs.show(.itemDetail(id: id))
                    },
                    onSettings: { tabs.show(.settings) },
                    onLogout: { tabs.logout() }
                )
                .navigationDestination(for: Route.self) { route in
                    destination(for: route)
                }
            }
            .tabItem { Label("Account", systemImage: "person") }
            .tag(AppTab.account)
        }
        .onAppear {
            tabs.mainDidAppear()
        }
    }
}
