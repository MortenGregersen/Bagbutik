import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Promote a purchase

     Add an existing In-App Purchase or auto-renewable subscription to the promoted In-App Purchases on an app listing in the App Store.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-promotedPurchases>

     - Parameter requestBody: PromotedPurchase representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createPromotedPurchaseV1(requestBody: PromotedPurchaseCreateRequest) -> Request<PromotedPurchaseResponse, ErrorResponse> {
        .init(
            path: "/v1/promotedPurchases",
            method: .post,
            requestBody: requestBody)
    }
}
