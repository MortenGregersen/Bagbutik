<p align="center">
    <br />
    <img src="https://raw.githubusercontent.com/MortenGregersen/Bagbutik/main/Assets/Bagbutik-logo.png" max-width="90%" alt="Bagbutik" />
</p>

<p align="center">
    <b>Generated Swift code for the <a href="https://developer.apple.com/documentation/appstoreconnectapi">App Store Connect API</a> based on the official <a href="https://en.wikipedia.org/wiki/OpenAPI_Specification">OpenAPI spec</a>.</b>
    <br /><br />
    <a href="https://swiftpackageindex.com/MortenGregersen/Bagbutik"><img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FMortenGregersen%2FBagbutik%2Fbadge%3Ftype%3Dswift-versions" alt="Swift versions" /></a>
    <a href="https://swiftpackageindex.com/MortenGregersen/Bagbutik"><img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FMortenGregersen%2FBagbutik%2Fbadge%3Ftype%3Dplatforms" alt="Platforms" /></a>
    <br />
    <a href="https://github.com/MortenGregersen/Bagbutik/actions/workflows/ci.yml"><img src="https://github.com/MortenGregersen/Bagbutik/workflows/CI/badge.svg" alt="CI" /></a>
    <a href="https://bagbutik.dev"><img src="https://raw.githubusercontent.com/MortenGregersen/Bagbutik/gh-pages/badge.svg" alt="Documentation" /></a>
    <a href="https://codecov.io/gh/MortenGregersen/Bagbutik"><img src="https://codecov.io/gh/MortenGregersen/Bagbutik/branch/main/graph/badge.svg?token=oJZWL49t0G"/></a>
    <br />
    <a href="https://x.com/mortengregersen"><img src="https://img.shields.io/badge/%40mortengregersen-black?logo=x" alt="X (Twitter)" /></a>
    <a href="https://mastodon.social/@mortengregersen"><img src="https://img.shields.io/badge/%40mortengregersen-6364FF?logo=mastodon&logoColor=white" alt="Mastodon" /></a>
</p>

## What is Bagbutik?

