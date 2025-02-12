import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify the Billing Grace Period Opt-in Status and Duration
     Change the Boolean value representing the billing grace period opt-in status.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-subscriptionGracePeriods-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionGracePeriod representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionGracePeriodV1(id: String,
                                                requestBody: SubscriptionGracePeriodUpdateRequest) -> Request<SubscriptionGracePeriodResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptionGracePeriods/\(id)", method: .patch, requestBody: requestBody)
    }
}
