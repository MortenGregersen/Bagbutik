import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/gameCenterLeaderboardSetLocalizations/{id}/relationships/gameCenterLeaderboardSetImage

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterLeaderboardSetLocalizations-_id_-relationships-gameCenterLeaderboardSetImage>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterLeaderboardSetImageIdsForGameCenterLeaderboardSetLocalizationV1(id: String) -> Request<GameCenterLeaderboardSetLocalizationGameCenterLeaderboardSetImageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardSetLocalizations/\(id)/relationships/gameCenterLeaderboardSetImage",
            method: .get)
    }
}
