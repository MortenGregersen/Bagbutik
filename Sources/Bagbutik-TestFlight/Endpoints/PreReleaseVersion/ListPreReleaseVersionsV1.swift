import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List Prerelease Versions
     Get a list of prerelease versions for all apps.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-preReleaseVersions>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listPreReleaseVersionsV1(fields: [ListPreReleaseVersionsV1.Field]? = nil,
                                         filters: [ListPreReleaseVersionsV1.Filter]? = nil,
                                         includes: [ListPreReleaseVersionsV1.Include]? = nil,
                                         sorts: [ListPreReleaseVersionsV1.Sort]? = nil,
                                         limits: [ListPreReleaseVersionsV1.Limit]? = nil) -> Request<PreReleaseVersionsResponse, ErrorResponse> {
        .init(
            path: "/v1/preReleaseVersions",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                sorts: sorts,
                limits: limits))
    }
}

public enum ListPreReleaseVersionsV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type builds
        case builds([Builds])
        /// The fields to include for returned resources of type preReleaseVersions
        case preReleaseVersions([PreReleaseVersions])

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

        public enum Builds: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appEncryptionDeclaration
            case appStoreVersion
            case betaAppReviewSubmission
            case betaBuildLocalizations
            case betaGroups
            case buildAudienceType
            case buildBetaDetail
            case buildBundles
            case computedMinMacOsVersion
            case computedMinVisionOsVersion
            case diagnosticSignatures
            case expirationDate
            case expired
            case iconAssetToken
            case icons
            case individualTesters
            case lsMinimumSystemVersion
            case minOsVersion
            case perfPowerMetrics
            case preReleaseVersion
            case processingState
            case uploadedDate
            case usesNonExemptEncryption
            case version
        }

        public enum PreReleaseVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case builds
            case platform
            case version
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'app'
        case app([String])
        /// Filter by id(s) of related 'builds'
        case builds([String])
        /// Filter by attribute 'builds.buildAudienceType'
        case builds_buildAudienceType([BuildAudienceType])
        /// Filter by attribute 'builds.expired'
        case builds_expired([String])
        /// Filter by attribute 'builds.processingState'
        case builds_processingState([BuildsProcessingState])
        /// Filter by attribute 'builds.version'
        case builds_version([String])
        /// Filter by attribute 'platform'
        case platform([Platform])
        /// Filter by attribute 'version'
        case version([String])

        public enum BuildsProcessingState: String, Sendable, ParameterValue, Codable, CaseIterable {
            case failed = "FAILED"
            case invalid = "INVALID"
            case processing = "PROCESSING"
            case valid = "VALID"
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
        case builds
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case versionAscending = "version"
        case versionDescending = "-version"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related builds returned (when they are included) - maximum 50
        case builds(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}
