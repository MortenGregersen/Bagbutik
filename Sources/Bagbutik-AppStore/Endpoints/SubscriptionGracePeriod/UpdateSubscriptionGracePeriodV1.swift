import Bagbutik_Core

public extension Request {
    /**
     # Modify the Grace Period Opt-in Status
     Change the Boolean value representing the subscription grace period opt-in status.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_the_grace_period_opt-in_status>

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
