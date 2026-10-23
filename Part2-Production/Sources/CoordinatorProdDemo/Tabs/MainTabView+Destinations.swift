//
//  MainTabView+Destinations.swift
//  CoordinatorProdDemo
//
//  Created by Hanushka Suren on 08/10/2026.
//

import SwiftUI

extension MainTabView {
    @ViewBuilder
    func destination(for route: Route) -> some View {
        switch route {
        case let .itemDetail(id):
            ItemDetailView(
                id: id,
                onEdit: {
                    tabs.show(.editItem(id: id))
                }
            )
        case let .editItem(id):
            EditItemView(
                viewModel: EditItemViewModel(
                    id: id,
                    repository: repository,
                    onSaved: { tabs.backToRoot() },
                    onCancelled: { tabs.back() }
                )
            )
        case .settings:
            SettingsView()
        }
    }
}
