import Bagbutik_Core
import Foundation

/**
 # BuildIcon
 The data structure that represents the Build Icons resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/buildicon>
 */
public struct BuildIcon: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "buildIcons" }
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
        public var iconAsset: ImageAsset?
        public var iconType: IconAssetType?
        public var masked: Bool?
        public var name: String?

        public init(iconAsset: ImageAsset? = nil,
                    iconType: IconAssetType? = nil,
                    masked: Bool? = nil,
                    name: String? = nil)
        {
            self.iconAsset = iconAsset
            self.iconType = iconType
            self.masked = masked
            self.name = name
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            iconAsset = try container.decodeIfPresent(ImageAsset.self, forKey: "iconAsset")
            iconType = try container.decodeIfPresent(IconAssetType.self, forKey: "iconType")
            masked = try container.decodeIfPresent(Bool.self, forKey: "masked")
            name = try container.decodeIfPresent(String.self, forKey: "name")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(iconAsset, forKey: "iconAsset")
            try container.encodeIfPresent(iconType, forKey: "iconType")
            try container.encodeIfPresent(masked, forKey: "masked")
            try container.encodeIfPresent(name, forKey: "name")
        }
    }
}
