public extension Request {
    /**
      # Read Subscription Group Localization Information
      Get the specific localized subscription group display name and optional custom app name for a subscription group.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/read_subscription_group_localization_information>

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getSubscriptionGroupLocalizationV1(id: String,
                                                   fields: [GetSubscriptionGroupLocalizationV1.Field]? = nil,
                                                   includes: [GetSubscriptionGroupLocalizationV1.Include]? = nil) -> Request<SubscriptionGroupLocalizationResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionGroupLocalizations/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                       includes: includes))
    }
}

public enum GetSubscriptionGroupLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionGroupLocalizations
        case subscriptionGroupLocalizations([SubscriptionGroupLocalizations])

        public enum SubscriptionGroupLocalizations: String, ParameterValue, CaseIterable {
            case customAppName
            case locale
            case name
            case state
            case subscriptionGroup
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case subscriptionGroup
    }
}
