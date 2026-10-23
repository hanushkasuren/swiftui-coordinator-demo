//
//  LiveItemRepository.swift
//  CoordinatorProdDemo
//
//  Created by Hanushka Suren on 08/10/2026.
//

import Foundation

/// Stands in for a network call. Saving takes half a second, and an empty
/// name fails, so you can see the edit screen stay put on an error.
struct LiveItemRepository: ItemRepository {
    struct EmptyNameError: Error {}

    func save(id: Int, name: String) async throws {
        try await Task.sleep(for: .milliseconds(500))

        if name.trimmingCharacters(in: .whitespaces).isEmpty {
            throw EmptyNameError()
        }
    }
}
