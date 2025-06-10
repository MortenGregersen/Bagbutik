import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # POST /v1/gameCenterLeaderboardEntrySubmissions
     Add a new score for a player to a leaderboard.

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
