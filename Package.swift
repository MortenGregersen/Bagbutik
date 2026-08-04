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
            name: "BagbutikCore",
            targets: ["BagbutikCore"]
        ),
        .library(
            // Preserves the legacy module import while API products migrate.
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
            name: "BagbutikMarketplaces",
            targets: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikMarketplacesModels",
                "BagbutikMarketplaces",
            ]
        ),
        .library(
            name: "BagbutikProvisioning",
            targets: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikProvisioningModels",
                "BagbutikProvisioning",
            ]
        ),
        .library(
            name: "BagbutikReporting",
            targets: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikReportingModels",
                "BagbutikReporting",
            ]
        ),
        .library(
            name: "Bagbutik-TestFlight",
            targets: ["Bagbutik-TestFlight"]
        ),
        .library(
            name: "BagbutikUsers",
            targets: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikUsersModels",
                "BagbutikUsers",
            ]
        ),
        .library(
            name: "BagbutikWebhooks",
            targets: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikWebhooksModels",
                "BagbutikWebhooks",
            ]
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
        .target(
            name: "BagbutikCore",
            dependencies: [
                .product(name: "Crypto", package: "swift-crypto", condition: .when(platforms: [.linux, .android])),
                .target(name: "system-zlib", condition: .when(platforms: [.linux, .android]))
            ],
            path: "Sources/Bagbutik-Core"
        ),
        .target(
            name: "Bagbutik-Core",
            dependencies: ["BagbutikCore"],
            path: "Sources/Bagbutik-CoreCompatibility"
        ),
        .target(name: "BagbutikModelsShared", dependencies: ["BagbutikCore"]),
        .target(name: "BagbutikMarketplacesModels", dependencies: ["BagbutikCore", "BagbutikModelsShared"]),
        .target(name: "BagbutikProvisioningModels", dependencies: ["BagbutikCore", "BagbutikModelsShared"]),
        .target(name: "BagbutikReportingModels", dependencies: ["BagbutikCore", "BagbutikModelsShared"]),
        .target(name: "BagbutikUsersModels", dependencies: ["BagbutikCore", "BagbutikModelsShared"]),
        .target(name: "BagbutikWebhooksModels", dependencies: ["BagbutikCore", "BagbutikModelsShared"]),
        .target(
            name: "BagbutikMarketplaces",
            dependencies: ["BagbutikCore", "BagbutikModelsShared", "BagbutikMarketplacesModels"],
            path: "Sources/Bagbutik-Marketplaces"
        ),
        .target(
            name: "BagbutikProvisioning",
            dependencies: ["BagbutikCore", "BagbutikModelsShared", "BagbutikProvisioningModels"],
            path: "Sources/Bagbutik-Provisioning"
        ),
        .target(
            name: "BagbutikReporting",
            dependencies: ["BagbutikCore", "BagbutikModelsShared", "BagbutikReportingModels"],
            path: "Sources/Bagbutik-Reporting"
        ),
        .target(
            name: "BagbutikUsers",
            dependencies: ["BagbutikCore", "BagbutikModelsShared", "BagbutikUsersModels"],
            path: "Sources/Bagbutik-Users"
        ),
        .target(
            name: "Bagbutik-Models",
            dependencies: [
                "Bagbutik-Core",
                "BagbutikModelsShared",
                "BagbutikMarketplacesModels",
                "BagbutikProvisioningModels",
                "BagbutikReportingModels",
                "BagbutikUsersModels",
                "BagbutikWebhooksModels",
            ]
        ),
        .target(name: "Bagbutik-AppStore", dependencies: ["Bagbutik-Core", "Bagbutik-Models"]),
        .target(name: "Bagbutik-GameCenter", dependencies: ["Bagbutik-Core", "Bagbutik-Models"]),
        .target(name: "Bagbutik-TestFlight", dependencies: ["Bagbutik-Core", "Bagbutik-Models"]),
        .target(
            name: "BagbutikWebhooks",
            dependencies: ["BagbutikCore", "BagbutikModelsShared", "BagbutikWebhooksModels"],
            path: "Sources/Bagbutik-Webhooks"
        ),
        .target(name: "Bagbutik-XcodeCloud", dependencies: ["Bagbutik-Core", "Bagbutik-Models"]),
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
        .testTarget(
            name: "BagbutikMarketplacesIntegrationTests",
            dependencies: ["BagbutikCore", "BagbutikModelsShared", "BagbutikMarketplacesModels", "BagbutikMarketplaces"]
        ),
        .testTarget(
            name: "BagbutikProvisioningIntegrationTests",
            dependencies: ["BagbutikCore", "BagbutikModelsShared", "BagbutikProvisioningModels", "BagbutikProvisioning"]
        ),
        .testTarget(
            name: "BagbutikReportingIntegrationTests",
            dependencies: ["BagbutikCore", "BagbutikModelsShared", "BagbutikReportingModels", "BagbutikReporting"]
        ),
        .testTarget(
            name: "BagbutikUsersIntegrationTests",
            dependencies: ["BagbutikCore", "BagbutikModelsShared", "BagbutikUsersModels", "BagbutikUsers"]
        ),
        .testTarget(
            name: "BagbutikWebhooksIntegrationTests",
            dependencies: ["BagbutikCore", "BagbutikModelsShared", "BagbutikWebhooksModels", "BagbutikWebhooks"]
        ),
    ],
    swiftLanguageModes: [.v5, .v6]
)
