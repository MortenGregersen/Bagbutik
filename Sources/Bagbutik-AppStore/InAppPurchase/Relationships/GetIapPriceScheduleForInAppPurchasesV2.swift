import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the Price Schedule for an In-App Purchase
     Get a list of the scheduled prices for an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_price_schedule_for_an_in-app_purchase>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getIapPriceScheduleForInAppPurchasesV2(id: String,
                                                       fields: [GetIapPriceScheduleForInAppPurchasesV2.Field]? = nil,
                                                       includes: [GetIapPriceScheduleForInAppPurchasesV2.Include]? = nil,
                                                       limits: [GetIapPriceScheduleForInAppPurchasesV2.Limit]? = nil) -> Request<InAppPurchasePriceScheduleResponse, ErrorResponse>
    {
        .init(path: "/v2/inAppPurchases/\(id)/iapPriceSchedule", method: .get, parameters: .init(fields: fields,
                                                                                                 includes: includes,
                                                                                                 limits: limits))
    }
}

public enum GetIapPriceScheduleForInAppPurchasesV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchasePriceSchedules
        case inAppPurchasePriceSchedules([InAppPurchasePriceSchedules])
        /// The fields to include for returned resources of type inAppPurchasePrices
        case inAppPurchasePrices([InAppPurchasePrices])
        /// The fields to include for returned resources of type inAppPurchases
        case inAppPurchases([InAppPurchases])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum InAppPurchasePriceSchedules: String, Sendable, ParameterValue, Codable, CaseIterable {
            case automaticPrices
            case baseTerritory
            case inAppPurchase
            case manualPrices
        }

        public enum InAppPurchasePrices: String, Sendable, ParameterValue, Codable, CaseIterable {
            case endDate
            case inAppPurchasePricePoint
            case inAppPurchaseV2
            case manual
            case startDate
            case territory
        }

        public enum InAppPurchases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appStoreReviewScreenshot
            case content
            case contentHosting
            case familySharable
            case iapPriceSchedule
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

        public enum Territories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case currency
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case automaticPrices
        case baseTerritory
        case inAppPurchase
        case manualPrices
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related automaticPrices returned (when they are included) - maximum 50
        case automaticPrices(Int)
        /// Maximum number of related manualPrices returned (when they are included) - maximum 50
        case manualPrices(Int)
    }
}
