import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/gameCenterMatchmakingRuleSets/{id}/relationships/rules

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterMatchmakingRuleSets-_id_-relationships-rules>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listRuleIdsForGameCenterMatchmakingRuleSetV1(id: String,
                                                             limit: Int? = nil) -> Request<GameCenterMatchmakingRuleSetRulesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterMatchmakingRuleSets/\(id)/relationships/rules",
            method: .get,
            parameters: .init(limit: limit))
    }
}
