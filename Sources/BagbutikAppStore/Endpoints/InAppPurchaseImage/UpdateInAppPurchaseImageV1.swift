import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Commit an image for an In-App Purchase (v1)

     Commit an uploaded image asset for an In-App Purchase.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-inAppPurchaseImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: InAppPurchaseImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateInAppPurchaseImageV1(id: String,
                                           requestBody: InAppPurchaseImageUpdateRequest) -> Request<InAppPurchaseImageResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseImages/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
