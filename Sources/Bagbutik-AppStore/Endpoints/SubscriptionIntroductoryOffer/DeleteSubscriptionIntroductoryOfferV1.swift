import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete an Introductory Offer for a Subscription
     Delete a specific introductory offer for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-subscriptionIntroductoryOffers-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteSubscriptionIntroductoryOfferV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionIntroductoryOffers/\(id)",
            method: .delete)
    }
}
