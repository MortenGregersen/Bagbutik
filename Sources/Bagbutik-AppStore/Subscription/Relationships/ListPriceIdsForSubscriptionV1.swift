import Bagbutik_Models

public extension Request {
    /**
     # List All Subscription Prices IDs for an Auto-Renewable Subscription
     Get a list of resource IDs representing subscription prices for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_subscription_prices_ids_for_an_auto-renewable_subscription>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPriceIdsForSubscriptionV1(id: String,
                                              limit: Int? = nil) -> Request<SubscriptionPricesLinkagesResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptions/\(id)/relationships/prices", method: .get, parameters: .init(limit: limit))
    }
}
