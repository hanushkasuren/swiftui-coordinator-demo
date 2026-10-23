//
//  DetailScreens.swift
//  CoordinatorProdDemo
//
//  Created by Hanushka Suren on 08/10/2026.
//

import SwiftUI

struct ItemDetailView: View {
    let id: Int
    let onEdit: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Text("Item \(id)")
                .font(.largeTitle)
            Button("Edit", action: onEdit)
        }
        .navigationTitle("Detail")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings")
            .navigationTitle("Settings")
    }
}
