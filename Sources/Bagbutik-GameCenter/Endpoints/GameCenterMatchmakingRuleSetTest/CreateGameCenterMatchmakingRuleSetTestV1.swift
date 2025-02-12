import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Test a rule set
     Apply the given rule set to the given sample match requests.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterMatchmakingRuleSetTests>

     - Parameter requestBody: GameCenterMatchmakingRuleSetTest representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterMatchmakingRuleSetTestV1(requestBody: GameCenterMatchmakingRuleSetTestCreateRequest) -> Request<GameCenterMatchmakingRuleSetTestResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterMatchmakingRuleSetTests", method: .post, requestBody: requestBody)
    }
}
