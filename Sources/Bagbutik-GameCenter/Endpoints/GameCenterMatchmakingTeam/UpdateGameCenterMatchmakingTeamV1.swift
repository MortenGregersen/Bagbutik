import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a team
     Update a specific team in a rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterMatchmakingTeams-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterMatchmakingTeam representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterMatchmakingTeamV1(id: String,
                                                  requestBody: GameCenterMatchmakingTeamUpdateRequest) -> Request<GameCenterMatchmakingTeamResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterMatchmakingTeams/\(id)", method: .patch, requestBody: requestBody)
    }
}
