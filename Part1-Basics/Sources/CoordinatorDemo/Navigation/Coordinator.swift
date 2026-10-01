//
//  Coordinator.swift
//  CoordinatorDemo
//
//  Created by Hanushka Suren on 29/09/2026.
//

import SwiftUI

final class Coordinator: ObservableObject {
    @Published var path: [Route] = []

    func show(_ route: Route) {
        guard path.last != route else { return }
        path.append(route)
    }

    func back() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    func backToRoot() {
        path.removeAll()
    }
}
