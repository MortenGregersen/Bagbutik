import BagbutikCore
import BagbutikGameCenterModels
import BagbutikModelsShared

public extension Request {
    /**
     # Delete an Achievement Localization

     Delete localization metadata that’s associated with an achievement.

     ## Discussion

     ### Example Request and Response

     **Request:**

     ```
     DELETE https://api.appstoreconnect.apple.com/v1/gameCenterAchievementLocalizations/ca329301-e7ad-4784-97cd-02faade43c2f -d
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
     HTTP/1.1 204 No Content
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-gameCenterAchievementLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func deleteGameCenterAchievementLocalizationV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterAchievementLocalizations/\(id)",
            method: .delete)
    }
}
