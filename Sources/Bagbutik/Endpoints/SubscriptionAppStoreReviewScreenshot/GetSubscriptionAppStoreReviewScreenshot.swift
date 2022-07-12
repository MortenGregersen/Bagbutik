public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter includes: Relationship data to include in the response
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func getSubscriptionAppStoreReviewScreenshot(id: String,
                                                        fields: [GetSubscriptionAppStoreReviewScreenshot.Field]? = nil,
                                                        includes: [GetSubscriptionAppStoreReviewScreenshot.Include]? = nil) -> Request<SubscriptionAppStoreReviewScreenshotResponse, ErrorResponse>
    {
        return .init(path: "/v1/subscriptionAppStoreReviewScreenshots/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                              includes: includes))
    }
}

public enum GetSubscriptionAppStoreReviewScreenshot {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionAppStoreReviewScreenshots
        case subscriptionAppStoreReviewScreenshots([SubscriptionAppStoreReviewScreenshots])

        public enum SubscriptionAppStoreReviewScreenshots: String, ParameterValue, CaseIterable {
            case assetDeliveryState
            case assetToken
            case assetType
            case fileName
            case fileSize
            case imageAsset
            case sourceFileChecksum
            case subscription
            case uploadOperations
            case uploaded
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case subscription
    }
}
