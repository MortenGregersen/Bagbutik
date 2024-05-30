import Bagbutik_Core
import Foundation

public struct GameCenterAchievementLocalizationCreateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
    }

    public struct Data: Codable {
        public var type: String { "gameCenterAchievementLocalizations" }
        public let attributes: Attributes
        public let relationships: Relationships

        public init(attributes: Attributes,
                    relationships: Relationships)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            attributes = try container.decode(Attributes.self, forKey: "attributes")
            relationships = try container.decode(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encode(attributes, forKey: "attributes")
            try container.encode(relationships, forKey: "relationships")
        }

        public struct Attributes: Codable {
            public let afterEarnedDescription: String
            public let beforeEarnedDescription: String
            public let locale: String
            public let name: String

            public init(afterEarnedDescription: String,
                        beforeEarnedDescription: String,
                        locale: String,
                        name: String)
            {
                self.afterEarnedDescription = afterEarnedDescription
                self.beforeEarnedDescription = beforeEarnedDescription
                self.locale = locale
                self.name = name
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                afterEarnedDescription = try container.decode(String.self, forKey: "afterEarnedDescription")
                beforeEarnedDescription = try container.decode(String.self, forKey: "beforeEarnedDescription")
                locale = try container.decode(String.self, forKey: "locale")
                name = try container.decode(String.self, forKey: "name")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(afterEarnedDescription, forKey: "afterEarnedDescription")
                try container.encode(beforeEarnedDescription, forKey: "beforeEarnedDescription")
                try container.encode(locale, forKey: "locale")
                try container.encode(name, forKey: "name")
            }
        }

        public struct Relationships: Codable {
            public let gameCenterAchievement: GameCenterAchievement

            public init(gameCenterAchievement: GameCenterAchievement) {
                self.gameCenterAchievement = gameCenterAchievement
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                gameCenterAchievement = try container.decode(GameCenterAchievement.self, forKey: "gameCenterAchievement")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(gameCenterAchievement, forKey: "gameCenterAchievement")
            }

            public struct GameCenterAchievement: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decode(Data.self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                public struct Data: Codable, Identifiable {
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
        }
    }
}
