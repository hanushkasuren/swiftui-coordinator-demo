//
//  DeepLinkTests.swift
//  CoordinatorDemo
//
//  Created by Hanushka Suren on 29/09/2026.
//

import Testing
@testable import CoordinatorDemo

@MainActor
struct DeepLinkTests {
    @Test func deepLinkReplacesThePathInOneStep() {
        // Prepare
        let coordinator = Coordinator()
        coordinator.show(.settings)

        // When
        coordinator.path = [.itemDetail(id: 42), .editItem(id: 42)]

        // Then
        #expect(coordinator.path == [.itemDetail(id: 42), .editItem(id: 42)])
    }

    @Test func backOnAnEmptyPathDoesNothing() {
        // Prepare
        let coordinator = Coordinator()

        // When
        coordinator.back()

        // Then
        #expect(coordinator.path.isEmpty)
    }
}
