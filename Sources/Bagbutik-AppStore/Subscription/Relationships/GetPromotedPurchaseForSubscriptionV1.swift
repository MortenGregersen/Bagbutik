import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Promoted Purchase Information for a Subscription
     Get details about the promoted purchase of an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptions-_id_-promotedPurchase>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related promotionImages returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getPromotedPurchaseForSubscriptionV1(id: String,
                                                     fields: [GetPromotedPurchaseForSubscriptionV1.Field]? = nil,
                                                     includes: [GetPromotedPurchaseForSubscriptionV1.Include]? = nil,
                                                     limit: GetPromotedPurchaseForSubscriptionV1.Limit? = nil) -> Request<PromotedPurchaseResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptions/\(id)/promotedPurchase", method: .get, parameters: .init(fields: fields,
                                                                                                includes: includes,
                                                                                                limits: limit.map { [$0] }))
    }
}

public enum GetPromotedPurchaseForSubscriptionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchases
        case inAppPurchases([InAppPurchases])
        /// The fields to include for returned resources of type promotedPurchaseImages
        case promotedPurchaseImages([PromotedPurchaseImages])
        /// The fields to include for returned resources of type promotedPurchases
        case promotedPurchases([PromotedPurchases])
        /// The fields to include for returned resources of type subscriptions
        case subscriptions([Subscriptions])

        public enum InAppPurchases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appStoreReviewScreenshot
            case content
            case contentHosting
            case familySharable
            case iapPriceSchedule
            case images
            case inAppPurchaseAvailability
            case inAppPurchaseLocalizations
            case inAppPurchaseType
            case name
            case pricePoints
            case productId
            case promotedPurchase
            case reviewNote
            case state
        }

        public enum PromotedPurchaseImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetToken
            case assetType
            case fileName
            case fileSize
            case imageAsset
            case promotedPurchase
            case sourceFileChecksum
            case state
            case uploadOperations
            case uploaded
        }

        public enum PromotedPurchases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case enabled
            case inAppPurchaseV2
            case promotionImages
            case state
            case subscription
            case visibleForAllUsers
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
        case inAppPurchaseV2
        case promotionImages
        case subscription
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related promotionImages returned (when they are included) - maximum 50
        case promotionImages(Int)
    }
}
