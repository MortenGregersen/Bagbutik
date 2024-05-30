import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingRule
 The data structure that represents a matchmaking rule.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrule>
 */
public struct GameCenterMatchmakingRule: Codable, Identifiable {
    /// The unique identifier for the rule.
    public let id: String
    public var links: ResourceLinks?
    public var type: String { "gameCenterMatchmakingRules" }
    /// The attributes of the rule.
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        if try container.decode(String.self, forKey: .type) != type {
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encodeIfPresent(links, forKey: .links)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(attributes, forKey: .attributes)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case type
    }

    /**
     # GameCenterMatchmakingRule.Attributes
     The attributes of a matchmaking rule.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrule/attributes>
     */
    public struct Attributes: Codable {
        /// A human-readable description of the rule.
        public var description: String?
        /// Code that returns a Boolean or numeric value that the matchmaking rules algorithm executes to compare or filter match requests.
        public var expression: String?
        /// A name for the rule that’s unique within the scope of its rule set.
        public var referenceName: String?
        /// The type or category of the rule that determines the return value and properties available in the expression.
        public var type: AttributesType?
        /// A numeric value for the rule when `type` is either `DISTANCE` or `MATCH`.
        public var weight: Double?

        public init(description: String? = nil,
                    expression: String? = nil,
                    referenceName: String? = nil,
                    type: AttributesType? = nil,
                    weight: Double? = nil)
        {
            self.description = description
            self.expression = expression
            self.referenceName = referenceName
            self.type = type
            self.weight = weight
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            description = try container.decodeIfPresent(String.self, forKey: .description)
            expression = try container.decodeIfPresent(String.self, forKey: .expression)
            referenceName = try container.decodeIfPresent(String.self, forKey: .referenceName)
            type = try container.decode(AttributesType.self, forKey: .type)
            weight = try container.decodeIfPresent(Double.self, forKey: .weight)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(description, forKey: .description)
            try container.encodeIfPresent(expression, forKey: .expression)
            try container.encodeIfPresent(referenceName, forKey: .referenceName)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(weight, forKey: .weight)
        }

        private enum CodingKeys: String, CodingKey {
            case description
            case expression
            case referenceName
            case type
            case weight
        }

        public enum AttributesType: String, Codable, CaseIterable {
            case compatible = "COMPATIBLE"
            case distance = "DISTANCE"
            case match = "MATCH"
            case team = "TEAM"
        }
    }
}
