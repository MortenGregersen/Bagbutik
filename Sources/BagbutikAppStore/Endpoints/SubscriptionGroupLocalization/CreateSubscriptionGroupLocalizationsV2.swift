import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Create a subscription group localization

     Create a localized custom name for a subscription group configured with the v2 API.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/post-v2-subscriptionGroupLocalizations>

     - Parameter requestBody: SubscriptionGroupLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionGroupLocalizationsV2(requestBody: SubscriptionGroupLocalizationV2CreateRequest) -> Request<SubscriptionGroupLocalizationV2Response, ErrorResponse> {
        .init(
            path: "/v2/subscriptionGroupLocalizations",
            method: .post,
            requestBody: requestBody)
    }
}
