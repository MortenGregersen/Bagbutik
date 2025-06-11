import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List the assets packs IDs for an app
     Get a list of the Apple hosted background asset IDs for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-relationships-backgroundAssets>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBackgroundAssetIdsForAppV1(id: String,
                                               limit: Int? = nil) -> Request<AppBackgroundAssetsLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/backgroundAssets",
            method: .get,
            parameters: .init(limit: limit))
    }
}
