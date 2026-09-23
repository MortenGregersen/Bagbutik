import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a subscription localization

     Create a localized display name and description for an auto-renewable subscription configured with the v2 API.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-subscriptionLocalizations>

     - Parameter requestBody: SubscriptionLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionLocalizationsV2(requestBody: SubscriptionLocalizationV2CreateRequest) -> Request<SubscriptionLocalizationV2Response, ErrorResponse> {
        .init(
            path: "/v2/subscriptionLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}
