import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Deactivate custom offer codes

     Deactivate a batch of custom offer codes for an auto-renewable subscription.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptionOfferCodeCustomCodes-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionOfferCodeCustomCode representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionOfferCodeCustomCodeV1(id: String,
                                                        requestBody: SubscriptionOfferCodeCustomCodeUpdateRequest) -> Request<SubscriptionOfferCodeCustomCodeResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionOfferCodeCustomCodes/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
