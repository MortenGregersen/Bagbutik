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
</p>

## What is Bagbutik?

**Bag·bu·tik** (noun) **[/ˈb̥a̝w-ˌb̥u-tiːk/](http://ipa-reader.xyz/?text=ˈb̥a̝w-ˌb̥u-ti%CB%90k&voice=Amy)** - _(Danish) A room behind a store_

Bagbutik is two things, a command line tool for generating Swift code, and library with the generated code for the App Store Connect API. The command line tool decodes the official [OpenAPI spec](https://en.wikipedia.org/wiki/OpenAPI_Specification) for Apple's [App Store Connect API](https://developer.apple.com/documentation/appstoreconnectapi).

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
    .listBundleIdsV1(fields: [.profiles([.bundleId, .name])],
                     filters: [.platform([.iOS])],
                     includes: [.profiles],
                     sorts: [.seedIdDescending, .idDescending])
)
print(response)
```
