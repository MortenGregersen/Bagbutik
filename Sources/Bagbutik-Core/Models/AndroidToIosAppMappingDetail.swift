import Foundation

/**
 # AndroidToIosAppMappingDetail
 The data structure that represents an Android to iOS app mapping detail resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/androidtoiosappmappingdetail>
 */
public struct AndroidToIosAppMappingDetail: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "androidToIosAppMappingDetails" }
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
        public var appSigningKeyPublicCertificateSha256Fingerprints: [String]?
        public var packageName: String?

        public init(appSigningKeyPublicCertificateSha256Fingerprints: [String]? = nil,
                    packageName: String? = nil)
        {
            self.appSigningKeyPublicCertificateSha256Fingerprints = appSigningKeyPublicCertificateSha256Fingerprints
            self.packageName = packageName
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            appSigningKeyPublicCertificateSha256Fingerprints = try container.decodeIfPresent([String].self, forKey: "appSigningKeyPublicCertificateSha256Fingerprints")
            packageName = try container.decodeIfPresent(String.self, forKey: "packageName")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(appSigningKeyPublicCertificateSha256Fingerprints, forKey: "appSigningKeyPublicCertificateSha256Fingerprints")
            try container.encodeIfPresent(packageName, forKey: "packageName")
        }
    }
}
