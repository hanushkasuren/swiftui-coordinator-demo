//
//  RootCoordinatorTests.swift
//  CoordinatorProdDemo
//
//  Created by Hanushka Suren on 08/10/2026.
//

import Testing
@testable import CoordinatorProdDemo

@MainActor
struct RootCoordinatorTests {
    @Test func startsOnTheLaunchScreen() {
        // Given
        let root = RootCoordinator()

        // Then
        #expect(root.screen == .launch)
    }

    @Test func launchWithoutASessionGoesToLogin() {
        // Given
        let root = RootCoordinator()

        // When
        root.finishLaunch(isLoggedIn: false)

        // Then
        #expect(root.screen == .login)
    }

    @Test func launchWithASessionGoesStraightToMain() {
        // Given
        let root = RootCoordinator()

        // When
        root.finishLaunch(isLoggedIn: true)

        // Then
        #expect(root.screen == .main)
    }

    @Test func logoutAfterLoginGoesBackToLogin() {
        // Given
        let root = RootCoordinator()
        root.didLogin()

        // When
        root.didLogout()

        // Then
        #expect(root.screen == .login)
    }
}
