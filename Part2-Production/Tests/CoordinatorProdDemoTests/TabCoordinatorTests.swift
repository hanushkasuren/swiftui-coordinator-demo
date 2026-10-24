//
//  TabCoordinatorTests.swift
//  CoordinatorProdDemo
//
//  Created by Hanushka Suren on 08/10/2026.
//

import Testing
@testable import CoordinatorProdDemo

@MainActor
struct TabCoordinatorTests {
    @Test func linkWaitsUntilTabsAppear() {
        // Given
        let tabs = TabCoordinator(onLogout: {})

        // When
        tabs.open([.itemDetail(id: 42), .editItem(id: 42)], in: .home)

        // Then
        #expect(tabs.homePath.isEmpty)

        // When
        tabs.mainDidAppear()

        // Then
        #expect(tabs.homePath == [.itemDetail(id: 42), .editItem(id: 42)])
    }

    @Test func linkOpensStraightAwayWhenTabsAreVisible() {
        // Given
        let tabs = TabCoordinator(onLogout: {})
        tabs.mainDidAppear()

        // When
        tabs.open([.settings], in: .account)

        // Then
        #expect(tabs.selectedTab == .account)
        #expect(tabs.accountPath == [.settings])
    }

    @Test func linkWaitsAgainAfterLogout() {
        // Given
        let tabs = TabCoordinator(onLogout: {})
        tabs.mainDidAppear()
        tabs.logout()

        // When
        tabs.open([.itemDetail(id: 42)], in: .home)

        // Then
        #expect(tabs.homePath.isEmpty)
    }

    @Test func linkReplacesWhatTheTabWasShowing() {
        // Given
        let tabs = TabCoordinator(onLogout: {})
        tabs.mainDidAppear()
        tabs.show(.itemDetail(id: 1), in: .home)
        tabs.show(.editItem(id: 1), in: .home)

        // When
        tabs.open([.itemDetail(id: 42), .editItem(id: 42)], in: .home)

        // Then
        #expect(tabs.homePath == [.itemDetail(id: 42), .editItem(id: 42)])
    }

    @Test func showPushesOntoTheSelectedTab() {
        // Given
        let tabs = TabCoordinator(onLogout: {})
        tabs.selectedTab = .account

        // When
        tabs.show(.itemDetail(id: 7))

        // Then
        #expect(tabs.accountPath == [.itemDetail(id: 7)])
        #expect(tabs.homePath.isEmpty)
    }

    @Test func showIgnoresTheSameRouteTwiceInARow() {
        // Given
        let tabs = TabCoordinator(onLogout: {})

        // When
        tabs.show(.itemDetail(id: 1))
        tabs.show(.itemDetail(id: 1))

        // Then
        #expect(tabs.homePath == [.itemDetail(id: 1)])
    }

    @Test func backRemovesOnlyTheTopScreenOfTheSelectedTab() {
        // Given
        let tabs = TabCoordinator(onLogout: {})
        tabs.show(.itemDetail(id: 1), in: .home)
        tabs.show(.itemDetail(id: 2), in: .account)
        tabs.show(.editItem(id: 2), in: .account)

        // When
        tabs.back()

        // Then
        #expect(tabs.accountPath == [.itemDetail(id: 2)])
        #expect(tabs.homePath == [.itemDetail(id: 1)])
    }

    @Test func backToRootClearsOnlyTheSelectedTab() {
        // Given
        let tabs = TabCoordinator(onLogout: {})
        tabs.show(.itemDetail(id: 1), in: .home)
        tabs.show(.itemDetail(id: 2), in: .account)
        tabs.show(.editItem(id: 2), in: .account)

        // When
        tabs.backToRoot()

        // Then
        #expect(tabs.accountPath.isEmpty)
        #expect(tabs.homePath == [.itemDetail(id: 1)])
    }

    @Test func logoutClearsEveryTabAndReportsUp() {
        // Given
        var didReportLogout = false
        let tabs = TabCoordinator(onLogout: { didReportLogout = true })
        tabs.show(.itemDetail(id: 1), in: .home)
        tabs.show(.settings, in: .account)

        // When
        tabs.logout()

        // Then
        #expect(didReportLogout)
        #expect(tabs.selectedTab == .home)
        #expect(tabs.homePath.isEmpty)
        #expect(tabs.accountPath.isEmpty)
    }
}
