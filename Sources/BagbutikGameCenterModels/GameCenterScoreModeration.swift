import BagbutikCore
import Foundation

/**
 # GameCenterScoreModeration

 A score submitted to a Game Center leaderboard that you review and choose to block or unblock.

 ```
 object GameCenterScoreModeration
 ```

 ## Topics

 ### Objects

 [`object GameCenterScoreModeration.Attributes`](https://developer.apple.com/documentation/AppStoreConnectAPI/GameCenterScoreModeration/Attributes-data.dictionary)

 The attributes that describe a Game Center score moderation.

 [`object GameCenterScoreModeration.Relationships`](https://developer.apple.com/documentation/AppStoreConnectAPI/GameCenterScoreModeration/Relationships-data.dictionary)

 The relationships between a Game Center score moderation and other resources.



 ---

 Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterscoremoderation>
 */
public struct GameCenterScoreModeration: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "gameCenterScoreModerations" }
    public var attributes: Attributes?
    public var relationships: Relationships?

    public init(id: String,
                links: ResourceLinks? = nil,
                attributes: Attributes? = nil,
                relationships: Relationships? = nil)
    {
        self.id = id
        self.links = links
        self.attributes = attributes
        self.relationships = relationships
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
        relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
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
        try container.encodeIfPresent(relationships, forKey: "relationships")
    }

    public struct Attributes: Codable, Sendable {
        public var blocked: Bool?
        public var challengeIds: [String]?
        public var context: String?
        public var preReleased: Bool?
        public var rank: String?
        public var score: String?
        public var submittedDate: Date?

        public init(blocked: Bool? = nil,
                    challengeIds: [String]? = nil,
                    context: String? = nil,
                    preReleased: Bool? = nil,
                    rank: String? = nil,
                    score: String? = nil,
                    submittedDate: Date? = nil)
        {
            self.blocked = blocked
            self.challengeIds = challengeIds
            self.context = context
            self.preReleased = preReleased
            self.rank = rank
            self.score = score
            self.submittedDate = submittedDate
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            blocked = try container.decodeIfPresent(Bool.self, forKey: "blocked")
            challengeIds = try container.decodeIfPresent([String].self, forKey: "challengeIds")
            context = try container.decodeIfPresent(String.self, forKey: "context")
            preReleased = try container.decodeIfPresent(Bool.self, forKey: "preReleased")
            rank = try container.decodeIfPresent(String.self, forKey: "rank")
            score = try container.decodeIfPresent(String.self, forKey: "score")
            submittedDate = try container.decodeIfPresent(Date.self, forKey: "submittedDate")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(blocked, forKey: "blocked")
            try container.encodeIfPresent(challengeIds, forKey: "challengeIds")
            try container.encodeIfPresent(context, forKey: "context")
            try container.encodeIfPresent(preReleased, forKey: "preReleased")
            try container.encodeIfPresent(rank, forKey: "rank")
            try container.encodeIfPresent(score, forKey: "score")
            try container.encodeIfPresent(submittedDate, forKey: "submittedDate")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var player: Player?

        public init(player: Player? = nil) {
            self.player = player
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            player = try container.decodeIfPresent(Player.self, forKey: "player")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(player, forKey: "player")
        }

        public struct Player: Codable, Sendable {
            @NullCodable public var data: Data?

            public init(data: Data? = nil) {
                self.data = data
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "gameCenterDetailPlayers" }

                public init(id: String) {
                    self.id = id
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    id = try container.decode(String.self, forKey: "id")
                    if try container.decode(String.self, forKey: "type") != type {
                        throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(id, forKey: "id")
                    try container.encode(type, forKey: "type")
                }
            }
        }
    }
}
