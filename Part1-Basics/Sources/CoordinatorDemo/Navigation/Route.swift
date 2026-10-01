//
//  Route.swift
//  CoordinatorDemo
//
//  Created by Hanushka Suren on 29/09/2026.
//

import SwiftUI

enum Route: Hashable {
    case itemDetail(id: Int)
    case editItem(id: Int)
    case settings
}
