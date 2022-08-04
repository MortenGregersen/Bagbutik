import Bagbutik_Core

public extension Request {
    /**
     # Delete an Introductory Offer for a Subscription
     Delete a specific introductory offer for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_an_introductory_offer_for_a_subscription>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteSubscriptionIntroductoryOfferV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/subscriptionIntroductoryOffers/\(id)", method: .delete)
    }
}
