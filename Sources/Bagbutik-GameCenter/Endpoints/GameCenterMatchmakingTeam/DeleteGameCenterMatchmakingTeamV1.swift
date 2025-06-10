import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a team
     Delete a game-specific team in a rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterMatchmakingTeams-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterMatchmakingTeamV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterMatchmakingTeams/\(id)",
            method: .delete)
    }
}
