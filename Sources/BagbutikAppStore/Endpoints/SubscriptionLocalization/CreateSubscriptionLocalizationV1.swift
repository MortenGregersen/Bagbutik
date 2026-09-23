import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a subscription localization (v1)

     Create a localized display name and description for an auto-renewable subscription.

     ## Discussion

     > Note:
     > Changes that you make to product metadata with the App Store Connect API can take up to 1 hour to appear in the sandbox environment.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionLocalizations>

     - Parameter requestBody: SubscriptionLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionLocalizationV1(requestBody: SubscriptionLocalizationCreateRequest) -> Request<SubscriptionLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}
