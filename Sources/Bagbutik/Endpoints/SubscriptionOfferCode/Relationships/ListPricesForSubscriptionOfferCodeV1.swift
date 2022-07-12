public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listPricesForSubscriptionOfferCodeV1(id: String,
                                                     fields: [ListPricesForSubscriptionOfferCodeV1.Field]? = nil,
                                                     filters: [ListPricesForSubscriptionOfferCodeV1.Filter]? = nil,
                                                     includes: [ListPricesForSubscriptionOfferCodeV1.Include]? = nil,
                                                     limit: Int? = nil) -> Request<SubscriptionOfferCodePricesResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionOfferCodes/\(id)/prices", method: .get, parameters: .init(fields: fields,
                                                                                                      filters: filters,
                                                                                                      includes: includes,
                                                                                                      limit: limit))
    }
}

public enum ListPricesForSubscriptionOfferCodeV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionOfferCodePrices
        case subscriptionOfferCodePrices([SubscriptionOfferCodePrices])
        /// The fields to include for returned resources of type subscriptionPricePoints
        case subscriptionPricePoints([SubscriptionPricePoints])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum SubscriptionOfferCodePrices: String, ParameterValue, CaseIterable {
            case subscriptionPricePoint
            case territory
        }

        public enum SubscriptionPricePoints: String, ParameterValue, CaseIterable {
            case customerPrice
            case equalizations
            case proceeds
            case proceedsYear2
            case subscription
            case territory
        }

        public enum Territories: String, ParameterValue, CaseIterable {
            case currency
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'territory'
        case territory([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case subscriptionPricePoint, territory
    }
}
