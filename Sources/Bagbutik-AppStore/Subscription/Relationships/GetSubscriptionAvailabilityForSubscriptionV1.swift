import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Information About the Availability of a Subscription
     Get information about the territory availability for a subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_information_about_the_availability_of_a_subscription>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related availableTerritories returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionAvailabilityForSubscriptionV1(id: String,
                                                             fields: [GetSubscriptionAvailabilityForSubscriptionV1.Field]? = nil,
                                                             includes: [GetSubscriptionAvailabilityForSubscriptionV1.Include]? = nil,
                                                             limit: GetSubscriptionAvailabilityForSubscriptionV1.Limit? = nil) -> Request<SubscriptionAvailabilityResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptions/\(id)/subscriptionAvailability", method: .get, parameters: .init(fields: fields,
                                                                                                        includes: includes,
                                                                                                        limits: limit.map { [$0] }))
    }
}

public enum GetSubscriptionAvailabilityForSubscriptionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionAvailabilities
        case subscriptionAvailabilities([SubscriptionAvailabilities])
        /// The fields to include for returned resources of type subscriptions
        case subscriptions([Subscriptions])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum SubscriptionAvailabilities: String, ParameterValue, Codable, CaseIterable {
            case availableInNewTerritories
            case availableTerritories
            case subscription
        }

        public enum Subscriptions: String, ParameterValue, Codable, CaseIterable {
            case appStoreReviewScreenshot
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
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case availableTerritories
        case subscription
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related availableTerritories returned (when they are included) - maximum 50
        case availableTerritories(Int)
    }
}
