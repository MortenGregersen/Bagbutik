import Bagbutik_Core
import Foundation

public struct GameCenterPlayerAchievementSubmission: Codable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "gameCenterPlayerAchievementSubmissions" }
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

    public struct Attributes: Codable {
        public var bundleId: String?
        public var challengeIds: [String]?
        public var percentageAchieved: Int?
        public var scopedPlayerId: String?
        public var submittedDate: Date?
        public var vendorIdentifier: String?

        public init(bundleId: String? = nil,
                    challengeIds: [String]? = nil,
                    percentageAchieved: Int? = nil,
                    scopedPlayerId: String? = nil,
                    submittedDate: Date? = nil,
                    vendorIdentifier: String? = nil)
        {
            self.bundleId = bundleId
            self.challengeIds = challengeIds
            self.percentageAchieved = percentageAchieved
            self.scopedPlayerId = scopedPlayerId
            self.submittedDate = submittedDate
            self.vendorIdentifier = vendorIdentifier
        }
    }
}
