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
}
