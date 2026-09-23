import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Create an Achievement

     Add an achievement to a Game Center detail.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     POST https://api.appstoreconnect.apple.com/v1/gameCenterAchievements -d {
       “data”: {
         “type”: “gameCenterAchievements”,
         “attributes”: {
           “referenceName”: “Perfectly Steamed Milk Texture”,
           “vendorIdentifier”: “PSMT_ACH”,
           “points”: 0,
           “repeatable”: false,
           “showBeforeEarned”: false
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
         “type” : “gameCenterAchievements”,
         “id” : “304e0f56-63b2-492f-980e-bce6fafb8502”,
         “attributes” : {
           “referenceName” : “Perfectly Steamed Milk Texture”,
           “vendorIdentifier” : “PSMT_ACH”,
           “points” : 0,
           “showBeforeEarned” : false,
           “repeatable” : false,
           “archived” : false
         },
         “relationships” : {
           “groupAchievement” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502/relationships/groupAchievement”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502/groupAchievement”
             }
           },
           “localizations” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502/relationships/localizations”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502/localizations”
             }
           },
           “releases” : {
             “links” : {
               “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502/relationships/releases”,
               “related” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502/releases”
             }
           }
         },
         “links” : {
           “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502”
         }
       },
       “links” : {
         “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements”
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterAchievements>

     - Parameter requestBody: GameCenterAchievement representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createGameCenterAchievementV1(requestBody: GameCenterAchievementCreateRequest) -> Request<GameCenterAchievementResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAchievements",
            method: .post,
            requestBody: requestBody)
    }
}
