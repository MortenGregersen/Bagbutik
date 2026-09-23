import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify a subscription image

     Commit the asset upload for a subscription image configured with the v2 API.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-subscriptionImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionImagesV2(id: String,
                                           requestBody: SubscriptionImageV2UpdateRequest) -> Request<SubscriptionImageV2Response, ErrorResponse> {
        .init(
            path: "/v2/subscriptionImages/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
