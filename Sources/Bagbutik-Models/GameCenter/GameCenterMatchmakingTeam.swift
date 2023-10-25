import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingTeam
 The data structure that represents a team.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingteam>
 */
public struct GameCenterMatchmakingTeam: Codable, Identifiable {
    /// The unique identifier for the team.
    public let id: String
    /// The link representations of the object.
    public var links: ResourceLinks?
    /// The type of resource object.
    public var type: String { "gameCenterMatchmakingTeams" }
    /// The attributes of the team.
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
     # GameCenterMatchmakingTeam.Attributes
     The attributes of a game-specific team.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingteam/attributes>
     */
    public struct Attributes: Codable {
        /// The maximum number of players on the team.
        public var maxPlayers: Int?
        /// The minimum number of players on the team.
        public var minPlayers: Int?
        /// A name for the team that’s unique within the scope of its rule set.
        public var referenceName: String?

        public init(maxPlayers: Int? = nil,
                    minPlayers: Int? = nil,
                    referenceName: String? = nil)
        {
            self.maxPlayers = maxPlayers
            self.minPlayers = minPlayers
            self.referenceName = referenceName
        }
    }
}
