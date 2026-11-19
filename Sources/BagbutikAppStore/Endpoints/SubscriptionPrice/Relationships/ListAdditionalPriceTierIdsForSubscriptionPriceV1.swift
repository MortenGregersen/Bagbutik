import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List additional price tier IDs for a subscription price

     List the IDs of the additional volume pricing tiers for a subscription price.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionPrices-_id_-relationships-additionalPriceTiers>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAdditionalPriceTierIdsForSubscriptionPriceV1(id: String,
                                                                 limit: Int? = nil) -> Request<SubscriptionPriceAdditionalPriceTiersLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionPrices/\(id)/relationships/additionalPriceTiers",
            method: .get,
            parameters: .init(limit: limit))
    }
}
