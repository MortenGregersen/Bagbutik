import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Create a Queue

     Create a queue and add it to a rule set.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     POST https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingQueues
     {
         “data”: {
             “type”: “gameCenterMatchmakingQueues”,
             “attributes”: {
                 “referenceName”: “com.example.mygame.GameSettingsQueue”
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
             “type”: “gameCenterMatchmakingQueues”,
             “id”: “aa1c1e6b-f8a9-4bad-b969-860dfd1485c5”,
             “attributes”: {
                 “referenceName”: “com.example.mygame.GameSettingsQueue”
             },
             “links”: {
                 “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingQueues/aa1c1e6b-f8a9-4bad-b969-860dfd1485c5”
             }
         },
         “links”: {
             “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingQueues”
         }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterMatchmakingQueues>

     - Parameter requestBody: GameCenterMatchmakingQueue representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterMatchmakingQueueV1(requestBody: GameCenterMatchmakingQueueCreateRequest) -> Request<GameCenterMatchmakingQueueResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterMatchmakingQueues",
            method: .post,
            requestBody: requestBody)
    }
}
