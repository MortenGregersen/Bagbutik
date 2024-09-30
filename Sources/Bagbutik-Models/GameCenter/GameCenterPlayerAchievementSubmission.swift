import Bagbutik_Core
import Foundation

public struct GameCenterPlayerAchievementSubmission: Codable, Sendable, Identifiable {
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
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        if try container.decode(String.self, forKey: "type") != type {
            throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(id, forKey: "id")
        try container.encodeIfPresent(links, forKey: "links")
        try container.encode(type, forKey: "type")
        try container.encodeIfPresent(attributes, forKey: "attributes")
    }

    public struct Attributes: Codable, Sendable {
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

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            bundleId = try container.decodeIfPresent(String.self, forKey: "bundleId")
            challengeIds = try container.decodeIfPresent([String].self, forKey: "challengeIds")
            percentageAchieved = try container.decodeIfPresent(Int.self, forKey: "percentageAchieved")
            scopedPlayerId = try container.decodeIfPresent(String.self, forKey: "scopedPlayerId")
            submittedDate = try container.decodeIfPresent(Date.self, forKey: "submittedDate")
            vendorIdentifier = try container.decodeIfPresent(String.self, forKey: "vendorIdentifier")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(bundleId, forKey: "bundleId")
            try container.encodeIfPresent(challengeIds, forKey: "challengeIds")
            try container.encodeIfPresent(percentageAchieved, forKey: "percentageAchieved")
            try container.encodeIfPresent(scopedPlayerId, forKey: "scopedPlayerId")
            try container.encodeIfPresent(submittedDate, forKey: "submittedDate")
            try container.encodeIfPresent(vendorIdentifier, forKey: "vendorIdentifier")
        }
    }
}
