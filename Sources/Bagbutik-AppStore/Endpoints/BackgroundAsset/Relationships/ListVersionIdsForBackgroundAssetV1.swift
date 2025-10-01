import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read version IDs for a background asset
     Get version IDs about a specific background asset version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-backgroundAssets-_id_-relationships-versions>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVersionIdsForBackgroundAssetV1(id: String,
                                                   limit: Int? = nil) -> Request<BackgroundAssetVersionsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/backgroundAssets/\(id)/relationships/versions",
            method: .get,
            parameters: .init(limit: limit))
    }
}
