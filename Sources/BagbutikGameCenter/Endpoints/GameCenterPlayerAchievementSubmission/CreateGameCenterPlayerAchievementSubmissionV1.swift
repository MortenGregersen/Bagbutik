import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Add a Player's Score

     Add a new entry for a player’s score for a Game Center achievement.

     ## Discussion

     Use the `preReleased` attribute to indicate whether the requested change applies to the game’s release version or its prerelease version. Set `preReleased` to `true` to indicate that the change applies to the game’s prerelease version.

     ### Example Request and Response

     **Request:**

     ```
     POST https://api.appstoreconnect.apple.com/v1/gameCenterPlayerAchievementSubmissions
     {
       “data”: {
         “type”: “gameCenterPlayerAchievementSubmissions”,
         “attributes”: {
           “percentageAchieved”: 30,
           “scopedPlayerId”: “A:_5f21e308073d18f9b3afdc37f646e851”,
           “bundleId”: “com.apple.sample.actionship”,
           “vendorIdentifier”: “com.apple.sample.actionship.perfectaim”,
           "preReleased": true
         }
       }
     }
     ```

     **Response:**

     ```json
     {
       “data”: {
         “type”: “gameCenterPlayerAchievementSubmissions”,
         “id”: “d9f8b8dd-6050-45c6-a8e3-c6b97c186583”,
         “attributes”: {
           “bundleId”: “com.apple.sample.actionship”,
           “challengeIds”: null,
           “percentageAchieved”: 30,
           “scopedPlayerId”: “A:_5f21e308073d18f9b3afdc37f646e851”,
           “submittedDate”: null,
           “vendorIdentifier”: “com.apple.sample.actionship.perfectaim”,
           "preReleased": true
         },
         “links”: {
           “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterPlayerAchievementSubmissions/d9f8b8dd-6050-45c6-a8e3-c6b97c186583”
         }
       },
       “links”: {
         “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterPlayerAchievementSubmissions”
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterPlayerAchievementSubmissions>

     - Parameter requestBody: GameCenterPlayerAchievementSubmission representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterPlayerAchievementSubmissionV1(requestBody: GameCenterPlayerAchievementSubmissionCreateRequest) -> Request<GameCenterPlayerAchievementSubmissionResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterPlayerAchievementSubmissions",
            method: .post,
            requestBody: requestBody)
    }
}
