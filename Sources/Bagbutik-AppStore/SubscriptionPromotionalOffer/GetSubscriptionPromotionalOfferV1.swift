import Bagbutik_Models

public extension Request {
    /**
     # Read Promotional Offer Information
     Get details about a specific promotional offer for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_promotional_offer_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related prices returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionPromotionalOfferV1(id: String,
                                                  fields: [GetSubscriptionPromotionalOfferV1.Field]? = nil,
                                                  includes: [GetSubscriptionPromotionalOfferV1.Include]? = nil,
                                                  limit: Int? = nil) -> Request<SubscriptionPromotionalOfferResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptionPromotionalOffers/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                               includes: includes,
                                                                                               limit: limit))
    }
}

public enum GetSubscriptionPromotionalOfferV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionPromotionalOfferPrices
        case subscriptionPromotionalOfferPrices([SubscriptionPromotionalOfferPrices])
        /// The fields to include for returned resources of type subscriptionPromotionalOffers
        case subscriptionPromotionalOffers([SubscriptionPromotionalOffers])

        public enum SubscriptionPromotionalOfferPrices: String, ParameterValue, CaseIterable {
            case subscriptionPricePoint
            case territory
        }

        public enum SubscriptionPromotionalOffers: String, ParameterValue, CaseIterable {
            case duration
            case name
            case numberOfPeriods
            case offerCode
            case offerMode
            case prices
            case subscription
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case prices
        case subscription
    }
}
