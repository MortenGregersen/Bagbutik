import Bagbutik_Core
import Foundation

/**
 # AlternativeDistributionPackageVariant
 The data structure that represents an alternative distribution package variant resource.

 To learn more about the responses that include alternative distribution package variant objects, see ``AlternativeDistributionPackageVariantResponse`` or ``AlternativeDistributionPackageVariantsResponse``.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/alternativedistributionpackagevariant>
 */
public struct AlternativeDistributionPackageVariant: Codable, Identifiable {
    /// An opaque resource ID that uniquely identifies the alternative distribution package variant.
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "alternativeDistributionPackageVariants" }
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

    public struct Attributes: Codable {
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
