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
            targets: ["Bagbutik"]),
        .executable(
            name: "BagbutikCLI",
            targets: ["BagbutikCLI"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.1"),
        .package(url: "https://github.com/SwiftGen/StencilSwiftKit", from: "2.8.0"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.48.17"),
        .package(url: "https://github.com/apple/swift-crypto", from: "2.0.0"),
        .package(url: "https://github.com/marmelroy/Zip.git", from: "2.1.2")
    ],
    targets: [
        .target(
            name: "Bagbutik",
            dependencies: [
                .product(name: "Crypto", package: "swift-crypto", condition: .when(platforms: [.linux])),
                .target(name: "system-zlib", condition: .when(platforms: [.linux])),
                "BagbutikPolyfill"
            ]),
        .target(name: "system-zlib"),
        .testTarget(
            name: "BagbutikTests",
            dependencies: [
                "Bagbutik",
                .product(name: "Crypto", package: "swift-crypto", condition: .when(platforms: [.linux]))
            ],
            resources: [.copy("test-private-key.p8")]),
        .executableTarget(
            name: "BagbutikCLI",
            dependencies: [
                "BagbutikGenerator",
                "BagbutikPolyfill",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "Zip"
            ]),
        .target(
            name: "BagbutikGenerator",
            dependencies: ["BagbutikSpecDecoder", "BagbutikStringExtensions", "StencilSwiftKit", "SwiftFormat"]),
        .testTarget(
            name: "BagbutikGeneratorTests",
            dependencies: ["BagbutikGenerator"]),
        .target(
            name: "BagbutikSpecDecoder",
            dependencies: ["BagbutikStringExtensions"]),
        .testTarget(
            name: "BagbutikSpecDecoderTests",
            dependencies: ["BagbutikSpecDecoder"]),
        .target(
            name: "BagbutikStringExtensions"),
        .testTarget(
            name: "BagbutikStringExtensionsTests",
            dependencies: ["BagbutikStringExtensions"]),
        .target(name: "BagbutikPolyfill")
    ])
