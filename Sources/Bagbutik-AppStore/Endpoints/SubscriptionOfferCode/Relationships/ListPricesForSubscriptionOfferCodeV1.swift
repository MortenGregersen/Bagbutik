import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Subscription Offer Code Prices
     Get a list of price tiers for a subscription offer code.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionOfferCodes-_id_-prices>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPricesForSubscriptionOfferCodeV1(id: String,
                                                     fields: [ListPricesForSubscriptionOfferCodeV1.Field]? = nil,
                                                     filters: [ListPricesForSubscriptionOfferCodeV1.Filter]? = nil,
                                                     includes: [ListPricesForSubscriptionOfferCodeV1.Include]? = nil,
                                                     limit: Int? = nil) -> Request<SubscriptionOfferCodePricesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionOfferCodes/\(id)/prices",
            method: .get,
            parameters: .init(
                fields: fields,
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

        public enum SubscriptionOfferCodePrices: String, Sendable, ParameterValue, Codable, CaseIterable {
            case subscriptionPricePoint
            case territory

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = SubscriptionOfferCodePrices(rawValue: string) {
                    self = value
                } else if let value = SubscriptionOfferCodePrices(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid SubscriptionOfferCodePrices value: \(string)"
                    )
                }
            }
        }

        public enum SubscriptionPricePoints: String, Sendable, ParameterValue, Codable, CaseIterable {
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
        /// Filter by id(s) of related 'territory'
        case territory([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case subscriptionPricePoint
        case territory
    }
}
