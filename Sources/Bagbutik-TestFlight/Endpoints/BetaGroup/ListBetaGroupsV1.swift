import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List Beta Groups
     Find and list beta groups for all apps.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-betaGroups>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBetaGroupsV1(fields: [ListBetaGroupsV1.Field]? = nil,
                                 filters: [ListBetaGroupsV1.Filter]? = nil,
                                 includes: [ListBetaGroupsV1.Include]? = nil,
                                 sorts: [ListBetaGroupsV1.Sort]? = nil,
                                 limits: [ListBetaGroupsV1.Limit]? = nil) -> Request<BetaGroupsResponse, ErrorResponse>
    {
        .init(path: "/v1/betaGroups", method: .get, parameters: .init(fields: fields,
                                                                      filters: filters,
                                                                      includes: includes,
                                                                      sorts: sorts,
                                                                      limits: limits))
    }
}

public enum ListBetaGroupsV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type betaGroups
        case betaGroups([BetaGroups])
        /// The fields to include for returned resources of type betaTesters
        case betaTesters([BetaTesters])
        /// The fields to include for returned resources of type builds
        case builds([Builds])

        public enum Apps: String, Sendable, ParameterValue, Codable, CaseIterable {
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
            case betaAppLocalizations
            case betaAppReviewDetail
            case betaGroups
            case betaLicenseAgreement
            case betaTesters
            case builds
            case bundleId
            case ciProduct
            case contentRightsDeclaration
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
        }

        public enum BetaGroups: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case betaTesters
            case builds
            case createdDate
            case feedbackEnabled
            case hasAccessToAllBuilds
            case iosBuildsAvailableForAppleSiliconMac
            case isInternalGroup
            case name
            case publicLink
            case publicLinkEnabled
            case publicLinkId
            case publicLinkLimit
            case publicLinkLimitEnabled
        }

        public enum BetaTesters: String, Sendable, ParameterValue, Codable, CaseIterable {
            case apps
            case betaGroups
            case builds
            case email
            case firstName
            case inviteType
            case lastName
            case state
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
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'app'
        case app([String])
        /// Filter by id(s) of related 'builds'
        case builds([String])
        /// Filter by id(s)
        case id([String])
        /// Filter by attribute 'isInternalGroup'
        case isInternalGroup([String])
        /// Filter by attribute 'name'
        case name([String])
        /// Filter by attribute 'publicLink'
        case publicLink([String])
        /// Filter by attribute 'publicLinkEnabled'
        case publicLinkEnabled([String])
        /// Filter by attribute 'publicLinkLimitEnabled'
        case publicLinkLimitEnabled([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
        case betaTesters
        case builds
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case createdDateAscending = "createdDate"
        case createdDateDescending = "-createdDate"
        case nameAscending = "name"
        case nameDescending = "-name"
        case publicLinkEnabledAscending = "publicLinkEnabled"
        case publicLinkEnabledDescending = "-publicLinkEnabled"
        case publicLinkLimitAscending = "publicLinkLimit"
        case publicLinkLimitDescending = "-publicLinkLimit"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related betaTesters returned (when they are included) - maximum 50
        case betaTesters(Int)
        /// Maximum number of related builds returned (when they are included) - maximum 1000
        case builds(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}
