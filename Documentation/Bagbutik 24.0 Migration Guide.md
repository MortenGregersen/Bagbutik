# Migrating to Bagbutik 24

Bagbutik 24 introduces modular products and clean Swift module names. This is an intentional breaking change for source and binary consumers.

## Select the products your target uses

The `Bagbutik` umbrella product no longer exists. Add `BagbutikCore` and each product needed by the target. For example, an app that manages bundle IDs selects `BagbutikCore` and `BagbutikProvisioning`.

```swift
.target(
    name: "AppStoreClient",
    dependencies: [
        .product(name: "BagbutikCore", package: "Bagbutik"),
        .product(name: "BagbutikProvisioning", package: "Bagbutik"),
    ]
)
```

## Replace product and import names

| Earlier product and import | Version 24 product and import |
| --- | --- |
| `Bagbutik-Core`, `import Bagbutik_Core` | `BagbutikCore`, `import BagbutikCore` |
| `Bagbutik-AppStore`, `import Bagbutik_AppStore` | `BagbutikAppStore`, `import BagbutikAppStore` |
| `Bagbutik-GameCenter`, `import Bagbutik_GameCenter` | `BagbutikGameCenter`, `import BagbutikGameCenter` |
| `Bagbutik-Marketplaces`, `import Bagbutik_Marketplaces` | `BagbutikMarketplaces`, `import BagbutikMarketplaces` |
| `Bagbutik-Provisioning`, `import Bagbutik_Provisioning` | `BagbutikProvisioning`, `import BagbutikProvisioning` |
| `Bagbutik-Reporting`, `import Bagbutik_Reporting` | `BagbutikReporting`, `import BagbutikReporting` |
| `Bagbutik-TestFlight`, `import Bagbutik_TestFlight` | `BagbutikTestFlight`, `import BagbutikTestFlight` |
| `Bagbutik-Users`, `import Bagbutik_Users` | `BagbutikUsers`, `import BagbutikUsers` |
| `Bagbutik-Webhooks`, `import Bagbutik_Webhooks` | `BagbutikWebhooks`, `import BagbutikWebhooks` |
| `Bagbutik-XcodeCloud`, `import Bagbutik_XcodeCloud` | `BagbutikXcodeCloud`, `import BagbutikXcodeCloud` |

## Generated model imports

`Bagbutik-Models` is replaced by model modules selected with each public product. Most applications should import `BagbutikCore` and the endpoint product only. When application code directly uses a generated model type that is not exposed through an endpoint, import the matching `Bagbutik<Domain>Models` module.

For example, direct use of a provisioning model requires:

```swift
import BagbutikProvisioningModels
```

## Source and binary distributions

The source and binary distributions expose the same public product and module names. Choose one distribution for a target. Adding both would create duplicate Swift module names.
