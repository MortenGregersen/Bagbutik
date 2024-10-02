import Bagbutik_Core
import Foundation

public struct GameCenterAchievementLocalization: Codable, Sendable, Identifiable {
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "gameCenterAchievementLocalizations" }
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
        public var afterEarnedDescription: String?
        public var beforeEarnedDescription: String?
        public var locale: String?
        public var name: String?

        public init(afterEarnedDescription: String? = nil,
                    beforeEarnedDescription: String? = nil,
                    locale: String? = nil,
                    name: String? = nil)
        {
            self.afterEarnedDescription = afterEarnedDescription
            self.beforeEarnedDescription = beforeEarnedDescription
            self.locale = locale
            self.name = name
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            afterEarnedDescription = try container.decodeIfPresent(String.self, forKey: "afterEarnedDescription")
            beforeEarnedDescription = try container.decodeIfPresent(String.self, forKey: "beforeEarnedDescription")
            locale = try container.decodeIfPresent(String.self, forKey: "locale")
            name = try container.decodeIfPresent(String.self, forKey: "name")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(afterEarnedDescription, forKey: "afterEarnedDescription")
            try container.encodeIfPresent(beforeEarnedDescription, forKey: "beforeEarnedDescription")
            try container.encodeIfPresent(locale, forKey: "locale")
            try container.encodeIfPresent(name, forKey: "name")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var gameCenterAchievement: GameCenterAchievement?
        public var gameCenterAchievementImage: GameCenterAchievementImage?

        public init(gameCenterAchievement: GameCenterAchievement? = nil,
                    gameCenterAchievementImage: GameCenterAchievementImage? = nil)
        {
            self.gameCenterAchievement = gameCenterAchievement
            self.gameCenterAchievementImage = gameCenterAchievementImage
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            gameCenterAchievement = try container.decodeIfPresent(GameCenterAchievement.self, forKey: "gameCenterAchievement")
            gameCenterAchievementImage = try container.decodeIfPresent(GameCenterAchievementImage.self, forKey: "gameCenterAchievementImage")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(gameCenterAchievement, forKey: "gameCenterAchievement")
            try container.encodeIfPresent(gameCenterAchievementImage, forKey: "gameCenterAchievementImage")
        }

        public struct GameCenterAchievement: Codable, Sendable {
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
                public var type: String { "gameCenterAchievements" }

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

        public struct GameCenterAchievementImage: Codable, Sendable {
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
                public var type: String { "gameCenterAchievementImages" }

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
