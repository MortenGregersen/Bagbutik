public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listPromotionalOffersForSubscriptionV1(id: String,
                                                       fields: [ListPromotionalOffersForSubscriptionV1.Field]? = nil,
                                                       filters: [ListPromotionalOffersForSubscriptionV1.Filter]? = nil,
                                                       includes: [ListPromotionalOffersForSubscriptionV1.Include]? = nil,
                                                       limits: [ListPromotionalOffersForSubscriptionV1.Limit]? = nil) -> Request<SubscriptionPromotionalOffersResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptions/\(id)/promotionalOffers", method: .get, parameters: .init(fields: fields,
                                                                                                        filters: filters,
                                                                                                        includes: includes,
                                                                                                        limits: limits))
    }
}

public enum ListPromotionalOffersForSubscriptionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionPromotionalOfferPrices
        case subscriptionPromotionalOfferPrices([SubscriptionPromotionalOfferPrices])
        /// The fields to include for returned resources of type subscriptionPromotionalOffers
        case subscriptionPromotionalOffers([SubscriptionPromotionalOffers])
        /// The fields to include for returned resources of type subscriptions
        case subscriptions([Subscriptions])

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

        public enum Subscriptions: String, ParameterValue, CaseIterable {
            case appStoreReviewScreenshot
            case availableInAllTerritories
            case familySharable
            case group
            case groupLevel
            case introductoryOffers
            case name
            case offerCodes
            case pricePoints
            case prices
            case productId
            case promotedPurchase
            case promotionalOffers
            case reviewNote
            case state
            case subscriptionLocalizations
            case subscriptionPeriod
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by territory
        case territory([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case prices, subscription
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related prices returned (when they are included) - maximum 50
        case prices(Int)
    }
}
