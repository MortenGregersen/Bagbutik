import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingQueue
 The data structure that represents a queue.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueue>
 */
public struct GameCenterMatchmakingQueue: Codable, Sendable, Identifiable {
    /// The unique identifier for the rule.
    public let id: String
    /// The link representations of the object.
    public var links: ResourceLinks?
    /// The type of resource.
    public var type: String { "gameCenterMatchmakingQueues" }
    /// The attributes of the queue.
    public var attributes: Attributes?
    /// The relationships of the queue.
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
        public var classicMatchmakingBundleIds: [String]?
        public var referenceName: String?

        public init(classicMatchmakingBundleIds: [String]? = nil,
                    referenceName: String? = nil)
        {
            self.classicMatchmakingBundleIds = classicMatchmakingBundleIds
            self.referenceName = referenceName
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            classicMatchmakingBundleIds = try container.decodeIfPresent([String].self, forKey: "classicMatchmakingBundleIds")
            referenceName = try container.decodeIfPresent(String.self, forKey: "referenceName")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(classicMatchmakingBundleIds, forKey: "classicMatchmakingBundleIds")
            try container.encodeIfPresent(referenceName, forKey: "referenceName")
        }
    }

    public struct Relationships: Codable, Sendable {
        public var experimentRuleSet: ExperimentRuleSet?
        public var ruleSet: RuleSet?

        public init(experimentRuleSet: ExperimentRuleSet? = nil,
                    ruleSet: RuleSet? = nil)
        {
            self.experimentRuleSet = experimentRuleSet
            self.ruleSet = ruleSet
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            experimentRuleSet = try container.decodeIfPresent(ExperimentRuleSet.self, forKey: "experimentRuleSet")
            ruleSet = try container.decodeIfPresent(RuleSet.self, forKey: "ruleSet")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(experimentRuleSet, forKey: "experimentRuleSet")
            try container.encodeIfPresent(ruleSet, forKey: "ruleSet")
        }

        public struct ExperimentRuleSet: Codable, Sendable {
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

        public struct RuleSet: Codable, Sendable {
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
