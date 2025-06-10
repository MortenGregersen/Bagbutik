import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an Introductory Offer
     Create an introductory offer for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionIntroductoryOffers>

     - Parameter requestBody: SubscriptionIntroductoryOffer representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionIntroductoryOfferV1(requestBody: SubscriptionIntroductoryOfferCreateRequest) -> Request<SubscriptionIntroductoryOfferResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionIntroductoryOffers",
            method: .post,
            requestBody: requestBody)
    }
}
