import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Read the App Store review screenshot ID for an In-App Purchase

     Get the App Store review screenshot ID for a specific In-App Purchase.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-inAppPurchases-_id_-relationships-appStoreReviewScreenshot>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppStoreReviewScreenshotIdsForInAppPurchasesV2(id: String) -> Request<InAppPurchaseV2AppStoreReviewScreenshotLinkageResponse, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchases/\(id)/relationships/appStoreReviewScreenshot",
            method: .get)
    }
}
