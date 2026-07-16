import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create an in-app purchase localization
     Create a localized display name and description for an in-app purchase configured with the v2 API.

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
