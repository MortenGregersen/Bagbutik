import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a subscription version
     Create a draft version of an auto-renewable subscription, capturing its current localized metadata and review images for App Review submission.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionVersions>

     - Parameter requestBody: SubscriptionVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionVersionV1(requestBody: SubscriptionVersionCreateRequest) -> Request<SubscriptionVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionVersions",
            method: .post,
            requestBody: requestBody)
    }
}
