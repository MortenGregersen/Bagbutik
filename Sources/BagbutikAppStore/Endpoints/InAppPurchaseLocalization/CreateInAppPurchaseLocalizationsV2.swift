import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create an in-app purchase localization

     Create a localized display name and description for an in-app purchase configured with the v2 API.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-inAppPurchaseLocalizations>

     - Parameter requestBody: InAppPurchaseLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createInAppPurchaseLocalizationsV2(requestBody: InAppPurchaseLocalizationV2CreateRequest) -> Request<InAppPurchaseLocalizationV2Response, ErrorResponse> {
        .init(
            path: "/v2/inAppPurchaseLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}
