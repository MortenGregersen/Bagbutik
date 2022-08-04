import Bagbutik_Core

public extension Request {
    /**
     # Create a Subscription Offer
     Create a subscription offer that provides offer codes for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_a_subscription_offer>

     - Parameter requestBody: SubscriptionOfferCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionOfferCodeV1(requestBody: SubscriptionOfferCodeCreateRequest) -> Request<SubscriptionOfferCodeResponse, ErrorResponse> {
        .init(path: "/v1/subscriptionOfferCodes", method: .post, requestBody: requestBody)
    }
}
