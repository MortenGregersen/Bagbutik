import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all prices for an in-app purchase offer code
     Get a list of prices for a specific in-app purchase offer code.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-inAppPurchaseOfferCodes-_id_-prices>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPricesForInAppPurchaseOfferCodeV1(id: String,
                                                      fields: [ListPricesForInAppPurchaseOfferCodeV1.Field]? = nil,
                                                      filters: [ListPricesForInAppPurchaseOfferCodeV1.Filter]? = nil,
                                                      includes: [ListPricesForInAppPurchaseOfferCodeV1.Include]? = nil,
                                                      limit: Int? = nil) -> Request<InAppPurchaseOfferPricesResponse, ErrorResponse> {
        .init(
            path: "/v1/inAppPurchaseOfferCodes/\(id)/prices",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limit: limit))
    }
}

public enum ListPricesForInAppPurchaseOfferCodeV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseOfferPrices
        case inAppPurchaseOfferPrices([InAppPurchaseOfferPrices])
        /// The fields to include for returned resources of type inAppPurchasePricePoints
        case inAppPurchasePricePoints([InAppPurchasePricePoints])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum InAppPurchaseOfferPrices: String, Sendable, ParameterValue, Codable, CaseIterable {
            case pricePoint
            case territory

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = InAppPurchaseOfferPrices(rawValue: string) {
                    self = value
                } else if let value = InAppPurchaseOfferPrices(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid InAppPurchaseOfferPrices value: \(string)"
                    )
                }
            }
        }

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
        case pricePoint
        case territory
    }
}
