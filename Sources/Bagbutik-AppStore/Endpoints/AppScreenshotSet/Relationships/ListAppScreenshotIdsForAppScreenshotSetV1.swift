import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Get All App Screenshot IDs for an App Screenshot Set
     Get the ordered screenshot IDs in a screenshot set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-appScreenshotSets-_id_-relationships-appScreenshots>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppScreenshotIdsForAppScreenshotSetV1(id: String,
                                                          limit: Int? = nil) -> Request<AppScreenshotSetAppScreenshotsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/appScreenshotSets/\(id)/relationships/appScreenshots",
            method: .get,
            parameters: .init(limit: limit))
    }
}
