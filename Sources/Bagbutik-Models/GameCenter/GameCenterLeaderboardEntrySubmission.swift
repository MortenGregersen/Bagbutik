import Bagbutik_Core
import Foundation

public struct GameCenterLeaderboardEntrySubmission: Codable, Sendable, Identifiable {
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

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            bundleId = try container.decodeIfPresent(String.self, forKey: "bundleId")
            challengeIds = try container.decodeIfPresent([String].self, forKey: "challengeIds")
            context = try container.decodeIfPresent(String.self, forKey: "context")
            scopedPlayerId = try container.decodeIfPresent(String.self, forKey: "scopedPlayerId")
            score = try container.decodeIfPresent(String.self, forKey: "score")
            submittedDate = try container.decodeIfPresent(Date.self, forKey: "submittedDate")
            vendorIdentifier = try container.decodeIfPresent(String.self, forKey: "vendorIdentifier")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(bundleId, forKey: "bundleId")
            try container.encodeIfPresent(challengeIds, forKey: "challengeIds")
            try container.encodeIfPresent(context, forKey: "context")
            try container.encodeIfPresent(scopedPlayerId, forKey: "scopedPlayerId")
            try container.encodeIfPresent(score, forKey: "score")
            try container.encodeIfPresent(submittedDate, forKey: "submittedDate")
            try container.encodeIfPresent(vendorIdentifier, forKey: "vendorIdentifier")
        }
    }
}
