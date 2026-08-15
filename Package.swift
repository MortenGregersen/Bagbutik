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
            name: "Bagbutik",
            targets: ["Bagbutik"]
        ),
        .library(
            name: "BagbutikCore",
            targets: ["BagbutikCore"]
        ),
        .library(
            name: "BagbutikAppStore",
            targets: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikAppStoreModels",
                "BagbutikAppStore",
                "BagbutikMarketplacesModels",
                "BagbutikProvisioningModels",
                "BagbutikTestFlightModels",
                "BagbutikXcodeCloudModels",
            ]
        ),
        .library(
            name: "BagbutikGameCenter",
            targets: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikAppStoreModels",
                "BagbutikGameCenterModels",
                "BagbutikGameCenter",
                "BagbutikMarketplacesModels",
                "BagbutikProvisioningModels",
                "BagbutikTestFlightModels",
                "BagbutikXcodeCloudModels",
            ]
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
            name: "BagbutikTestFlight",
            targets: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikTestFlightModels",
                "BagbutikTestFlight",
            ]
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
            name: "BagbutikXcodeCloud",
            targets: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikProvisioningModels",
                "BagbutikXcodeCloudModels",
                "BagbutikXcodeCloud",
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-crypto", from: "3.12.3"),
        .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.5.0"),
    ],
    targets: [
        .target(
            name: "BagbutikCore",
            dependencies: [
                .product(name: "Crypto", package: "swift-crypto", condition: .when(platforms: [.linux, .android])),
                .target(name: "system-zlib", condition: .when(platforms: [.linux, .android]))
            ]
        ),
        .target(
            name: "Bagbutik",
            dependencies: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikAppStoreModels",
                "BagbutikAppStore",
                "BagbutikGameCenterModels",
                "BagbutikGameCenter",
                "BagbutikMarketplacesModels",
                "BagbutikMarketplaces",
                "BagbutikProvisioningModels",
                "BagbutikProvisioning",
                "BagbutikReportingModels",
                "BagbutikReporting",
                "BagbutikTestFlightModels",
                "BagbutikTestFlight",
                "BagbutikUsersModels",
                "BagbutikUsers",
                "BagbutikWebhooksModels",
                "BagbutikWebhooks",
                "BagbutikXcodeCloudModels",
                "BagbutikXcodeCloud",
            ]
        ),
        .target(name: "BagbutikModelsShared", dependencies: ["BagbutikCore"]),
        .target(
            name: "BagbutikAppStoreModels",
            dependencies: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikMarketplacesModels",
                "BagbutikTestFlightModels",
                "BagbutikXcodeCloudModels",
            ]
        ),
        .target(
            name: "BagbutikGameCenterModels",
            dependencies: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikAppStoreModels",
            ]
        ),
        .target(name: "BagbutikMarketplacesModels", dependencies: ["BagbutikCore", "BagbutikModelsShared"]),
        .target(name: "BagbutikProvisioningModels", dependencies: ["BagbutikCore", "BagbutikModelsShared"]),
        .target(name: "BagbutikReportingModels", dependencies: ["BagbutikCore", "BagbutikModelsShared"]),
        .target(
            name: "BagbutikTestFlightModels",
            dependencies: ["BagbutikCore", "BagbutikModelsShared"]
        ),
        .target(name: "BagbutikUsersModels", dependencies: ["BagbutikCore", "BagbutikModelsShared"]),
        .target(name: "BagbutikWebhooksModels", dependencies: ["BagbutikCore", "BagbutikModelsShared"]),
        .target(
            name: "BagbutikXcodeCloudModels",
            dependencies: ["BagbutikCore", "BagbutikModelsShared", "BagbutikProvisioningModels"]
        ),
        .target(
            name: "BagbutikMarketplaces",
            dependencies: ["BagbutikCore", "BagbutikModelsShared", "BagbutikMarketplacesModels"]
        ),
        .target(
            name: "BagbutikProvisioning",
            dependencies: ["BagbutikCore", "BagbutikModelsShared", "BagbutikProvisioningModels"]
        ),
        .target(
            name: "BagbutikReporting",
            dependencies: ["BagbutikCore", "BagbutikModelsShared", "BagbutikReportingModels"]
        ),
        .target(
            name: "BagbutikUsers",
            dependencies: ["BagbutikCore", "BagbutikModelsShared", "BagbutikUsersModels"]
        ),
        .target(
            name: "BagbutikAppStore",
            dependencies: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikAppStoreModels",
            ]
        ),
        .target(
            name: "BagbutikGameCenter",
            dependencies: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikGameCenterModels",
            ]
        ),
        .target(
            name: "BagbutikTestFlight",
            dependencies: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikTestFlightModels",
            ]
        ),
        .target(
            name: "BagbutikWebhooks",
            dependencies: ["BagbutikCore", "BagbutikModelsShared", "BagbutikWebhooksModels"]
        ),
        .target(
            name: "BagbutikXcodeCloud",
            dependencies: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikProvisioningModels",
                "BagbutikXcodeCloudModels",
            ]
        ),
        .target(name: "system-zlib"),
        // Test targets
        .testTarget(
            name: "BagbutikCoreTests",
            dependencies: [
                "BagbutikCore",
                "BagbutikAppStore",
                "BagbutikAppStoreModels",
                "BagbutikModelsShared",
                .product(name: "Crypto", package: "swift-crypto", condition: .when(platforms: [.linux, .android]))
            ],
            path: "Tests/Bagbutik-CoreTests",
            resources: [.copy("test-private-key.p8")]
        ),
        .testTarget(name: "BagbutikUmbrellaIntegrationTests", dependencies: ["Bagbutik"]),
        .testTarget(
            name: "BagbutikAppStoreIntegrationTests",
            dependencies: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikAppStoreModels",
                "BagbutikAppStore",
            ]
        ),
        .testTarget(
            name: "BagbutikGameCenterIntegrationTests",
            dependencies: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikAppStoreModels",
                "BagbutikGameCenterModels",
                "BagbutikGameCenter",
            ]
        ),
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
            name: "BagbutikTestFlightIntegrationTests",
            dependencies: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikTestFlightModels",
                "BagbutikTestFlight",
            ]
        ),
        .testTarget(
            name: "BagbutikUsersIntegrationTests",
            dependencies: ["BagbutikCore", "BagbutikModelsShared", "BagbutikUsersModels", "BagbutikUsers"]
        ),
        .testTarget(
            name: "BagbutikWebhooksIntegrationTests",
            dependencies: ["BagbutikCore", "BagbutikModelsShared", "BagbutikWebhooksModels", "BagbutikWebhooks"]
        ),
        .testTarget(
            name: "BagbutikXcodeCloudIntegrationTests",
            dependencies: [
                "BagbutikCore",
                "BagbutikModelsShared",
                "BagbutikProvisioningModels",
                "BagbutikXcodeCloudModels",
                "BagbutikXcodeCloud",
            ]
        ),
    ],
    swiftLanguageModes: [.v5, .v6]
)
