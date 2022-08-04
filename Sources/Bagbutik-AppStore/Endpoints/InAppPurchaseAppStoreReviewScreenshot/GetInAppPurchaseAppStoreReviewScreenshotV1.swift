import Bagbutik_Core

public extension Request {
    /**
     # Read In-App Purchase Review Screenshot Information
     Get information about a specific review screenshot for an in-app purchase.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_in-app_purchase_review_screenshot_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getInAppPurchaseAppStoreReviewScreenshotV1(id: String,
                                                           fields: [GetInAppPurchaseAppStoreReviewScreenshotV1.Field]? = nil,
                                                           includes: [GetInAppPurchaseAppStoreReviewScreenshotV1.Include]? = nil) -> Request<InAppPurchaseAppStoreReviewScreenshotResponse, ErrorResponse>
    {
        .init(path: "/v1/inAppPurchaseAppStoreReviewScreenshots/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                        includes: includes))
    }
}

public enum GetInAppPurchaseAppStoreReviewScreenshotV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseAppStoreReviewScreenshots
        case inAppPurchaseAppStoreReviewScreenshots([InAppPurchaseAppStoreReviewScreenshots])

        public enum InAppPurchaseAppStoreReviewScreenshots: String, ParameterValue, CaseIterable {
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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case inAppPurchaseV2
    }
}
