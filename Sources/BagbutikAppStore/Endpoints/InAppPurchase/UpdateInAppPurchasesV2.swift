import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify an in-app purchase

     Update the reference name of a specific in-app purchase.

     ## Discussion

     > Note:
     > Changes that you make to product metadata in App Store Connect can take up to 1 hour to appear in the sandbox environment.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-inAppPurchases-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: InAppPurchase representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateInAppPurchasesV2(id: String,
                                       requestBody: InAppPurchaseV2UpdateRequest) -> Request<InAppPurchaseV2Response, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchases/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
