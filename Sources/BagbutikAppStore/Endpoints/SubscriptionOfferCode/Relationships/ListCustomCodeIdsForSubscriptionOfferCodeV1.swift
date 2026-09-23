import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # List custom code IDs for a subscription offer code

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionOfferCodes-_id_-relationships-customCodes>

     - Parameter id: The id of the requested resource
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listCustomCodeIdsForSubscriptionOfferCodeV1(id: String,
                                                            limit: Int? = nil) -> Request<SubscriptionOfferCodeCustomCodesLinkagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionOfferCodes/\(id)/relationships/customCodes",
            method: .get,
            parameters: .init(limit: limit))
    }
}
