import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a rule
     Add a matchmaking rule to a rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterMatchmakingRules>

     - Parameter requestBody: GameCenterMatchmakingRule representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterMatchmakingRuleV1(requestBody: GameCenterMatchmakingRuleCreateRequest) -> Request<GameCenterMatchmakingRuleResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterMatchmakingRules", method: .post, requestBody: requestBody)
    }
}
