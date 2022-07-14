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
            name: "bagbutik-cli",
            targets: ["BagbutikCLI"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.1.0"),
        .package(url: "https://github.com/SwiftGen/StencilSwiftKit", from: "2.8.0"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.48.17"),
        .package(url: "https://github.com/apple/swift-crypto", from: "2.0.0"),
        .package(url: "https://github.com/marmelroy/Zip.git", from: "2.1.2"),
    ],
    targets: [
        .target(
            name: "Bagbutik",
            dependencies: [
                .product(name: "Crypto", package: "swift-crypto", condition: .when(platforms: [.linux])),
                .target(name: "system-zlib", condition: .when(platforms: [.linux])),
                "BagbutikPolyfill"
            ]),
        .executableTarget(
            name: "BagbutikCLI",
            dependencies: [
                "BagbutikGenerator",
                "BagbutikDocsFetcher",
                "BagbutikPolyfill",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "Zip"
            ]),
        .target(
            name: "BagbutikGenerator",
            dependencies: [
                "BagbutikSpecDecoder",
                "BagbutikStringExtensions",
                "StencilSwiftKit",
                "SwiftFormat"
            ]),
        .target(name: "BagbutikDocsFetcher", dependencies: ["BagbutikSpecDecoder"]),
        .target(name: "BagbutikSpecDecoder", dependencies: ["BagbutikStringExtensions"]),
        .target(name: "BagbutikStringExtensions"),
        .target(name: "BagbutikPolyfill"),
        .target(name: "system-zlib"),
        .testTarget(
            name: "BagbutikTests",
            dependencies: [
                "Bagbutik",
                .product(name: "Crypto", package: "swift-crypto", condition: .when(platforms: [.linux]))
            ],
            resources: [.copy("test-private-key.p8")]),
        .testTarget(name: "BagbutikGeneratorTests", dependencies: ["BagbutikGenerator"]),
        .testTarget(name: "BagbutikSpecDecoderTests", dependencies: ["BagbutikSpecDecoder"]),
        .testTarget(name: "BagbutikStringExtensionsTests", dependencies: ["BagbutikStringExtensions"]),
    ])
