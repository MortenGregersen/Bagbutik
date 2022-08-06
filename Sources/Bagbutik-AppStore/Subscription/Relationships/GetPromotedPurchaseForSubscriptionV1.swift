import Bagbutik_Models

public extension Request {
    /**
     # Read Promoted Purchase Information for a Subscription
     Get details about the promoted purchase of an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_promoted_purchase_information_for_a_subscription>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related promotionImages returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getPromotedPurchaseForSubscriptionV1(id: String,
                                                     fields: [GetPromotedPurchaseForSubscriptionV1.Field]? = nil,
                                                     includes: [GetPromotedPurchaseForSubscriptionV1.Include]? = nil,
                                                     limit: Int? = nil) -> Request<PromotedPurchaseResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptions/\(id)/promotedPurchase", method: .get, parameters: .init(fields: fields,
                                                                                                includes: includes,
                                                                                                limit: limit))
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

        public enum InAppPurchases: String, ParameterValue, CaseIterable {
            case app
            case appStoreReviewScreenshot
            case availableInAllTerritories
            case content
            case contentHosting
            case familySharable
            case iapPriceSchedule
            case inAppPurchaseLocalizations
            case inAppPurchaseType
            case name
            case pricePoints
            case productId
            case promotedPurchase
            case reviewNote
            case state
        }

        public enum PromotedPurchaseImages: String, ParameterValue, CaseIterable {
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

        public enum PromotedPurchases: String, ParameterValue, CaseIterable {
            case app
            case enabled
            case inAppPurchaseV2
            case promotionImages
            case state
            case subscription
            case visibleForAllUsers
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
        case inAppPurchaseV2
        case promotionImages
        case subscription
    }
}
