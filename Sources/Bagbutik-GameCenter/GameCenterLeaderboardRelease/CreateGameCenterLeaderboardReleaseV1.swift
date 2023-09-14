import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a leaderboard release
     Add a new leaderboard release.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_a_leaderboard_release>

     - Parameter requestBody: GameCenterLeaderboardRelease representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterLeaderboardReleaseV1(requestBody: GameCenterLeaderboardReleaseCreateRequest) -> Request<GameCenterLeaderboardReleaseResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterLeaderboardReleases", method: .post, requestBody: requestBody)
    }
}
