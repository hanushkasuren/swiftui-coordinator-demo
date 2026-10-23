# Part 2, In Production

A runnable SwiftUI project that grows the single coordinator from Part 1 into the shape of a production app.

- `RootCoordinator` replaces the top-level screen across launch, login and the main app, so login never sits in the back history
- `TabCoordinator` keeps one navigation path per tab and pushes onto the tab the user is on
- A push notification tapped while the app is closed waits until the tabs are on screen, then opens through the same code as a button tap
- Logging out clears every tab and reports up to the root coordinator through a closure
- Screens never call a coordinator. Simple screens take closures, and `EditItemViewModel` reports back through callbacks after it saves

## Requirements

- Xcode 16 or later
- iOS 17 or later, for the `@Observable` macro

## Run it

1. Open `CoordinatorProdDemo.xcodeproj` in Xcode.
2. Pick any iPhone simulator and run with Cmd+R. Allow notifications when asked.
3. Run the tests with Cmd+U.

## What to try

The app always starts logged out, so tap Sign In after the launch screen.

On Account, tap Last Viewed Item. The item opens on the Account tab, not on Home, because `show(_:)` pushes onto the selected tab.

Open any item and tap Edit. Save and Close with an empty name and the screen stays put with an error. Type a name and Save and Close goes back to the first screen of the tab, while Cancel goes back one screen.

Tap Log Out on Account. Every tab is cleared and the app goes back to login.

## Push notifications in the simulator

The `Pushes` folder has two sample notifications. They target the bundle identifier `com.example.CoordinatorProdDemo`, so change `Simulator Target Bundle` in both files if yours is different.

Send one by dragging the file onto the running simulator, or from Terminal inside the `Part2-Production` folder.

```
xcrun simctl push booted com.example.CoordinatorProdDemo Pushes/item-updated.apns
```

To see a notification wait for the tabs, stop the app in Xcode, send `item-updated.apns` and tap the notification. The app starts on the launch screen, goes to login, and only opens item 42 on the Home tab after you sign in.

`settings-reminder.apns` opens Settings on the Account tab.
