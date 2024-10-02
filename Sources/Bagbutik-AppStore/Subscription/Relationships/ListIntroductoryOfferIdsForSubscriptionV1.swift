import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Introductory Offer Resource IDs for an Auto-Renewable Subscription
     Get a list of resource IDs representing introductory offers for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptions-_id_-relationships-introductoryOffers>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listIntroductoryOfferIdsForSubscriptionV1(id: String,
                                                          limit: Int? = nil) -> Request<SubscriptionIntroductoryOffersLinkagesResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptions/\(id)/relationships/introductoryOffers", method: .get, parameters: .init(limit: limit))
    }
}
