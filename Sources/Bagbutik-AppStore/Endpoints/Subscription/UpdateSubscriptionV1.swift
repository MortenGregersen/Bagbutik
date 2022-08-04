import Bagbutik_Core

public extension Request {
    /**
     # Modify an Auto-Renewable Subscription
     Update a specific auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_an_auto-renewable_subscription>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: Subscription representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionV1(id: String,
                                     requestBody: SubscriptionUpdateRequest) -> Request<SubscriptionResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptions/\(id)", method: .patch, requestBody: requestBody)
    }
}
