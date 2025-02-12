import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a rule set
     Update the attributes of a rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterMatchmakingRuleSets-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterMatchmakingRuleSet representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterMatchmakingRuleSetV1(id: String,
                                                     requestBody: GameCenterMatchmakingRuleSetUpdateRequest) -> Request<GameCenterMatchmakingRuleSetResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterMatchmakingRuleSets/\(id)", method: .patch, requestBody: requestBody)
    }
}
