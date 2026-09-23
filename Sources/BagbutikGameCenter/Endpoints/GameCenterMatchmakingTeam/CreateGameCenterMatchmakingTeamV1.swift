import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Create a Team

     Add a game-specific team to a rule set.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     POST https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingTeams
     {
         “data”: {
             “type”: “gameCenterMatchmakingTeams”,
             “attributes”: {
                 “minPlayers”: 2,
                 “maxPlayers”: 4,
                 “referenceName”: “blue”
             },
             “relationships”: {
                 “ruleSet”: {
                     “data”: {
                         “type”: “gameCenterMatchmakingRuleSets”,
                         “id”: “50d7eed2-8016-441a-a919-db3d863f433c”
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
             “type”: “gameCenterMatchmakingTeams”,
             “id”: “2a68632b-0129-4c07-8e84-6da57a76499d”,
             “attributes”: {
                 “referenceName”: “blue”,
                 “minPlayers”: 2,
                 “maxPlayers”: 4
             },
             “links”: {
                 “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingTeams/2a68632b-0129-4c07-8e84-6da57a76499d”
             }
         },
         “links”: {
             “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterMatchmakingTeams”
         }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterMatchmakingTeams>

     - Parameter requestBody: GameCenterMatchmakingTeam representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterMatchmakingTeamV1(requestBody: GameCenterMatchmakingTeamCreateRequest) -> Request<GameCenterMatchmakingTeamResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterMatchmakingTeams",
            method: .post,
            requestBody: requestBody)
    }
}
