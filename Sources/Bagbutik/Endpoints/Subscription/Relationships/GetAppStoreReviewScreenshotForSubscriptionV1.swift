public extension Request {
    /**
     # Read Review Screenshot Information for a Subscription
     Get information about review screenshot for a specific auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_review_screenshot_information_for_a_subscription>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppStoreReviewScreenshotForSubscriptionV1(id: String,
                                                             fields: [GetAppStoreReviewScreenshotForSubscriptionV1.Field]? = nil,
                                                             includes: [GetAppStoreReviewScreenshotForSubscriptionV1.Include]? = nil) -> Request<SubscriptionAppStoreReviewScreenshotResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptions/\(id)/appStoreReviewScreenshot", method: .get, parameters: .init(fields: fields,
                                                                                                        includes: includes))
    }
}

public enum GetAppStoreReviewScreenshotForSubscriptionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionAppStoreReviewScreenshots
        case subscriptionAppStoreReviewScreenshots([SubscriptionAppStoreReviewScreenshots])
        /// The fields to include for returned resources of type subscriptions
        case subscriptions([Subscriptions])

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

        public enum Subscriptions: String, ParameterValue, CaseIterable {
            case appStoreReviewScreenshot
            case availableInAllTerritories
            case familySharable
            case group
            case groupLevel
            case introductoryOffers
            case name
            case offerCodes
            case pricePoints
            case prices
            case productId
            case promotedPurchase
            case promotionalOffers
            case reviewNote
            case state
            case subscriptionLocalizations
            case subscriptionPeriod
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case subscription
    }
}
