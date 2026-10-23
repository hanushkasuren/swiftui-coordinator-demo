//
//  EditItemViewModel.swift
//  CoordinatorProdDemo
//
//  Created by Hanushka Suren on 08/10/2026.
//

import Observation

protocol ItemRepository: Sendable {
    func save(id: Int, name: String) async throws
}

@MainActor
@Observable
final class EditItemViewModel {
    let id: Int
    var name = ""
    private(set) var isSaving = false
    private(set) var errorMessage: String?

    private let repository: ItemRepository
    private let onSaved: () -> Void
    private let onCancelled: () -> Void

    init(
        id: Int,
        repository: ItemRepository,
        onSaved: @escaping () -> Void,
        onCancelled: @escaping () -> Void
    ) {
        self.id = id
        self.repository = repository
        self.onSaved = onSaved
        self.onCancelled = onCancelled
    }

    func save() async {
        isSaving = true
        errorMessage = nil

        defer { isSaving = false }

        do {
            try await repository.save(id: id, name: name)
            onSaved()
        } catch {
            errorMessage = "Could not save. Please try again."
        }
    }

    func cancel() {
        onCancelled()
    }
}
