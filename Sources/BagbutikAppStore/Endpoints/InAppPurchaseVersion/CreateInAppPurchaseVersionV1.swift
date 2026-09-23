import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an in-app purchase version

     Create a draft version of an in-app purchase, capturing its current localized metadata and review images for App Review submission.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-inAppPurchaseVersions>

     - Parameter requestBody: InAppPurchaseVersion representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseVersionV1(requestBody: InAppPurchaseVersionCreateRequest) -> Request<InAppPurchaseVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseVersions",
            method: .post,
            requestBody: requestBody)
    }
}
