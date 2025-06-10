import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a Promotional Offer
     Create a promotional offer for an auto-renewable subscription.

     <<<<<<< HEAD

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionPromotionalOffers>

     - Parameter requestBody: SubscriptionPromotionalOffer representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionPromotionalOfferV1(requestBody: SubscriptionPromotionalOfferCreateRequest) -> Request<SubscriptionPromotionalOfferResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionPromotionalOffers",
            method: .post,
            requestBody: requestBody)
    }
}
