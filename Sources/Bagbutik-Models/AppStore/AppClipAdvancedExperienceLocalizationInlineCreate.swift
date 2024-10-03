import Bagbutik_Core
import Foundation

public struct AppClipAdvancedExperienceLocalizationInlineCreate: Codable, Sendable, Identifiable {
    public var id: String?
    public var type: String { "appClipAdvancedExperienceLocalizations" }
    public var attributes: Attributes?

    public init(id: String? = nil,
                attributes: Attributes? = nil)
    {
        self.id = id
        self.attributes = attributes
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decodeIfPresent(String.self, forKey: "id")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encodeIfPresent(id, forKey: "id")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
    }

    public struct Attributes: Codable, Sendable {
        public var language: AppClipAdvancedExperienceLanguage?
        public var subtitle: String?
        public var title: String?

        public init(language: AppClipAdvancedExperienceLanguage? = nil,
                    subtitle: String? = nil,
                    title: String? = nil)
        {
            self.language = language
            self.subtitle = subtitle
            self.title = title
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            language = try container.decodeIfPresent(AppClipAdvancedExperienceLanguage.self, forKey: "language")
            subtitle = try container.decodeIfPresent(String.self, forKey: "subtitle")
            title = try container.decodeIfPresent(String.self, forKey: "title")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(language, forKey: "language")
            try container.encodeIfPresent(subtitle, forKey: "subtitle")
            try container.encodeIfPresent(title, forKey: "title")
        }
    }
}
