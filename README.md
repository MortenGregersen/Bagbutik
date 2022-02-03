<p align="center">
    <br />
    <img src="https://raw.githubusercontent.com/MortenGregersen/Bagbutik/main/Assets/Bagbutik-logo.png" max-width="90%" alt="Bagbutik" />
</p>

<p align="center">
    <b>Generated Swift code for the <a href="https://developer.apple.com/documentation/appstoreconnectapi">App Store Connect API</a> based on the official <a href="https://en.wikipedia.org/wiki/OpenAPI_Specification">OpenAPI spec</a>.</b><br />
    Created with <a href="https://github.com/SwiftGen/StencilSwiftKit">StencilSwiftKit</a> and <a href="https://github.com/apple/swift-crypto">swift-crypto</a><br />
    <br />
    <img src="https://img.shields.io/badge/Swift-5.3-brightgreen.svg" alt="Swift version" />
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/SwiftPM-compatible-brightgreen.svg?style=flat" alt="Swift PM" />
    </a>
    <img src="https://img.shields.io/badge/platforms-Mac+iOS-brightgreen.svg?style=flat" alt="Platforms" />
    <a href="https://codecov.io/gh/MortenGregersen/Bagbutik">
        <img src="https://codecov.io/gh/MortenGregersen/Bagbutik/branch/main/graph/badge.svg?token=oJZWL49t0G"/>
    </a>
    <a href="https://twitter.com/mortengregersen">
        <img src="https://img.shields.io/badge/twitter-@mortengregersen-blue.svg?style=flat" alt="Twitter" />
    </a>
</p>

## What is Bagbutik?
Bagbutik is two things, a command line tool for generating Swift code, and the generated code for the App Store Connect API. The command line tool decodes the official <a href="https://en.wikipedia.org/wiki/OpenAPI_Specification">OpenAPI spec</a> for Apple's <a href="https://developer.apple.com/documentation/appstoreconnectapi">App Store Connect API</a>.

The command line tool is only needed, when Apple publishes a new version of the spec.

## How to use Bagbutik
Bagbutik uses JSON Web Tokens (JWT) for authorization. You obtain the required keys from your organization's App Store Connect account.

> See [Creating API Keys for App Store Connect API](https://developer.apple.com/documentation/appstoreconnectapi/creating_api_keys_for_app_store_connect_api) for how to create your keys.

Here is a basic example for fetching all bundle IDs for iOS apps including related profiles sorted by seed ID and the ID itself descending.

```swift
let privateKey = """
-----BEGIN PRIVATE KEY-----
MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgevZzL1gdAFr88hb2
OF/2NxApJCzGCEDdfSp6VQO30hyhRANCAAQRWz+jn65BtOMvdyHKcvjBeBSDZH2r
1RTwjmYSi9R/zpBnuQ4EiMnCqfMPWiZqB4QdbAd0E7oH50VpuZ1P087G
-----END PRIVATE KEY-----
"""
let service = try BagbutikService(jwt: .init(keyId: "P9M252746H", issuerId: "82067982-6b3b-4a48-be4f-5b10b373c5f2", privateKey: privateKey))
let response: BundleIdsResponse = try await service.request(
    .listBundleIds(fields: [.profiles([.bundleId, .name])],
                   filters: [.platform([.iOS])],
                   includes: [.profiles],
                   sorts: [.seedIdDescending, .idDescending])
)
print(response)
let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
print(String(data: try! encoder.encode(response), encoding: .utf8)!)
```
