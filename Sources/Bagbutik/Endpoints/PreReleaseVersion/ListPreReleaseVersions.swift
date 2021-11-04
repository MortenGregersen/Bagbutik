public extension Request {
    /**
      # List Prerelease Versions
      Get a list of prerelease versions for all apps.

      Full documentation:
      <https://developer.apple.com/documentation/appstoreconnectapi/list_prerelease_versions>

      - Parameter fields: Fields to return for included related types
      - Parameter filters: Attributes, relationships, and IDs by which to filter
      - Parameter includes: Relationship data to include in the response
      - Parameter sorts: Attributes by which to sort
      - Parameter limits: Number of resources to return
      - Returns: A `Request` with to send to an instance of `BagbutikService`
     */
    static func listPreReleaseVersions(fields: [ListPreReleaseVersions.Field]? = nil,
                                       filters: [ListPreReleaseVersions.Filter]? = nil,
                                       includes: [ListPreReleaseVersions.Include]? = nil,
                                       sorts: [ListPreReleaseVersions.Sort]? = nil,
                                       limits: [ListPreReleaseVersions.Limit]? = nil) -> Request<PreReleaseVersionsResponse, ErrorResponse>
    {
        return .init(path: "/v1/preReleaseVersions", method: .get, parameters: .init(fields: fields,
                                                                                     filters: filters,
                                                                                     includes: includes,
                                                                                     sorts: sorts,
                                                                                     limits: limits))
    }
}

public enum ListPreReleaseVersions {
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

        public enum Apps: String, ParameterValue, CaseIterable {
            case appClips
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
            case sku
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

        public enum PreReleaseVersions: String, ParameterValue, CaseIterable {
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

        public enum BuildsProcessingState: String, ParameterValue, CaseIterable {
            case processing = "PROCESSING"
            case failed = "FAILED"
            case invalid = "INVALID"
            case valid = "VALID"
        }

        /// Strings that represent Apple operating systems.
        public enum Platform: String, ParameterValue, CaseIterable {
            /// A string that represents iOS.
            case iOS = "IOS"
            /// A string that represents macOS.
            case macOS = "MAC_OS"
            /// A string that represents tvOS.
            case tvOS = "TV_OS"
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter {
        case app, builds
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter {
        case versionAscending = "version"
        case versionDescending = "-version"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related builds returned (when they are included) - maximum 50
        case builds(Int)
    }
}
