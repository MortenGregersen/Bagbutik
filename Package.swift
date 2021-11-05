// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Bagbutik",
    platforms: [
        .macOS(.v11),
        .iOS(.v14)
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
        .package(url: "https://github.com/apple/swift-crypto", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "Bagbutik",
            dependencies: [.product(name: "Crypto", package: "swift-crypto")]),
        .testTarget(
            name: "BagbutikTests",
            dependencies: ["Bagbutik", .product(name: "Crypto", package: "swift-crypto")]),
        .target(
            name: "BagbutikCLI",
            dependencies: [
                "Bagbutik",
                "BagbutikGenerator",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]),
        .target(
            name: "BagbutikGenerator",
            dependencies: ["BagbutikSpecDecoder", "StencilSwiftKit", "SwiftFormat"]),
        .testTarget(
            name: "BagbutikGeneratorTests",
            dependencies: ["BagbutikGenerator"]),
        .target(
            name: "BagbutikSpecDecoder"),
        .testTarget(
            name: "BagbutikSpecDecoderTests",
            dependencies: ["BagbutikSpecDecoder"])
    ])
