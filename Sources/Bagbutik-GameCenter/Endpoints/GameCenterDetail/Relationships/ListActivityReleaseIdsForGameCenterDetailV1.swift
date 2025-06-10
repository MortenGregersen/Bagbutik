import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get activity release IDs for a Game Center detail
     List all activity release IDs for a specific Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-relationships-activityReleases>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listActivityReleaseIdsForGameCenterDetailV1(id: String,
                                                            limit: Int? = nil) -> Request<GameCenterDetailActivityReleasesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/relationships/activityReleases",
            method: .get,
            parameters: .init(limit: limit))
    }
}
