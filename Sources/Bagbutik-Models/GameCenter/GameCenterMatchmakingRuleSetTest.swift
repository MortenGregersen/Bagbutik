import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingRuleSetTest
 The data structure that represents the results of testing a rule set.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingrulesettest>
 */
public struct GameCenterMatchmakingRuleSetTest: Codable, Sendable, Identifiable {
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
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        id = try container.decode(String.self, forKey: "id")
        links = try container.decodeIfPresent(ResourceLinks.self, forKey: "links")
        attributes = try container.decodeIfPresent(Attributes.self, forKey: "attributes")
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
    }

    public struct Attributes: Codable, Sendable {
        public var matchmakingResults: [MatchmakingResults]?

        public init(matchmakingResults: [MatchmakingResults]? = nil) {
            self.matchmakingResults = matchmakingResults
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: AnyCodingKey.self)
            matchmakingResults = try container.decodeIfPresent([MatchmakingResults].self, forKey: "matchmakingResults")
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: AnyCodingKey.self)
            try container.encodeIfPresent(matchmakingResults, forKey: "matchmakingResults")
        }

        public struct MatchmakingResults: Codable, Sendable {
            public var requestName: String?
            public var teamAssignments: [GameCenterMatchmakingTeamAssignment]?

            public init(requestName: String? = nil,
                        teamAssignments: [GameCenterMatchmakingTeamAssignment]? = nil)
            {
                self.requestName = requestName
                self.teamAssignments = teamAssignments
            }

            public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: AnyCodingKey.self)
                requestName = try container.decodeIfPresent(String.self, forKey: "requestName")
                teamAssignments = try container.decodeIfPresent([GameCenterMatchmakingTeamAssignment].self, forKey: "teamAssignments")
            }

            public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: AnyCodingKey.self)
                try container.encodeIfPresent(requestName, forKey: "requestName")
                try container.encodeIfPresent(teamAssignments, forKey: "teamAssignments")
            }
        }
    }
}
