import Bagbutik_Models

public extension Request {
    /**
     # Create an Auto-Renewable Subscription
     Create an auto-renewable subscription for your app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_an_auto-renewable_subscription>

     - Parameter requestBody: Subscription representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionV1(requestBody: SubscriptionCreateRequest) -> Request<SubscriptionResponse, ErrorResponse> {
        .init(path: "/v1/subscriptions", method: .post, requestBody: requestBody)
    }
}
