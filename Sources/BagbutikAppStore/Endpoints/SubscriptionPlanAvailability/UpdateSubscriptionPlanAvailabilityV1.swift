import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify a subscription plan availability

     Update the plan availability configuration for a specific subscription.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptionPlanAvailabilities-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionPlanAvailability representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionPlanAvailabilityV1(id: String,
                                                     requestBody: SubscriptionPlanAvailabilityUpdateRequest) -> Request<SubscriptionPlanAvailabilityResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionPlanAvailabilities/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
