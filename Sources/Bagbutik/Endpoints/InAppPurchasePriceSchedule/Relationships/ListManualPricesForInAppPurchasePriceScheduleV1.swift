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
    static func listManualPricesForInAppPurchasePriceScheduleV1(id: String,
                                                                fields: [ListManualPricesForInAppPurchasePriceScheduleV1.Field]? = nil,
                                                                filters: [ListManualPricesForInAppPurchasePriceScheduleV1.Filter]? = nil,
                                                                includes: [ListManualPricesForInAppPurchasePriceScheduleV1.Include]? = nil,
                                                                limit: Int? = nil) -> Request<InAppPurchasePricesResponse, ErrorResponse>
    {
        return .init(path: "/v1/inAppPurchasePriceSchedules/\(id)/manualPrices", method: .get, parameters: .init(fields: fields,
                                                                                                                 filters: filters,
                                                                                                                 includes: includes,
                                                                                                                 limit: limit))
    }
}

public enum ListManualPricesForInAppPurchasePriceScheduleV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchasePricePoints
        case inAppPurchasePricePoints([InAppPurchasePricePoints])
        /// The fields to include for returned resources of type inAppPurchasePrices
        case inAppPurchasePrices([InAppPurchasePrices])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum InAppPurchasePricePoints: String, ParameterValue, CaseIterable {
            case customerPrice
            case inAppPurchaseV2
            case priceTier
            case proceeds
            case territory
        }

        public enum InAppPurchasePrices: String, ParameterValue, CaseIterable {
            case inAppPurchasePricePoint
            case inAppPurchaseV2
            case startDate
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
        case inAppPurchasePricePoint, territory
    }
}
