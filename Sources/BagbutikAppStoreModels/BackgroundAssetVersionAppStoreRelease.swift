import BagbutikCore
import Foundation

/**
 # BackgroundAssetVersionAppStoreRelease

 A release of a background asset version to App Store customers, making the background content available on their devices.

 ```
 object BackgroundAssetVersionAppStoreRelease
 ```

 ## Topics

 ### Dictionaries

 [`object BackgroundAssetVersionAppStoreRelease.Attributes`](https://developer.apple.com/documentation/AppStoreConnectAPI/BackgroundAssetVersionAppStoreRelease/Attributes-data.dictionary)

 Attributes that describe a background asset version App Store release resource.

 [`object BackgroundAssetVersionAppStoreRelease.Relationships`](https://developer.apple.com/documentation/AppStoreConnectAPI/BackgroundAssetVersionAppStoreRelease/Relationships-data.dictionary)

 The relationships you include in the request and those on which you can operate.

 ## See Also

 [`object BackgroundAsset`](https://developer.apple.com/documentation/AppStoreConnectAPI/BackgroundAsset)

 A downloadable content package that your app fetches in the background before or after installation, managed through Apple-hosted background assets.

 [`object BackgroundAssetCreateRequest`](https://developer.apple.com/documentation/AppStoreConnectAPI/BackgroundAssetCreateRequest)

 The request body you use to create a background asset record.

 [`object BackgroundAssetResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/BackgroundAssetResponse)

 A response containing a single background asset downloadable content package.

 [`object BackgroundAssetVersion`](https://developer.apple.com/documentation/AppStoreConnectAPI/BackgroundAssetVersion)

 A specific version of a background asset, containing the upload files your app downloads after installation.

 [`object BackgroundAssetVersionAppStoreReleaseResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/BackgroundAssetVersionAppStoreReleaseResponse)

 A response containing a single App Store release record for a background asset version.

 [`object BackgroundAssetVersionBackgroundAssetUploadFilesLinkagesResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/BackgroundAssetVersionBackgroundAssetUploadFilesLinkagesResponse)

 A response containing the resource identifiers of upload files associated with a background asset version.

 [`object BackgroundAssetVersionCreateRequest`](https://developer.apple.com/documentation/AppStoreConnectAPI/BackgroundAssetVersionCreateRequest)

 The request body you use to create a background asset version.

 [`object BackgroundAssetVersionExternalBetaRelease`](https://developer.apple.com/documentation/AppStoreConnectAPI/BackgroundAssetVersionExternalBetaRelease)

 A release of a background asset version to external TestFlight testers for validation.

 [`object BackgroundAssetVersionExternalBetaReleaseResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/BackgroundAssetVersionExternalBetaReleaseResponse)

 A response containing a single external beta release record for a background asset version.

 [`object BackgroundAssetVersionInternalBetaRelease`](https://developer.apple.com/documentation/AppStoreConnectAPI/BackgroundAssetVersionInternalBetaRelease)

 A release of a background asset version to internal testers, allowing you to validate asset delivery before public distribution.

 [`object BackgroundAssetVersionInternalBetaReleaseResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/BackgroundAssetVersionInternalBetaReleaseResponse)

 A response containing a single internal beta release record for a background asset version.

 [`object BackgroundAssetVersionsLinkagesResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/BackgroundAssetVersionsLinkagesResponse)

 A response containing the resource identifiers of background asset versions linked to an app.

 [`object BackgroundAssetVersionResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/BackgroundAssetVersionResponse)

 A response containing a single version of a background asset.

 [`object BackgroundAssetVersionsResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/BackgroundAssetVersionsResponse)

 A response containing a list of versions for a background asset.

 [`object BackgroundAssetsResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/BackgroundAssetsResponse)

 A response containing a list of background assets for an app.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/backgroundassetversionappstorerelease>
 */
public struct BackgroundAssetVersionAppStoreRelease: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "backgroundAssetVersionAppStoreReleases" }
    public var attributes: Attributes?
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    public struct Attributes: Codable, Sendable {
        public var state: BackgroundAssetVersionAppStoreReleaseState?

        public init(state: BackgroundAssetVersionAppStoreReleaseState? = nil) {
            self.state = state
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            state = try container.decodeIfPresent(BackgroundAssetVersionAppStoreReleaseState.self, forKey: "state")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(state, forKey: "state")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var backgroundAssetVersion: BackgroundAssetVersion?

        public init(backgroundAssetVersion: BackgroundAssetVersion? = nil) {
            self.backgroundAssetVersion = backgroundAssetVersion
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            backgroundAssetVersion = try container.decodeIfPresent(BackgroundAssetVersion.self, forKey: "backgroundAssetVersion")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(backgroundAssetVersion, forKey: "backgroundAssetVersion")
        }

        public struct BackgroundAssetVersion: Codable, Sendable {
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "backgroundAssetVersions" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    id = try container.decode(String.self, forKey: "id")
                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(id, forKey: "id")
                    try container.encode(type, forKey: "type")
                }
            }
        }
    }
}
