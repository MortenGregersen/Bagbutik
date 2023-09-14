import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Content Information for an In-App Purchase
     Get the details about hosted content for an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_content_information_for_an_in-app_purchase>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getContentForInAppPurchasesV2V2(id: String,
                                                fields: [GetContentForInAppPurchasesV2V2.Field]? = nil,
                                                includes: [GetContentForInAppPurchasesV2V2.Include]? = nil) -> Request<InAppPurchaseContentResponse, ErrorResponse>
    {
        .init(path: "/v2/inAppPurchases/\(id)/content", method: .get, parameters: .init(fields: fields,
                                                                                        includes: includes))
    }
}

public enum GetContentForInAppPurchasesV2V2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseContents
        case inAppPurchaseContents([InAppPurchaseContents])
        /// The fields to include for returned resources of type inAppPurchases
        case inAppPurchases([InAppPurchases])

        public enum InAppPurchaseContents: String, ParameterValue, Codable, CaseIterable {
            case fileName
            case fileSize
            case inAppPurchaseV2
            case lastModifiedDate
            case url
        }

        public enum InAppPurchases: String, ParameterValue, Codable, CaseIterable {
            case app
            case appStoreReviewScreenshot
            case availableInAllTerritories
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
