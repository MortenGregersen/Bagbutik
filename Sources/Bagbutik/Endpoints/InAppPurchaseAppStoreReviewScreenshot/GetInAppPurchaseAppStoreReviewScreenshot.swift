public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getInAppPurchaseAppStoreReviewScreenshot(id: String,
                                                         fields: [GetInAppPurchaseAppStoreReviewScreenshot.Field]? = nil,
                                                         includes: [GetInAppPurchaseAppStoreReviewScreenshot.Include]? = nil) -> Request<InAppPurchaseAppStoreReviewScreenshotResponse, ErrorResponse>
    {
        return .init(path: "/v1/inAppPurchaseAppStoreReviewScreenshots/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                               includes: includes))
    }
}

public enum GetInAppPurchaseAppStoreReviewScreenshot {
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
