import Bagbutik_Core
import Foundation

/**
 # BetaAppClipInvocationLocalization
 The data structure that represents a Beta App Clip Invocation Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/betaappclipinvocationlocalization>
 */
public struct BetaAppClipInvocationLocalization: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies a Beta App Clip Invocation Localization.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "betaAppClipInvocationLocalizations" }
    /// The attributes that describe the Beta App Clip Invocation Localizations resource.
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
        public var locale: String?
        public var title: String?

        public init(locale: String? = nil,
                    title: String? = nil)
        {
            self.locale = locale
            self.title = title
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            locale = try container.decodeIfPresent(String.self, forKey: "locale")
            title = try container.decodeIfPresent(String.self, forKey: "title")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(locale, forKey: "locale")
            try container.encodeIfPresent(title, forKey: "title")
        }
    }
}
