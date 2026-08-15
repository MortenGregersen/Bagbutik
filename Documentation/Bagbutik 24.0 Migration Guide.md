# Migrating to Bagbutik 24

Bagbutik 24 introduces modular products and clean Swift module names. This is an intentional breaking change for source and binary consumers.

## Select the products your target uses

For the smallest source build, add each public API product needed by the target. Each product includes `BagbutikCore` and its required generated model modules. For example, an app that manages bundle IDs selects `BagbutikProvisioning`.

```swift
.target(
    name: "AppStoreClient",
    dependencies: [
        .product(name: "BagbutikProvisioning", package: "Bagbutik"),
    ]
)
```

Import the API product and `BagbutikCore` in Swift source:

```swift
import BagbutikCore
import BagbutikProvisioning
```

## Replace product and import names

| Earlier product and import | Version 24 product and import |
| --- | --- |
| `Bagbutik-Core`, `import Bagbutik_Core` | `BagbutikCore`, `import BagbutikCore` |
| `Bagbutik-Models`, `import Bagbutik_Models` | No single replacement. See generated model imports below. |
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

The `Bagbutik-Models` product and `import Bagbutik_Models` are removed. There is no single replacement because models are grouped by API domain. Most applications should import `BagbutikCore` and the endpoint product only. When application code directly uses a generated model type that is not exposed through an endpoint, import the matching `Bagbutik<Domain>Models` module.

The source package no longer provides compatibility products for `Bagbutik-Core` or `Bagbutik-Models`. Update all imports and product dependencies before adopting version 24.

For example, direct use of a provisioning model requires:

```swift
import BagbutikProvisioningModels
```

## Source and binary distributions

The source and binary distributions expose the same modular product and module names. The source distribution also provides an optional, importable `Bagbutik` umbrella module for consumers who prefer one import over a selective build. The binary distribution does not provide that umbrella module.

To switch an existing target to the binary distribution, replace the source package dependency with:

```swift
.package(
    name: "Bagbutik",
    url: "https://github.com/MortenGregersen/Bagbutik-Binary",
    from: "24.0.0"
)
```

Keep the same selected product dependencies and imports. Choose one distribution for a target. Adding both would create duplicate Swift module names.
