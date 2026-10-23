//
//  NotificationLinkTests.swift
//  CoordinatorProdDemo
//
//  Created by Hanushka Suren on 08/10/2026.
//

import Testing
@testable import CoordinatorProdDemo

struct NotificationLinkTests {
    @Test func itemUpdatedOpensTheItemOnHome() {
        // When
        let link = NotificationLink(action: "item_updated", entityId: "42")

        // Then
        #expect(link?.route == .itemDetail(id: 42))
        #expect(link?.tab == .home)
    }

    @Test func settingsReminderOpensSettingsOnAccount() {
        // When
        let link = NotificationLink(action: "settings_reminder", entityId: nil)

        // Then
        #expect(link?.route == .settings)
        #expect(link?.tab == .account)
    }

    @Test func itemUpdatedWithoutAnIdIsIgnored() {
        // When
        let link = NotificationLink(action: "item_updated", entityId: nil)

        // Then
        #expect(link == nil)
    }

    @Test func unknownActionIsIgnored() {
        // When
        let link = NotificationLink(action: "something_new", entityId: "42")

        // Then
        #expect(link == nil)
    }
}
