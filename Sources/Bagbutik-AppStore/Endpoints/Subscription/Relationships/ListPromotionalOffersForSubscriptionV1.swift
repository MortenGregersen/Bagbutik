import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Promotional Offer Resource IDs for an Auto-Renewable Subscription
     Get a list of promotional offers for a specific auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptions-_id_-promotionalOffers>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPromotionalOffersForSubscriptionV1(id: String,
                                                       fields: [ListPromotionalOffersForSubscriptionV1.Field]? = nil,
                                                       filters: [ListPromotionalOffersForSubscriptionV1.Filter]? = nil,
                                                       includes: [ListPromotionalOffersForSubscriptionV1.Include]? = nil,
                                                       limits: [ListPromotionalOffersForSubscriptionV1.Limit]? = nil) -> Request<SubscriptionPromotionalOffersResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)/promotionalOffers",
            method: .get,
            parameters: .init(
                fields: fields,
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

        public enum SubscriptionPromotionalOfferPrices: String, Sendable, ParameterValue, Codable, CaseIterable {
            case subscriptionPricePoint
            case territory
        }

        public enum SubscriptionPromotionalOffers: String, Sendable, ParameterValue, Codable, CaseIterable {
            case duration
            case name
            case numberOfPeriods
            case offerCode
            case offerMode
            case prices
            case subscription
        }

        public enum Subscriptions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreReviewScreenshot
            case familySharable
            case group
            case groupLevel
            case images
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
            case winBackOffers
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
    public enum Include: String, IncludeParameter, CaseIterable {
        case prices
        case subscription
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
