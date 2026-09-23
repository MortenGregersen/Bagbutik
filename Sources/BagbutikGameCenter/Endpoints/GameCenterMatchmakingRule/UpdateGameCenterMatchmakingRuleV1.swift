import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Modify a Rule

     Update a specific matchmaking rule in a rule set.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
