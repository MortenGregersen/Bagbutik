import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List Bundle IDs
     Find and list bundle IDs that are registered to your team.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-bundleIds>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBundleIdsV1(fields: [ListBundleIdsV1.Field]? = nil,
                                filters: [ListBundleIdsV1.Filter]? = nil,
                                includes: [ListBundleIdsV1.Include]? = nil,
                                sorts: [ListBundleIdsV1.Sort]? = nil,
                                limits: [ListBundleIdsV1.Limit]? = nil) -> Request<BundleIdsResponse, ErrorResponse> {
        .init(
            path: "/v1/bundleIds",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                sorts: sorts,
                limits: limits))
    }
}

public enum ListBundleIdsV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type bundleIdCapabilities
        case bundleIdCapabilities([BundleIdCapabilities])
        /// The fields to include for returned resources of type bundleIds
        case bundleIds([BundleIds])
        /// The fields to include for returned resources of type profiles
        case profiles([Profiles])

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

        public enum BundleIdCapabilities: String, Sendable, ParameterValue, Codable, CaseIterable {
            case capabilityType
            case settings
        }

        public enum BundleIds: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case bundleIdCapabilities
            case identifier
            case name
            case platform
            case profiles
            case seedId
        }

        public enum Profiles: String, Sendable, ParameterValue, Codable, CaseIterable {
            case bundleId
            case certificates
            case createdDate
            case devices
            case expirationDate
            case name
            case platform
            case profileContent
            case profileState
            case profileType
            case uuid
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s)
        case id([String])
        /// Filter by attribute 'identifier'
        case identifier([String])
        /// Filter by attribute 'name'
        case name([String])
        /// Filter by attribute 'platform'
        case platform([BundleIdPlatform])
        /// Filter by attribute 'seedId'
        case seedId([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
        case bundleIdCapabilities
        case profiles
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case idAscending = "id"
        case idDescending = "-id"
        case identifierAscending = "identifier"
        case identifierDescending = "-identifier"
        case nameAscending = "name"
        case nameDescending = "-name"
        case platformAscending = "platform"
        case platformDescending = "-platform"
        case seedIdAscending = "seedId"
        case seedIdDescending = "-seedId"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related bundleIdCapabilities returned (when they are included) - maximum 50
        case bundleIdCapabilities(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related profiles returned (when they are included) - maximum 50
        case profiles(Int)
    }
}
