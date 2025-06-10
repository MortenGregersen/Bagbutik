import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an image for a subscription
     Reserve an image asset to appear in the App Store, representing a subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionImages>

     - Parameter requestBody: SubscriptionImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionImageV1(requestBody: SubscriptionImageCreateRequest) -> Request<SubscriptionImageResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionImages",
            method: .post,
            requestBody: requestBody)
    }
}
