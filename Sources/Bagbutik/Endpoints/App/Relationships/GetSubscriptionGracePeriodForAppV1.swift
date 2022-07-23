public extension Request {
    /**
      # Read the Subscription Grace Period Value for an App
      Get the Boolean value that represents the grace period opt-in state for your app.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_the_subscription_grace_period_value_for_an_app>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getSubscriptionGracePeriodForAppV1(id: String,
                                                   fields: [GetSubscriptionGracePeriodForAppV1.Field]? = nil) -> Request<SubscriptionGracePeriodResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/subscriptionGracePeriod", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetSubscriptionGracePeriodForAppV1 {
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
