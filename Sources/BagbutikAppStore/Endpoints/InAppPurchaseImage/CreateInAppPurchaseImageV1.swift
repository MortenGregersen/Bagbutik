import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an image for an In-App Purchase (v1)

     Reserve an image asset to appear in the App Store, representing an In-App Purchase.

     ## Discussion

     > Note:
     > Changes that you make to product metadata with the App Store Connect API can take up to 1 hour to appear in the sandbox environment.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-inAppPurchaseImages>

     - Parameter requestBody: InAppPurchaseImage representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseImageV1(requestBody: InAppPurchaseImageCreateRequest) -> Request<InAppPurchaseImageResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseImages",
            method: .post,
            requestBody: requestBody)
    }
}
