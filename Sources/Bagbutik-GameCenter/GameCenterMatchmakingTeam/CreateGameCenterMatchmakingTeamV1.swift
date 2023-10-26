import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a team
     Add a game-specific team to a rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_a_team>

     - Parameter requestBody: GameCenterMatchmakingTeam representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterMatchmakingTeamV1(requestBody: GameCenterMatchmakingTeamCreateRequest) -> Request<GameCenterMatchmakingTeamResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterMatchmakingTeams", method: .post, requestBody: requestBody)
    }
}
