// swift-tools-version:5.5

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
            name: "Bagbutik",
            targets: [
                "Bagbutik-Core",
                "Bagbutik-Models",
                "Bagbutik-AppStore",
                "Bagbutik-Provisioning",
                "Bagbutik-Reporting",
                "Bagbutik-TestFlight",
                "Bagbutik-Users",
                "Bagbutik-XcodeCloud",
            ]),
        .library(
            name: "Bagbutik-Core",
            targets: ["Bagbutik-Core"]),
        .library(
            name: "Bagbutik-Models",
            targets: ["Bagbutik-Models"]),
        .library(
            name: "Bagbutik-AppStore",
            targets: ["Bagbutik-AppStore"]),
        .library(
            name: "Bagbutik-Provisioning",
            targets: ["Bagbutik-Provisioning"]),
        .library(
            name: "Bagbutik-Reporting",
            targets: ["Bagbutik-Reporting"]),
        .library(
            name: "Bagbutik-TestFlight",
            targets: ["Bagbutik-TestFlight"]),
        .library(
            name: "Bagbutik-Users",
            targets: ["Bagbutik-Users"]),
        .library(
            name: "Bagbutik-XcodeCloud",
            targets: ["Bagbutik-XcodeCloud"]),
        .executable(
            name: "bagbutik-cli",
            targets: ["BagbutikCLI"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.1.0"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.48.17"),
        .package(url: "https://github.com/apple/swift-crypto", from: "2.0.0"),
        .package(url: "https://github.com/marmelroy/Zip.git", from: "2.1.2"),
    ],
    targets: [
        .target(name: "Bagbutik-Core", dependencies: [
            .product(name: "Crypto", package: "swift-crypto", condition: .when(platforms: [.linux])),
            .target(name: "system-zlib", condition: .when(platforms: [.linux])),
            .target(name: "BagbutikPolyfill", condition: .when(platforms: [.linux]))
        ]),
        .target(name: "Bagbutik-Models", dependencies: ["Bagbutik-Core"]),
        .target(name: "Bagbutik-AppStore", dependencies: ["Bagbutik-Core", "Bagbutik-Models"]),
        .target(name: "Bagbutik-Provisioning", dependencies: ["Bagbutik-Core", "Bagbutik-Models"]),
        .target(name: "Bagbutik-Reporting", dependencies: ["Bagbutik-Core", "Bagbutik-Models"]),
        .target(name: "Bagbutik-TestFlight", dependencies: ["Bagbutik-Core", "Bagbutik-Models"]),
        .target(name: "Bagbutik-Users", dependencies: ["Bagbutik-Core", "Bagbutik-Models"]),
        .target(name: "Bagbutik-XcodeCloud", dependencies: ["Bagbutik-Core", "Bagbutik-Models"]),
        .executableTarget(
            name: "BagbutikCLI",
            dependencies: [
                "BagbutikGenerator",
                "BagbutikDocsCollector",
                .target(name: "BagbutikPolyfill", condition: .when(platforms: [.linux])),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "Zip"
            ]),
        // Internal targets
        .target(
            name: "BagbutikGenerator",
            dependencies: [
                "BagbutikDocsCollector",
                "BagbutikSpecDecoder",
                "BagbutikStringExtensions",
                "SwiftFormat"
            ]),
        .target(name: "BagbutikDocsCollector", dependencies: [
            "BagbutikSpecDecoder",
            .target(name: "BagbutikPolyfill", condition: .when(platforms: [.linux]))
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
                .product(name: "Crypto", package: "swift-crypto", condition: .when(platforms: [.linux]))
            ],
            resources: [.copy("test-private-key.p8")]),
        .testTarget(name: "Bagbutik-ModelsTests", dependencies: ["Bagbutik-Models"]),
        .testTarget(name: "BagbutikGeneratorTests", dependencies: ["BagbutikGenerator"]),
        .testTarget(name: "BagbutikDocsCollectorTests", dependencies: ["BagbutikDocsCollector"]),
        .testTarget(name: "BagbutikSpecDecoderTests", dependencies: ["BagbutikSpecDecoder"]),
        .testTarget(name: "BagbutikStringExtensionsTests", dependencies: ["BagbutikStringExtensions"]),
    ])
