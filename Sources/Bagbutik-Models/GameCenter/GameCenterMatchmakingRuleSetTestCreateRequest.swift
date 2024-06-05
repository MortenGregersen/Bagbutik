import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingRuleSetTestCreateRequest
 The request body for testing the rules in a rule set.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulesettestcreaterequest>
 */
public struct GameCenterMatchmakingRuleSetTestCreateRequest: Codable, RequestBody {
    /// The data structure for the request body.
    public let data: Data
    /// The resource objects that Game Center uses in the test.
    public var included: [Included]?

    public init(data: Data,
                included: [Included]? = nil)
    {
        self.data = data
        self.included = included
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        data = try container.decode(Data.self, forKey: "data")
        included = try container.decodeIfPresent([Included].self, forKey: "included")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: AnyCodingKey.self)
        try container.encode(data, forKey: "data")
        try container.encodeIfPresent(included, forKey: "included")
    }

    /**
     # GameCenterMatchmakingRuleSetTestCreateRequest.Data
     The data structure of the request body for testing a rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulesettestcreaterequest/data>
     */
    public struct Data: Codable {
        public var type: String { "gameCenterMatchmakingRuleSetTests" }
        public let relationships: Relationships

        public init(relationships: Relationships) {
            self.relationships = relationships
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            relationships = try container.decode(Relationships.self, forKey: "relationships")
            if try container.decode(String.self, forKey: "type") != type {
                throw DecodingError.dataCorruptedError(forKey: "type", in: container, debugDescription: "Not matching \(type)")
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encode(type, forKey: "type")
            try container.encode(relationships, forKey: "relationships")
        }

        /**
         # GameCenterMatchmakingRuleSetTestCreateRequest.Data.Relationships
         The relationships of the rule set to other objects.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulesettestcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let matchmakingRequests: MatchmakingRequests
            public let matchmakingRuleSet: MatchmakingRuleSet

            public init(matchmakingRequests: MatchmakingRequests,
                        matchmakingRuleSet: MatchmakingRuleSet)
            {
                self.matchmakingRequests = matchmakingRequests
                self.matchmakingRuleSet = matchmakingRuleSet
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                matchmakingRequests = try container.decode(MatchmakingRequests.self, forKey: "matchmakingRequests")
                matchmakingRuleSet = try container.decode(MatchmakingRuleSet.self, forKey: "matchmakingRuleSet")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(matchmakingRequests, forKey: "matchmakingRequests")
                try container.encode(matchmakingRuleSet, forKey: "matchmakingRuleSet")
            }

            /**
             # GameCenterMatchmakingRuleSetTestCreateRequest.Data.Relationships.MatchmakingRequests
             The data structure representing the sample match requests.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulesettestcreaterequest/data/relationships/matchmakingrequests>
             */
            public struct MatchmakingRequests: Codable {
                public let data: [Data]

                public init(data: [Data]) {
                    self.data = data
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    data = try container.decode([Data].self, forKey: "data")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encode(data, forKey: "data")
                }

                /**
                 # GameCenterMatchmakingRuleSetTestCreateRequest.Data.Relationships.MatchmakingRequests.Data
                 The resource object for a match request.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulesettestcreaterequest/data/relationships/matchmakingrequests/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The identifier for a ``GameCenterMatchmakingTestRequestInlineCreate`` resource object that you add to the `included` field of the request body.
                    public let id: String
                    /// The type of resource object.
                    public var type: String { "gameCenterMatchmakingTestRequests" }

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
             # GameCenterMatchmakingRuleSetTestCreateRequest.Data.Relationships.MatchmakingRuleSet
             The data structure representation of the rule set to test.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulesettestcreaterequest/data/relationships/matchmakingruleset>
             */
            public struct MatchmakingRuleSet: Codable {
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
                 # GameCenterMatchmakingRuleSetTestCreateRequest.Data.Relationships.MatchmakingRuleSet.Data
                 A resource object for a rule set.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulesettestcreaterequest/data/relationships/matchmakingruleset/data>
                 */
                public struct Data: Codable, Identifiable {
                    /// The identifier for the rule set that appears in the response when you create it.
                    public let id: String
                    /// The type of resource object.
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

    public enum Included: Codable {
        case gameCenterMatchmakingTestPlayerPropertyInlineCreate(GameCenterMatchmakingTestPlayerPropertyInlineCreate)
        case gameCenterMatchmakingTestRequestInlineCreate(GameCenterMatchmakingTestRequestInlineCreate)

        public init(from decoder: Decoder) throws {
            if let gameCenterMatchmakingTestPlayerPropertyInlineCreate = try? GameCenterMatchmakingTestPlayerPropertyInlineCreate(from: decoder) {
                self = .gameCenterMatchmakingTestPlayerPropertyInlineCreate(gameCenterMatchmakingTestPlayerPropertyInlineCreate)
            } else if let gameCenterMatchmakingTestRequestInlineCreate = try? GameCenterMatchmakingTestRequestInlineCreate(from: decoder) {
                self = .gameCenterMatchmakingTestRequestInlineCreate(gameCenterMatchmakingTestRequestInlineCreate)
            } else {
                throw DecodingError.typeMismatch(Included.self, DecodingError.Context(codingPath: decoder.codingPath,
                                                                                      debugDescription: "Unknown Included"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            switch self {
            case let .gameCenterMatchmakingTestPlayerPropertyInlineCreate(value):
                try value.encode(to: encoder)
            case let .gameCenterMatchmakingTestRequestInlineCreate(value):
                try value.encode(to: encoder)
            }
        }
    }
}
