import Bagbutik_Core
import Foundation

/**
 # AppClipAdvancedExperienceLocalizationInlineCreate
 The data structure that represents an Advanced App Clip Experience Localization Inline Creates resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperiencelocalizationinlinecreate>
 */
public struct AppClipAdvancedExperienceLocalizationInlineCreate: Codable, Identifiable {
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case type
    }

    public struct Attributes: Codable {
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
    }
}
