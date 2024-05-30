import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingQueue
 The data structure that represents a queue.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueue>
 */
public struct GameCenterMatchmakingQueue: Codable, Identifiable {
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
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
        try container.encodeIfPresent(relationships, forKey: .relationships)
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case relationships
        case type
    }

    /**
     # GameCenterMatchmakingQueue.Attributes
     The attributes of the rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueue/attributes>
     */
    public struct Attributes: Codable {
        public var classicMatchmakingBundleIds: [String]?
        /// A name for the queue that’s unique within the scope of your development team.
        public var referenceName: String?

        public init(classicMatchmakingBundleIds: [String]? = nil,
                    referenceName: String? = nil)
        {
            self.classicMatchmakingBundleIds = classicMatchmakingBundleIds
            self.referenceName = referenceName
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            classicMatchmakingBundleIds = try container.decodeIfPresent([String].self, forKey: .classicMatchmakingBundleIds)
            referenceName = try container.decodeIfPresent(String.self, forKey: .referenceName)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(classicMatchmakingBundleIds, forKey: .classicMatchmakingBundleIds)
            try container.encodeIfPresent(referenceName, forKey: .referenceName)
        }

        private enum CodingKeys: String, CodingKey {
            case classicMatchmakingBundleIds
            case referenceName
        }
    }

    /**
     # GameCenterMatchmakingQueue.Relationships
     The rule sets associated with the queue.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueue/relationships>
     */
    public struct Relationships: Codable {
        public var experimentRuleSet: ExperimentRuleSet?
        public var ruleSet: RuleSet?

        public init(experimentRuleSet: ExperimentRuleSet? = nil,
                    ruleSet: RuleSet? = nil)
        {
            self.experimentRuleSet = experimentRuleSet
            self.ruleSet = ruleSet
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            experimentRuleSet = try container.decodeIfPresent(ExperimentRuleSet.self, forKey: .experimentRuleSet)
            ruleSet = try container.decodeIfPresent(RuleSet.self, forKey: .ruleSet)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encodeIfPresent(experimentRuleSet, forKey: .experimentRuleSet)
            try container.encodeIfPresent(ruleSet, forKey: .ruleSet)
        }

        private enum CodingKeys: String, CodingKey {
            case experimentRuleSet
            case ruleSet
        }

        /**
         # GameCenterMatchmakingQueue.Relationships.ExperimentRuleSet
         An experimental rule set for testing this queue.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueue/relationships/experimentruleset>
         */
        public struct ExperimentRuleSet: Codable {
            @NullCodable public var data: Data?
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent(Data.self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
            }

            /**
             # GameCenterMatchmakingQueue.Relationships.ExperimentRuleSet.Data
             The data structure of the request body for an experimental rule set.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueue/relationships/experimentruleset/data>
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
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    id = try container.decode(String.self, forKey: .id)
                    if try container.decode(String.self, forKey: .type) != type {
                        throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(id, forKey: .id)
                    try container.encode(type, forKey: .type)
                }

                private enum CodingKeys: String, CodingKey {
                    case id
                    case type
                }
            }

            /**
             # GameCenterMatchmakingQueue.Relationships.ExperimentRuleSet.Links
             The link representations of the experiment rule set object.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueue/relationships/experimentruleset/links>
             */
            public struct Links: Codable {
                /// A link object representation of the relationship.
                public var related: String?
                /// A string URI representation of the relationship.
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }

        /**
         # GameCenterMatchmakingQueue.Relationships.RuleSet
         The rule set associated with the queue.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueue/relationships/ruleset>
         */
        public struct RuleSet: Codable {
            @NullCodable public var data: Data?
            public var links: Links?

            public init(data: Data? = nil,
                        links: Links? = nil)
            {
                self.data = data
                self.links = links
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                data = try container.decodeIfPresent(Data.self, forKey: .data)
                links = try container.decodeIfPresent(Links.self, forKey: .links)
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encode(data, forKey: .data)
                try container.encodeIfPresent(links, forKey: .links)
            }

            private enum CodingKeys: String, CodingKey {
                case data
                case links
            }

            /**
             # GameCenterMatchmakingQueue.Relationships.RuleSet.Data
             The data structure for the rule set.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueue/relationships/ruleset/data>
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
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    id = try container.decode(String.self, forKey: .id)
                    if try container.decode(String.self, forKey: .type) != type {
                        throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(id, forKey: .id)
                    try container.encode(type, forKey: .type)
                }

                private enum CodingKeys: String, CodingKey {
                    case id
                    case type
                }
            }

            /**
             # GameCenterMatchmakingQueue.Relationships.RuleSet.Links
             An object that represents rule set links.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueue/relationships/ruleset/links>
             */
            public struct Links: Codable {
                /// A link object representation of the rule set relationship.
                public var related: String?
                /// A string URI representation of the rule set relationship.
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    related = try container.decodeIfPresent(String.self, forKey: .related)
                    itself = try container.decodeIfPresent(String.self, forKey: .itself)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encodeIfPresent(related, forKey: .related)
                    try container.encodeIfPresent(itself, forKey: .itself)
                }

                private enum CodingKeys: String, CodingKey {
                    case itself = "self"
                    case related
                }
            }
        }
    }
}
