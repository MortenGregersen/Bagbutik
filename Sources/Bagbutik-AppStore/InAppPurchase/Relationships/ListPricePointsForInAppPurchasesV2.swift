import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Price Points for an In-App Purchase
     Get a list of possible price points for an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_price_points_for_an_in-app_purchase>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 8000
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPricePointsForInAppPurchasesV2(id: String,
                                                   fields: [ListPricePointsForInAppPurchasesV2.Field]? = nil,
                                                   filters: [ListPricePointsForInAppPurchasesV2.Filter]? = nil,
                                                   includes: [ListPricePointsForInAppPurchasesV2.Include]? = nil,
                                                   limit: Int? = nil) -> Request<InAppPurchasePricePointsResponse, ErrorResponse>
    {
        .init(path: "/v2/inAppPurchases/\(id)/pricePoints", method: .get, parameters: .init(fields: fields,
                                                                                            filters: filters,
                                                                                            includes: includes,
                                                                                            limit: limit))
    }
}

public enum ListPricePointsForInAppPurchasesV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchasePricePoints
        case inAppPurchasePricePoints([InAppPurchasePricePoints])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum InAppPurchasePricePoints: String, ParameterValue, Codable, CaseIterable {
            case customerPrice
            case inAppPurchaseV2
            case proceeds
            case territory
        }

        public enum Territories: String, ParameterValue, Codable, CaseIterable {
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
    public enum Include: String, IncludeParameter, CaseIterable {
        case territory
    }
}
