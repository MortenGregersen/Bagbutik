public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getSubscriptionGracePeriodV1(id: String,
                                             fields: [GetSubscriptionGracePeriodV1.Field]? = nil) -> Request<SubscriptionGracePeriodResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionGracePeriods/\(id)", method: .get, parameters: .init(fields: fields))
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
