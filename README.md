<p align="center">
    <br />
    <img src="https://raw.githubusercontent.com/MortenGregersen/Bagbutik/main/Assets/Bagbutik-logo.png" max-width="90%" alt="Bagbutik" />
</p>

<p align="center">
    <b>Generated Swift code for the <a href="https://developer.apple.com/documentation/appstoreconnectapi">App Store Connect API</a> based on the official <a href="https://en.wikipedia.org/wiki/OpenAPI_Specification">OpenAPI spec</a>.</b>
    <br />
    <a href="https://swiftpackageindex.com/MortenGregersen/Bagbutik">
        <img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FMortenGregersen%2FBagbutik%2Fbadge%3Ftype%3Dswift-versions" alt="Swift versions" />
    </a>
    <a href="https://swiftpackageindex.com/MortenGregersen/Bagbutik">
        <img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FMortenGregersen%2FBagbutik%2Fbadge%3Ftype%3Dplatforms" alt="Platforms" />
    </a>
    <br />
    <a href="https://github.com/MortenGregersen/Bagbutik/actions/workflows/ci.yml">
        <img src="https://github.com/MortenGregersen/Bagbutik/workflows/CI/badge.svg" alt="CI" />
    </a>
    <a href="https://bagbutik.dev">
        <img src="https://raw.githubusercontent.com/MortenGregersen/Bagbutik/gh-pages/badge.svg" alt="Documentation" />
    </a>
    <a href="https://codecov.io/gh/MortenGregersen/Bagbutik">
        <img src="https://codecov.io/gh/MortenGregersen/Bagbutik/branch/main/graph/badge.svg?token=oJZWL49t0G"/>
    </a>
    <a href="https://twitter.com/mortengregersen">
        <img src="https://img.shields.io/badge/twitter-@mortengregersen-blue.svg?style=flat" alt="Twitter" />
    </a>
    <a href="https://twitter.com/mortengregersen">
        <img src="https://img.shields.io/badge/mastodon.social-@mortengregersen-blueviolet.svg?style=flat" alt="Mastodon" />
    </a>
</p>

## What is Bagbutik?

**Bag·bu·tik** (noun) **[/ˈb̥a̝w-ˌb̥u-tiːk/](http://ipa-reader.xyz/?text=ˈb̥a̝w-ˌb̥u-ti%CB%90k&voice=Amy)** - _(Danish) A room behind a store_

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
    .package(url: "https://github.com/MortenGregersen/Bagbutik", from: "3.0.0"),
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

Right now there are 6 libraries with endpoints:

* `Bagbutik-AppStore`: Manage all [aspects of your app, App Clips, in-app purchases, and customer reviews in the App Store](https://developer.apple.com/documentation/appstoreconnectapi/app_store).
* `Bagbutik-Provisioning`: Manage the [bundle IDs](https://developer.apple.com/documentation/appstoreconnectapi/bundle_ids), [certificates](https://developer.apple.com/documentation/appstoreconnectapi/certificates), [devices](https://developer.apple.com/documentation/appstoreconnectapi/devices) and [provisioning profiles](https://developer.apple.com/documentation/appstoreconnectapi/profiles) for your app.
* `Bagbutik-Reporting`: Download your [sales and financial reports](https://developer.apple.com/documentation/appstoreconnectapi/sales_and_finance_reports) and [get power and performance metrics, logs, and signatures](https://developer.apple.com/documentation/appstoreconnectapi/power_and_performance_metrics_and_logs). 
* `Bagbutik-TestFlight`: Manage your [beta testing program, including beta testers and groups, apps, App Clips, and builds](https://developer.apple.com/documentation/appstoreconnectapi/prerelease_versions_and_beta_testers).
* `Bagbutik-Users`: Manage [users](https://developer.apple.com/documentation/appstoreconnectapi/users) and [email invitations to join](https://developer.apple.com/documentation/appstoreconnectapi/user_invitations) your App Store Connect team.
* `Bagbutik-XcodeCloud`: Automate [reading Xcode Cloud data, managing workflows, and starting builds](https://developer.apple.com/documentation/appstoreconnectapi/xcode_cloud_workflows_and_builds).
