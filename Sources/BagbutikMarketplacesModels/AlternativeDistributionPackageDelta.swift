import BagbutikCore
import Foundation

/**
 # AlternativeDistributionPackageDelta

 An incremental update package for an alternative distribution app, containing only the changes between two versions to reduce download size.

 ```
 object AlternativeDistributionPackageDelta
 ```

 ## Discussion

 For more information about the responses that include alternative distribution package delta objects, see [`AlternativeDistributionPackageDeltaResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/AlternativeDistributionPackageDeltaResponse) or [`AlternativeDistributionPackageDeltasResponse`](https://developer.apple.com/documentation/AppStoreConnectAPI/AlternativeDistributionPackageDeltasResponse).

 > Tip:
 > Use the `links` fields to navigate the resource object graph while making your requests. For example, from the alternative distribution package delta object above, you can also reach its package metadata, versions, and variants.

 ## Topics

 ### Objects

 [`object AlternativeDistributionPackageDelta.Attributes`](https://developer.apple.com/documentation/AppStoreConnectAPI/AlternativeDistributionPackageDelta/Attributes-data.dictionary)

 Attributes that describe an alternative distribution package delta resource.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionpackagedelta>
 */
public struct AlternativeDistributionPackageDelta: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "alternativeDistributionPackageDeltas" }
    public var attributes: Attributes?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
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
    }

    public struct Attributes: Codable, Sendable {
        public var alternativeDistributionKeyBlob: String?
        public var fileChecksum: String?
        public var url: String?
        public var urlExpirationDate: Date?

        public init(alternativeDistributionKeyBlob: String? = nil,
                    fileChecksum: String? = nil,
                    url: String? = nil,
                    urlExpirationDate: Date? = nil)
        {
            self.alternativeDistributionKeyBlob = alternativeDistributionKeyBlob
            self.fileChecksum = fileChecksum
            self.url = url
            self.urlExpirationDate = urlExpirationDate
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            alternativeDistributionKeyBlob = try container.decodeIfPresent(String.self, forKey: "alternativeDistributionKeyBlob")
            fileChecksum = try container.decodeIfPresent(String.self, forKey: "fileChecksum")
            url = try container.decodeIfPresent(String.self, forKey: "url")
            urlExpirationDate = try container.decodeIfPresent(Date.self, forKey: "urlExpirationDate")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(alternativeDistributionKeyBlob, forKey: "alternativeDistributionKeyBlob")
            try container.encodeIfPresent(fileChecksum, forKey: "fileChecksum")
            try container.encodeIfPresent(url, forKey: "url")
            try container.encodeIfPresent(urlExpirationDate, forKey: "urlExpirationDate")
        }
    }
}
