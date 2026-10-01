//
//  Screens.swift
//  CoordinatorDemo
//
//  Created by Hanushka Suren on 29/09/2026.
//

import SwiftUI

struct ItemListView: View {
    @Environment(Coordinator.self) private var coordinator

    var body: some View {
        List(1...20, id: \.self) { id in
            Button("Item \(id)") {
                coordinator.show(.itemDetail(id: id))
            }
        }
        .navigationTitle("Items")
        .toolbar {
            Button("Settings", systemImage: "gear") {
                coordinator.show(.settings)
            }
        }
    }
}

struct ItemDetailView: View {
    @Environment(Coordinator.self) private var coordinator
    let id: Int

    var body: some View {
        VStack(spacing: 16) {
            Text("Item \(id)")
                .font(.largeTitle)
            Button("Edit") {
                coordinator.show(.editItem(id: id))
            }
        }
        .navigationTitle("Detail")
    }
}

struct EditItemView: View {
    @Environment(Coordinator.self) private var coordinator
    let id: Int

    var body: some View {
        Button("Save and Close") {
            coordinator.backToRoot()
        }
        .navigationTitle("Edit Item \(id)")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings")
            .navigationTitle("Settings")
    }
}
