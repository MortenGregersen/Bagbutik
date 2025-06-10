import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/gameCenterDetails/{id}/relationships/leaderboardSetReleases

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-relationships-leaderboardSetReleases>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLeaderboardSetReleaseIdsForGameCenterDetailV1(id: String,
                                                                  limit: Int? = nil) -> Request<GameCenterDetailLeaderboardSetReleasesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/relationships/leaderboardSetReleases",
            method: .get,
            parameters: .init(limit: limit))
    }
}
