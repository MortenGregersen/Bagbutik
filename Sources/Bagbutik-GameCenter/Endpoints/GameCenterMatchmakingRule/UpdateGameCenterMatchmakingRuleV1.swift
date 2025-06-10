import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a rule
     Update a specific matchmaking rule in a rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterMatchmakingRules-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterMatchmakingRule representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterMatchmakingRuleV1(id: String,
                                                  requestBody: GameCenterMatchmakingRuleUpdateRequest) -> Request<GameCenterMatchmakingRuleResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterMatchmakingRules/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
