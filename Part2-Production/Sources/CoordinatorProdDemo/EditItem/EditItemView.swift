//
//  EditItemView.swift
//  CoordinatorProdDemo
//
//  Created by Hanushka Suren on 08/10/2026.
//

import SwiftUI

struct EditItemView: View {
    @State private var viewModel: EditItemViewModel

    init(viewModel: EditItemViewModel) {
        _viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        Form {
            TextField("Name", text: $viewModel.name)

            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
            }

            Button("Save and Close") {
                Task { await viewModel.save() }
            }
            .disabled(viewModel.isSaving)

            Button("Cancel") {
                viewModel.cancel()
            }
        }
        .navigationTitle("Edit Item \(viewModel.id)")
    }
}
