public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getSubscriptionLocalization(id: String,
                                            fields: [GetSubscriptionLocalization.Field]? = nil,
                                            includes: [GetSubscriptionLocalization.Include]? = nil) -> Request<SubscriptionLocalizationResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionLocalizations/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                  includes: includes))
    }
}

public enum GetSubscriptionLocalization {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionLocalizations
        case subscriptionLocalizations([SubscriptionLocalizations])

        public enum SubscriptionLocalizations: String, ParameterValue, CaseIterable {
            case description
            case locale
            case name
            case state
            case subscription
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case subscription
    }
}
