import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List image IDs for a subscription version
     Get the related resource IDs for the review images attached to a draft version of an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionVersions-_id_-relationships-images>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listImageIdsForSubscriptionVersionV1(id: String,
                                                     limit: Int? = nil) -> Request<SubscriptionVersionImagesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionVersions/\(id)/relationships/images",
            method: .get,
            parameters: .init(limit: limit))
    }
}
