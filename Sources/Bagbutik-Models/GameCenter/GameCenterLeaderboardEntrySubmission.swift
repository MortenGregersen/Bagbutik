import Bagbutik_Core
import Foundation

/**
 # GameCenterLeaderboardEntrySubmission
 The data structure that represent an Game Center leaderboard entry submission resource.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardentrysubmission>
 */
public struct GameCenterLeaderboardEntrySubmission: Codable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "gameCenterLeaderboardEntrySubmissions" }
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
        public var context: String?
        public var scopedPlayerId: String?
        public var score: String?
        public var submittedDate: Date?
        public var vendorIdentifier: String?

        public init(bundleId: String? = nil,
                    challengeIds: [String]? = nil,
                    context: String? = nil,
                    scopedPlayerId: String? = nil,
                    score: String? = nil,
                    submittedDate: Date? = nil,
                    vendorIdentifier: String? = nil)
        {
            self.bundleId = bundleId
            self.challengeIds = challengeIds
            self.context = context
            self.scopedPlayerId = scopedPlayerId
            self.score = score
            self.submittedDate = submittedDate
            self.vendorIdentifier = vendorIdentifier
        }
    }
}
