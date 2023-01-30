import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read In-App Purchase Price Schedule Information
     Get information about a specific scheduled price change for an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_in-app_purchase_price_schedule_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related manualPrices returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getInAppPurchasePriceScheduleV1(id: String,
                                                fields: [GetInAppPurchasePriceScheduleV1.Field]? = nil,
                                                includes: [GetInAppPurchasePriceScheduleV1.Include]? = nil,
                                                limit: Int? = nil) -> Request<InAppPurchasePriceScheduleResponse, ErrorResponse>
    {
        .init(path: "/v1/inAppPurchasePriceSchedules/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                             includes: includes,
                                                                                             limit: limit))
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

        public enum InAppPurchasePriceSchedules: String, ParameterValue, Codable, CaseIterable {
            case inAppPurchase
            case manualPrices
        }

        public enum InAppPurchasePrices: String, ParameterValue, Codable, CaseIterable {
            case inAppPurchasePricePoint
            case inAppPurchaseV2
            case startDate
            case territory
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case inAppPurchase
        case manualPrices
    }
}
