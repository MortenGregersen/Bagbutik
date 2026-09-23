import BagbutikCore
import BagbutikAppStoreModels
import BagbutikModelsShared

public extension Request {
    /**
     # Delete prices from a subscription

     Delete a scheduled subscription price change for an auto-renewable subscription.

     ## Discussion

     > Note:
     > Changes that you make to product metadata with the App Store Connect API can take up to 1 hour to appear in the sandbox environment.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

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
