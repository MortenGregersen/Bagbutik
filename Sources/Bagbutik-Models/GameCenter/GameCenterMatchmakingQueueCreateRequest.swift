import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingQueueCreateRequest
 The request body you use to create a queue.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuecreaterequest>
 */
public struct GameCenterMatchmakingQueueCreateRequest: Codable, RequestBody {
    /// The data structure of the request body.
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     # GameCenterMatchmakingQueueCreateRequest.Data
     The data structure of the request body you use to create a queue.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuecreaterequest/data>
     */
    public struct Data: Codable {
        public var type: String { "gameCenterMatchmakingQueues" }
        public let attributes: Attributes
        public let relationships: Relationships

        public init(attributes: Attributes,
                    relationships: Relationships)
        {
            self.attributes = attributes
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            attributes = try container.decode(Attributes.self, forKey: .attributes)
            relationships = try container.decode(Relationships.self, forKey: .relationships)
            if try container.decode(String.self, forKey: .type) != type {
                throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(type, forKey: .type)
            try container.encode(attributes, forKey: .attributes)
            try container.encode(relationships, forKey: .relationships)
        }

        private enum CodingKeys: String, CodingKey {
            case attributes
            case relationships
            case type
        }

        /**
         # GameCenterMatchmakingQueueCreateRequest.Data.Attributes
         The attributes for a queue that you create.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuecreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            public var classicMatchmakingBundleIds: [String]?
            /// A name for the queue that’s unique within the scope of your development team.
            public let referenceName: String

            public init(classicMatchmakingBundleIds: [String]? = nil,
                        referenceName: String)
            {
                self.classicMatchmakingBundleIds = classicMatchmakingBundleIds
                self.referenceName = referenceName
            }
        }

        /**
         # GameCenterMatchmakingQueueCreateRequest.Data.Relationships
         The rule sets that you include when creating a queue.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuecreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            /// The experimental rule set to test the associated rules with live match requests. If you provide an experimental rule set, Game Center processes the match requests in the queue using both the experimental and the required rule set, except that it doesn’t return the results of the experimental rule set to clients. Then compare the results of the experimental rule set with the production rule set using metrics, such as the [List all queues](https://developer.apple.com/documentation/appstoreconnectapi/list_all_queues) and [Read queue information](https://developer.apple.com/documentation/appstoreconnectapi/read_queue_information) endpoints.
            public var experimentRuleSet: ExperimentRuleSet?
            /// The rule set to associate with this queue.
            public let ruleSet: RuleSet

            public init(experimentRuleSet: ExperimentRuleSet? = nil,
                        ruleSet: RuleSet)
            {
                self.experimentRuleSet = experimentRuleSet
                self.ruleSet = ruleSet
            }

            /**
             # GameCenterMatchmakingQueueCreateRequest.Data.Relationships.ExperimentRuleSet
             An experimental rule set for testing this queue.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuecreaterequest/data/relationships/experimentruleset>
             */
            public struct ExperimentRuleSet: Codable {
                /// The data structure for the experimental rule set.
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
                 # GameCenterMatchmakingQueueCreateRequest.Data.Relationships.ExperimentRuleSet.Data
                 The data structure of the request body for an experimental rule set.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuecreaterequest/data/relationships/experimentruleset/data>
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
             # GameCenterMatchmakingQueueCreateRequest.Data.Relationships.RuleSet
             The rule set associated with the queue.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuecreaterequest/data/relationships/ruleset>
             */
            public struct RuleSet: Codable {
                /// The data structure for the rule set.
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 # GameCenterMatchmakingQueueCreateRequest.Data.Relationships.RuleSet.Data
                 The data structure of the request body for the rule set.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingqueuecreaterequest/data/relationships/ruleset/data>
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
