import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an activity version
     Add an activity to a Game Center detail, group, or leaderboard.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-gameCenterActivityVersions>

     - Parameter requestBody: GameCenterActivityVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterActivityVersionV1(requestBody: GameCenterActivityVersionCreateRequest) -> Request<GameCenterActivityVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityVersions",
            method: .post,
            requestBody: requestBody)
    }
}
