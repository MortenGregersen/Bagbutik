import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify an In-App Purchase image

     Commit the asset upload for an In-App Purchase image configured with the v2 API.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-inAppPurchaseImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: InAppPurchaseImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateInAppPurchaseImagesV2(id: String,
                                            requestBody: InAppPurchaseImageV2UpdateRequest) -> Request<InAppPurchaseImageV2Response, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchaseImages/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
