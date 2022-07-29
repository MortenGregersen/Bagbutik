public extension Request {
    /**
     # List All Prices for a Subscription
     Get a list of prices for an auto-renewable subscription, by territory.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_prices_for_a_subscription>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPricesForSubscriptionV1(id: String,
                                            fields: [ListPricesForSubscriptionV1.Field]? = nil,
                                            filters: [ListPricesForSubscriptionV1.Filter]? = nil,
                                            includes: [ListPricesForSubscriptionV1.Include]? = nil,
                                            limit: Int? = nil) -> Request<SubscriptionPricesResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptions/\(id)/prices", method: .get, parameters: .init(fields: fields,
                                                                                      filters: filters,
                                                                                      includes: includes,
                                                                                      limit: limit))
    }
}

public enum ListPricesForSubscriptionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionPricePoints
        case subscriptionPricePoints([SubscriptionPricePoints])
        /// The fields to include for returned resources of type subscriptionPrices
        case subscriptionPrices([SubscriptionPrices])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum SubscriptionPricePoints: String, ParameterValue, CaseIterable {
            case customerPrice
            case equalizations
            case proceeds
            case proceedsYear2
            case subscription
            case territory
        }

        public enum SubscriptionPrices: String, ParameterValue, CaseIterable {
            case preserveCurrentPrice
            case preserved
            case startDate
            case subscription
            case subscriptionPricePoint
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
        /// Filter by id(s) of related 'subscriptionPricePoint'
        case subscriptionPricePoint([String])
        /// Filter by id(s) of related 'territory'
        case territory([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case subscriptionPricePoint
        case territory
    }
}