**Bag·bu·tik** (noun) **[/ˈb̥a̝w-ˌb̥u-tiːk/](https://ipa-reader.com/?text=ˈb̥a̝w-ˌb̥u-ti%CB%90k&voice=Mads)** - _(Danish) A room behind a store_

Bagbutik is two things, a command line tool for generating Swift code, and a library with the generated code for the App Store Connect API. The command line tool decodes the official [OpenAPI spec](https://en.wikipedia.org/wiki/OpenAPI_Specification) for Apple's [App Store Connect API](https://developer.apple.com/documentation/appstoreconnectapi).

While generating the code, the command line tool also downloads the official documentation from [Apple's Documentation site for the App Store Connect API](https://developer.apple.com/documentation/appstoreconnectapi) and applies it to the generated code, so you can get documentation right in Xcode.

The command line tool is only needed, when Apple publishes a new version of the spec. A [GitHub Action](https://github.com/MortenGregersen/Bagbutik/actions/workflows/check-for-new-spec.yml) automatically checks for new versions of the spec and creates a pull request with the changes.

## How to use Bagbutik

Bagbutik uses JSON Web Tokens (JWT) for authorization. You obtain the required keys from your organization's App Store Connect account.

> See [Creating API Keys for App Store Connect API](https://developer.apple.com/documentation/appstoreconnectapi/creating_api_keys_for_app_store_connect_api) for how to create your keys.

Here is a basic example for fetching all bundle IDs for iOS apps including related profiles sorted by seed ID and the bundle ID itself descending.

```swift
import Bagbutik_Core
import Bagbutik_Provisioning

let service = BagbutikService(jwt: try .init(
    keyId: "P9M252746H",
    issuerId: "82067982-6b3b-4a48-be4f-5b10b373c5f2",
    privateKey: """
    -----BEGIN PRIVATE KEY-----
    MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgevZzL1gdAFr88hb2
    OF/2NxApJCzGCEDdfSp6VQO30hyhRANCAAQRWz+jn65BtOMvdyHKcvjBeBSDZH2r
    1RTwjmYSi9R/zpBnuQ4EiMnCqfMPWiZqB4QdbAd0E7oH50VpuZ1P087G
    -----END PRIVATE KEY-----
    """
))
let response = try await service.request(
    .listBundleIdsV1(filters: [.platform([.iOS])],
                     includes: [.profiles],
                     sorts: [.seedIdDescending, .idDescending])
)
print(response)
```

## How to get Bagbutik into a project

Bagbutik supports [Swift Package Manager](https://www.swift.org/package-manager) and the internal libraries used to generate the code is also managed by it.

The library of generated code actually consists of multiple libraries, to let the consumer only depend on the endpoints needed.
So to get Bagbutik, you need to decide which functionality you need.

In your `Package.swift` add Bagbutik as a dependency:

```swift
dependencies: [
    .package(url: "https://github.com/MortenGregersen/Bagbutik", from: "18.0.0"),
```

Then in `targets` add the libraries needed by your target:

```swift
targets: [
    .target(
        name: "Awesome",
        dependencies: [
            .product(name: "Bagbutik-AppStore", package: "Bagbutik"),
            .product(name: "Bagbutik-TestFlight", package: "Bagbutik"),
```

If all libraries are needed, the umbrella library `Bagbutik` can be used:

```swift
targets: [
    .target(
        name: "Awesome",
        dependencies: [
            .product(name: "Bagbutik", package: "Bagbutik"),
```

> Remember to replace the hyphen with an underscore when importing the libraries.
>
> When importing `Bagbutik-TestFlight` write: 
```swift
import Bagbutik_TestFlight
```

### `Bagbutik-Core`

The core library is `Bagbutik-Core` which contains the `BagbutikService`, the `JWT`, protocols and the general generated types like `ErrorResponse` and `PagingInformation`.

All other libraries depend on `Bagbutik-Core`. This is the only library which is documented on [Bagbutik.dev](https://bagbutik.dev), as the other libraries only contain types which are already [documented by Apple](https://developer.apple.com/documentation/appstoreconnectapi).

### `Bagbutik-Models`

Because the models from the API are used from many different endpoints, they are all located in `Bagbutik-Models`. All libraries with endpoints depend on `Bagbutik-Models`.

### `Bagbutik-<API-Area>`

The endpoints of all the areas of the App Store Connect API are located in different libraries with a describing name.

Right now there are 9 libraries with endpoints:

* `Bagbutik-AppStore`: Manage all [aspects of your app, App Clips, in-app purchases, and customer reviews in the App Store](https://developer.apple.com/documentation/appstoreconnectapi/app_store).
* `Bagbutik-GameCenter`: Manage [Game Center data and configurations for your apps](https://developer.apple.com/documentation/appstoreconnectapi/game_center).
* `Bagbutik-Marketplaces`: Manage [keys, packages, and search for the marketplace distribution of your app](https://developer.apple.com/documentation/appstoreconnectapi/game_center).
* `Bagbutik-Provisioning`: Manage the [bundle IDs](https://developer.apple.com/documentation/appstoreconnectapi/bundle_ids), [certificates](https://developer.apple.com/documentation/appstoreconnectapi/certificates), [devices](https://developer.apple.com/documentation/appstoreconnectapi/devices) and [provisioning profiles](https://developer.apple.com/documentation/appstoreconnectapi/profiles) for your app.
* `Bagbutik-Reporting`: Download your [sales and financial reports](https://developer.apple.com/documentation/appstoreconnectapi/sales_and_finance_reports) and [get power and performance metrics, logs, and signatures](https://developer.apple.com/documentation/appstoreconnectapi/power_and_performance_metrics_and_logs). 
* `Bagbutik-TestFlight`: Manage your [beta testing program, including beta testers and groups, apps, App Clips, and builds](https://developer.apple.com/documentation/appstoreconnectapi/prerelease_versions_and_beta_testers).
* `Bagbutik-Users`: Manage [users](https://developer.apple.com/documentation/appstoreconnectapi/users) and [email invitations to join](https://developer.apple.com/documentation/appstoreconnectapi/user_invitations) your App Store Connect team.
* `Bagbutik-Webhooks`: Manage [notifications](https://developer.apple.com/documentation/appstoreconnectapi/webhook-notifications) from App Store about your apps and their statuses.
* `Bagbutik-XcodeCloud`: Automate [reading Xcode Cloud data, managing workflows, and starting builds](https://developer.apple.com/documentation/appstoreconnectapi/xcode_cloud_workflows_and_builds).

## Manual patches applied to OpenAPI Spec

The OpenAPI Spec provided by Apple do not always align with the data received from the API. Whenever such mismatches are identified, feedback is submitted to Apple and a patch is applied. Whenever an issue is resolved, the patch is removed again.

### Currently open feedback and applied patches

#### **FB8977648**: The "BundleIdPlatform" schema is missing "UNIVERSAL" and "SERVICES"

* Submitted: January 21st 2021.
* Updated: October 14th 2022 - the type "SERVICES" is also missing.
* Partly resolved: November 12th 2024 (Spec version 3.7) - "UNIVERSAL" added.

**Title:** App Store Connect API is missing the "UNIVERSAL" type for the BundleIdPlatform schema

##### Description

In the OpenAPI spec for the App Store Connect API the "BundleIdPlatform" schema is said to only be "IOS" or "MAC_OS". This is not right as universal apps (iOS and macOS) has a "UNIVERSAL" platform.

#### **FB12292035**: ErrorResponse.Errors has required optional "detail" and no "associatedErrors" in "meta"

* Submitted: June 9th 2023.

In Apple's OpenAPI spec the `detail` property on `ErrorResponse.Errors` is marked as `required`.
On 12/1/23 some errors (with status code 409) has been observed, with no `detail`.

In Apple's OpenAPI spec and documentation the `associatedErrors` is not mentioned in `meta` property (last checked 12/1/23).
But it is observed when creating a `ReviewSubmissionItem` with an `AppStoreVersion` fails.

#### **FB16699896**: App Store Connect API is missing "XKS" (Kosovo) for the TerritoryCode enum

* Submitted: March 3rd, 2025.

In the OpenAPI spec (and documentation) for the App Store Connect API the “TerritoryCode” schema is said to not include "XKS” (Kosovo). This is not right as the “Territories” endpoint returns a “XKS” `TerritoryCode`. Nominations as well can have "XKS" as a `supportedTerritory`.

#### **FB16908301**: App Store Connect API Spec is missing list of possible "PurchaseRequirement" on AppEvent

* Submitted: March 17th, 2025.

In the OpenAPI spec (and documentation) for the App Store Connect API the `purchaseRequirement` property on the “AppEvent” schema is a string. As a consumer of the API, we don’t know the possible values of this could be. After doing some research, it looks like there are two options `NO_COST_ASSOCIATED` and `IN_APP_PURCHASE`.

### Closed feedback (removed patches)

* **FB9963088**: The xcodeMetrics schema has no properties or attributes in the OpenAPI spec
  * Submitted: March 21st 2022.
  * Resolved: July 12th 2022 (Spec version 2.0).

* **FB10029609**: Required 'links' property missing on included BuildBundle
  * Submitted: May 27th 2022.
  * Resolved: At least since May 23rd 2023.

* **FB13071298**: App Store Connect API Spec is missing "VISION_OS" type for the Platform schema
  * Submitted: August 28th 2023.
  * Resolved: January 25th 2024 (Spec version 3.2).

* **FB13539766**: App Store Connect API Spec is missing "APP_APPLE_VISION_PRO" type for the Screenshot Display Type schema
  * Submitted: January 14th 2024.
  * Resolved: January 25th 2024 (Spec version 3.2).
  
* **FB13540097**: Almost all of the schemas ending in “WithoutIncludesResponse” has wrong "data" type
  * Submitted: January 14th 2024.
  * Resolved: July 11th 2024 (Spec version 3.5).

* **FB13701181**: App Store Connect API Spec is missing "DEVELOPER_ID_APPLICATION_G2" type for the Certificate Type schema
  * Submitted: March 28th 2024.
  * Resolved: November 12th 2024 (Spec version 3.7).

* **FB15681740**: App Store Connect API Spec is missing "APPLE_VISION_PRO" type for the Device class type schema
  * Submitted: November 4th 2024.
  * Resolved: June 10th 2025 (Spec version 4.0).

* **FB17874677**: The "AgeRatingDeclaration.Attributes" properties is missing the values "INFREQUENT_OR_MILD" and "FREQUENT_OR_INTENSE"
  * Submitted: June 10th 2025.
  * Resolved: October 9th 2025 (Spec version 4.1).

* **FB17925890**: The "ageRatingOverride" property of "AgeRatingDeclaration.Attributes" is missing
  * Submitted: June 11th 2025.
  * Resolved: October 9th 2025 (Spec version 4.1).

* **FB17932433**: The "totalNumberOfCodes" property of "SubscriptionOfferCode.Attributes" is missing
  * Submitted: June 11th 2025.
  * Resolved: October 9th 2025 (Spec version 4.1).
