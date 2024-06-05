import Bagbutik_Core
import Foundation

/**
 # ScmProvider
 The data structure that represents a Providers resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/scmprovider>
 */
public struct ScmProvider: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies a Providers resource.
    public let id: String
    /// The navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "scmProviders" }
    /// The attributes that describe the Providers resource.
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

    /**
     # ScmProvider.Attributes
     The attributes that describe a Providers resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/scmprovider/attributes>
     */
    public struct Attributes: Codable {
        /// The source code management provider’s type.
        public var scmProviderType: ScmProviderType?
        /// The URL of the source code management provider.
        public var url: String?

        public init(scmProviderType: ScmProviderType? = nil,
                    url: String? = nil)
        {
            self.scmProviderType = scmProviderType
            self.url = url
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            scmProviderType = try container.decodeIfPresent(ScmProviderType.self, forKey: "scmProviderType")
            url = try container.decodeIfPresent(String.self, forKey: "url")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(scmProviderType, forKey: "scmProviderType")
            try container.encodeIfPresent(url, forKey: "url")
        }
    }
}
