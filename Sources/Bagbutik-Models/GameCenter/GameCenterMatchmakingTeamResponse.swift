import Bagbutik_Core
import Foundation

/**
 # GameCenterMatchmakingTeamResponse
 The response body for endpoints that create or modify a team.

 Full documentation:
 <https://developer.apple.com/documentation/appstoreconnectapi/gamecentermatchmakingteamresponse>
 */
public struct GameCenterMatchmakingTeamResponse: Codable {
    /// The team that you create or modify.
    public let data: GameCenterMatchmakingTeam
    /// The link representations of the object.
    public let links: DocumentLinks

    public init(data: GameCenterMatchmakingTeam,
                links: DocumentLinks)
    {
        self.data = data
        self.links = links
    }
}
