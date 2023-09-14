import Bagbutik_Core
import Foundation

/**
 # BundleIdCapability
 The data structure that represents a Bundle ID Capabilities resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapability>
 */
public struct BundleIdCapability: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "bundleIdCapabilities" }
    /// The resource's attributes.
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case type
    }

    /**
     # BundleIdCapability.Attributes
     Attributes that describe a Bundle ID Capabilities resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapability/attributes>
     */
    public struct Attributes: Codable {
        public var capabilityType: CapabilityType?
        public var settings: [CapabilitySetting]?

        public init(capabilityType: CapabilityType? = nil,
                    settings: [CapabilitySetting]? = nil)
        {
            self.capabilityType = capabilityType
            self.settings = settings
        }
    }
}
