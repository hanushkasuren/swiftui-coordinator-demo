//
//  RootScreens.swift
//  CoordinatorProdDemo
//
//  Created by Hanushka Suren on 08/10/2026.
//

import SwiftUI

struct LaunchView: View {
    let onFinish: (_ isLoggedIn: Bool) -> Void

    var body: some View {
        ProgressView()
            .task {
                // Stands in for checking a saved session. The demo always starts
                // logged out, so you can see a push notification wait through login.
                do {
                    try await Task.sleep(for: .seconds(1))
                } catch {
                    return
                }
                onFinish(false)
            }
    }
}

struct LoginView: View {
    let onLogin: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            Text("Welcome")
                .font(.largeTitle)
            Button("Sign In", action: onLogin)
                .buttonStyle(.borderedProminent)
        }
    }
}
