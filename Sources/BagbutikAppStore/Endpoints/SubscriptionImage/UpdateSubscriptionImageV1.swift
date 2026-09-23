import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Commit a subscription image (v1)

     Commit an uploaded subscription image.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptionImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionImageV1(id: String,
                                          requestBody: SubscriptionImageUpdateRequest) -> Request<SubscriptionImageResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionImages/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
