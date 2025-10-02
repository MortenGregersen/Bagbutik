import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read tge leaderboard ID for a leaderboard set member localization
     Get the leaderboard ID for a specific leaderboard set member localization.

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
