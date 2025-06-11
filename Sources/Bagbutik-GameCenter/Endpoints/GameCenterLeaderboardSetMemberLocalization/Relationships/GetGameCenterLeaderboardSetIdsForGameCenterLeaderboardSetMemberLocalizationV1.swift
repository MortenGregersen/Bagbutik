import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/gameCenterLeaderboardSetMemberLocalizations/{id}/relationships/gameCenterLeaderboardSet

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterLeaderboardSetMemberLocalizations-_id_-relationships-gameCenterLeaderboardSet>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterLeaderboardSetIdsForGameCenterLeaderboardSetMemberLocalizationV1(id: String) -> Request<GameCenterLeaderboardSetMemberLocalizationGameCenterLeaderboardSetLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardSetMemberLocalizations/\(id)/relationships/gameCenterLeaderboardSet",
            method: .get)
    }
}
