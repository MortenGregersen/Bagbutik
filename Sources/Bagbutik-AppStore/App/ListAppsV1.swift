import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List Apps
     Find and list apps in App Store Connect.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_apps>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter exists: Attributes, relationships, and IDs to check for existence
     - Parameter includes: Relationship data to include in the response
     - Parameter sorts: Attributes by which to sort
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAppsV1(fields: [ListAppsV1.Field]? = nil,
                           filters: [ListAppsV1.Filter]? = nil,
                           exists: [ListAppsV1.Exist]? = nil,
                           includes: [ListAppsV1.Include]? = nil,
                           sorts: [ListAppsV1.Sort]? = nil,
                           limits: [ListAppsV1.Limit]? = nil) -> Request<AppsResponse, ErrorResponse>
    {
        .init(path: "/v1/apps", method: .get, parameters: .init(fields: fields,
                                                                filters: filters,
                                                                exists: exists,
                                                                includes: includes,
                                                                sorts: sorts,
                                                                limits: limits))
    }
}

public enum ListAppsV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appAvailabilities
        case appAvailabilities([AppAvailabilities])
        /// The fields to include for returned resources of type appClips
        case appClips([AppClips])
        /// The fields to include for returned resources of type appCustomProductPages
        case appCustomProductPages([AppCustomProductPages])
        /// The fields to include for returned resources of type appEncryptionDeclarations
        case appEncryptionDeclarations([AppEncryptionDeclarations])
        /// The fields to include for returned resources of type appEvents
        case appEvents([AppEvents])
        /// The fields to include for returned resources of type appInfos
        case appInfos([AppInfos])
        /// The fields to include for returned resources of type appPreOrders
        case appPreOrders([AppPreOrders])
        /// The fields to include for returned resources of type appPricePoints
        case appPricePoints([AppPricePoints])
        /// The fields to include for returned resources of type appPriceSchedules
        case appPriceSchedules([AppPriceSchedules])
        /// The fields to include for returned resources of type appPrices
        @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
        case appPrices([AppPrices])
        /// The fields to include for returned resources of type appStoreVersionExperiments
        case appStoreVersionExperiments([AppStoreVersionExperiments])
        /// The fields to include for returned resources of type appStoreVersions
        case appStoreVersions([AppStoreVersions])
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type betaAppLocalizations
        case betaAppLocalizations([BetaAppLocalizations])
        /// The fields to include for returned resources of type betaAppReviewDetails
        case betaAppReviewDetails([BetaAppReviewDetails])
        /// The fields to include for returned resources of type betaGroups
        case betaGroups([BetaGroups])
        /// The fields to include for returned resources of type betaLicenseAgreements
        case betaLicenseAgreements([BetaLicenseAgreements])
        /// The fields to include for returned resources of type builds
        case builds([Builds])
        /// The fields to include for returned resources of type ciProducts
        case ciProducts([CiProducts])
        /// The fields to include for returned resources of type customerReviews
        case customerReviews([CustomerReviews])
        /// The fields to include for returned resources of type endUserLicenseAgreements
        case endUserLicenseAgreements([EndUserLicenseAgreements])
        /// The fields to include for returned resources of type gameCenterDetails
        case gameCenterDetails([GameCenterDetails])
        /// The fields to include for returned resources of type gameCenterEnabledVersions
        @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
        case gameCenterEnabledVersions([GameCenterEnabledVersions])
        /// The fields to include for returned resources of type inAppPurchases
        case inAppPurchases([InAppPurchases])
        /// The fields to include for returned resources of type perfPowerMetrics
        case perfPowerMetrics([PerfPowerMetrics])
        /// The fields to include for returned resources of type preReleaseVersions
        case preReleaseVersions([PreReleaseVersions])
        /// The fields to include for returned resources of type promotedPurchases
        case promotedPurchases([PromotedPurchases])
        /// The fields to include for returned resources of type reviewSubmissions
        case reviewSubmissions([ReviewSubmissions])
        /// The fields to include for returned resources of type subscriptionGracePeriods
        case subscriptionGracePeriods([SubscriptionGracePeriods])
        /// The fields to include for returned resources of type subscriptionGroups
        case subscriptionGroups([SubscriptionGroups])
        /// The fields to include for returned resources of type territories
        @available(*, deprecated, message: "Apple has marked it as deprecated and it will be removed sometime in the future.")
        case territories([Territories])

        public enum AppAvailabilities: String, ParameterValue, Codable, CaseIterable {
            case app
            case availableInNewTerritories
            case availableTerritories
        }

        public enum AppClips: String, ParameterValue, Codable, CaseIterable {
            case app
            case appClipAdvancedExperiences
            case appClipDefaultExperiences
            case bundleId
        }

        public enum AppCustomProductPages: String, ParameterValue, Codable, CaseIterable {
            case app
            case appCustomProductPageVersions
            case appStoreVersionTemplate
            case customProductPageTemplate
            case name
            case url
            case visible
        }

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

        public enum AppEvents: String, ParameterValue, Codable, CaseIterable {
            case app
            case archivedTerritorySchedules
            case badge
            case deepLink
            case eventState
            case localizations
            case primaryLocale
            case priority
            case purchaseRequirement
            case purpose
            case referenceName
            case territorySchedules
        }

        public enum AppInfos: String, ParameterValue, Codable, CaseIterable {
            case ageRatingDeclaration
            case app
            case appInfoLocalizations
            case appStoreAgeRating
            case appStoreState
            case brazilAgeRating
            case brazilAgeRatingV2
            case kidsAgeBand
            case primaryCategory
            case primarySubcategoryOne
            case primarySubcategoryTwo
            case secondaryCategory
            case secondarySubcategoryOne
            case secondarySubcategoryTwo
        }

        public enum AppPreOrders: String, ParameterValue, Codable, CaseIterable {
            case app
            case appReleaseDate
            case preOrderAvailableDate
        }

        public enum AppPricePoints: String, ParameterValue, Codable, CaseIterable {
            case app
            case customerPrice
            case equalizations
            case priceTier
            case proceeds
            case territory
        }

        public enum AppPriceSchedules: String, ParameterValue, Codable, CaseIterable {
            case app
            case automaticPrices
            case baseTerritory
            case manualPrices
        }

        public enum AppPrices: String, ParameterValue, Codable, CaseIterable {
            case app
            case priceTier
        }

        public enum AppStoreVersionExperiments: String, ParameterValue, Codable, CaseIterable {
            case app
            case appStoreVersionExperimentTreatments
            case controlVersions
            case endDate
            case latestControlVersion
            case name
            case platform
            case reviewRequired
            case startDate
            case started
            case state
            case trafficProportion
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
            case appEncryptionDeclarations
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
            case gameCenterDetail
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

        public enum BetaAppLocalizations: String, ParameterValue, Codable, CaseIterable {
            case app
            case description
            case feedbackEmail
            case locale
            case marketingUrl
            case privacyPolicyUrl
            case tvOsPrivacyPolicy
        }

        public enum BetaAppReviewDetails: String, ParameterValue, Codable, CaseIterable {
            case app
            case contactEmail
            case contactFirstName
            case contactLastName
            case contactPhone
            case demoAccountName
            case demoAccountPassword
            case demoAccountRequired
            case notes
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

        public enum BetaLicenseAgreements: String, ParameterValue, Codable, CaseIterable {
            case agreementText
            case app
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

        public enum CiProducts: String, ParameterValue, Codable, CaseIterable {
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

        public enum CustomerReviews: String, ParameterValue, Codable, CaseIterable {
            case body
            case createdDate
            case rating
            case response
            case reviewerNickname
            case territory
            case title
        }

        public enum EndUserLicenseAgreements: String, ParameterValue, Codable, CaseIterable {
            case agreementText
            case app
            case territories
        }

        public enum GameCenterDetails: String, ParameterValue, Codable, CaseIterable {
            case achievementReleases
            case app
            case arcadeEnabled
            case challengeEnabled
            case defaultGroupLeaderboard
            case defaultLeaderboard
            case gameCenterAchievements
            case gameCenterAppVersions
            case gameCenterGroup
            case gameCenterLeaderboardSets
            case gameCenterLeaderboards
            case leaderboardReleases
            case leaderboardSetReleases
        }

        public enum GameCenterEnabledVersions: String, ParameterValue, Codable, CaseIterable {
            case app
            case compatibleVersions
            case iconAsset
            case platform
            case versionString
        }

        public enum InAppPurchases: String, ParameterValue, Codable, CaseIterable {
            case app
            case appStoreReviewScreenshot
            case apps
            case availableInAllTerritories
            case content
            case contentHosting
            case familySharable
            case iapPriceSchedule
            case inAppPurchaseAvailability
            case inAppPurchaseLocalizations
            case inAppPurchaseType
            case name
            case pricePoints
            case productId
            case promotedPurchase
            case referenceName
            case reviewNote
            case state
        }

        public enum PerfPowerMetrics: String, ParameterValue, Codable, CaseIterable {
            case deviceType
            case metricType
            case platform
        }

        public enum PreReleaseVersions: String, ParameterValue, Codable, CaseIterable {
            case app
            case builds
            case platform
            case version
        }

        public enum PromotedPurchases: String, ParameterValue, Codable, CaseIterable {
            case app
            case enabled
            case inAppPurchaseV2
            case promotionImages
            case state
            case subscription
            case visibleForAllUsers
        }

        public enum ReviewSubmissions: String, ParameterValue, Codable, CaseIterable {
            case app
            case appStoreVersionForReview
            case canceled
            case items
            case lastUpdatedByActor
            case platform
            case state
            case submitted
            case submittedByActor
            case submittedDate
        }

        public enum SubscriptionGracePeriods: String, ParameterValue, Codable, CaseIterable {
            case duration
            case optIn
            case renewalType
            case sandboxOptIn
        }

        public enum SubscriptionGroups: String, ParameterValue, Codable, CaseIterable {
            case app
            case referenceName
            case subscriptionGroupLocalizations
            case subscriptions
        }

        public enum Territories: String, ParameterValue, Codable, CaseIterable {
            case currency
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'appStoreVersions'
        case appStoreVersions([String])
        /// Filter by attribute 'appStoreVersions.appStoreState'
        case appStoreVersions_appStoreState([AppStoreVersionState])
        /// Filter by attribute 'appStoreVersions.platform'
        case appStoreVersions_platform([Platform])
        /// Filter by attribute 'bundleId'
        case bundleId([String])
        /// Filter by id(s)
        case id([String])
        /// Filter by attribute 'name'
        case name([String])
        /// Filter by attribute 'sku'
        case sku([String])
    }

    /**
     Attributes, relationships, and IDs to check for existence.
     */
    public enum Exist: ExistParameter {
        /// Filter by existence or non-existence of related 'gameCenterEnabledVersions'
        case gameCenterEnabledVersions(Bool)
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case appClips
        case appCustomProductPages
        case appEncryptionDeclarations
        case appEvents
        case appInfos
        case appStoreVersionExperimentsV2
        case appStoreVersions
        case availableTerritories
        case betaAppLocalizations
        case betaAppReviewDetail
        case betaGroups
        case betaLicenseAgreement
        case builds
        case ciProduct
        case endUserLicenseAgreement
        case gameCenterDetail
        case gameCenterEnabledVersions
        case inAppPurchases
        case inAppPurchasesV2
        case preOrder
        case preReleaseVersions
        case prices
        case promotedPurchases
        case reviewSubmissions
        case subscriptionGracePeriod
        case subscriptionGroups
    }

    /**
     Attributes by which to sort.
     */
    public enum Sort: String, SortParameter, CaseIterable {
        case bundleIdAscending = "bundleId"
        case bundleIdDescending = "-bundleId"
        case nameAscending = "name"
        case nameDescending = "-name"
        case skuAscending = "sku"
        case skuDescending = "-sku"
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related appClips returned (when they are included) - maximum 50
        case appClips(Int)
        /// Maximum number of related appCustomProductPages returned (when they are included) - maximum 50
        case appCustomProductPages(Int)
        /// Maximum number of related appEncryptionDeclarations returned (when they are included) - maximum 50
        case appEncryptionDeclarations(Int)
        /// Maximum number of related appEvents returned (when they are included) - maximum 50
        case appEvents(Int)
        /// Maximum number of related appInfos returned (when they are included) - maximum 50
        case appInfos(Int)
        /// Maximum number of related appStoreVersionExperimentsV2 returned (when they are included) - maximum 50
        case appStoreVersionExperimentsV2(Int)
        /// Maximum number of related appStoreVersions returned (when they are included) - maximum 50
        case appStoreVersions(Int)
        /// Maximum number of related availableTerritories returned (when they are included) - maximum 50
        case availableTerritories(Int)
        /// Maximum number of related betaAppLocalizations returned (when they are included) - maximum 50
        case betaAppLocalizations(Int)
        /// Maximum number of related betaGroups returned (when they are included) - maximum 50
        case betaGroups(Int)
        /// Maximum number of related builds returned (when they are included) - maximum 50
        case builds(Int)
        /// Maximum number of related gameCenterEnabledVersions returned (when they are included) - maximum 50
        case gameCenterEnabledVersions(Int)
        /// Maximum number of related inAppPurchases returned (when they are included) - maximum 50
        case inAppPurchases(Int)
        /// Maximum number of related inAppPurchasesV2 returned (when they are included) - maximum 50
        case inAppPurchasesV2(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related preReleaseVersions returned (when they are included) - maximum 50
        case preReleaseVersions(Int)
        /// Maximum number of related prices returned (when they are included) - maximum 50
        case prices(Int)
        /// Maximum number of related promotedPurchases returned (when they are included) - maximum 50
        case promotedPurchases(Int)
        /// Maximum number of related reviewSubmissions returned (when they are included) - maximum 50
        case reviewSubmissions(Int)
        /// Maximum number of related subscriptionGroups returned (when they are included) - maximum 50
        case subscriptionGroups(Int)
    }
}
