public extension Request {
    /**
      # No overview available

      - Parameter id: The id of the requested resource
      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter sorts: Attributes by which to sort
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listInAppPurchasesV2ForAppV1(id: String,
                                             fields: [ListInAppPurchasesV2ForAppV1.Field]? = nil,
                                             filters: [ListInAppPurchasesV2ForAppV1.Filter]? = nil,
                                             includes: [ListInAppPurchasesV2ForAppV1.Include]? = nil,
                                             sorts: [ListInAppPurchasesV2ForAppV1.Sort]? = nil,
                                             limits: [ListInAppPurchasesV2ForAppV1.Limit]? = nil) -> Request<InAppPurchasesV2Response, ErrorResponse>
    {
        return .init(path: "/v1/apps/\(id)/inAppPurchasesV2", method: .get, parameters: .init(fields: fields,
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
        /// The fields to include for returned resources of type inAppPurchaseContents
        case inAppPurchaseContents([InAppPurchaseContents])
        /// The fields to include for returned resources of type inAppPurchaseLocalizations
        case inAppPurchaseLocalizations([InAppPurchaseLocalizations])
        /// The fields to include for returned resources of type inAppPurchasePricePoints
        case inAppPurchasePricePoints([InAppPurchasePricePoints])
        /// The fields to include for returned resources of type inAppPurchasePriceSchedules
        case inAppPurchasePriceSchedules([InAppPurchasePriceSchedules])
        /// The fields to include for returned resources of type inAppPurchases
        case inAppPurchases([InAppPurchases])
        /// The fields to include for returned resources of type promotedPurchases
        case promotedPurchases([PromotedPurchases])

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

        public enum InAppPurchaseContents: String, ParameterValue, CaseIterable {
            case fileName
            case fileSize
            case inAppPurchaseV2
            case lastModifiedDate
            case url
        }

        public enum InAppPurchaseLocalizations: String, ParameterValue, CaseIterable {
            case description
            case inAppPurchaseV2
            case locale
            case name
            case state
        }

        public enum InAppPurchasePricePoints: String, ParameterValue, CaseIterable {
            case customerPrice
            case inAppPurchaseV2
            case priceTier
            case proceeds
            case territory
        }

        public enum InAppPurchasePriceSchedules: String, ParameterValue, CaseIterable {
            case inAppPurchase
            case manualPrices
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

        public enum PromotedPurchases: String, ParameterValue, CaseIterable {
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
        case state([State])

        public enum InAppPurchaseType: String, ParameterValue, CaseIterable {
            case consumable = "CONSUMABLE"
            case nonConsumable = "NON_CONSUMABLE"
            case nonRenewingSubscription = "NON_RENEWING_SUBSCRIPTION"
        }

        public enum State: String, ParameterValue, CaseIterable {
            case missingMetadata = "MISSING_METADATA"
            case waitingForUpload = "WAITING_FOR_UPLOAD"
            case processingContent = "PROCESSING_CONTENT"
            case readyToSubmit = "READY_TO_SUBMIT"
            case waitingForReview = "WAITING_FOR_REVIEW"
            case inReview = "IN_REVIEW"
            case developerActionNeeded = "DEVELOPER_ACTION_NEEDED"
            case pendingBinaryApproval = "PENDING_BINARY_APPROVAL"
            case approved = "APPROVED"
            case developerRemovedFromSale = "DEVELOPER_REMOVED_FROM_SALE"
            case removedFromSale = "REMOVED_FROM_SALE"
            case rejected = "REJECTED"
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case appStoreReviewScreenshot, content, iapPriceSchedule, inAppPurchaseLocalizations, pricePoints, promotedPurchase
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter {
        case inAppPurchaseTypeAscending = "inAppPurchaseType"
        case inAppPurchaseTypeDescending = "-inAppPurchaseType"
        case nameAscending = "name"
        case nameDescending = "-name"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related inAppPurchaseLocalizations returned (when they are included) - maximum 50
        case inAppPurchaseLocalizations(Int)
        /// Maximum number of related pricePoints returned (when they are included) - maximum 40000
        case pricePoints(Int)
    }
}
