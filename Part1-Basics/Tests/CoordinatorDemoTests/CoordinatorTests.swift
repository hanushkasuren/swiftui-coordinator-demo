//
//  CoordinatorTests.swift
//  CoordinatorDemo
//
//  Created by Hanushka Suren on 29/09/2026.
//

import XCTest
@testable import CoordinatorDemo

final class CoordinatorTests: XCTestCase {
    func test_backToRoot_clearsTheWholePath() {
        // Prepare
        let coordinator = Coordinator()
        coordinator.show(.itemDetail(id: 1))
        coordinator.show(.editItem(id: 1))

        // When
        coordinator.backToRoot()

        // Then
        XCTAssertTrue(coordinator.path.isEmpty)
    }

    func test_show_ignoresTheSameRouteTwiceInARow() {
        // Prepare
        let coordinator = Coordinator()

        // When
        coordinator.show(.itemDetail(id: 1))
        coordinator.show(.itemDetail(id: 1))

        // Then
        XCTAssertEqual(coordinator.path, [.itemDetail(id: 1)])
    }

    func test_back_removesOnlyTheTopScreen() {
        // Prepare
        let coordinator = Coordinator()
        coordinator.show(.itemDetail(id: 1))
        coordinator.show(.editItem(id: 1))

        // When
        coordinator.back()

        // Then
        XCTAssertEqual(coordinator.path, [.itemDetail(id: 1)])
    }
}
