//
//  EditItemViewModelTests.swift
//  CoordinatorProdDemo
//
//  Created by Hanushka Suren on 08/10/2026.
//

import Testing
@testable import CoordinatorProdDemo

struct FailingRepository: ItemRepository {
    struct Failure: Error {}

    func save(id: Int, name: String) async throws {
        throw Failure()
    }
}

struct SucceedingRepository: ItemRepository {
    func save(id: Int, name: String) async throws {}
}

@MainActor
struct EditItemViewModelTests {
    @Test func failedSaveStaysOnScreen() async {
        // Given
        var didSave = false
        let viewModel = EditItemViewModel(id: 1,
                                          repository: FailingRepository(),
                                          onSaved: { didSave = true },
                                          onCancelled: {})

        // When
        await viewModel.save()

        // Then
        #expect(!didSave)
        #expect(viewModel.errorMessage != nil)
    }

    @Test func successfulSaveReportsSaved() async {
        // Given
        var didSave = false
        let viewModel = EditItemViewModel(id: 1,
                                          repository: SucceedingRepository(),
                                          onSaved: { didSave = true },
                                          onCancelled: {})

        // When
        await viewModel.save()

        // Then
        #expect(didSave)
        #expect(viewModel.errorMessage == nil)
        #expect(!viewModel.isSaving)
    }

    @Test func cancelReportsCancelled() {
        // Given
        var didCancel = false
        let viewModel = EditItemViewModel(id: 1,
                                          repository: SucceedingRepository(),
                                          onSaved: {},
                                          onCancelled: { didCancel = true })

        // When
        viewModel.cancel()

        // Then
        #expect(didCancel)
    }
}
