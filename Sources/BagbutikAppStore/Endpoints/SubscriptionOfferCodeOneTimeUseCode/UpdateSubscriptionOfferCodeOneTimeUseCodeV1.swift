import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Deactivate one-time use offer codes

     Deactivate a batch of one-time use offer codes for an auto-renewable subscription.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptionOfferCodeOneTimeUseCodes-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionOfferCodeOneTimeUseCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionOfferCodeOneTimeUseCodeV1(id: String,
                                                            requestBody: SubscriptionOfferCodeOneTimeUseCodeUpdateRequest) -> Request<SubscriptionOfferCodeOneTimeUseCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionOfferCodeOneTimeUseCodes/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
