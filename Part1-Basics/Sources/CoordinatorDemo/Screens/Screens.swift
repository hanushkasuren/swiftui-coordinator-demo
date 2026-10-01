//
//  Screens.swift
//  CoordinatorDemo
//
//  Created by Hanushka Suren on 29/09/2026.
//

import SwiftUI

struct ItemListView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        List(1...20, id: \.self) { id in
            Button("Item \(id)") {
                coordinator.show(.itemDetail(id: id))
            }
        }
        .navigationTitle("Items")
        .toolbar {
            Button {
                coordinator.show(.settings)
            } label: {
                Label("Settings", systemImage: "gear")
            }
        }
    }
}

struct ItemDetailView: View {
    @EnvironmentObject private var coordinator: Coordinator
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
    @EnvironmentObject private var coordinator: Coordinator
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
