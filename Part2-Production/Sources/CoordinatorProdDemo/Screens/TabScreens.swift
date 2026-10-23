//
//  TabScreens.swift
//  CoordinatorProdDemo
//
//  Created by Hanushka Suren on 08/10/2026.
//

import SwiftUI

struct ItemListView: View {
    let onSelect: (_ id: Int) -> Void

    var body: some View {
        List(1...20, id: \.self) { id in
            Button("Item \(id)") {
                onSelect(id)
            }
        }
        .navigationTitle("Items")
    }
}

struct AccountView: View {
    let onSelectItem: (_ id: Int) -> Void
    let onSettings: () -> Void
    let onLogout: () -> Void

    var body: some View {
        List {
            Section {
                Button("Last Viewed Item") {
                    onSelectItem(7)
                }

                Button("Settings", action: onSettings)
            }

            Section {
                Button("Log Out", role: .destructive, action: onLogout)
            }
        }
        .navigationTitle("Account")
    }
}
