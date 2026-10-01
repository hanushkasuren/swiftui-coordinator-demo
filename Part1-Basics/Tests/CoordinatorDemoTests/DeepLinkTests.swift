//
//  DeepLinkTests.swift
//  CoordinatorDemo
//
//  Created by Hanushka Suren on 29/09/2026.
//

import XCTest
@testable import CoordinatorDemo

final class DeepLinkTests: XCTestCase {
    func test_deepLink_replacesThePathInOneStep() {
        // Prepare
        let coordinator = Coordinator()
        coordinator.show(.settings)

        // When
        coordinator.path = [.itemDetail(id: 42), .editItem(id: 42)]

        // Then
        XCTAssertEqual(coordinator.path, [.itemDetail(id: 42), .editItem(id: 42)])
    }

    func test_back_onAnEmptyPath_doesNothing() {
        // Prepare
        let coordinator = Coordinator()

        // When
        coordinator.back()

        // Then
        XCTAssertTrue(coordinator.path.isEmpty)
    }
}
