import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify a subscription group localization (v1)

     Update a specific localized display name and optional custom app name for a subscription group.

     ## Discussion

     > Note:
     > Changes that you make to product metadata with the App Store Connect API can take up to 1 hour to appear in the sandbox environment.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptionGroupLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionGroupLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionGroupLocalizationV1(id: String,
                                                      requestBody: SubscriptionGroupLocalizationUpdateRequest) -> Request<SubscriptionGroupLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionGroupLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
