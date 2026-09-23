import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify an introductory offer

     Update a specific introductory offer for an auto-renewable subscription.

     ## Discussion

     > Note:
     > Changes that you make to product metadata with the App Store Connect API can take up to 1 hour to appear in the sandbox environment.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptionIntroductoryOffers-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionIntroductoryOffer representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionIntroductoryOfferV1(id: String,
                                                      requestBody: SubscriptionIntroductoryOfferUpdateRequest) -> Request<SubscriptionIntroductoryOfferResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionIntroductoryOffers/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
