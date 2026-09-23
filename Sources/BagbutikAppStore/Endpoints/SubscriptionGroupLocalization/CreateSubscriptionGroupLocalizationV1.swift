import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a subscription group localization (v1)

     Create a localized display name and optional custom app name for a subscription group.

     ## Discussion

     > Note:
     > Changes that you make to product metadata with the App Store Connect API can take up to 1 hour to appear in the sandbox environment.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v1-subscriptionGroupLocalizations>

     - Parameter requestBody: SubscriptionGroupLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionGroupLocalizationV1(requestBody: SubscriptionGroupLocalizationCreateRequest) -> Request<SubscriptionGroupLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionGroupLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}
