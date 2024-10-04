import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingRuleCreateRequest
 The request body you use to create a rule.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulecreaterequest>
 */
public struct GameCenterMatchmakingRuleCreateRequest: Codable, Sendable, RequestBody {
    /// The data structure of the request body.
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
        public var type: String { "gameCenterMatchmakingRules" }
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

        public struct Attributes: Codable, Sendable {
            public let description: String
            public let expression: String
            public let referenceName: String
            public let type: GameCenterMatchmakingRule.Attributes.AttributesType
            public var weight: Double?

            public init(description: String,
                        expression: String,
                        referenceName: String,
                        type: GameCenterMatchmakingRule.Attributes.AttributesType,
                        weight: Double? = nil)
            {
                self.description = description
                self.expression = expression
                self.referenceName = referenceName
                self.type = type
                self.weight = weight
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                description = try container.decode(String.self, forKey: "description")
                expression = try container.decode(String.self, forKey: "expression")
                referenceName = try container.decode(String.self, forKey: "referenceName")
                type = try container.decode(GameCenterMatchmakingRule.Attributes.AttributesType.self, forKey: "type")
                weight = try container.decodeIfPresent(Double.self, forKey: "weight")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(description, forKey: "description")
                try container.encode(expression, forKey: "expression")
                try container.encode(referenceName, forKey: "referenceName")
                try container.encode(type, forKey: "type")
                try container.encodeIfPresent(weight, forKey: "weight")
            }
        }

        public struct Relationships: Codable, Sendable {
            public let ruleSet: RuleSet

            public init(ruleSet: RuleSet) {
                self.ruleSet = ruleSet
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                ruleSet = try container.decode(RuleSet.self, forKey: "ruleSet")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(ruleSet, forKey: "ruleSet")
            }

            public struct RuleSet: Codable, Sendable {
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

                public struct Data: Codable, Sendable, Identifiable {
                    public let id: String
                    public var type: String { "gameCenterMatchmakingRuleSets" }

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
