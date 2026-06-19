// swift-tools-version: 5.7

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "ClaudeCodeTutorial",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "ClaudeCodeTutorial",
            targets: ["AppModule"],
            bundleIdentifier: "com.claudecodetutorial.app",
            teamIdentifier: "",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .book),
            accentColor: .presetColor(.purple),
            supportedDeviceFamilies: [.pad, .phone],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown
            ],
            appCategory: .education
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "Sources"
        )
    ]
)
