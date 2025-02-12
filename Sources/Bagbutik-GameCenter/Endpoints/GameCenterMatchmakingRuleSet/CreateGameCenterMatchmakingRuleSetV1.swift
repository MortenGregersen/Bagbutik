import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a rule set
     Create a rule set to contain matchmaking rules and teams.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterMatchmakingRuleSets>

     - Parameter requestBody: GameCenterMatchmakingRuleSet representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterMatchmakingRuleSetV1(requestBody: GameCenterMatchmakingRuleSetCreateRequest) -> Request<GameCenterMatchmakingRuleSetResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterMatchmakingRuleSets", method: .post, requestBody: requestBody)
    }
}
