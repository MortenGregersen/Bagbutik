import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify a promotional offer

     Update the prices for a specific promotional offer for an auto-renewable subscription.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptionPromotionalOffers-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionPromotionalOffer representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionPromotionalOfferV1(id: String,
                                                     requestBody: SubscriptionPromotionalOfferUpdateRequest) -> Request<SubscriptionPromotionalOfferResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionPromotionalOffers/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
