import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add a player's score
     Add a new entry for a player’s score for a Game Center achievement.

     Use the `preReleased` attribute to indicate whether the requested change applies to the game’s release version or its prerelease version. Set `preReleased` to `true` to indicate that the change applies to the game’s prerelease version.

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
