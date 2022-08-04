import Foundation
import Bagbutik_Core

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
    public let links: ResourceLinks
    /// The resource type.
    public var type: String { "appClipAdvancedExperienceLocalizations" }
    /// The attributes that describe the Advanced App Clip Experience Localizations resource.
    public var attributes: Attributes?

    public init(id: String,
                links: ResourceLinks,
                attributes: Attributes? = nil)
    {
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
    }
}
