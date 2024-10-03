import Bagbutik_Core
import Foundation

public struct GameCenterMatchmakingRuleSetCreateRequest: Codable, Sendable, RequestBody {
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

    public struct Data: Codable, Sendable {
        public var type: String { "gameCenterMatchmakingRuleSets" }
        public let attributes: Attributes

        public init(attributes: Attributes) {
            self.attributes = attributes
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            attributes = try container.decode(Attributes.self, forKey: "attributes")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encode(attributes, forKey: "attributes")
        }

        public struct Attributes: Codable, Sendable {
            public let maxPlayers: Int
            public let minPlayers: Int
            public let referenceName: String
            public let ruleLanguageVersion: Int

            public init(maxPlayers: Int,
                        minPlayers: Int,
                        referenceName: String,
                        ruleLanguageVersion: Int)
            {
                self.maxPlayers = maxPlayers
                self.minPlayers = minPlayers
                self.referenceName = referenceName
                self.ruleLanguageVersion = ruleLanguageVersion
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                maxPlayers = try container.decode(Int.self, forKey: "maxPlayers")
                minPlayers = try container.decode(Int.self, forKey: "minPlayers")
                referenceName = try container.decode(String.self, forKey: "referenceName")
                ruleLanguageVersion = try container.decode(Int.self, forKey: "ruleLanguageVersion")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(maxPlayers, forKey: "maxPlayers")
                try container.encode(minPlayers, forKey: "minPlayers")
                try container.encode(referenceName, forKey: "referenceName")
                try container.encode(ruleLanguageVersion, forKey: "ruleLanguageVersion")
            }
        }
    }
}
