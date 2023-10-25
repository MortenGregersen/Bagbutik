import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingRuleSetTest
 The data structure that represents the results of testing a rule set.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulesettest>
 */
public struct GameCenterMatchmakingRuleSetTest: Codable, Identifiable {
    /// A unique identifier for the rule set.
    public let id: String
    /// The link representations of the object.
    public var links: ResourceLinks?
    /// The type of resource object.
    public var type: String { "gameCenterMatchmakingRuleSetTests" }
    /// The object attributes.
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
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: .links)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
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
    }

    private enum CodingKeys: String, CodingKey {
        case attributes
        case id
        case links
        case type
    }

    /**
     # GameCenterMatchmakingRuleSetTest.Attributes
     The results of testing a rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulesettest/attributes>
     */
    public struct Attributes: Codable {
        public var matchmakingResults: [MatchmakingResults]?

        public init(matchmakingResults: [MatchmakingResults]? = nil) {
            self.matchmakingResults = matchmakingResults
        }

        /**
         # GameCenterMatchmakingRuleSetTest.Attributes.MatchmakingResults
         The data structure representing the results of a match request.

         Full documentation:
         <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulesettest/attributes/matchmakingresults>
         */
        public struct MatchmakingResults: Codable {
            /// A unique identifier for the request.
            public var requestName: String?
            /// The assignments of players to teams.
            public var teamAssignments: [GameCenterMatchmakingTeamAssignment]?

            public init(requestName: String? = nil,
                        teamAssignments: [GameCenterMatchmakingTeamAssignment]? = nil)
            {
                self.requestName = requestName
                self.teamAssignments = teamAssignments
            }
        }
    }
}
