import Bagbutik_Models

public extension Request {
    /**
     # Deactivate a Subscription Offer with Offer Codes
     Deactivate a subscription offer that has offer codes for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/deactivate_a_subscription_offer_with_offer_codes>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionOfferCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionOfferCodeV1(id: String,
                                              requestBody: SubscriptionOfferCodeUpdateRequest) -> Request<SubscriptionOfferCodeResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptionOfferCodes/\(id)", method: .patch, requestBody: requestBody)
    }
}
