import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Add a score to a leaderbaord
     Add a new score for a player to a leaderboard.

     Use the `preReleased` attribute to indicate whether the requested change applies to the game’s release version or its prerelease version. Set `preReleased` to `true` to indicate that the change applies to the game’s prerelease version.

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
