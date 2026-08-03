// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "Bagbutik",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v9),
        .visionOS(.v1)
    ],
    products: [
        .library(
            // Includes all targets. Each target still needs to be imported in code.
            name: "Bagbutik",
            targets: [
                "Bagbutik-Core",
                "Bagbutik-Models",
                "Bagbutik-AppStore",
                "Bagbutik-GameCenter",
                "Bagbutik-Marketplaces",
                "Bagbutik-Provisioning",
                "Bagbutik-Reporting",
                "Bagbutik-TestFlight",
                "Bagbutik-Users",
                "Bagbutik-Webhooks",
                "Bagbutik-XcodeCloud",
            ]
        ),
        .library(
            // Has the core features like the service, JWT and general models.
            name: "Bagbutik-Core",
            targets: ["Bagbutik-Core"]
        ),
        .library(
            // All models used by the endpoints.
            name: "Bagbutik-Models",
            targets: ["Bagbutik-Models"]
        ),
        .library(
            name: "Bagbutik-AppStore",
            targets: ["Bagbutik-AppStore"]
        ),
        .library(
            name: "Bagbutik-GameCenter",
            targets: ["Bagbutik-GameCenter"]
        ),
        .library(
            name: "Bagbutik-Marketplaces",
            targets: ["Bagbutik-Marketplaces"]
        ),
        .library(
            name: "Bagbutik-Provisioning",
            targets: ["Bagbutik-Provisioning"]
        ),
        .library(
            name: "Bagbutik-Reporting",
            targets: ["Bagbutik-Reporting"]
        ),
        .library(
            name: "Bagbutik-TestFlight",
            targets: ["Bagbutik-TestFlight"]
        ),
        .library(
            name: "Bagbutik-Users",
            targets: ["Bagbutik-Users"]
        ),
        .library(
            name: "Bagbutik-Webhooks",
            targets: ["Bagbutik-Webhooks"]
        ),
        .library(
            name: "Bagbutik-XcodeCloud",
            targets: ["Bagbutik-XcodeCloud"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-crypto", from: "3.12.3"),
    ],
    targets: [
        .target(name: "Bagbutik-Core", dependencies: [
            .product(name: "Crypto", package: "swift-crypto", condition: .when(platforms: [.linux, .android])),
            .target(name: "system-zlib", condition: .when(platforms: [.linux, .android])),
            .target(name: "BagbutikPolyfill", condition: .when(platforms: [.linux, .android]))
        ]),
        .target(name: "Bagbutik-Models", dependencies: ["Bagbutik-Core"]),
        .target(name: "Bagbutik-AppStore", dependencies: ["Bagbutik-Core", "Bagbutik-Models"]),
        .target(name: "Bagbutik-GameCenter", dependencies: ["Bagbutik-Core", "Bagbutik-Models"]),
        .target(name: "Bagbutik-Marketplaces", dependencies: ["Bagbutik-Core", "Bagbutik-Models"]),
        .target(name: "Bagbutik-Provisioning", dependencies: ["Bagbutik-Core", "Bagbutik-Models"]),
        .target(name: "Bagbutik-Reporting", dependencies: ["Bagbutik-Core", "Bagbutik-Models"]),
        .target(name: "Bagbutik-TestFlight", dependencies: ["Bagbutik-Core", "Bagbutik-Models"]),
        .target(name: "Bagbutik-Users", dependencies: ["Bagbutik-Core", "Bagbutik-Models"]),
        .target(name: "Bagbutik-Webhooks", dependencies: ["Bagbutik-Core", "Bagbutik-Models"]),
        .target(name: "Bagbutik-XcodeCloud", dependencies: ["Bagbutik-Core", "Bagbutik-Models"]),
        .target(name: "BagbutikPolyfill"),
        .target(name: "system-zlib"),
        // Test targets
        .testTarget(
            name: "Bagbutik-CoreTests",
            dependencies: [
                "Bagbutik-Core",
                "Bagbutik-AppStore",
                .product(name: "Crypto", package: "swift-crypto", condition: .when(platforms: [.linux, .android]))
            ],
            resources: [.copy("test-private-key.p8")]
        ),
        .testTarget(name: "Bagbutik-ModelsTests", dependencies: ["Bagbutik-Models"]),
    ],
    swiftLanguageModes: [.v5, .v6]
)
