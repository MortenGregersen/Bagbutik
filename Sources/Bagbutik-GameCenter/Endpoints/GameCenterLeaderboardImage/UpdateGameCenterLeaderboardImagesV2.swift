import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Game Center leaderboard image
     Update a specific Game Center leaderboard image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-gameCenterLeaderboardImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterLeaderboardImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterLeaderboardImagesV2(id: String,
                                                    requestBody: GameCenterLeaderboardImageV2UpdateRequest) -> Request<GameCenterLeaderboardImageV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardImages/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
