# SwiftUI Coordinator Demo

Two small SwiftUI projects that show the coordinator pattern, from a single navigation stack to the shape of a production app. Each part has its own Xcode project, so you only open the one you need.

## Part 1, The Basics

[`Part1-Basics`](Part1-Basics) builds a coordinator for a single `NavigationStack` in four steps. One object owns the navigation path, screens ask it to navigate instead of building the next screen themselves, and the navigation is covered by unit tests.

## Part 2, In Production

[`Part2-Production`](Part2-Production) grows the same idea into a real app shape. A root coordinator swaps between launch, login and the main app, a tab coordinator keeps one path per tab, push notifications wait until the tabs are on screen, and screens report back through closures and view model callbacks instead of calling a coordinator.

## Requirements

- Xcode 16 or later
- iOS 17 or later
