# Example of using skip (https://skip.tools) with the native setting for the UI and LocalModel and transpiled for the Firebase module


# SkipNFirebaseUI

This is a [Skip](https://skip.tools) dual-platform app project.
It builds a native app for both iOS and Android.

## Custom setup required as of 5/5/2025

Look at the Package.swift take note of  "swiftLanguageModes: [.v5]" this is required for the bridging to work.
Add plugins: [.plugin(name: "skipstone", package: "skip")]) to the last module
Add .package(url: "https://source.skip.tools/skip-firebase.git", "0.0.0"..<"2.0.0")


Look at the skip.yml located in Sources -> FireplaceModel -> Skip notice 
skip:
  mode: 'transpiled'
  bridging: true
  
Look at FireplaceModel.swift  located in Sources -> FireplaceModel notice that the entire file needs to be wrapped with

" #if !SKIP_BRIDGE  "

" #endif  "

General Firebase setup

Replace the GoogleService-Info.plist and the google-services.json files with you own
Add "id("com.google.gms.google-services") version "4.4.2" apply true" to Android -> app -> build.gradle.kts
Add import skip.firebase.core.FirebaseApp to Android -> app -> src -> main ->kotlin -> Main.kt
Also add FirebaseApp.configure() to onCreate like so
       override fun onCreate() {
        super.onCreate()
        logger.info("starting app")
        ProcessInfo.launch(applicationContext)
        FirebaseApp.configure()
    }


## Building

This project is both a stand-alone Swift Package Manager module,
as well as an Xcode project that builds and transpiles the project
into a Kotlin Gradle project for Android using the Skip plugin.

Building the module requires that Skip be installed using
[Homebrew](https://brew.sh) with `brew install skiptools/skip/skip`.

This will also install the necessary transpiler prerequisites:
Kotlin, Gradle, and the Android build tools.

Installation prerequisites can be confirmed by running `skip checkup`.

## Testing

The module can be tested using the standard `swift test` command
or by running the test target for the macOS destination in Xcode,
which will run the Swift tests as well as the transpiled
Kotlin JUnit tests in the Robolectric Android simulation environment.

Parity testing can be performed with `skip test`,
which will output a table of the test results for both platforms.

## Running

Xcode and Android Studio must be downloaded and installed in order to
run the app in the iOS simulator / Android emulator.
An Android emulator must already be running, which can be launched from
Android Studio's Device Manager.

To run both the Swift and Kotlin apps simultaneously,
launch the SkipNFirebaseUI target from Xcode.
A build phases runs the "Launch Android APK" script that
will deploy the transpiled app a running Android emulator or connected device.
Logging output for the iOS app can be viewed in the Xcode console, and in
Android Studio's logcat tab for the transpiled Kotlin app.
