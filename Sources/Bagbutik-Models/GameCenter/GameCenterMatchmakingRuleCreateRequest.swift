import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingRuleCreateRequest
 The request body you use to create a rule.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulecreaterequest>
 */
public struct GameCenterMatchmakingRuleCreateRequest: Codable, RequestBody {
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

    /**
     # GameCenterMatchmakingRuleCreateRequest.Data
     The data structure of the request body you use to create a rule.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulecreaterequest/data>
     */
    public struct Data: Codable {
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

        /**
         # GameCenterMatchmakingRuleCreateRequest.Data.Attributes
         The attributes for a rule that you create.

         The possible values for the `type` field are:

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulecreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// A human-readable description of the rule.
            public let description: String
            /// Code that returns a Boolean or numeric value that the matchmaking rules algorithm executes to compare or filter match requests.
            public let expression: String
            /// A name for the rule that’s unique within the scope of its rule set.
            public let referenceName: String
            /// The type or category of the rule that determines the return value and properties available in the expression.
            public let type: GameCenterMatchmakingRule.Attributes.AttributesType
            /// A numeric value for the rule when `type` is either `DISTANCE` or `MATCH`.
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

        /**
         # GameCenterMatchmakingRuleCreateRequest.Data.Relationships
         The relationships to other objects that you include when creating a rule.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulecreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
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

            /**
             # GameCenterMatchmakingRuleCreateRequest.Data.Relationships.RuleSet
             The relationship to the rule set that you provide when you create a rule.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulecreaterequest/data/relationships/ruleset>
             */
            public struct RuleSet: Codable {
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

                /**
                 # GameCenterMatchmakingRuleCreateRequest.Data.Relationships.RuleSet.Data
                 The type and ID for the rule set that you’re adding the rule to.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulecreaterequest/data/relationships/ruleset/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The unique identifier for the rule set.
                    public let id: String
                    /// The type of resource.
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
