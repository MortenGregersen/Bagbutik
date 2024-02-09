import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingQueueUpdateRequest
 The request body you use to modify a queue.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueueupdaterequest>
 */
public struct GameCenterMatchmakingQueueUpdateRequest: Codable, RequestBody {
    /// The data structure of the request body.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     # GameCenterMatchmakingQueueUpdateRequest.Data
     The data structure of the request body you use to modify a queue.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueueupdaterequest/data>
     */
    public struct Data: Codable, Identifiable {
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
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(String.self, forKey: .id)
            attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
            relationships = try container.decodeIfPresent(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(type, forKey: .type)
            try container.encodeIfPresent(attributes, forKey: .attributes)
            try container.encodeIfPresent(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case id
            case relationships
            case type
        }

        /**
         # GameCenterMatchmakingQueueUpdateRequest.Data.Attributes
         The attributes for a queue that you modify.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueueupdaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public var classicMatchmakingBundleIds: [String]?

            public init(classicMatchmakingBundleIds: [String]? = nil) {
                self.classicMatchmakingBundleIds = classicMatchmakingBundleIds
            }
        }

        /**
         # GameCenterMatchmakingQueueUpdateRequest.Data.Relationships
         The rule sets related to the queue.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueueupdaterequest/data/relationships>
         */
        public struct Relationships: Codable {
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

            /**
             # GameCenterMatchmakingQueueUpdateRequest.Data.Relationships.ExperimentRuleSet
             The rule set for testing the queue.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueueupdaterequest/data/relationships/experimentruleset>
             */
            public struct ExperimentRuleSet: Codable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    data = try container.decodeIfPresent(Data.self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
                }

                /**
                 # GameCenterMatchmakingQueueUpdateRequest.Data.Relationships.ExperimentRuleSet.Data
                 The data structure for the experimental rule set.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueueupdaterequest/data/relationships/experimentruleset/data>
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
            }

            /**
             # GameCenterMatchmakingQueueUpdateRequest.Data.Relationships.RuleSet
             The rule set associated with the queue.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueueupdaterequest/data/relationships/ruleset>
             */
            public struct RuleSet: Codable {
                @NullCodable public var data: Data?

                public init(data: Data? = nil) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    data = try container.decodeIfPresent(Data.self, forKey: .data)
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)
                    try container.encode(data, forKey: .data)
                }

                private enum CodingKeys: String, CodingKey {
                    case data
                }

                /**
                 # GameCenterMatchmakingQueueUpdateRequest.Data.Relationships.RuleSet.Data
                 The data structure for the rule set.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueueupdaterequest/data/relationships/ruleset/data>
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
            }
        }
    }
}
