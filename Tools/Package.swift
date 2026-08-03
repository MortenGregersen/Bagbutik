// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "BagbutikTools",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(
            name: "bagbutik-cli",
            targets: ["BagbutikCLI"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.1")
    ],
    targets: [
        .executableTarget(
            name: "BagbutikCLI",
            dependencies: [
                "BagbutikGenerator",
                "BagbutikDocsCollector",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),
        .target(
            name: "BagbutikGenerator",
            dependencies: [
                "BagbutikDocsCollector",
                "BagbutikSpecDecoder",
                "BagbutikStringExtensions"
            ]
        ),
        .target(
            name: "BagbutikDocsCollector",
            dependencies: ["BagbutikSpecDecoder"]
        ),
        .target(
            name: "BagbutikSpecDecoder",
            dependencies: ["BagbutikStringExtensions"]
        ),
        .target(name: "BagbutikStringExtensions"),
        .testTarget(
            name: "BagbutikGeneratorTests",
            dependencies: ["BagbutikGenerator"]
        ),
        .testTarget(
            name: "BagbutikDocsCollectorTests",
            dependencies: ["BagbutikDocsCollector"]
        ),
        .testTarget(
            name: "BagbutikSpecDecoderTests",
            dependencies: ["BagbutikSpecDecoder"]
        ),
        .testTarget(
            name: "BagbutikStringExtensionsTests",
            dependencies: ["BagbutikStringExtensions"]
        )
    ],
    swiftLanguageModes: [.v5, .v6]
)
