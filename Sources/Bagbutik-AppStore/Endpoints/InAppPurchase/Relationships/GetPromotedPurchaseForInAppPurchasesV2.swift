import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Promoted Purchase Information for an In-App Purchase
     Get details about the promoted purchase of an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-inAppPurchases-_id_-promotedPurchase>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getPromotedPurchaseForInAppPurchasesV2(id: String,
                                                       fields: [GetPromotedPurchaseForInAppPurchasesV2.Field]? = nil,
                                                       includes: [GetPromotedPurchaseForInAppPurchasesV2.Include]? = nil) -> Request<PromotedPurchaseResponse, ErrorResponse>
    {
        .init(path: "/v2/inAppPurchases/\(id)/promotedPurchase", method: .get, parameters: .init(fields: fields,
                                                                                                 includes: includes))
    }
}

public enum GetPromotedPurchaseForInAppPurchasesV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchases
        case inAppPurchases([InAppPurchases])
        /// The fields to include for returned resources of type promotedPurchases
        case promotedPurchases([PromotedPurchases])
        /// The fields to include for returned resources of type subscriptions
        case subscriptions([Subscriptions])

        public enum InAppPurchases: String, Sendable, ParameterValue, Codable, CaseIterable {
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

        public enum PromotedPurchases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case enabled
            case inAppPurchaseV2
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
        case subscription
    }
}
