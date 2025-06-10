import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all in-app purchase price point equalizations
     Get a list of in-app purchase price points and their equivalent in a specified currency.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchasePricePoints-_id_-equalizations>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 8000
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listEqualizationsForInAppPurchasePricePointV1(id: String,
                                                              fields: [ListEqualizationsForInAppPurchasePricePointV1.Field]? = nil,
                                                              filters: [ListEqualizationsForInAppPurchasePricePointV1.Filter]? = nil,
                                                              includes: [ListEqualizationsForInAppPurchasePricePointV1.Include]? = nil,
                                                              limit: Int? = nil) -> Request<InAppPurchasePricePointsResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchasePricePoints/\(id)/equalizations",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limit: limit))
    }
}

public enum ListEqualizationsForInAppPurchasePricePointV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchasePricePoints
        case inAppPurchasePricePoints([InAppPurchasePricePoints])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum InAppPurchasePricePoints: String, Sendable, ParameterValue, Codable, CaseIterable {
            case customerPrice
            case equalizations
            case proceeds
            case territory
        }

        public enum Territories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case currency
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'inAppPurchaseV2'
        case inAppPurchaseV2([String])
        /// Filter by id(s) of related 'territory'
        case territory([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case equalizations
        case territory
    }
}
