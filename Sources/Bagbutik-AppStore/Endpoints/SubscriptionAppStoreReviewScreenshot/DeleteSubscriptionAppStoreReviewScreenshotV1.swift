import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a Review Screenshot for an Auto-Renewable Subscription
     Delete an image that you uploaded for review of an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-subscriptionAppStoreReviewScreenshots-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteSubscriptionAppStoreReviewScreenshotV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/subscriptionAppStoreReviewScreenshots/\(id)", method: .delete)
    }
}
