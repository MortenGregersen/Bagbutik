import Foundation

/**
 The data structure that represents a Bundle ID Capabilities resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapability>
 */
public struct BundleIdCapability: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "bundleIdCapabilities" }
    /// The resource's attributes.
    public let attributes: Attributes?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case links
        case type
        case attributes
    }

    /**
     Attributes that describe a Bundle ID Capabilities resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/bundleidcapability/attributes>
     */
    public struct Attributes: Codable {
        public let capabilityType: CapabilityType?
        public let settings: [CapabilitySetting]?

        public init(capabilityType: CapabilityType? = nil, settings: [CapabilitySetting]? = nil) {
            self.capabilityType = capabilityType
            self.settings = settings
        }
    }
}
