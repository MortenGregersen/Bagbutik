import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingRule
 The data structure that represents a matchmaking rule.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrule>
 */
public struct GameCenterMatchmakingRule: Codable, Sendable, Identifiable {
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
        public var description: String?
        public var expression: String?
        public var referenceName: String?
        public var type: AttributesType?
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
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            description = try container.decodeIfPresent(String.self, forKey: "description")
            expression = try container.decodeIfPresent(String.self, forKey: "expression")
            referenceName = try container.decodeIfPresent(String.self, forKey: "referenceName")
            type = try container.decode(AttributesType.self, forKey: "type")
            weight = try container.decodeIfPresent(Double.self, forKey: "weight")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(description, forKey: "description")
            try container.encodeIfPresent(expression, forKey: "expression")
            try container.encodeIfPresent(referenceName, forKey: "referenceName")
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(weight, forKey: "weight")
        }

        public enum AttributesType: String, Sendable, Codable, CaseIterable {
            case compatible = "COMPATIBLE"
            case distance = "DISTANCE"
            case match = "MATCH"
            case team = "TEAM"
        }
    }
}
