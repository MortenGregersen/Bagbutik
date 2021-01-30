import Foundation

public struct BuildBetaNotification: Codable {
    public let id: String
    public let links: ResourceLinks
    public var type: String { "buildBetaNotifications" }

    public init(id: String, links: ResourceLinks) {
        self.id = id
        self.links = links
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decode(ResourceLinks.self, forKey: .links)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(links, forKey: .links)
    }

    private enum CodingKeys: String, CodingKey {
        case id
        case links
        case type
    }
}
