import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Localizations for an Auto-Renewable Subscription
     Get a list of the subscription localizations for a specific auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_localizations_for_an_auto-renewable_subscription>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listSubscriptionLocalizationsForSubscriptionV1(id: String,
                                                               fields: [ListSubscriptionLocalizationsForSubscriptionV1.Field]? = nil,
                                                               includes: [ListSubscriptionLocalizationsForSubscriptionV1.Include]? = nil,
                                                               limit: Int? = nil) -> Request<SubscriptionLocalizationsResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptions/\(id)/subscriptionLocalizations", method: .get, parameters: .init(fields: fields,
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

        public enum SubscriptionLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case description
            case locale
            case name
            case state
            case subscription
        }

        public enum Subscriptions: String, Sendable, ParameterValue, Codable, CaseIterable {
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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case subscription
    }
}
