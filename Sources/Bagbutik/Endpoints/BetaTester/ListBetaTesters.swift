public extension Request {
    /**
      # List Beta Testers
      Find and list beta testers for all apps, builds, and beta groups.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_beta_testers>

      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter sorts: Attributes by which to sort
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listBetaTesters(fields: [ListBetaTesters.Field]? = nil,
                                filters: [ListBetaTesters.Filter]? = nil,
                                includes: [ListBetaTesters.Include]? = nil,
                                sorts: [ListBetaTesters.Sort]? = nil,
                                limits: [ListBetaTesters.Limit]? = nil) -> Request<BetaTestersResponse, ErrorResponse>
    {
        return .init(path: "/v1/betaTesters", method: .get, parameters: .init(fields: fields,
                                                                              filters: filters,
                                                                              includes: includes,
                                                                              sorts: sorts,
                                                                              limits: limits))
    }
}

public enum ListBetaTesters {
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
        /// Filter by id(s) of related 'apps'
        case apps([String])
        /// Filter by id(s) of related 'betaGroups'
        case betaGroups([String])
        /// Filter by id(s) of related 'builds'
        case builds([String])
        /// Filter by attribute 'email'
        case email([String])
        /// Filter by attribute 'firstName'
        case firstName([String])
        /// Filter by id(s)
        case id([String])
        /// Filter by attribute 'inviteType'
        case inviteType([InviteType])
        /// Filter by attribute 'lastName'
        case lastName([String])

        public enum InviteType: String, ParameterValue, CaseIterable {
            case email = "EMAIL"
            case publicLink = "PUBLIC_LINK"
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case apps, betaGroups, builds
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter {
        case emailAscending = "email"
        case emailDescending = "-email"
        case firstNameAscending = "firstName"
        case firstNameDescending = "-firstName"
        case inviteTypeAscending = "inviteType"
        case inviteTypeDescending = "-inviteType"
        case lastNameAscending = "lastName"
        case lastNameDescending = "-lastName"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related apps returned (when they are included) - maximum 50
        case apps(Int)
        /// Maximum number of related betaGroups returned (when they are included) - maximum 50
        case betaGroups(Int)
        /// Maximum number of related builds returned (when they are included) - maximum 50
        case builds(Int)
    }
}
