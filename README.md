# SwiftUI Coordinator Demo

Companion demos for a two-part article series on the coordinator pattern in SwiftUI. Each part has its own small Xcode project, so you only open the one you are reading about.

## Part 1, The Basics

[`Part1-Basics`](Part1-Basics) builds a coordinator for a single `NavigationStack` in four steps. One object owns the navigation path, screens ask it to navigate instead of building the next screen themselves, and the navigation is covered by unit tests.

Article. Your SwiftUI Views Should Not Decide Where to Go Next. Meet the Coordinator. (link coming soon)

## Part 2, In Production

[`Part2-Production`](Part2-Production) scales the same idea to a real app shape with launch, login, onboarding, tabs and push notification deep links.

Coming soon.

## Requirements

- Xcode 16 or later
- iOS 16 or later
