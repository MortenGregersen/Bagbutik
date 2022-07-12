public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getSubscriptionPricePointV1(id: String,
                                            fields: [GetSubscriptionPricePointV1.Field]? = nil,
                                            includes: [GetSubscriptionPricePointV1.Include]? = nil) -> Request<SubscriptionPricePointResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionPricePoints/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                includes: includes))
    }
}

public enum GetSubscriptionPricePointV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionPricePoints
        case subscriptionPricePoints([SubscriptionPricePoints])

        public enum SubscriptionPricePoints: String, ParameterValue, CaseIterable {
            case customerPrice
            case equalizations
            case proceeds
            case proceedsYear2
            case subscription
            case territory
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case territory
    }
}
