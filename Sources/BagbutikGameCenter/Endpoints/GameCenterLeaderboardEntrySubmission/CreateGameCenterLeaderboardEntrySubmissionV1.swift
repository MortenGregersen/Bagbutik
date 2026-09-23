import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Add a Score to a Leaderbaord

     Add a new score for a player to a leaderboard.

     ## Discussion

     Use the `preReleased` attribute to indicate whether the requested change applies to the game’s release version or its prerelease version. Set `preReleased` to `true` to indicate that the change applies to the game’s prerelease version.

     ### Example Request and Response

     **Request:**

     ```
     POST https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardEntrySubmissions

     {
       “data”: {
         “type”: “gameCenterLeaderboardEntrySubmissions”,
         “attributes”: {
           “score”: “123”,
           “scopedPlayerId”: “A:_5f21e308073d18f9b3afdc37f646e851”,
           “bundleId”: “com.apple.sample.actionship”,
           “vendorIdentifier”: “com.apple.sample.actionship.shipssank”,
           "preReleased": false
         }
       }
     }
     ```

     **Response:**

     ```json
     {
       “data”: {
         “type”: “gameCenterLeaderboardEntrySubmissions”,
         “id”: “3ef21559-006c-4308-831f-cd6cdd714863”,
         “attributes”: {
           “bundleId”: “com.apple.sample.actionship”,
           “challengeIds”: null,
           “context”: null,
           “scopedPlayerId”: “A:_5f21e308073d18f9b3afdc37f646e851”,
           “score”: “123”,
           “submittedDate”: null,
           “vendorIdentifier”: “com.apple.sample.actionship.shipssank”,
           "preReleased": false
         },
         “links”: {
           “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardEntrySubmissions/3ef21559-006c-4308-831f-cd6cdd714863”
         }
       },
       “links”: {
         “self”: “https://api.appstoreconnect.apple.com/v1/gameCenterLeaderboardEntrySubmissions”
       }
     }
     ```

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterLeaderboardEntrySubmissions>

     - Parameter requestBody: GameCenterLeaderboardEntrySubmission representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardEntrySubmissionV1(requestBody: GameCenterLeaderboardEntrySubmissionCreateRequest) -> Request<GameCenterLeaderboardEntrySubmissionResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardEntrySubmissions",
            method: .post,
            requestBody: requestBody)
    }
}
