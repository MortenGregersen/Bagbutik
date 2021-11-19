import Foundation

/**
 The data structure that represents an Advanced App Clip Experience Localization Inline Creates resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperiencelocalizationinlinecreate>
 */
public struct AppClipAdvancedExperienceLocalizationInlineCreate: Codable {
    /// The opaque resource ID that uniquely identifies the resource.
    public let id: String?
    /// The resource type.
    public var type: String { "appClipAdvancedExperienceLocalizations" }
    /// The resource's attributes.
    public let attributes: Attributes?

    public init(id: String? = nil, attributes: Attributes? = nil) {
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
        case id
        case type
        case attributes
    }

    /**
     The attributes that describe an Advanced App Clip Experience Localization Inline Creates resource.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/appclipadvancedexperiencelocalizationinlinecreate/attributes>
     */
    public struct Attributes: Codable {
        /// A string that identifies the language of the advanced App Clip experience.
        public let language: AppClipAdvancedExperienceLanguage?
        /// The subtitle that appears on the App Clip card for the advanced App Clip experience.
        public let subtitle: String?
        /// The title that appears on the App Clip card for the advanced App Clip experience.
        public let title: String?

        public init(language: AppClipAdvancedExperienceLanguage? = nil, subtitle: String? = nil, title: String? = nil) {
            self.language = language
            self.subtitle = subtitle
            self.title = title
        }
    }
}
