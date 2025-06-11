import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Xcode Cloud Products
     Get a list of all products you created in Xcode Cloud.

     The example request below lists ten Xcode Cloud products and sorts the list using the `latestBuildCreatedDate` attribute. Use the information provided in the response to display data about your Xcode Cloud products on a dashboard or to read additional information; for example, workflow information.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciProducts>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listCiProductsV1(fields: [ListCiProductsV1.Field]? = nil,
                                 filters: [ListCiProductsV1.Filter]? = nil,
                                 includes: [ListCiProductsV1.Include]? = nil,
                                 limits: [ListCiProductsV1.Limit]? = nil) -> Request<CiProductsResponse, ErrorResponse> {
        .init(
            path: "/v1/ciProducts",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limits: limits))
    }
}

public enum ListCiProductsV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type ciProducts
        case ciProducts([CiProducts])
        /// The fields to include for returned resources of type scmRepositories
        case scmRepositories([ScmRepositories])

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

        public enum CiProducts: String, Sendable, ParameterValue, Codable, CaseIterable {
            case additionalRepositories
            case app
            case buildRuns
            case bundleId
            case createdDate
            case name
            case primaryRepositories
            case productType
            case workflows
        }

        public enum ScmRepositories: String, Sendable, ParameterValue, Codable, CaseIterable {
            case defaultBranch
            case gitReferences
            case httpCloneUrl
            case lastAccessedDate
            case ownerName
            case pullRequests
            case repositoryName
            case scmProvider
            case sshCloneUrl
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'app'
        case app([String])
        /// Filter by attribute 'productType'
        case productType([CiProduct.Attributes.ProductType])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case additionalRepositories
        case app
        case buildRuns
        case bundleId
        case primaryRepositories
        case workflows
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related primaryRepositories returned (when they are included) - maximum 50
        case primaryRepositories(Int)
    }
}
