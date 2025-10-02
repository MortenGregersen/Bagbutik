import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List in-app purchases IDs for an app V1
     Get a list of all in-app purchases IDs for a specific app V1.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-relationships-inAppPurchases>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func listInAppPurchaseIdsForAppV1(id: String,
                                             limit: Int? = nil) -> Request<AppInAppPurchasesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/relationships/inAppPurchases",
            method: .get,
            parameters: .init(limit: limit))
    }
}
