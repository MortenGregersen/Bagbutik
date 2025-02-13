import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Subscription Information
     Get information about a specific auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptions-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionV1(id: String,
                                  fields: [GetSubscriptionV1.Field]? = nil,
                                  includes: [GetSubscriptionV1.Include]? = nil,
                                  limits: [GetSubscriptionV1.Limit]? = nil) -> Request<SubscriptionResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptions/\(id)", method: .get, parameters: .init(fields: fields,
                                                                               includes: includes,
                                                                               limits: limits))
    }
}

public enum GetSubscriptionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type promotedPurchases
        case promotedPurchases([PromotedPurchases])
        /// The fields to include for returned resources of type subscriptionAppStoreReviewScreenshots
        case subscriptionAppStoreReviewScreenshots([SubscriptionAppStoreReviewScreenshots])
        /// The fields to include for returned resources of type subscriptionAvailabilities
        case subscriptionAvailabilities([SubscriptionAvailabilities])
        /// The fields to include for returned resources of type subscriptionImages
        case subscriptionImages([SubscriptionImages])
        /// The fields to include for returned resources of type subscriptionIntroductoryOffers
        case subscriptionIntroductoryOffers([SubscriptionIntroductoryOffers])
        /// The fields to include for returned resources of type subscriptionLocalizations
        case subscriptionLocalizations([SubscriptionLocalizations])
        /// The fields to include for returned resources of type subscriptionOfferCodes
        case subscriptionOfferCodes([SubscriptionOfferCodes])
        /// The fields to include for returned resources of type subscriptionPrices
        case subscriptionPrices([SubscriptionPrices])
        /// The fields to include for returned resources of type subscriptionPromotionalOffers
        case subscriptionPromotionalOffers([SubscriptionPromotionalOffers])
        /// The fields to include for returned resources of type subscriptions
        case subscriptions([Subscriptions])
        /// The fields to include for returned resources of type winBackOffers
        case winBackOffers([WinBackOffers])

        public enum PromotedPurchases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case enabled
            case inAppPurchaseV2
            case state
            case subscription
            case visibleForAllUsers
        }

        public enum SubscriptionAppStoreReviewScreenshots: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case assetToken
            case assetType
            case fileName
            case fileSize
            case imageAsset
            case sourceFileChecksum
            case subscription
            case uploadOperations
        }

        public enum SubscriptionAvailabilities: String, Sendable, ParameterValue, Codable, CaseIterable {
            case availableInNewTerritories
            case availableTerritories
        }

        public enum SubscriptionImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetToken
            case fileName
            case fileSize
            case imageAsset
            case sourceFileChecksum
            case state
            case subscription
            case uploadOperations
        }

        public enum SubscriptionIntroductoryOffers: String, Sendable, ParameterValue, Codable, CaseIterable {
            case duration
            case endDate
            case numberOfPeriods
            case offerMode
            case startDate
            case subscription
            case subscriptionPricePoint
            case territory
        }

        public enum SubscriptionLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case description
            case locale
            case name
            case state
            case subscription
        }

        public enum SubscriptionOfferCodes: String, Sendable, ParameterValue, Codable, CaseIterable {
            case active
            case customCodes
            case customerEligibilities
            case duration
            case name
            case numberOfPeriods
            case offerEligibility
            case offerMode
            case oneTimeUseCodes
            case prices
            case subscription
            case totalNumberOfCodes
        }

        public enum SubscriptionPrices: String, Sendable, ParameterValue, Codable, CaseIterable {
            case preserved
            case startDate
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

        public enum WinBackOffers: String, Sendable, ParameterValue, Codable, CaseIterable {
            case customerEligibilityPaidSubscriptionDurationInMonths
            case customerEligibilityTimeSinceLastSubscribedInMonths
            case customerEligibilityWaitBetweenOffersInMonths
            case duration
            case endDate
            case offerId
            case offerMode
            case periodCount
            case prices
            case priority
            case promotionIntent
            case referenceName
            case startDate
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appStoreReviewScreenshot
        case group
        case images
        case introductoryOffers
        case offerCodes
        case pricePoints
        case prices
        case promotedPurchase
        case promotionalOffers
        case subscriptionAvailability
        case subscriptionLocalizations
        case winBackOffers
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related images returned (when they are included) - maximum 50
        case images(Int)
        /// Maximum number of related introductoryOffers returned (when they are included) - maximum 50
        case introductoryOffers(Int)
        /// Maximum number of related offerCodes returned (when they are included) - maximum 50
        case offerCodes(Int)
        /// Maximum number of related prices returned (when they are included) - maximum 50
        case prices(Int)
        /// Maximum number of related promotionalOffers returned (when they are included) - maximum 50
        case promotionalOffers(Int)
        /// Maximum number of related subscriptionLocalizations returned (when they are included) - maximum 50
        case subscriptionLocalizations(Int)
        /// Maximum number of related winBackOffers returned (when they are included) - maximum 50
        case winBackOffers(Int)
    }
}
