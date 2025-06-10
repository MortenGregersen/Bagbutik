import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List subscription images
     List all images for a specific subscription.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-subscriptions-_id_-images>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listImagesForSubscriptionV1(id: String,
                                            fields: [ListImagesForSubscriptionV1.Field]? = nil,
                                            includes: [ListImagesForSubscriptionV1.Include]? = nil,
                                            limit: Int? = nil) -> Request<SubscriptionImagesResponse, ErrorResponse> {
        .init(
            path: "/v1/subscriptions/\(id)/images",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limit: limit))
    }
}

public enum ListImagesForSubscriptionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type subscriptionImages
        case subscriptionImages([SubscriptionImages])
        /// The fields to include for returned resources of type subscriptions
        case subscriptions([Subscriptions])

        public enum SubscriptionImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetToken
            case fileName
            case fileSize
            case imageAsset
            case sourceFileChecksum
            case state
            case subscription
            case uploadOperations
        }

        public enum Subscriptions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreReviewScreenshot
            case familySharable
            case group
            case groupLevel
            case images
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
            case subscriptionAvailability
            case subscriptionLocalizations
            case subscriptionPeriod
            case winBackOffers
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case subscription
    }
}
