import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingQueueUpdateRequest
 The request body you use to modify a queue.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueueupdaterequest>
 */
public struct GameCenterMatchmakingQueueUpdateRequest: Codable, Sendable, RequestBody {
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
     # GameCenterMatchmakingQueueUpdateRequest.Data
     The data structure of the request body you use to modify a queue.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueueupdaterequest/data>
     */
    public struct Data: Codable, Sendable, Identifiable {
        /// The unique identifier for the queue.
        public let id: String
        /// The type of resource.
        public var type: String { "gameCenterMatchmakingQueues" }
        public var attributes: Attributes?
        public var relationships: Relationships?

        public init(id: String,
                    attributes: Attributes? = nil,
                    relationships: Relationships? = nil)
        {
            self.id = id
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            id = try container.decode(String.self, forKey: "id")
            attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
            relationships = try container.decodeIfPresent(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(id, forKey: "id")
            try container.encode(type, forKey: "type")
            try container.encodeIfPresent(attributes, forKey: "attributes")
            try container.encodeIfPresent(relationships, forKey: "relationships")
        }

        /**
         # GameCenterMatchmakingQueueUpdateRequest.Data.Attributes
         The attributes for a queue that you modify.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueueupdaterequest/data/attributes>
         */
        public struct Attributes: Codable, Sendable {
            public var classicMatchmakingBundleIds: [String]?

            public init(classicMatchmakingBundleIds: [String]? = nil) {
                self.classicMatchmakingBundleIds = classicMatchmakingBundleIds
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                classicMatchmakingBundleIds = try container.decodeIfPresent([String].self, forKey: "classicMatchmakingBundleIds")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(classicMatchmakingBundleIds, forKey: "classicMatchmakingBundleIds")
            }
        }

        /**
         # GameCenterMatchmakingQueueUpdateRequest.Data.Relationships
         The rule sets related to the queue.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueueupdaterequest/data/relationships>
         */
        public struct Relationships: Codable, Sendable {
            /// A rule set for testing the queue.
            public var experimentRuleSet: ExperimentRuleSet?
            /// The rule set for this queue.
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

            /**
             # GameCenterMatchmakingQueueUpdateRequest.Data.Relationships.ExperimentRuleSet
             The rule set for testing the queue.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueueupdaterequest/data/relationships/experimentruleset>
             */
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

                /**
                 # GameCenterMatchmakingQueueUpdateRequest.Data.Relationships.ExperimentRuleSet.Data
                 The data structure for the experimental rule set.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueueupdaterequest/data/relationships/experimentruleset/data>
                 */
                public struct Data: Codable, Sendable, Identifiable {
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

            /**
             # GameCenterMatchmakingQueueUpdateRequest.Data.Relationships.RuleSet
             The rule set associated with the queue.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueueupdaterequest/data/relationships/ruleset>
             */
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

                /**
                 # GameCenterMatchmakingQueueUpdateRequest.Data.Relationships.RuleSet.Data
                 The data structure for the rule set.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueueupdaterequest/data/relationships/ruleset/data>
                 */
                public struct Data: Codable, Sendable, Identifiable {
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
