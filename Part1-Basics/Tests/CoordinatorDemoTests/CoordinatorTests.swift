//
//  CoordinatorTests.swift
//  CoordinatorDemo
//
//  Created by Hanushka Suren on 29/09/2026.
//

import Testing
@testable import CoordinatorDemo

@MainActor
struct CoordinatorTests {
    @Test func backToRootClearsTheWholePath() {
        // Prepare
        let coordinator = Coordinator()
        coordinator.show(.itemDetail(id: 1))
        coordinator.show(.editItem(id: 1))

        // When
        coordinator.backToRoot()

        // Then
        #expect(coordinator.path.isEmpty)
    }

    @Test func showIgnoresTheSameRouteTwiceInARow() {
        // Prepare
        let coordinator = Coordinator()

        // When
        coordinator.show(.itemDetail(id: 1))
        coordinator.show(.itemDetail(id: 1))

        // Then
        #expect(coordinator.path == [.itemDetail(id: 1)])
    }

    @Test func backRemovesOnlyTheTopScreen() {
        // Prepare
        let coordinator = Coordinator()
        coordinator.show(.itemDetail(id: 1))
        coordinator.show(.editItem(id: 1))

        // When
        coordinator.back()

        // Then
        #expect(coordinator.path == [.itemDetail(id: 1)])
    }
}
