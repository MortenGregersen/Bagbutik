import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a subscription group localization
     Update the custom name for a specific locale of a subscription group configured with the v2 API.

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
