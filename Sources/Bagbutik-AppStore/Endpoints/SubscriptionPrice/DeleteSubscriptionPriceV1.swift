import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete Subscription Prices
     Delete a scheduled price change for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-subscriptionPrices-_id_>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteSubscriptionPriceV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionPrices/\(id)",
            method: .delete)
    }
}
