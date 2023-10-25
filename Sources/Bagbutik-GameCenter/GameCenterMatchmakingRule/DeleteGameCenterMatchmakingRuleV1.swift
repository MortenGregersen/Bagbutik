import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a rule
     Delete a matchmaking rule in a rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_rule>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterMatchmakingRuleV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterMatchmakingRules/\(id)", method: .delete)
    }
}
