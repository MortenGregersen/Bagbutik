import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a subscription plan availability
     Create the plan availability configuration for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionPlanAvailabilities>

     - Parameter requestBody: SubscriptionPlanAvailability representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionPlanAvailabilityV1(requestBody: SubscriptionPlanAvailabilityCreateRequest) -> Request<SubscriptionPlanAvailabilityResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionPlanAvailabilities",
            method: .post,
            requestBody: requestBody)
    }
}
