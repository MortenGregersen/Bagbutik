import Bagbutik_Core
import Foundation

/**
 # GameCenterLeaderboardLocalizationCreateRequest
 The request body you use to create a leaderboard localization.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecenterleaderboardlocalizationcreaterequest>
 */
public struct GameCenterLeaderboardLocalizationCreateRequest: Codable, RequestBody {
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
        public var type: String { "gameCenterLeaderboardLocalizations" }
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
            public var formatterOverride: GameCenterLeaderboardFormatter?
            public var formatterSuffix: String?
            public var formatterSuffixSingular: String?
            public let locale: String
            public let name: String

            public init(formatterOverride: GameCenterLeaderboardFormatter? = nil,
                        formatterSuffix: String? = nil,
                        formatterSuffixSingular: String? = nil,
                        locale: String,
                        name: String)
            {
                self.formatterOverride = formatterOverride
                self.formatterSuffix = formatterSuffix
                self.formatterSuffixSingular = formatterSuffixSingular
                self.locale = locale
                self.name = name
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                formatterOverride = try container.decodeIfPresent(GameCenterLeaderboardFormatter.self, forKey: "formatterOverride")
                formatterSuffix = try container.decodeIfPresent(String.self, forKey: "formatterSuffix")
                formatterSuffixSingular = try container.decodeIfPresent(String.self, forKey: "formatterSuffixSingular")
                locale = try container.decode(String.self, forKey: "locale")
                name = try container.decode(String.self, forKey: "name")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(formatterOverride, forKey: "formatterOverride")
                try container.encodeIfPresent(formatterSuffix, forKey: "formatterSuffix")
                try container.encodeIfPresent(formatterSuffixSingular, forKey: "formatterSuffixSingular")
                try container.encode(locale, forKey: "locale")
                try container.encode(name, forKey: "name")
            }
        }

        public struct Relationships: Codable {
            public let gameCenterLeaderboard: GameCenterLeaderboard

            public init(gameCenterLeaderboard: GameCenterLeaderboard) {
                self.gameCenterLeaderboard = gameCenterLeaderboard
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                gameCenterLeaderboard = try container.decode(GameCenterLeaderboard.self, forKey: "gameCenterLeaderboard")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(gameCenterLeaderboard, forKey: "gameCenterLeaderboard")
            }

            public struct GameCenterLeaderboard: Codable {
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
        }
    }
}
