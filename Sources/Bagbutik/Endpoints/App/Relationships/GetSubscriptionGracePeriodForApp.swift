public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getSubscriptionGracePeriodForApp(id: String,
                                                 fields: [GetSubscriptionGracePeriodForApp.Field]? = nil) -> Request<SubscriptionGracePeriodResponse, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/subscriptionGracePeriod", method: .get, parameters: .init(fields: fields))
    }
}

public enum GetSubscriptionGracePeriodForApp {
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
