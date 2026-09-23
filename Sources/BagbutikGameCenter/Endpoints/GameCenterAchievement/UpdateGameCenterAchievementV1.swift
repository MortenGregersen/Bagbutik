import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Modify an Achievement

     Modify properties for a specific achievement.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     PATCH https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502 -d {
       “data”: {
         “type”: “gameCenterAchievements”,
         “id”: “304e0f56-63b2-492f-980e-bce6fafb8502”,
         “attributes”: {
           “repeatable”: true
         }
       }
     }
     ```

     **Response:**

     ```json
       “data” : {
         “type” : “gameCenterAchievements”,
         “id” : “304e0f56-63b2-492f-980e-bce6fafb8502”,
         “attributes” : {
           “referenceName” : “Perfectly Steamed Milk Texture”,
           “vendorIdentifier” : “PSMT_ACH”,
           “points” : 0,
           “showBeforeEarned” : false,
           “repeatable” : true,
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
         “self” : “https://api.appstoreconnect.apple.com/v1/gameCenterAchievements/304e0f56-63b2-492f-980e-bce6fafb8502”
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterAchievements-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterAchievement representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func updateGameCenterAchievementV1(id: String,
                                              requestBody: GameCenterAchievementUpdateRequest) -> Request<GameCenterAchievementResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAchievements/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
