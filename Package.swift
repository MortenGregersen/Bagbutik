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
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.2"),
        .package(url: "https://github.com/SwiftGen/StencilSwiftKit", from: "2.7.2"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.47.11"),
        .package(url: "https://github.com/apple/swift-crypto", from: "1.1.3")
    ],
    targets: [
        .target(
            name: "Bagbutik",
            dependencies: [.product(name: "Crypto", package: "swift-crypto")]),
        .testTarget(
            name: "BagbutikTests",
            dependencies: ["Bagbutik", .product(name: "Crypto", package: "swift-crypto")],
            resources: [.copy("test-private-key.p8")]),
        .executableTarget(
            name: "BagbutikCLI",
            dependencies: [
                "BagbutikGenerator",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
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
            dependencies: ["BagbutikStringExtensions"])
    ])
