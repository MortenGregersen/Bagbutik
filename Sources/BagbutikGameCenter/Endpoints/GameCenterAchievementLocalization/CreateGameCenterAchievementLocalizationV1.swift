import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Create an Achievement Localization

     Add Game Center achievement localized information for a new locale.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     POST https://api.appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations -d {
         “data”: {
             “type”: “gameCenterAchievementLocalizations”,
             “attributes”: {
                 “locale”: “en-US”,
                 “name”: “Perfectly steamed milk”,
                 “afterEarnedDescription”: “You did it! The milk had the perfect texture.”,
                 “beforeEarnedDescription”: “You will earn this achievement upon steaming milk to the perfect texture.”
             },
             “relationships”: {
                 “gameCenterAchievement”: {
                     “data”: {
                         “type”: “gameCenterAchievements”,
                         “id”: “304e0f56-63b2-492f-980e-bce6fafb8502”
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
         “type” : “gameCenterAchievementLocalizations”,
         “id” : “ca329301-e7ad-4784-97cd-02faade43c2f”,
         “attributes” : {
           “locale” : “en-US”,
           “name” : “Perfectly steamed milk”,
           “beforeEarnedDescription” : “You will earn this achievement upon steaming milk to the perfect texture.”,
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
         “self” : “https://appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations”
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterAchievementLocalizations>

     - Parameter requestBody: GameCenterAchievementLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createGameCenterAchievementLocalizationV1(requestBody: GameCenterAchievementLocalizationCreateRequest) -> Request<GameCenterAchievementLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAchievementLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}
