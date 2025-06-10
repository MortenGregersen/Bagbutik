import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/gameCenterLeaderboardLocalizations/{id}/relationships/gameCenterLeaderboardImage

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterLeaderboardLocalizations-_id_-relationships-gameCenterLeaderboardImage>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterLeaderboardImageIdsForGameCenterLeaderboardLocalizationV1(id: String) -> Request<GameCenterLeaderboardLocalizationGameCenterLeaderboardImageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardLocalizations/\(id)/relationships/gameCenterLeaderboardImage",
            method: .get)
    }
}
