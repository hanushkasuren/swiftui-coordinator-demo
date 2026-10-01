//
//  SelfNavigatingListView.swift
//  CoordinatorDemo
//
//  Created by Hanushka Suren on 29/09/2026.
//

import SwiftUI

// The "before" example from the article. A view that decides where to go next.
// Not used by the app, kept here for comparison.

struct SelfNavigatingListView: View {
    var body: some View {
        NavigationStack {
            List(1...20, id: \.self) { id in
                NavigationLink {
                    ItemDetailView(id: id)
                } label: {
                    Text("Item \(id)")
                }
            }
            .navigationTitle("Items")
        }
    }
}
