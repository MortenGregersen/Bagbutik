import Bagbutik_Core
import Foundation

/**
 # Certificate
 The data structure that represents a Certificates resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/certificate>
 */
public struct Certificate: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "certificates" }
    /// The resource’s attributes.
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
        public var certificateContent: String?
        public var certificateType: CertificateType?
        public var displayName: String?
        public var expirationDate: Date?
        public var name: String?
        public var platform: BundleIdPlatform?
        public var serialNumber: String?

        public init(certificateContent: String? = nil,
                    certificateType: CertificateType? = nil,
                    displayName: String? = nil,
                    expirationDate: Date? = nil,
                    name: String? = nil,
                    platform: BundleIdPlatform? = nil,
                    serialNumber: String? = nil)
        {
            self.certificateContent = certificateContent
            self.certificateType = certificateType
            self.displayName = displayName
            self.expirationDate = expirationDate
            self.name = name
            self.platform = platform
            self.serialNumber = serialNumber
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            certificateContent = try container.decodeIfPresent(String.self, forKey: "certificateContent")
            certificateType = try container.decodeIfPresent(CertificateType.self, forKey: "certificateType")
            displayName = try container.decodeIfPresent(String.self, forKey: "displayName")
            expirationDate = try container.decodeIfPresent(Date.self, forKey: "expirationDate")
            name = try container.decodeIfPresent(String.self, forKey: "name")
            platform = try container.decodeIfPresent(BundleIdPlatform.self, forKey: "platform")
            serialNumber = try container.decodeIfPresent(String.self, forKey: "serialNumber")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(certificateContent, forKey: "certificateContent")
            try container.encodeIfPresent(certificateType, forKey: "certificateType")
            try container.encodeIfPresent(displayName, forKey: "displayName")
            try container.encodeIfPresent(expirationDate, forKey: "expirationDate")
            try container.encodeIfPresent(name, forKey: "name")
            try container.encodeIfPresent(platform, forKey: "platform")
            try container.encodeIfPresent(serialNumber, forKey: "serialNumber")
        }
    }
}
