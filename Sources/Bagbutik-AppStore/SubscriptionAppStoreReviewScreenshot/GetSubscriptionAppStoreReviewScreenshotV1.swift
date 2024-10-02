import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Subscription Review Screenshot Information
     Get the information about a review screenshot for an auto-renewable subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptionAppStoreReviewScreenshots-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getSubscriptionAppStoreReviewScreenshotV1(id: String,
                                                          fields: [GetSubscriptionAppStoreReviewScreenshotV1.Field]? = nil,
                                                          includes: [GetSubscriptionAppStoreReviewScreenshotV1.Include]? = nil) -> Request<SubscriptionAppStoreReviewScreenshotResponse, ErrorResponse>
    {
        .init(path: "/v1/subscriptionAppStoreReviewScreenshots/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                       includes: includes))
    }
}

public enum GetSubscriptionAppStoreReviewScreenshotV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionAppStoreReviewScreenshots
        case subscriptionAppStoreReviewScreenshots([SubscriptionAppStoreReviewScreenshots])

        public enum SubscriptionAppStoreReviewScreenshots: String, Sendable, ParameterValue, Codable, CaseIterable {
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
    public enum Include: String, IncludeParameter, CaseIterable {
        case subscription
    }
}
