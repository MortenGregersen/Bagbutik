import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Review Screenshot Information for an In-App Purchase
     Get information about a review screenshot for a specific in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_review_screenshot_information_for_an_in-app_purchase>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppStoreReviewScreenshotForInAppPurchasesV2V2(id: String,
                                                                 fields: [GetAppStoreReviewScreenshotForInAppPurchasesV2V2.Field]? = nil,
                                                                 includes: [GetAppStoreReviewScreenshotForInAppPurchasesV2V2.Include]? = nil) -> Request<InAppPurchaseAppStoreReviewScreenshotResponse, ErrorResponse>
    {
        .init(path: "/v2/inAppPurchases/\(id)/appStoreReviewScreenshot", method: .get, parameters: .init(fields: fields,
                                                                                                         includes: includes))
    }
}

public enum GetAppStoreReviewScreenshotForInAppPurchasesV2V2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseAppStoreReviewScreenshots
        case inAppPurchaseAppStoreReviewScreenshots([InAppPurchaseAppStoreReviewScreenshots])
        /// The fields to include for returned resources of type inAppPurchases
        case inAppPurchases([InAppPurchases])

        public enum InAppPurchaseAppStoreReviewScreenshots: String, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case assetToken
            case assetType
            case fileName
            case fileSize
            case imageAsset
            case inAppPurchaseV2
            case sourceFileChecksum
            case uploadOperations
            case uploaded
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
