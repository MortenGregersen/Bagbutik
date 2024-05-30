import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingTeamAssignment
 The data structure that represents the assignment of a player to a team.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingteamassignment>
 */
public struct GameCenterMatchmakingTeamAssignment: Codable {
    /// A unique identifier for the player.
    public var playerId: String?
    /// The name of the team that Game Center assigned the player to.
    public var team: String?

    public init(playerId: String? = nil,
                team: String? = nil)
    {
        self.playerId = playerId
        self.team = team
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        playerId = try container.decodeIfPresent(String.self, forKey: .playerId)
        team = try container.decodeIfPresent(String.self, forKey: .team)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(playerId, forKey: .playerId)
        try container.encodeIfPresent(team, forKey: .team)
    }

    private enum CodingKeys: String, CodingKey {
        case playerId
        case team
    }
}
