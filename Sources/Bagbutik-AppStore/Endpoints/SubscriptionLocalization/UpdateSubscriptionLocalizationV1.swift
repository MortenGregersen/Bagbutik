import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a Subscription Localization
     Update a specific localized subscription display name and description for an auto-renewable subscription.

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
