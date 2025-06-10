import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/gameCenterLeaderboardSetMemberLocalizations/{id}/relationships/gameCenterLeaderboard

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterLeaderboardSetMemberLocalizations-_id_-relationships-gameCenterLeaderboard>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterLeaderboardIdsForGameCenterLeaderboardSetMemberLocalizationV1(id: String) -> Request<GameCenterLeaderboardSetMemberLocalizationGameCenterLeaderboardLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardSetMemberLocalizations/\(id)/relationships/gameCenterLeaderboard",
            method: .get)
    }
}
