import Bagbutik_Models

public extension Request {
    /**
     # Modify a Subscription Group
     Update the reference name for a specific subscription group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/modify_a_subscription_group>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: SubscriptionGroup representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateSubscriptionGroupV1(id: String,
                                          requestBody: SubscriptionGroupUpdateRequest) -> Request<SubscriptionGroupResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptionGroups/\(id)", method: .patch, requestBody: requestBody)
    }
}
