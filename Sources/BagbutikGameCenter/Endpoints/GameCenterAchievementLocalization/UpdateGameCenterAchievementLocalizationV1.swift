import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Edit an Achievement Localization

     Modify localized Game Center achievement information for a particular language.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     PATCH https://api.appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f -d
     {
         “data”: {
             “type”: “gameCenterAchievementLocalizations”,
             “id”: “ca329301-e7ad-4784-97cd-02faade43c2f”,
             “attributes”: {
                 “beforeEarnedDescription”: “You can earn this achievement upon steaming milk to the perfect texture.”
             }
         }
     }
     ```

     **Response:**

     ```json
     {
       “data” : {
         “type” : “gameCenterAchievementLocalizations”,
         “id” : “ca329301-e7ad-4784-97cd-02faade43c2f”,
         “attributes” : {
           “locale” : “en-US”,
           “name” : “Perfectly steamed milk”,
           “beforeEarnedDescription” : “You can earn this achievement upon steaming milk to the perfect texture.”,
           “afterEarnedDescription” : “You did it! The milk had the perfect texture.”
         },
         “relationships” : {
           “gameCenterAchievement” : {
             “links” : {
               “self” : “https://appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f/relationships/gameCenterAchievement”,
               “related” : “https://appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f/gameCenterAchievement”
             }
           },
           “gameCenterAchievementImage” : {
             “links” : {
               “self” : “https://appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f/relationships/gameCenterAchievementImage”,
               “related” : “https://appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f/gameCenterAchievementImage”
             }
           }
         },
         “links” : {
           “self” : “https://appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f”
         }
       },
       “links” : {
         “self” : “https://appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f”
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterAchievementLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterAchievementLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func updateGameCenterAchievementLocalizationV1(id: String,
                                                          requestBody: GameCenterAchievementLocalizationUpdateRequest) -> Request<GameCenterAchievementLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAchievementLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
