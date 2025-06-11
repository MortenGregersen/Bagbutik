import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All In-App Purchases for an App V1
     List the in-app purchases that are available for your app.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-apps-_id_-inAppPurchases>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
    static func listInAppPurchasesForAppV1(id: String,
                                           fields: [ListInAppPurchasesForAppV1.Field]? = nil,
                                           filters: [ListInAppPurchasesForAppV1.Filter]? = nil,
                                           includes: [ListInAppPurchasesForAppV1.Include]? = nil,
                                           sorts: [ListInAppPurchasesForAppV1.Sort]? = nil,
                                           limits: [ListInAppPurchasesForAppV1.Limit]? = nil) -> Request<InAppPurchasesResponse, ErrorResponse> {
        .init(
            path: "/v1/apps/\(id)/inAppPurchases",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                sorts: sorts,
                limits: limits))
    }
}

public enum ListInAppPurchasesForAppV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type inAppPurchases
        case inAppPurchases([InAppPurchases])

        public enum Apps: String, Sendable, ParameterValue, Codable, CaseIterable {
            case accessibilityDeclarations
            case accessibilityUrl
            case alternativeDistributionKey
            case analyticsReportRequests
            case appAvailabilityV2
            case appClips
            case appCustomProductPages
            case appEncryptionDeclarations
            case appEvents
            case appInfos
            case appPricePoints
            case appPriceSchedule
            case appStoreVersionExperimentsV2
            case appStoreVersions
            case backgroundAssets
            case betaAppLocalizations
            case betaAppReviewDetail
            case betaFeedbackCrashSubmissions
            case betaFeedbackScreenshotSubmissions
            case betaGroups
            case betaLicenseAgreement
            case betaTesters
            case builds
            case bundleId
            case ciProduct
            case contentRightsDeclaration
            case customerReviewSummarizations
            case customerReviews
            case endUserLicenseAgreement
            case gameCenterDetail
            case gameCenterEnabledVersions
            case inAppPurchases
            case inAppPurchasesV2
            case isOrEverWasMadeForKids
            case marketplaceSearchDetail
            case name
            case perfPowerMetrics
            case preReleaseVersions
            case primaryLocale
            case promotedPurchases
            case reviewSubmissions
            case sku
            case streamlinedPurchasingEnabled
            case subscriptionGracePeriod
            case subscriptionGroups
            case subscriptionStatusUrl
            case subscriptionStatusUrlForSandbox
            case subscriptionStatusUrlVersion
            case subscriptionStatusUrlVersionForSandbox
            case webhooks
        }

        public enum InAppPurchases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case apps
            case inAppPurchaseType
            case productId
            case referenceName
            case state
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by canBeSubmitted
        case canBeSubmitted([String])
        /// Filter by attribute 'inAppPurchaseType'
        case inAppPurchaseType([InAppPurchaseType])

        public enum InAppPurchaseType: String, Sendable, ParameterValue, Codable, CaseIterable {
            case automaticallyRenewableSubscription = "AUTOMATICALLY_RENEWABLE_SUBSCRIPTION"
            case consumable = "CONSUMABLE"
            case freeSubscription = "FREE_SUBSCRIPTION"
            case nonConsumable = "NON_CONSUMABLE"
            case nonRenewingSubscription = "NON_RENEWING_SUBSCRIPTION"
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case apps
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case inAppPurchaseTypeAscending = "inAppPurchaseType"
        case inAppPurchaseTypeDescending = "-inAppPurchaseType"
        case productIdAscending = "productId"
        case productIdDescending = "-productId"
        case referenceNameAscending = "referenceName"
        case referenceNameDescending = "-referenceName"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related apps returned (when they are included) - maximum 50
        case apps(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}
