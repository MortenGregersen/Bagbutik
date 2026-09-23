import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an in-app purchase localization (v1)

     Create a localized display name and description for an in-app purchase.

     ## Discussion

     > Note:
     > Changes that you make to product metadata with the App Store Connect API can take up to 1 hour to appear in the sandbox environment.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-inAppPurchaseLocalizations>

     - Parameter requestBody: InAppPurchaseLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseLocalizationV1(requestBody: InAppPurchaseLocalizationCreateRequest) -> Request<InAppPurchaseLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}
