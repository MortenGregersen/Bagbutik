import Bagbutik_Models

public extension Request {
    /**
     # Create a Subscription Price Change
     Schedule a subscription price change for a specific territory.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_a_subscription_price_change>

     - Parameter requestBody: SubscriptionPrice representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionPriceV1(requestBody: SubscriptionPriceCreateRequest) -> Request<SubscriptionPriceResponse, ErrorResponse> {
        .init(path: "/v1/subscriptionPrices", method: .post, requestBody: requestBody)
    }
}
