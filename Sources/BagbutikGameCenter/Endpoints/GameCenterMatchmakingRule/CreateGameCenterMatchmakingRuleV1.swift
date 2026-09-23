import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Create a Rule

     Add a matchmaking rule to a rule set.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     POST https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRules
     {
         “data”: {
             “type”: “gameCenterMatchmakingRules”,
             “attributes”: {
                 “type”: “COMPATIBLE”,
                 “description”: “Check whether the players use the same game settings.”,
                 “referenceName”: “SameTheme”,
                 “expression”: “requests[0].properties.theme == requests[1].properties.theme”
             },
             “relationships”: {
                 “ruleSet”: {
                     “data”: {
                         “type”: “gameCenterMatchmakingRuleSets”,
                         “id”: “7353266e-8c6f-4cbe-8f0f-5108332a1146”
                     }
                 }
             }
         }
     }
     ```

     **Response:**

     ```json
     {
         “data”: {
             “type”: “gameCenterMatchmakingRules”,
             “id”: “2fd4bb73-3cca-46ca-aced-395c54ab11bc”,
             “attributes”: {
                 “referenceName”: “SameTheme”,
                 “description”: “Check whether the players use the same game settings.”,
                 “type”: “COMPATIBLE”,
                 “expression”: “requests[0].properties.theme == requests[1].properties.theme”,
                 “weight”: null
             },
             “links”: {
                 “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRules/2fd4bb73-3cca-46ca-aced-395c54ab11bc”
             }
         },
         “links”: {
             “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingRules”
         }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterMatchmakingRules>

     - Parameter requestBody: GameCenterMatchmakingRule representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterMatchmakingRuleV1(requestBody: GameCenterMatchmakingRuleCreateRequest) -> Request<GameCenterMatchmakingRuleResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterMatchmakingRules",
            method: .post,
            requestBody: requestBody)
    }
}
