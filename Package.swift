// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "Bagbutik",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v8)
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
            // type: .dynamic, // Uncommented automatically when building XCFrameworks
            targets: ["Bagbutik-Core"]
        ),
        .library(
            // All models used by the endpoints.
            name: "Bagbutik-Models",
            // type: .dynamic, // Uncommented automatically when building XCFrameworks
            targets: ["Bagbutik-Models"]
        ),
        .library(
            name: "Bagbutik-AppStore",
            // type: .dynamic, // Uncommented automatically when building XCFrameworks
            targets: ["Bagbutik-AppStore"]
        ),
        .library(
            name: "Bagbutik-GameCenter",
            // type: .dynamic, // Uncommented automatically when building XCFrameworks
            targets: ["Bagbutik-GameCenter"]
        ),
        .library(
            name: "Bagbutik-Marketplaces",
            // type: .dynamic, // Uncommented automatically when building XCFrameworks
            targets: ["Bagbutik-Marketplaces"]
        ),
        .library(
            name: "Bagbutik-Provisioning",
            // type: .dynamic, // Uncommented automatically when building XCFrameworks
            targets: ["Bagbutik-Provisioning"]
        ),
        .library(
            name: "Bagbutik-Reporting",
            // type: .dynamic, // Uncommented automatically when building XCFrameworks
            targets: ["Bagbutik-Reporting"]
        ),
        .library(
            name: "Bagbutik-TestFlight",
            // type: .dynamic, // Uncommented automatically when building XCFrameworks
            targets: ["Bagbutik-TestFlight"]
        ),
        .library(
            name: "Bagbutik-Users",
            // type: .dynamic, // Uncommented automatically when building XCFrameworks
            targets: ["Bagbutik-Users"]
        ),
        .library(
            name: "Bagbutik-Webhooks",
            // type: .dynamic, // Uncommented automatically when building XCFrameworks
            targets: ["Bagbutik-Webhooks"]
        ),
        .library(
            name: "Bagbutik-XcodeCloud",
            // type: .dynamic, // Uncommented automatically when building XCFrameworks
            targets: ["Bagbutik-XcodeCloud"]
        ),
        .executable(
            name: "bagbutik-cli",
            targets: ["BagbutikCLI"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.1"),
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
        .executableTarget(
            name: "BagbutikCLI",
            dependencies: [
                "BagbutikGenerator",
                "BagbutikDocsCollector",
                .target(name: "BagbutikPolyfill", condition: .when(platforms: [.linux, .android])),
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),
        // Internal targets
        .target(
            name: "BagbutikGenerator",
            dependencies: [
                "BagbutikDocsCollector",
                "BagbutikSpecDecoder",
                "BagbutikStringExtensions"
            ]
        ),
        .target(name: "BagbutikDocsCollector", dependencies: [
            "BagbutikSpecDecoder",
            .target(name: "BagbutikPolyfill", condition: .when(platforms: [.linux, .android]))
        ]),
        .target(name: "BagbutikSpecDecoder", dependencies: ["BagbutikStringExtensions"]),
        .target(name: "BagbutikStringExtensions"),
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
        .testTarget(name: "BagbutikGeneratorTests", dependencies: ["BagbutikGenerator"]),
        .testTarget(name: "BagbutikDocsCollectorTests", dependencies: ["BagbutikDocsCollector"]),
        .testTarget(name: "BagbutikSpecDecoderTests", dependencies: ["BagbutikSpecDecoder"]),
        .testTarget(name: "BagbutikStringExtensionsTests", dependencies: ["BagbutikStringExtensions"]),
    ],
    swiftLanguageVersions: [.v5, .version("6")]
)

