import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All In-App Purchases for an App
     Get a list of the in-app purchases for a specific app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-inAppPurchasesV2>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listInAppPurchasesV2ForAppV1(id: String,
                                             fields: [ListInAppPurchasesV2ForAppV1.Field]? = nil,
                                             filters: [ListInAppPurchasesV2ForAppV1.Filter]? = nil,
                                             includes: [ListInAppPurchasesV2ForAppV1.Include]? = nil,
                                             sorts: [ListInAppPurchasesV2ForAppV1.Sort]? = nil,
                                             limits: [ListInAppPurchasesV2ForAppV1.Limit]? = nil) -> Request<InAppPurchasesV2Response, ErrorResponse>
    {
        .init(path: "/v1/apps/\(id)/inAppPurchasesV2", method: .get, parameters: .init(fields: fields,
                                                                                       filters: filters,
                                                                                       includes: includes,
                                                                                       sorts: sorts,
                                                                                       limits: limits))
    }
}

public enum ListInAppPurchasesV2ForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type inAppPurchaseAppStoreReviewScreenshots
        case inAppPurchaseAppStoreReviewScreenshots([InAppPurchaseAppStoreReviewScreenshots])
        /// The fields to include for returned resources of type inAppPurchaseAvailabilities
        case inAppPurchaseAvailabilities([InAppPurchaseAvailabilities])
        /// The fields to include for returned resources of type inAppPurchaseContents
        case inAppPurchaseContents([InAppPurchaseContents])
        /// The fields to include for returned resources of type inAppPurchaseImages
        case inAppPurchaseImages([InAppPurchaseImages])
        /// The fields to include for returned resources of type inAppPurchaseLocalizations
        case inAppPurchaseLocalizations([InAppPurchaseLocalizations])
        /// The fields to include for returned resources of type inAppPurchasePriceSchedules
        case inAppPurchasePriceSchedules([InAppPurchasePriceSchedules])
        /// The fields to include for returned resources of type inAppPurchases
        case inAppPurchases([InAppPurchases])
        /// The fields to include for returned resources of type promotedPurchases
        case promotedPurchases([PromotedPurchases])

        public enum InAppPurchaseAppStoreReviewScreenshots: String, Sendable, ParameterValue, Codable, CaseIterable {
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

        public enum InAppPurchaseAvailabilities: String, Sendable, ParameterValue, Codable, CaseIterable {
            case availableInNewTerritories
            case availableTerritories
            case inAppPurchase
        }

        public enum InAppPurchaseContents: String, Sendable, ParameterValue, Codable, CaseIterable {
            case fileName
            case fileSize
            case inAppPurchaseV2
            case lastModifiedDate
            case url
        }

        public enum InAppPurchaseImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetToken
            case fileName
            case fileSize
            case imageAsset
            case inAppPurchase
            case sourceFileChecksum
            case state
            case uploadOperations
            case uploaded
        }

        public enum InAppPurchaseLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case description
            case inAppPurchaseV2
            case locale
            case name
            case state
        }

        public enum InAppPurchasePriceSchedules: String, Sendable, ParameterValue, Codable, CaseIterable {
            case automaticPrices
            case baseTerritory
            case inAppPurchase
            case manualPrices
        }

        public enum InAppPurchases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appStoreReviewScreenshot
            case content
            case contentHosting
            case familySharable
            case iapPriceSchedule
            case images
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

        public enum PromotedPurchases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case enabled
            case inAppPurchaseV2
            case promotionImages
            case state
            case subscription
            case visibleForAllUsers
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'inAppPurchaseType'
        case inAppPurchaseType([InAppPurchaseType])
        /// Filter by attribute 'name'
        case name([String])
        /// Filter by attribute 'productId'
        case productId([String])
        /// Filter by attribute 'state'
        case state([InAppPurchaseState])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appStoreReviewScreenshot
        case content
        case iapPriceSchedule
        case images
        case inAppPurchaseAvailability
        case inAppPurchaseLocalizations
        case pricePoints
        case promotedPurchase
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case inAppPurchaseTypeAscending = "inAppPurchaseType"
        case inAppPurchaseTypeDescending = "-inAppPurchaseType"
        case nameAscending = "name"
        case nameDescending = "-name"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related images returned (when they are included) - maximum 50
        case images(Int)
        /// Maximum number of related inAppPurchaseLocalizations returned (when they are included) - maximum 50
        case inAppPurchaseLocalizations(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}
