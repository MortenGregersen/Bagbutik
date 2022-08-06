import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Promotional Offer
     Create a promotional offer for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_a_promotional_offer>

     - Parameter requestBody: SubscriptionPromotionalOffer representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionPromotionalOfferV1(requestBody: SubscriptionPromotionalOfferCreateRequest) -> Request<SubscriptionPromotionalOfferResponse, ErrorResponse> {
        .init(path: "/v1/subscriptionPromotionalOffers", method: .post, requestBody: requestBody)
    }
}
