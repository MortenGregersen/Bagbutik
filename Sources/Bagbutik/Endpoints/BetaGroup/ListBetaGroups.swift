public extension Request {
    /**
      # List Beta Groups
      Find and list beta groups for all apps.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_beta_groups>

      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter sorts: Attributes by which to sort
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listBetaGroups(fields: [ListBetaGroups.Field]? = nil,
                               filters: [ListBetaGroups.Filter]? = nil,
                               includes: [ListBetaGroups.Include]? = nil,
                               sorts: [ListBetaGroups.Sort]? = nil,
                               limits: [ListBetaGroups.Limit]? = nil) -> Request<BetaGroupsResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaGroups", method: .get, parameters: .init(fields: fields,
                                                                             filters: filters,
                                                                             includes: includes,
                                                                             sorts: sorts,
                                                                             limits: limits))
    }
}

public enum ListBetaGroups {
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

        public enum Apps: String, ParameterValue, CaseIterable {
            case appClips
            case appCustomProductPages
            case appEvents
            case appInfos
            case appStoreVersions
            case availableInNewTerritories
            case availableTerritories
            case betaAppLocalizations
            case betaAppReviewDetail
            case betaGroups
            case betaLicenseAgreement
            case betaTesters
            case builds
            case bundleId
            case ciProduct
            case contentRightsDeclaration
            case endUserLicenseAgreement
            case gameCenterEnabledVersions
            case inAppPurchases
            case isOrEverWasMadeForKids
            case name
            case perfPowerMetrics
            case preOrder
            case preReleaseVersions
            case prices
            case primaryLocale
            case reviewSubmissions
            case sku
            case subscriptionStatusUrl
            case subscriptionStatusUrlForSandbox
            case subscriptionStatusUrlVersion
            case subscriptionStatusUrlVersionForSandbox
        }

        public enum BetaGroups: String, ParameterValue, CaseIterable {
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

        public enum BetaTesters: String, ParameterValue, CaseIterable {
            case apps
            case betaGroups
            case builds
            case email
            case firstName
            case inviteType
            case lastName
        }

        public enum Builds: String, ParameterValue, CaseIterable {
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
    public enum Include: String, IncludeParameter {
        case app, betaTesters, builds
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter {
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
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related betaTesters returned (when they are included) - maximum 50
        case betaTesters(Int)
        /// Maximum number of related builds returned (when they are included) - maximum 1000
        case builds(Int)
    }
}
