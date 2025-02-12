import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a leaderboard set image
     Commit a leaderboard set image after uploading it.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterLeaderboardSetImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterLeaderboardSetImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterLeaderboardSetImageV1(id: String,
                                                      requestBody: GameCenterLeaderboardSetImageUpdateRequest) -> Request<GameCenterLeaderboardSetImageResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboardSetImages/\(id)", method: .patch, requestBody: requestBody)
    }
}
