import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read price information for an in-app purchase price schedule
     Get information about a set price or prices for an in-app purchase price schedule.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchasePriceSchedules-_id_-manualPrices>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listManualPricesForInAppPurchasePriceScheduleV1(id: String,
                                                                fields: [ListManualPricesForInAppPurchasePriceScheduleV1.Field]? = nil,
                                                                filters: [ListManualPricesForInAppPurchasePriceScheduleV1.Filter]? = nil,
                                                                includes: [ListManualPricesForInAppPurchasePriceScheduleV1.Include]? = nil,
                                                                limit: Int? = nil) -> Request<InAppPurchasePricesResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchasePriceSchedules/\(id)/manualPrices",
            method: .get,
            parameters: .init(
                fields: fields,
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

        public enum InAppPurchasePricePoints: String, Sendable, ParameterValue, Codable, CaseIterable {
            case customerPrice
            case equalizations
            case proceeds
            case territory

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchasePricePoints(rawValue: string) {
                    self = value
                } else if let value = InAppPurchasePricePoints(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchasePricePoints value: \(string)"
                    )
                }
            }
        }

        public enum InAppPurchasePrices: String, Sendable, ParameterValue, Codable, CaseIterable {
            case endDate
            case inAppPurchasePricePoint
            case manual
            case startDate
            case territory

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchasePrices(rawValue: string) {
                    self = value
                } else if let value = InAppPurchasePrices(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchasePrices value: \(string)"
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
        /// Filter by id(s) of related 'territory'
        case territory([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case inAppPurchasePricePoint
        case territory
    }
}
