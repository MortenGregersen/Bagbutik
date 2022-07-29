public extension Request {
    /**
     # Read Subscription Grace Period Value
     Get the Boolean value that represents the subscription grace period opt-in state.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_subscription_grace_period_value>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionGracePeriodV1(id: String,
                                             fields: [GetSubscriptionGracePeriodV1.Field]? = nil) -> Request<SubscriptionGracePeriodResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptionGracePeriods/\(id)", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetSubscriptionGracePeriodV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionGracePeriods
        case subscriptionGracePeriods([SubscriptionGracePeriods])

        public enum SubscriptionGracePeriods: String, ParameterValue, CaseIterable {
            case app
            case optIn
        }
    }
}
