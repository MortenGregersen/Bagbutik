import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify a subscription localization (v1)

     Update a specific localized subscription display name and description for an auto-renewable subscription.

     ## Discussion

     > Note:
     > Changes that you make to product metadata with the App Store Connect API can take up to 1 hour to appear in the sandbox environment.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptionLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionLocalizationV1(id: String,
                                                 requestBody: SubscriptionLocalizationUpdateRequest) -> Request<SubscriptionLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
