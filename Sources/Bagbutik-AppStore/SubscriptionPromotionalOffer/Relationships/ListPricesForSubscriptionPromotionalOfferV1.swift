import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Promotional Offer Prices for a Subscription
     Get a list of prices of a promotional offer for an auto-renewable subscription, for a specified territory.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionPromotionalOffers-_id_-prices>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPricesForSubscriptionPromotionalOfferV1(id: String,
                                                            fields: [ListPricesForSubscriptionPromotionalOfferV1.Field]? = nil,
                                                            filters: [ListPricesForSubscriptionPromotionalOfferV1.Filter]? = nil,
                                                            includes: [ListPricesForSubscriptionPromotionalOfferV1.Include]? = nil,
                                                            limit: Int? = nil) -> Request<SubscriptionPromotionalOfferPricesResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptionPromotionalOffers/\(id)/prices", method: .get, parameters: .init(fields: fields,
                                                                                                      filters: filters,
                                                                                                      includes: includes,
                                                                                                      limit: limit))
    }
}

public enum ListPricesForSubscriptionPromotionalOfferV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionPricePoints
        case subscriptionPricePoints([SubscriptionPricePoints])
        /// The fields to include for returned resources of type subscriptionPromotionalOfferPrices
        case subscriptionPromotionalOfferPrices([SubscriptionPromotionalOfferPrices])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum SubscriptionPricePoints: String, Sendable, ParameterValue, Codable, CaseIterable {
            case customerPrice
            case equalizations
            case proceeds
            case proceedsYear2
            case subscription
            case territory
        }

        public enum SubscriptionPromotionalOfferPrices: String, Sendable, ParameterValue, Codable, CaseIterable {
            case subscriptionPricePoint
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
