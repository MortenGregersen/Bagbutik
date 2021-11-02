import Foundation

public struct AppClipAdvancedExperienceLocalization: Codable {
    public let id: String
    public let links: ResourceLinks
    public var type: String { "appClipAdvancedExperienceLocalizations" }
    ///
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

    public struct Attributes: Codable {
        public let language: AppClipAdvancedExperienceLanguage?
        public let subtitle: String?
        public let title: String?

        public init(language: AppClipAdvancedExperienceLanguage? = nil, subtitle: String? = nil, title: String? = nil) {
            self.language = language
            self.subtitle = subtitle
            self.title = title
        }
    }
}
