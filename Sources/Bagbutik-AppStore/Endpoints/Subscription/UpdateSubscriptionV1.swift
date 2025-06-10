import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an Auto-Renewable Subscription
     Update a specific auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptions-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Subscription representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionV1(id: String,
                                     requestBody: SubscriptionUpdateRequest) -> Request<SubscriptionResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
