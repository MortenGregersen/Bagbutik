import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Deactivate a subscription offer with offer codes

     Deactivate a subscription offer that has offer codes for an auto-renewable subscription.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptionOfferCodes-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionOfferCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionOfferCodeV1(id: String,
                                              requestBody: SubscriptionOfferCodeUpdateRequest) -> Request<SubscriptionOfferCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionOfferCodes/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
