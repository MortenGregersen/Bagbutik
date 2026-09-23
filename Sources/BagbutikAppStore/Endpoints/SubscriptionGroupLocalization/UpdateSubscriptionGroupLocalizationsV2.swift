import BagbutikCore
import BagbutikAppStoreModels

public extension Request {
    /**
     # Modify a subscription group localization

     Update the custom name for a specific locale of a subscription group configured with the v2 API.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-subscriptionGroupLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionGroupLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionGroupLocalizationsV2(id: String,
                                                       requestBody: SubscriptionGroupLocalizationV2UpdateRequest) -> Request<SubscriptionGroupLocalizationV2Response, ErrorResponse> {
        .init(
            path: "/v2/subscriptionGroupLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
