import Bagbutik_Core
import Foundation

public struct GameCenterMatchmakingRuleSetTestCreateRequest: Codable, Sendable, RequestBody {
    public let data: Data
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

    public struct Data: Codable, Sendable {
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

        public struct Relationships: Codable, Sendable {
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

            public struct MatchmakingRequests: Codable, Sendable {
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

                public struct Data: Codable, Sendable, Identifiable {
                    public let id: String
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

            public struct MatchmakingRuleSet: Codable, Sendable {
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

    public enum Included: Codable, Sendable {
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
