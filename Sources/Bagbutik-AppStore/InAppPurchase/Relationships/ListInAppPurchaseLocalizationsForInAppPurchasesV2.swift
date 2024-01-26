import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Localizations for an In-App Purchase
     Get a list of localized display names and descriptions for a specific in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_localizations_for_an_in-app_purchase>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listInAppPurchaseLocalizationsForInAppPurchasesV2(id: String,
                                                                  fields: [ListInAppPurchaseLocalizationsForInAppPurchasesV2.Field]? = nil,
                                                                  includes: [ListInAppPurchaseLocalizationsForInAppPurchasesV2.Include]? = nil,
                                                                  limit: Int? = nil) -> Request<InAppPurchaseLocalizationsResponse, ErrorResponse>
    {
        .init(path: "/v2/inAppPurchases/\(id)/inAppPurchaseLocalizations", method: .get, parameters: .init(fields: fields,
                                                                                                           includes: includes,
                                                                                                           limit: limit))
    }
}

public enum ListInAppPurchaseLocalizationsForInAppPurchasesV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseLocalizations
        case inAppPurchaseLocalizations([InAppPurchaseLocalizations])
        /// The fields to include for returned resources of type inAppPurchases
        case inAppPurchases([InAppPurchases])

        public enum InAppPurchaseLocalizations: String, ParameterValue, Codable, CaseIterable {
            case description
            case inAppPurchaseV2
            case locale
            case name
            case state
        }

        public enum InAppPurchases: String, ParameterValue, Codable, CaseIterable {
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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case inAppPurchaseV2
    }
}
