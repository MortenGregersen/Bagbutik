public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getAppStoreReviewScreenshotForInAppPurchaseV2(id: String,
                                                              fields: [GetAppStoreReviewScreenshotForInAppPurchaseV2.Field]? = nil,
                                                              includes: [GetAppStoreReviewScreenshotForInAppPurchaseV2.Include]? = nil) -> Request<InAppPurchaseAppStoreReviewScreenshotResponse, ErrorResponse>
    {
        return .init(path: "/v2/inAppPurchases/\(id)/appStoreReviewScreenshot", method: .get, parameters: .init(fields: fields,
                                                                                                                includes: includes))
    }
}

public enum GetAppStoreReviewScreenshotForInAppPurchaseV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseAppStoreReviewScreenshots
        case inAppPurchaseAppStoreReviewScreenshots([InAppPurchaseAppStoreReviewScreenshots])
        /// The fields to include for returned resources of type inAppPurchases
        case inAppPurchases([InAppPurchases])

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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case inAppPurchaseV2
    }
}
