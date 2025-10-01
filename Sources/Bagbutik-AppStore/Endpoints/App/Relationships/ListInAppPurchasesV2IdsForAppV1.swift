import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List in-app purchases IDs for an app
     Get a list of all in-app purchases IDs for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-relationships-inAppPurchasesV2>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listInAppPurchasesV2IdsForAppV1(id: String,
                                                limit: Int? = nil) -> Request<AppInAppPurchasesV2LinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/inAppPurchasesV2",
            method: .get,
            parameters: .init(limit: limit))
    }
}
