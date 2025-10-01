import Bagbutik_Core
import Foundation

/**
 # GameCenterLeaderboardLocalization
 The data structure that represent a leaderboard localization.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardlocalization>
 */
public struct GameCenterLeaderboardLocalization: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "gameCenterLeaderboardLocalizations" }
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
        public var description: String?
        public var formatterOverride: GameCenterLeaderboardFormatter?
        public var formatterSuffix: String?
        public var formatterSuffixSingular: String?
        public var locale: String?
        public var name: String?

        public init(description: String? = nil,
                    formatterOverride: GameCenterLeaderboardFormatter? = nil,
                    formatterSuffix: String? = nil,
                    formatterSuffixSingular: String? = nil,
                    locale: String? = nil,
                    name: String? = nil)
        {
            self.description = description
            self.formatterOverride = formatterOverride
            self.formatterSuffix = formatterSuffix
            self.formatterSuffixSingular = formatterSuffixSingular
            self.locale = locale
            self.name = name
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            description = try container.decodeIfPresent(String.self, forKey: "description")
            formatterOverride = try container.decodeIfPresent(GameCenterLeaderboardFormatter.self, forKey: "formatterOverride")
            formatterSuffix = try container.decodeIfPresent(String.self, forKey: "formatterSuffix")
            formatterSuffixSingular = try container.decodeIfPresent(String.self, forKey: "formatterSuffixSingular")
            locale = try container.decodeIfPresent(String.self, forKey: "locale")
            name = try container.decodeIfPresent(String.self, forKey: "name")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(description, forKey: "description")
            try container.encodeIfPresent(formatterOverride, forKey: "formatterOverride")
            try container.encodeIfPresent(formatterSuffix, forKey: "formatterSuffix")
            try container.encodeIfPresent(formatterSuffixSingular, forKey: "formatterSuffixSingular")
            try container.encodeIfPresent(locale, forKey: "locale")
            try container.encodeIfPresent(name, forKey: "name")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var gameCenterLeaderboard: GameCenterLeaderboard?
        public var gameCenterLeaderboardImage: GameCenterLeaderboardImage?

        public init(gameCenterLeaderboard: GameCenterLeaderboard? = nil,
                    gameCenterLeaderboardImage: GameCenterLeaderboardImage? = nil)
        {
            self.gameCenterLeaderboard = gameCenterLeaderboard
            self.gameCenterLeaderboardImage = gameCenterLeaderboardImage
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            gameCenterLeaderboard = try container.decodeIfPresent(GameCenterLeaderboard.self, forKey: "gameCenterLeaderboard")
            gameCenterLeaderboardImage = try container.decodeIfPresent(GameCenterLeaderboardImage.self, forKey: "gameCenterLeaderboardImage")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(gameCenterLeaderboard, forKey: "gameCenterLeaderboard")
            try container.encodeIfPresent(gameCenterLeaderboardImage, forKey: "gameCenterLeaderboardImage")
        }

        public struct GameCenterLeaderboard: Codable, Sendable {
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
                public var type: String { "gameCenterLeaderboards" }

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

        public struct GameCenterLeaderboardImage: Codable, Sendable {
            @NullCodable public var data: Data?
            public var links: RelationshipLinks?

            public init(data: Data? = nil,
                        links: RelationshipLinks? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent(Data.self, forKey: "data")
                links = try container.decodeIfPresent(RelationshipLinks.self, forKey: "links")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
            }

            public struct Data: Codable, Sendable, Identifiable {
                public let id: String
                public var type: String { "gameCenterLeaderboardImages" }

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
