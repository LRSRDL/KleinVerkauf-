// swift-tools-version: 6.0

// Swift-Playgrounds-App-Paket. Öffnen auf dem iPad mit Swift Playgrounds,
// auf dem Mac mit Xcode. Die Tests laufen über KleinVerkauf.xcodeproj im Repo-Wurzelordner.

import AppleProductTypes
import PackageDescription

let package = Package(
    name: "KleinVerkauf",
    platforms: [
        .iOS("18.0")
    ],
    products: [
        .iOSApplication(
            name: "KleinVerkauf",
            targets: ["AppModule"],
            bundleIdentifier: "de.lrsrdl.kleinverkauf",
            displayVersion: "0.1",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .box),
            accentColor: .presetColor(.blue),
            supportedDeviceFamilies: [
                .pad,
                .phone,
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad])),
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "App"
        )
    ],
    swiftLanguageModes: [.v6]
)
