import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # GET /v1/gameCenterDetails/{id}/relationships/achievementReleases

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-relationships-achievementReleases>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAchievementReleaseIdsForGameCenterDetailV1(id: String,
                                                               limit: Int? = nil) -> Request<GameCenterDetailAchievementReleasesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/relationships/achievementReleases",
            method: .get,
            parameters: .init(limit: limit))
    }
}
