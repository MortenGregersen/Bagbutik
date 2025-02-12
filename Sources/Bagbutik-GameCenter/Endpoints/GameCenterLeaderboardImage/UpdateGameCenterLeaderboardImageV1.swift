import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a leaderboard image
     Commit a leaderboard image after uploading it.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterLeaderboardImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterLeaderboardImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterLeaderboardImageV1(id: String,
                                                   requestBody: GameCenterLeaderboardImageUpdateRequest) -> Request<GameCenterLeaderboardImageResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboardImages/\(id)", method: .patch, requestBody: requestBody)
    }
}
