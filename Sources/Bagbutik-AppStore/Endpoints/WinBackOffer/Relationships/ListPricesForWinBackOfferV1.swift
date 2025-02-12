import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List win-back offer prices
     List all prices for specific win-back offers.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-winBackOffers-_id_-prices>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPricesForWinBackOfferV1(id: String,
                                            fields: [ListPricesForWinBackOfferV1.Field]? = nil,
                                            filters: [ListPricesForWinBackOfferV1.Filter]? = nil,
                                            includes: [ListPricesForWinBackOfferV1.Include]? = nil,
                                            limit: Int? = nil) -> Request<WinBackOfferPricesResponse, ErrorResponse>
    {
        .init(path: "/v1/winBackOffers/\(id)/prices", method: .get, parameters: .init(fields: fields,
                                                                                      filters: filters,
                                                                                      includes: includes,
                                                                                      limit: limit))
    }
}

public enum ListPricesForWinBackOfferV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionPricePoints
        case subscriptionPricePoints([SubscriptionPricePoints])
        /// The fields to include for returned resources of type territories
        case territories([Territories])
        /// The fields to include for returned resources of type winBackOfferPrices
        case winBackOfferPrices([WinBackOfferPrices])

        public enum SubscriptionPricePoints: String, Sendable, ParameterValue, Codable, CaseIterable {
            case customerPrice
            case equalizations
            case proceeds
            case proceedsYear2
            case territory
        }

        public enum Territories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case currency
        }

        public enum WinBackOfferPrices: String, Sendable, ParameterValue, Codable, CaseIterable {
            case subscriptionPricePoint
            case territory
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
