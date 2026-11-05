import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List retention offer IDs for a subscription

     Get a list of retention offer IDs for a specific auto-renewable subscription.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptions-_id_-relationships-retentionOffers>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listRetentionOfferIdsForSubscriptionV1(id: String,
                                                       limit: Int? = nil) -> Request<SubscriptionRetentionOffersLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)/relationships/retentionOffers",
            method: .get,
            parameters: .init(limit: limit))
    }
}
