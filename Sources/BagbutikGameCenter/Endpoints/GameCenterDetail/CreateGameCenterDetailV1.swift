import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Enable game center for an app

     Create a Game Center detail for an app.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     https://api.appstoreconnect.apple.com/v1/gameCenterDetails -d
     {
       “data”: {
         “type”: “gameCenterDetails”,
         “attributes”: {
           “challengeEnabled”: true
         },
         “relationships”: {
           “app”: {
             “data”: {
               “type”: “apps”,
               “id”: “6449448109”
             }
           }
         }
       }
     }
     ```

     **Response:**

     ```json
     {
       “data” : {
         “type” : “gameCenterDetails”,
         “id” : “6fd13854-b796-4cb5-87e1-9f2d15d3d7b9”,
         “attributes” : {
           “arcadeEnabled” : false,
           “challengeEnabled” : true
         },
         “relationships” : {
           “gameCenterAppVersions” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/relationships/gameCenterAppVersions”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/gameCenterAppVersions”
             }
           },
           “gameCenterGroup” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/relationships/gameCenterGroup”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/gameCenterGroup”
             }
           },
           “gameCenterLeaderboards” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/relationships/gameCenterLeaderboards”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/gameCenterLeaderboards”
             }
           },
           “gameCenterLeaderboardSets” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/relationships/gameCenterLeaderboardSets”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/gameCenterLeaderboardSets”
             }
           },
           “gameCenterAchievements” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/relationships/gameCenterAchievements”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/gameCenterAchievements”
             }
           },
           “achievementReleases” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/relationships/achievementReleases”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/achievementReleases”
             }
           },
           “leaderboardReleases” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/relationships/leaderboardReleases”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/leaderboardReleases”
             }
           },
           “leaderboardSetReleases” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/relationships/leaderboardSetReleases”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/leaderboardSetReleases”
             }
           },
           “blockedPlayers” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/relationships/blockedPlayers”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9/blockedPlayers”
             }
           }
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails/6fd13854-b796-4cb5-87e1-9f2d15d3d7b9”
         }
       },
       “links” : {
         “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterDetails”
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterDetails>

     - Parameter requestBody: GameCenterDetail representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterDetailV1(requestBody: GameCenterDetailCreateRequest) -> Request<GameCenterDetailResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails",
            method: .post,
            requestBody: requestBody)
    }
}
