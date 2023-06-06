import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List All Builds Xcode Cloud Created in App Store Connect
     List All App Store Connect and TestFlight Builds when it performed a build.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_builds_xcode_cloud_created_in_app_store_connect>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listBuildsForCiBuildRunV1(id: String,
                                          fields: [ListBuildsForCiBuildRunV1.Field]? = nil,
                                          filters: [ListBuildsForCiBuildRunV1.Filter]? = nil,
                                          includes: [ListBuildsForCiBuildRunV1.Include]? = nil,
                                          sorts: [ListBuildsForCiBuildRunV1.Sort]? = nil,
                                          limits: [ListBuildsForCiBuildRunV1.Limit]? = nil) -> Request<BuildsResponse, ErrorResponse>
    {
        .init(path: "/v1/ciBuildRuns/\(id)/builds", method: .get, parameters: .init(fields: fields,
                                                                                    filters: filters,
                                                                                    includes: includes,
                                                                                    sorts: sorts,
                                                                                    limits: limits))
    }
}

public enum ListBuildsForCiBuildRunV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appEncryptionDeclarations
        case appEncryptionDeclarations([AppEncryptionDeclarations])
        /// The fields to include for returned resources of type appStoreVersions
        case appStoreVersions([AppStoreVersions])
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type betaAppReviewSubmissions
        case betaAppReviewSubmissions([BetaAppReviewSubmissions])
        /// The fields to include for returned resources of type betaBuildLocalizations
        case betaBuildLocalizations([BetaBuildLocalizations])
        /// The fields to include for returned resources of type betaGroups
        case betaGroups([BetaGroups])
        /// The fields to include for returned resources of type betaTesters
        case betaTesters([BetaTesters])
        /// The fields to include for returned resources of type buildBetaDetails
        case buildBetaDetails([BuildBetaDetails])
        /// The fields to include for returned resources of type buildBundles
        case buildBundles([BuildBundles])
        /// The fields to include for returned resources of type buildIcons
        case buildIcons([BuildIcons])
        /// The fields to include for returned resources of type builds
        case builds([Builds])
        /// The fields to include for returned resources of type preReleaseVersions
        case preReleaseVersions([PreReleaseVersions])

        public enum AppEncryptionDeclarations: String, ParameterValue, Codable, CaseIterable {
            case app
            case appDescription
            case appEncryptionDeclarationDocument
            case appEncryptionDeclarationState
            case availableOnFrenchStore
            case builds
            case codeValue
            case containsProprietaryCryptography
            case containsThirdPartyCryptography
            case createdDate
            case documentName
            case documentType
            case documentUrl
            case exempt
            case platform
            case uploadedDate
            case usesEncryption
        }

        public enum AppStoreVersions: String, ParameterValue, Codable, CaseIterable {
            case ageRatingDeclaration
            case app
            case appClipDefaultExperience
            case appStoreReviewDetail
            case appStoreState
            case appStoreVersionExperiments
            case appStoreVersionExperimentsV2
            case appStoreVersionLocalizations
            case appStoreVersionPhasedRelease
            case appStoreVersionSubmission
            case build
            case copyright
            case createdDate
            case customerReviews
            case downloadable
            case earliestReleaseDate
            case platform
            case releaseType
            case routingAppCoverage
            case versionString
        }

        public enum Apps: String, ParameterValue, Codable, CaseIterable {
            case appAvailability
            case appClips
            case appCustomProductPages
            case appEvents
            case appInfos
            case appPricePoints
            case appPriceSchedule
            case appStoreVersionExperimentsV2
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
            case customerReviews
            case endUserLicenseAgreement
            case gameCenterEnabledVersions
            case inAppPurchases
            case inAppPurchasesV2
            case isOrEverWasMadeForKids
            case name
            case perfPowerMetrics
            case preOrder
            case preReleaseVersions
            case pricePoints
            case prices
            case primaryLocale
            case promotedPurchases
            case reviewSubmissions
            case sku
            case subscriptionGracePeriod
            case subscriptionGroups
            case subscriptionStatusUrl
            case subscriptionStatusUrlForSandbox
            case subscriptionStatusUrlVersion
            case subscriptionStatusUrlVersionForSandbox
        }

        public enum BetaAppReviewSubmissions: String, ParameterValue, Codable, CaseIterable {
            case betaReviewState
            case build
            case submittedDate
        }

        public enum BetaBuildLocalizations: String, ParameterValue, Codable, CaseIterable {
            case build
            case locale
            case whatsNew
        }

        public enum BetaGroups: String, ParameterValue, Codable, CaseIterable {
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

        public enum BetaTesters: String, ParameterValue, Codable, CaseIterable {
            case apps
            case betaGroups
            case builds
            case email
            case firstName
            case inviteType
            case lastName
        }

        public enum BuildBetaDetails: String, ParameterValue, Codable, CaseIterable {
            case autoNotifyEnabled
            case build
            case externalBuildState
            case internalBuildState
        }

        public enum BuildBundles: String, ParameterValue, Codable, CaseIterable {
            case appClipDomainCacheStatus
            case appClipDomainDebugStatus
            case betaAppClipInvocations
            case buildBundleFileSizes
            case bundleId
            case bundleType
            case dSYMUrl
            case deviceProtocols
            case entitlements
            case fileName
            case hasOnDemandResources
            case hasPrerenderedIcon
            case hasSirikit
            case includesSymbols
            case isIosBuildMacAppStoreCompatible
            case locales
            case platformBuild
            case requiredCapabilities
            case sdkBuild
            case supportedArchitectures
            case usesLocationServices
        }

        public enum BuildIcons: String, ParameterValue, Codable, CaseIterable {
            case iconAsset
            case iconType
            case name
        }

        public enum Builds: String, ParameterValue, Codable, CaseIterable {
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

        public enum PreReleaseVersions: String, ParameterValue, Codable, CaseIterable {
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
        /// Filter by id(s) of related 'appStoreVersion'
        case appStoreVersion([String])
        /// Filter by attribute 'betaAppReviewSubmission.betaReviewState'
        case betaAppReviewSubmission_betaReviewState([BetaReviewState])
        /// Filter by id(s) of related 'betaGroups'
        case betaGroups([String])
        /// Filter by attribute 'buildAudienceType'
        case buildAudienceType([BuildAudienceType])
        /// Filter by attribute 'expired'
        case expired([String])
        /// Filter by id(s)
        case id([String])
        /// Filter by id(s) of related 'preReleaseVersion'
        case preReleaseVersion([String])
        /// Filter by attribute 'preReleaseVersion.platform'
        case preReleaseVersion_platform([Platform])
        /// Filter by attribute 'preReleaseVersion.version'
        case preReleaseVersion_version([String])
        /// Filter by attribute 'processingState'
        case processingState([ProcessingState])
        /// Filter by attribute 'usesNonExemptEncryption'
        case usesNonExemptEncryption([String])
        /// Filter by attribute 'version'
        case version([String])

        public enum ProcessingState: String, ParameterValue, Codable, CaseIterable {
            case processing = "PROCESSING"
            case failed = "FAILED"
            case invalid = "INVALID"
            case valid = "VALID"
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case app
        case appEncryptionDeclaration
        case appStoreVersion
        case betaAppReviewSubmission
        case betaBuildLocalizations
        case betaGroups
        case buildBetaDetail
        case buildBundles
        case icons
        case individualTesters
        case preReleaseVersion
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case preReleaseVersionAscending = "preReleaseVersion"
        case preReleaseVersionDescending = "-preReleaseVersion"
        case uploadedDateAscending = "uploadedDate"
        case uploadedDateDescending = "-uploadedDate"
        case versionAscending = "version"
        case versionDescending = "-version"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related betaBuildLocalizations returned (when they are included) - maximum 50
        case betaBuildLocalizations(Int)
        /// Maximum number of related betaGroups returned (when they are included) - maximum 50
        case betaGroups(Int)
        /// Maximum number of related buildBundles returned (when they are included) - maximum 50
        case buildBundles(Int)
        /// Maximum number of related icons returned (when they are included) - maximum 50
        case icons(Int)
        /// Maximum number of related individualTesters returned (when they are included) - maximum 50
        case individualTesters(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}
