import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a rule set
     Delete a rule set along with its matchmaking rules and teams.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterMatchmakingRuleSets-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterMatchmakingRuleSetV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterMatchmakingRuleSets/\(id)", method: .delete)
    }
}
