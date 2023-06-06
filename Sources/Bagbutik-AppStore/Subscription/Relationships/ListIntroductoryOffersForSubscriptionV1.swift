import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Introductory Offers for a Subscription
     Get a list of introductory offers for a specific auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_introductory_offers_for_a_subscription>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listIntroductoryOffersForSubscriptionV1(id: String,
                                                        fields: [ListIntroductoryOffersForSubscriptionV1.Field]? = nil,
                                                        filters: [ListIntroductoryOffersForSubscriptionV1.Filter]? = nil,
                                                        includes: [ListIntroductoryOffersForSubscriptionV1.Include]? = nil,
                                                        limit: Int? = nil) -> Request<SubscriptionIntroductoryOffersResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptions/\(id)/introductoryOffers", method: .get, parameters: .init(fields: fields,
                                                                                                  filters: filters,
                                                                                                  includes: includes,
                                                                                                  limit: limit))
    }
}

public enum ListIntroductoryOffersForSubscriptionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionIntroductoryOffers
        case subscriptionIntroductoryOffers([SubscriptionIntroductoryOffers])
        /// The fields to include for returned resources of type subscriptionPricePoints
        case subscriptionPricePoints([SubscriptionPricePoints])
        /// The fields to include for returned resources of type subscriptions
        case subscriptions([Subscriptions])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum SubscriptionIntroductoryOffers: String, ParameterValue, Codable, CaseIterable {
            case duration
            case endDate
            case numberOfPeriods
            case offerMode
            case startDate
            case subscription
            case subscriptionPricePoint
            case territory
        }

        public enum SubscriptionPricePoints: String, ParameterValue, Codable, CaseIterable {
            case customerPrice
            case equalizations
            case proceeds
            case proceedsYear2
            case subscription
            case territory
        }

        public enum Subscriptions: String, ParameterValue, Codable, CaseIterable {
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
            case subscriptionAvailability
            case subscriptionLocalizations
            case subscriptionPeriod
        }

        public enum Territories: String, ParameterValue, Codable, CaseIterable {
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
        case subscription
        case subscriptionPricePoint
        case territory
    }
}
