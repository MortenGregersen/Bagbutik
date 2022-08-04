import Bagbutik_Core

public extension Request {
    /**
     # Modify a Promotional Offer
     Update the prices for a specific promotional offer for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_promotional_offer>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionPromotionalOffer representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionPromotionalOfferV1(id: String,
                                                     requestBody: SubscriptionPromotionalOfferUpdateRequest) -> Request<SubscriptionPromotionalOfferResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptionPromotionalOffers/\(id)", method: .patch, requestBody: requestBody)
    }
}
