import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Create a Leaderboard

     Add a new leaderboard to your app.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     POST  https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards-d
     {
         “data”: {
             “type”: “gameCenterLeaderboards”,
             “attributes”: {
                 “referenceName”: “Cortado Temp LB”,
                 “vendorIdentifier”: “CORTADOTEMP_LB”,
                 “defaultFormatter”: “INTEGER”,
                 “submissionType”: “BEST_SCORE”,
                 “scoreSortType”: “DESC”,
                 “scoreRangeStart”: “0”,
                 “scoreRangeEnd”: “100”
             },
             “relationships”: {
                 “gameCenterDetail”: {
                     “data”: {
                         “type”: “gameCenterDetails”,
                         “id”: “6fd13854-b796-4cb5-87e1-9f2d15d3d7b9”
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
         “type” : “gameCenterLeaderboards”,
         “id” : “8e76c29a-4d4d-4b1f-9389-0dd161cab83c”,
         “attributes” : {
           “defaultFormatter” : “INTEGER”,
           “referenceName” : “Cortado Temp LB”,
           “vendorIdentifier” : “CORTADOTEMP_LB”,
           “submissionType” : “BEST_SCORE”,
           “scoreSortType” : “DESC”,
           “scoreRangeStart” : “0”,
           “scoreRangeEnd” : “100”,
           “recurrenceStartDate” : null,
           “recurrenceDuration” : null,
           “recurrenceRule” : null,
           “archived” : false,
           “leaderboardType” : “CLASSIC”
         },
         “relationships” : {
           “groupLeaderboard” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/8e76c29a-4d4d-4b1f-9389-0dd161cab83c/relationships/groupLeaderboard”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/8e76c29a-4d4d-4b1f-9389-0dd161cab83c/groupLeaderboard”
             }
           },
           “localizations” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/8e76c29a-4d4d-4b1f-9389-0dd161cab83c/relationships/localizations”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/8e76c29a-4d4d-4b1f-9389-0dd161cab83c/localizations”
             }
           },
           “releases” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/8e76c29a-4d4d-4b1f-9389-0dd161cab83c/relationships/releases”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/8e76c29a-4d4d-4b1f-9389-0dd161cab83c/releases”
             }
           },
           “leaderboardScores” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/8e76c29a-4d4d-4b1f-9389-0dd161cab83c/relationships/leaderboardScores”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/8e76c29a-4d4d-4b1f-9389-0dd161cab83c/leaderboardScores”
             }
           }
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards/8e76c29a-4d4d-4b1f-9389-0dd161cab83c”
         }
       },
       “links” : {
         “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboards”
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterLeaderboards>

     - Parameter requestBody: GameCenterLeaderboard representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createGameCenterLeaderboardV1(requestBody: GameCenterLeaderboardCreateRequest) -> Request<GameCenterLeaderboardResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboards",
            method: .post,
            requestBody: requestBody)
    }
}
