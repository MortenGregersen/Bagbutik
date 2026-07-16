import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a subscription localization
     Update the display name and description for a specific locale of a subscription configured with the v2 API.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v2-subscriptionLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionLocalization representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionLocalizationsV2(id: String,
                                                  requestBody: SubscriptionLocalizationV2UpdateRequest) -> Request<SubscriptionLocalizationV2Response, ErrorResponse> {
        .init(
            path: "/v2/subscriptionLocalizations/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
