// swift-tools-version: 5.9
import AppleProductTypes
import PackageDescription

let package = Package(
    name: "aoc2023.swiftpm",
    platforms: [.iOS(.v17)],
    products: [
        .iOSApplication(
            name: "AdventOfCode",
            targets: ["AdventOfCode"],
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .star),
            accentColor: .presetColor(.green),
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
    dependencies: [
        .package(url: "https://github.com/apple/swift-collections", from: "1.0.0")
    ],
    targets: [
        .executableTarget(
            name: "AdventOfCode",
            dependencies: [
                .product(name: "Collections", package: "swift-collections")
            ],
            path: ".",
            resources: [.copy("Data")],
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals")
            ]
        )
    ]
)
