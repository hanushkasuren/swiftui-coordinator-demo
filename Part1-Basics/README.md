# SwiftUI Coordinator Demo

A small runnable project for the companion article, "Your SwiftUI Views Should Not Decide Where to Go Next. Meet the Coordinator."

It builds a coordinator for a single `NavigationStack` in four steps, exactly as the article does.

- `Route` describes every screen you can push as a case in a `Hashable` enum
- `Coordinator` owns the navigation path and exposes `show(_:)`, `back()` and `backToRoot()`
- `RootView` binds `NavigationStack(path:)` to the coordinator and maps each route to a screen in one place
- The screens ask the coordinator to navigate instead of building the next screen themselves

`Before/SelfNavigatingListView.swift` is the "before" example from the article, a list that decides where to go next with `NavigationLink`. The app does not use it.

## Requirements

- Xcode 16 or later
- iOS 16 or later

## Run it

1. Open `CoordinatorDemo.xcodeproj` in Xcode.
2. Pick any iPhone simulator and run with Cmd+R.

## What to try

Tap an item to open its detail screen, then tap Edit. Save and Close jumps straight back to the list with `backToRoot()`, even though it is two screens deep. The system back button and the swipe back gesture still work, because `NavigationStack` writes back into the coordinator's path when the user pops a screen.

If a row is tapped twice before the push finishes, only one detail screen is pushed. That is the duplicate guard in `show(_:)`.

## Tests

Run the tests with Cmd+U. They cover pushing, going back, returning to the root, ignoring duplicate taps, and replacing the whole path for a deep link. No UI is launched, because navigation is plain state.
