import Bagbutik_Core
import Foundation

/**
 # AppClipAdvancedExperienceLocalizationInlineCreate
 The data structure that represents an Advanced App Clip Experience Localization Inline Creates resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperiencelocalizationinlinecreate>
 */
public struct AppClipAdvancedExperienceLocalizationInlineCreate: Codable, Sendable, Identifiable {
    /// The opaque resource ID that uniquely identifies an Advanced App Clip Experience Localization Inline Creates resource.
    public var id: String?
    /// The resource type.
    public var type: String { "appClipAdvancedExperienceLocalizations" }
    /// The attributes that describe the Advanced App Clip Experience Localization Inline Creates resource.
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

    /**
     # AppClipAdvancedExperienceLocalizationInlineCreate.Attributes
     The attributes that describe an Advanced App Clip Experience Localization Inline Creates resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperiencelocalizationinlinecreate/attributes>
     */
    public struct Attributes: Codable, Sendable {
        /// A string that identifies the language of the advanced App Clip experience.
        public var language: AppClipAdvancedExperienceLanguage?
        /// The subtitle that appears on the App Clip card for the advanced App Clip experience.
        public var subtitle: String?
        /// The title that appears on the App Clip card for the advanced App Clip experience.
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
