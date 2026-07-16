import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List image IDs for an in-app purchase version
     Get the related resource IDs for the review images attached to a draft version of an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchaseVersions-_id_-relationships-images>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listImageIdsForInAppPurchaseVersionV1(id: String,
                                                      limit: Int? = nil) -> Request<InAppPurchaseVersionImagesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseVersions/\(id)/relationships/images",
            method: .get,
            parameters: .init(limit: limit))
    }
}
