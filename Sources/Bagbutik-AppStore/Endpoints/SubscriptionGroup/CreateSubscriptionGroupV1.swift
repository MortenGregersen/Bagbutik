import Bagbutik_Core

public extension Request {
    /**
     # Create a Subscription Group
     Create a subscription group for an app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_a_subscription_group>

     - Parameter requestBody: SubscriptionGroup representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createSubscriptionGroupV1(requestBody: SubscriptionGroupCreateRequest) -> Request<SubscriptionGroupResponse, ErrorResponse> {
        .init(path: "/v1/subscriptionGroups", method: .post, requestBody: requestBody)
    }
}
