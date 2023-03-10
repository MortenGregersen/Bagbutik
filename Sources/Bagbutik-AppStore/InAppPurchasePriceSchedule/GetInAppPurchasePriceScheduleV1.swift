import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read in-app purchase price schedule information
     Get information about a specific scheduled price change for an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_in-app_purchase_price_schedule_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getInAppPurchasePriceScheduleV1(id: String,
                                                fields: [GetInAppPurchasePriceScheduleV1.Field]? = nil,
                                                includes: [GetInAppPurchasePriceScheduleV1.Include]? = nil,
                                                limits: [GetInAppPurchasePriceScheduleV1.Limit]? = nil) -> Request<InAppPurchasePriceScheduleResponse, ErrorResponse>
    {
        .init(path: "/v1/inAppPurchasePriceSchedules/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                             includes: includes,
                                                                                             limits: limits))
    }
}

public enum GetInAppPurchasePriceScheduleV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchasePriceSchedules
        case inAppPurchasePriceSchedules([InAppPurchasePriceSchedules])
        /// The fields to include for returned resources of type inAppPurchasePrices
        case inAppPurchasePrices([InAppPurchasePrices])
        /// The fields to include for returned resources of type territories
        case territories([Territories])

        public enum InAppPurchasePriceSchedules: String, ParameterValue, Codable, CaseIterable {
            case automaticPrices
            case baseTerritory
            case inAppPurchase
            case manualPrices
        }

        public enum InAppPurchasePrices: String, ParameterValue, Codable, CaseIterable {
            case endDate
            case inAppPurchasePricePoint
            case inAppPurchaseV2
            case manual
            case startDate
            case territory
        }

        public enum Territories: String, ParameterValue, Codable, CaseIterable {
            case currency
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
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
