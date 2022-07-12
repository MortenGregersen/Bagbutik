import Foundation

/**
 The data structure that represents the Build Icons resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildicon>
 */
public struct BuildIcon: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String
    /// Navigational links that include the self-link.
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "buildIcons" }
    /// The resource's attributes.
    public let attributes: Attributes?

    public init(id: String, links: ResourceLinks, attributes: Attributes? = nil) {
        self.id = id
        self.links = links
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decode(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
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
     Attributes that describe a Build Icons resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/buildicon/attributes>
     */
    public struct Attributes: Codable {
        public var iconAsset: ImageAsset?
        public var iconType: IconAssetType?
        public var name: String?

        public init(iconAsset: ImageAsset? = nil, iconType: IconAssetType? = nil, name: String? = nil) {
            self.iconAsset = iconAsset
            self.iconType = iconType
            self.name = name
        }
    }
}
