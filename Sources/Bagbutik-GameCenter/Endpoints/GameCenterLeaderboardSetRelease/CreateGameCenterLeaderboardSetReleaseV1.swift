import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a leaderboard set release
     Add a new leaderboard set release.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterLeaderboardSetReleases>

     - Parameter requestBody: GameCenterLeaderboardSetRelease representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func createGameCenterLeaderboardSetReleaseV1(requestBody: GameCenterLeaderboardSetReleaseCreateRequest) -> Request<GameCenterLeaderboardSetReleaseResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardSetReleases",
            method: .post,
            requestBody: requestBody)
    }
}
