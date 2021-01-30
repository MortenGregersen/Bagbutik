// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Bagbutik",
    platforms: [
        .macOS(.v11),
        .iOS(.v13)
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
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.1"),
        .package(url: "https://github.com/SwiftGen/StencilSwiftKit", from: "2.7.2"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.46.2"),
        .package(url: "https://github.com/apple/swift-crypto", from: "1.1.3")
    ],
    targets: [
        .target(
            name: "Bagbutik",
            dependencies: [.product(name: "Crypto", package: "swift-crypto")]),
        .target(
            name: "BagbutikCLI",
            dependencies: [
                "Bagbutik",
                "BagbutikSpecDecoder",
                "BagbutikGenerator",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]),
        .target(
            name: "BagbutikGenerator",
            dependencies: ["BagbutikSpecDecoder", "StencilSwiftKit", "SwiftFormat"]),
        .target(
            name: "BagbutikSpecDecoder"),
        .testTarget(
            name: "BagbutikTests",
            dependencies: ["Bagbutik", .product(name: "Crypto", package: "swift-crypto")]),
        .testTarget(
            name: "BagbutikGeneratorTests",
            dependencies: ["BagbutikGenerator"],
            resources: [.copy("app-store-connect-openapi-spec.json")]),
        .testTarget(
            name: "BagbutikSpecDecoderTests",
            dependencies: ["BagbutikSpecDecoder"])
    ])
