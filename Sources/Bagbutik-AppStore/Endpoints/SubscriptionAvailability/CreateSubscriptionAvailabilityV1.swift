import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the territory availability of a subscription
     Update the territory availability of a specific subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionAvailabilities>

     - Parameter requestBody: SubscriptionAvailability representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionAvailabilityV1(requestBody: SubscriptionAvailabilityCreateRequest) -> Request<SubscriptionAvailabilityResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionAvailabilities",
            method: .post,
            requestBody: requestBody)
    }
}
