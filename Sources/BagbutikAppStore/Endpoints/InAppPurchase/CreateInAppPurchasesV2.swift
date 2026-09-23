import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an in-app purchase

     Create an in-app purchase, including a consumable, non-consumable, or non-renewing subscription.

     ## Discussion

     > Note:
     > Changes that you make to product metadata with the App Store Connect API can take up to 1 hour to appear in the sandbox environment.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-inAppPurchases>

     - Parameter requestBody: InAppPurchase representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchasesV2(requestBody: InAppPurchaseV2CreateRequest) -> Request<InAppPurchaseV2Response, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchases",
            method: .post,
            requestBody: requestBody)
    }
}
