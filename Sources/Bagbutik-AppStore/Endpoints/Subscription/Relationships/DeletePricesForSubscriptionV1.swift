import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete Prices from a Subscription
     Delete a scheduled subscription price change for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete-v1-subscriptions-_id_-relationships-prices>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: List of related linkages
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deletePricesForSubscriptionV1(id: String,
                                              requestBody: SubscriptionPricesLinkagesRequest) -> Request<EmptyResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)/relationships/prices",
            method: .delete,
            requestBody: requestBody)
    }
}
