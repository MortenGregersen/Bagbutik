import Bagbutik_Core
import Foundation

/**
 # AppClipAdvancedExperienceLocalization
 The data structure that represents the Advanced App Clip Localizations resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperiencelocalization>
 */
public struct AppClipAdvancedExperienceLocalization: Codable, Identifiable {
    /// The opaque resource ID that uniquely identifies an Advanced App Clip Experience Localizations resource.
    public let id: String
    /// Navigational links that include the self-link.
    public var links: ResourceLinks?
    /// The resource type.
    public var type: String { "appClipAdvancedExperienceLocalizations" }
    /// The attributes that describe the Advanced App Clip Experience Localizations resource.
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
     # AppClipAdvancedExperienceLocalization.Attributes
     The attributes that describe an Advanced App Clip Experience Localizations resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperiencelocalization/attributes>
     */
    public struct Attributes: Codable {
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
            let container = try decoder.container(keyedBy: CodingKeys.self)
            language = try container.decodeIfPresent(AppClipAdvancedExperienceLanguage.self, forKey: .language)
            subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle)
            title = try container.decodeIfPresent(String.self, forKey: .title)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(language, forKey: .language)
            try container.encodeIfPresent(subtitle, forKey: .subtitle)
            try container.encodeIfPresent(title, forKey: .title)
        }

        private enum CodingKeys: String, CodingKey {
            case language
            case subtitle
            case title
        }
    }
}
