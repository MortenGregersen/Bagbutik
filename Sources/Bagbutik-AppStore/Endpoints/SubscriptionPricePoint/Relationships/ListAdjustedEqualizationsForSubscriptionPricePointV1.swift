import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List adjusted equalizations for a subscription price point
     List the adjusted territory equalizations for a subscription price point.

     Use this endpoint with filters to identify a specific adjusted equalization. Provide the `filter[upfrontPricePointId]` and `filter[planType]` query parameters, for example:
     ```
     GET /v1/subscriptionPricePoints/{pricePointId}/adjustedEqualizations?filter[upfrontPricePointId]=$id&filter[planType]=MONTHLY
     ```

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionPricePoints-_id_-adjustedEqualizations>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 8000
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAdjustedEqualizationsForSubscriptionPricePointV1(id: String,
                                                                     fields: [ListAdjustedEqualizationsForSubscriptionPricePointV1.Field]? = nil,
                                                                     filters: [ListAdjustedEqualizationsForSubscriptionPricePointV1.Filter]? = nil,
                                                                     includes: [ListAdjustedEqualizationsForSubscriptionPricePointV1.Include]? = nil,
                                                                     limit: Int? = nil) -> Request<SubscriptionPricePointsResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionPricePoints/\(id)/adjustedEqualizations",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limit: limit))
    }
}

public enum ListAdjustedEqualizationsForSubscriptionPricePointV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionPricePoints
        case subscriptionPricePoints([SubscriptionPricePoints])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum SubscriptionPricePoints: String, Sendable, ParameterValue, Codable, CaseIterable {
            case adjustedEqualizations
            case customerPrice
            case equalizations
            case proceeds
            case proceedsYear2
            case territory

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SubscriptionPricePoints(rawValue: string) {
                    self = value
                } else if let value = SubscriptionPricePoints(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SubscriptionPricePoints value: \(string)"
                    )
                }
            }
        }

        public enum Territories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case currency

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = Territories(rawValue: string) {
                    self = value
                } else if let value = Territories(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid Territories value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by planType
        case planType([String])
        /// Filter by id(s) of related 'subscription'
        case subscription([String])
        /// Filter by id(s) of related 'territory'
        case territory([String])
        /// Filter by upfrontPricePointId
        case upfrontPricePointId([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case territory
    }
}
