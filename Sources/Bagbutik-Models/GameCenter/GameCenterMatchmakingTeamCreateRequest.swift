import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingTeamCreateRequest
 The request body you use to create a team.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingteamcreaterequest>
 */
public struct GameCenterMatchmakingTeamCreateRequest: Codable, RequestBody {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }

    /**
     # GameCenterMatchmakingTeamCreateRequest.Data
     The data structure of the request body you use to create a team.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingteamcreaterequest/data>
     */
    public struct Data: Codable {
        public var type: String { "gameCenterMatchmakingTeams" }
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
         # GameCenterMatchmakingTeamCreateRequest.Data.Attributes
         The attributes for a team that you create.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingteamcreaterequest/data/attributes>
         */
        public struct Attributes: Codable {
            /// The maximum number of players on the team.
            public let maxPlayers: Int
            /// The minimum number of players on the team.
            public let minPlayers: Int
            /// A name for the team that’s unique within the scope of its rule set.
            public let referenceName: String

            public init(maxPlayers: Int,
                        minPlayers: Int,
                        referenceName: String)
            {
                self.maxPlayers = maxPlayers
                self.minPlayers = minPlayers
                self.referenceName = referenceName
            }
        }

        /**
         # GameCenterMatchmakingTeamCreateRequest.Data.Relationships
         The relationships from the team to other objects.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingteamcreaterequest/data/relationships>
         */
        public struct Relationships: Codable {
            public let ruleSet: RuleSet

            public init(ruleSet: RuleSet) {
                self.ruleSet = ruleSet
            }

            /**
             # GameCenterMatchmakingTeamCreateRequest.Data.Relationships.RuleSet
             The relationship to the rule set that you provide when you create a team.

             Full documentation:
             <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingteamcreaterequest/data/relationships/ruleset>
             */
            public struct RuleSet: Codable {
                public let data: Data

                public init(data: Data) {
                    self.data = data
                }

                /**
                 # GameCenterMatchmakingTeamCreateRequest.Data.Relationships.RuleSet.Data
                 The type and ID for the rule set that you’re adding the team to.

                 Full documentation:
                 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingteamcreaterequest/data/relationships/ruleset/data>
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
