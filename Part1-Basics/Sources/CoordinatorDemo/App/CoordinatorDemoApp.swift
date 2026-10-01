//
//  CoordinatorDemoApp.swift
//  CoordinatorDemo
//
//  Created by Hanushka Suren on 29/09/2026.
//

import SwiftUI

@main
struct CoordinatorDemoApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}

struct RootView: View {
    @State private var coordinator = Coordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ItemListView()
                .navigationDestination(for: Route.self) { route in
                    destination(for: route)
                }
        }
        .environment(coordinator)
    }

    @ViewBuilder
    private func destination(for route: Route) -> some View {
        switch route {
        case let .itemDetail(id):
            ItemDetailView(id: id)
        case let .editItem(id):
            EditItemView(id: id)
        case .settings:
            SettingsView()
        }
    }
}
