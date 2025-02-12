import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify an Introductory Offer
     Update a specific introductory offer for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptionIntroductoryOffers-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionIntroductoryOffer representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionIntroductoryOfferV1(id: String,
                                                      requestBody: SubscriptionIntroductoryOfferUpdateRequest) -> Request<SubscriptionIntroductoryOfferResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptionIntroductoryOffers/\(id)", method: .patch, requestBody: requestBody)
    }
}
