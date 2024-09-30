import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingRuleSet
 The data structure that represents a rule set.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleset>
 */
public struct GameCenterMatchmakingRuleSet: Codable, Sendable, Identifiable {
    /// The unique identifier for the rule set.
    public let id: String
    public var links: ResourceLinks?
    /// The type of resource.
    public var type: String { "gameCenterMatchmakingRuleSets" }
    /// The attributes of the rule set.
    public var attributes: Attributes?
    /// The relationships to other objects belonging to the rule set.
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

    /**
     # GameCenterMatchmakingRuleSet.Attributes
     The attributes of the rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleset/attributes>
     */
    public struct Attributes: Codable, Sendable {
        /// The maximum number of players who can join the matches that Game Center finds using these rules.
        public var maxPlayers: Int?
        /// The minimum number of players who can join the matches that Game Center finds using these rules.
        public var minPlayers: Int?
        /// A name for the rule set that’s unique within the scope of your development team.
        public var referenceName: String?
        /// The version of the expression language that all the rules in this rule set use. The only possible value is `1`.
        public var ruleLanguageVersion: Int?

        public init(maxPlayers: Int? = nil,
                    minPlayers: Int? = nil,
                    referenceName: String? = nil,
                    ruleLanguageVersion: Int? = nil)
        {
            self.maxPlayers = maxPlayers
            self.minPlayers = minPlayers
            self.referenceName = referenceName
            self.ruleLanguageVersion = ruleLanguageVersion
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            maxPlayers = try container.decodeIfPresent(Int.self, forKey: "maxPlayers")
            minPlayers = try container.decodeIfPresent(Int.self, forKey: "minPlayers")
            referenceName = try container.decodeIfPresent(String.self, forKey: "referenceName")
            ruleLanguageVersion = try container.decodeIfPresent(Int.self, forKey: "ruleLanguageVersion")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(maxPlayers, forKey: "maxPlayers")
            try container.encodeIfPresent(minPlayers, forKey: "minPlayers")
            try container.encodeIfPresent(referenceName, forKey: "referenceName")
            try container.encodeIfPresent(ruleLanguageVersion, forKey: "ruleLanguageVersion")
        }
    }

    /**
     # GameCenterMatchmakingRuleSet.Relationships
     The relationships to other objects belonging to the rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleset/relationships>
     */
    public struct Relationships: Codable, Sendable {
        /// The queues belonging to the rule set.
        public var matchmakingQueues: MatchmakingQueues?
        /// The rules belonging to the rule set.
        public var rules: Rules?
        /// The teams belonging to the rule set.
        public var teams: Teams?

        public init(matchmakingQueues: MatchmakingQueues? = nil,
                    rules: Rules? = nil,
                    teams: Teams? = nil)
        {
            self.matchmakingQueues = matchmakingQueues
            self.rules = rules
            self.teams = teams
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            matchmakingQueues = try container.decodeIfPresent(MatchmakingQueues.self, forKey: "matchmakingQueues")
            rules = try container.decodeIfPresent(Rules.self, forKey: "rules")
            teams = try container.decodeIfPresent(Teams.self, forKey: "teams")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(matchmakingQueues, forKey: "matchmakingQueues")
            try container.encodeIfPresent(rules, forKey: "rules")
            try container.encodeIfPresent(teams, forKey: "teams")
        }

        /**
         # GameCenterMatchmakingRuleSet.Relationships.MatchmakingQueues
         The queues related to the rule set.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleset/relationships/matchmakingqueues>
         */
        public struct MatchmakingQueues: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: Links?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: Links? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            /**
             # GameCenterMatchmakingRuleSet.Relationships.MatchmakingQueues.Data
             The data structure of a matchmaking queue.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleset/relationships/matchmakingqueues/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// A unique identifier for a queue.
                public let id: String
                /// The type of resource.
                public var type: String { "gameCenterMatchmakingQueues" }

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

            /**
             # GameCenterMatchmakingRuleSet.Relationships.MatchmakingQueues.Links
             The link representations of the queue object.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleset/relationships/matchmakingqueues/links>
             */
            public struct Links: Codable, Sendable {
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
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }

        /**
         # GameCenterMatchmakingRuleSet.Relationships.Rules
         The rules belonging to the rule set.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleset/relationships/rules>
         */
        public struct Rules: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: Links?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: Links? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            /**
             # GameCenterMatchmakingRuleSet.Relationships.Rules.Data
             The data structure of a matchmaking rule.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleset/relationships/rules/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// A unique identifier for a rule.
                public let id: String
                /// The type of resource.
                public var type: String { "gameCenterMatchmakingRules" }

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

            /**
             # GameCenterMatchmakingRuleSet.Relationships.Rules.Links
             The link representations of the rule object.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleset/relationships/rules/links>
             */
            public struct Links: Codable, Sendable {
                /// A link object representation of the  relationship.
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
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }

        /**
         # GameCenterMatchmakingRuleSet.Relationships.Teams
         The teams belonging to the rule set.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleset/relationships/teams>
         */
        public struct Teams: Codable, Sendable {
            @NullCodable public var data: [Data]?
            public var links: Links?
            public var meta: PagingInformation?

            public init(data: [Data]? = nil,
                        links: Links? = nil,
                        meta: PagingInformation? = nil)
            {
                self.data = data
                self.links = links
                self.meta = meta
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                data = try container.decodeIfPresent([Data].self, forKey: "data")
                links = try container.decodeIfPresent(Links.self, forKey: "links")
                meta = try container.decodeIfPresent(PagingInformation.self, forKey: "meta")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encode(data, forKey: "data")
                try container.encodeIfPresent(links, forKey: "links")
                try container.encodeIfPresent(meta, forKey: "meta")
            }

            /**
             # GameCenterMatchmakingRuleSet.Relationships.Teams.Data
             The data structure of a matchmaking team.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingruleset/relationships/teams/data>
             */
            public struct Data: Codable, Sendable, Identifiable {
                /// A unique identifier for a team.
                public let id: String
                /// The type of resource.
                public var type: String { "gameCenterMatchmakingTeams" }

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

            public struct Links: Codable, Sendable {
                public var related: String?
                public var itself: String?

                public init(related: String? = nil,
                            self itself: String? = nil)
                {
                    self.related = related
                    self.itself = itself
                }

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: AnyCodingKey.self)
                    related = try container.decodeIfPresent(String.self, forKey: "related")
                    itself = try container.decodeIfPresent(String.self, forKey: "self")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: AnyCodingKey.self)
                    try container.encodeIfPresent(related, forKey: "related")
                    try container.encodeIfPresent(itself, forKey: "self")
                }
            }
        }
    }
}
