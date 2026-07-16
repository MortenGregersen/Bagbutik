import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a subscription group localization
     Create a localized custom name for a subscription group configured with the v2 API.

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
