import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the image ID for a subscription version
     Get the related resource ID for the review image attached to a draft version of an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionVersions-_id_-relationships-image>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getImageIdsForSubscriptionVersionV1(id: String) -> Request<SubscriptionVersionImageLinkageResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionVersions/\(id)/relationships/image",
            method: .get)
    }
}
