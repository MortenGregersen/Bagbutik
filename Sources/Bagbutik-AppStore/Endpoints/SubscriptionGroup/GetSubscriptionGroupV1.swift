import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Subscription Group Information
     Get the details of a specific subscription group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionGroups-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionGroupV1(id: String,
                                       fields: [GetSubscriptionGroupV1.Field]? = nil,
                                       includes: [GetSubscriptionGroupV1.Include]? = nil,
                                       limits: [GetSubscriptionGroupV1.Limit]? = nil) -> Request<SubscriptionGroupResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptionGroups/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum GetSubscriptionGroupV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionGroupLocalizations
        case subscriptionGroupLocalizations([SubscriptionGroupLocalizations])
        /// The fields to include for returned resources of type subscriptionGroups
        case subscriptionGroups([SubscriptionGroups])
        /// The fields to include for returned resources of type subscriptions
        case subscriptions([Subscriptions])

        public enum SubscriptionGroupLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case customAppName
            case locale
            case name
            case state
            case subscriptionGroup
        }

        public enum SubscriptionGroups: String, Sendable, ParameterValue, Codable, CaseIterable {
            case referenceName
            case subscriptionGroupLocalizations
            case subscriptions
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
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case subscriptionGroupLocalizations
        case subscriptions
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related subscriptionGroupLocalizations returned (when they are included) - maximum 50
        case subscriptionGroupLocalizations(Int)
        /// Maximum number of related subscriptions returned (when they are included) - maximum 50
        case subscriptions(Int)
    }
}
