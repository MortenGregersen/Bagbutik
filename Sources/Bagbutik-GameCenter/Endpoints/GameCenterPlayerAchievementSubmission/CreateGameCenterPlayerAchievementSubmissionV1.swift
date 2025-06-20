import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # POST /v1/gameCenterPlayerAchievementSubmissions
     Add a new entry for a player’s score for a Game Center achievement.

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
