public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Parameter limit: Maximum resources per page - maximum 200
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listSubscriptionLocalizationsForSubscriptionV1(id: String,
                                                               fields: [ListSubscriptionLocalizationsForSubscriptionV1.Field]? = nil,
                                                               includes: [ListSubscriptionLocalizationsForSubscriptionV1.Include]? = nil,
                                                               limit: Int? = nil) -> Request<SubscriptionLocalizationsResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptions/\(id)/subscriptionLocalizations", method: .get, parameters: .init(fields: fields,
                                                                                                                includes: includes,
                                                                                                                limit: limit))
    }
}

public enum ListSubscriptionLocalizationsForSubscriptionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionLocalizations
        case subscriptionLocalizations([SubscriptionLocalizations])
        /// The fields to include for returned resources of type subscriptions
        case subscriptions([Subscriptions])

        public enum SubscriptionLocalizations: String, ParameterValue, CaseIterable {
            case description
            case locale
            case name
            case state
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
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case subscription
    }
}
