import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read App Information for an Xcode Cloud Product
     Get the app in App Store Connect that’s related to an Xcode Cloud product.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-ciProducts-_id_-app>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getAppForCiProductV1(id: String,
                                     fields: [GetAppForCiProductV1.Field]? = nil,
                                     includes: [GetAppForCiProductV1.Include]? = nil,
                                     limits: [GetAppForCiProductV1.Limit]? = nil) -> Request<AppResponse, ErrorResponse> {
        .init(
            path: "/v1/ciProducts/\(id)/app",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum GetAppForCiProductV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
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
        /// The fields to include for returned resources of type endUserLicenseAgreements
        case endUserLicenseAgreements([EndUserLicenseAgreements])
        /// The fields to include for returned resources of type gameCenterDetails
        case gameCenterDetails([GameCenterDetails])
        /// The fields to include for returned resources of type gameCenterEnabledVersions
        case gameCenterEnabledVersions([GameCenterEnabledVersions])
        /// The fields to include for returned resources of type inAppPurchases
        case inAppPurchases([InAppPurchases])
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

        public enum AppClips: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appClipAdvancedExperiences
            case appClipDefaultExperiences
            case bundleId
        }

        public enum AppCustomProductPages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appCustomProductPageVersions
            case name
            case url
            case visible
        }

        public enum AppEncryptionDeclarations: String, Sendable, ParameterValue, Codable, CaseIterable {
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

        public enum AppEvents: String, Sendable, ParameterValue, Codable, CaseIterable {
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

        public enum AppInfos: String, Sendable, ParameterValue, Codable, CaseIterable {
            case ageRatingDeclaration
            case app
            case appInfoLocalizations
            case appStoreAgeRating
            case appStoreState
            case australiaAgeRating
            case brazilAgeRating
            case brazilAgeRatingV2
            case franceAgeRating
            case kidsAgeBand
            case koreaAgeRating
            case primaryCategory
            case primarySubcategoryOne
            case primarySubcategoryTwo
            case secondaryCategory
            case secondarySubcategoryOne
            case secondarySubcategoryTwo
            case state
        }

        public enum AppStoreVersionExperiments: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appStoreVersionExperimentTreatments
            case controlVersions
            case endDate
            case latestControlVersion
            case name
            case platform
            case reviewRequired
            case startDate
            case state
            case trafficProportion
        }

        public enum AppStoreVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case ageRatingDeclaration
            case alternativeDistributionPackage
            case app
            case appClipDefaultExperience
            case appStoreReviewDetail
            case appStoreState
            case appStoreVersionExperiments
            case appStoreVersionExperimentsV2
            case appStoreVersionLocalizations
            case appStoreVersionPhasedRelease
            case appStoreVersionSubmission
            case appVersionState
            case build
            case copyright
            case createdDate
            case customerReviews
            case downloadable
            case earliestReleaseDate
            case gameCenterAppVersion
            case platform
            case releaseType
            case reviewType
            case routingAppCoverage
            case usesIdfa
            case versionString
        }

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

        public enum BetaAppLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case description
            case feedbackEmail
            case locale
            case marketingUrl
            case privacyPolicyUrl
            case tvOsPrivacyPolicy
        }

        public enum BetaAppReviewDetails: String, Sendable, ParameterValue, Codable, CaseIterable {
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

        public enum BetaGroups: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case betaRecruitmentCriteria
            case betaRecruitmentCriterionCompatibleBuildCheck
            case betaTesters
            case builds
            case createdDate
            case feedbackEnabled
            case hasAccessToAllBuilds
            case iosBuildsAvailableForAppleSiliconMac
            case iosBuildsAvailableForAppleVision
            case isInternalGroup
            case name
            case publicLink
            case publicLinkEnabled
            case publicLinkId
            case publicLinkLimit
            case publicLinkLimitEnabled
        }

        public enum BetaLicenseAgreements: String, Sendable, ParameterValue, Codable, CaseIterable {
            case agreementText
            case app
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

        public enum EndUserLicenseAgreements: String, Sendable, ParameterValue, Codable, CaseIterable {
            case agreementText
            case app
            case territories
        }

        public enum GameCenterDetails: String, Sendable, ParameterValue, Codable, CaseIterable {
            case achievementReleases
            case activityReleases
            case app
            case arcadeEnabled
            case challengeEnabled
            case challengeReleases
            case challengesMinimumPlatformVersions
            case defaultGroupLeaderboard
            case defaultLeaderboard
            case gameCenterAchievements
            case gameCenterActivities
            case gameCenterAppVersions
            case gameCenterChallenges
            case gameCenterGroup
            case gameCenterLeaderboardSets
            case gameCenterLeaderboards
            case leaderboardReleases
            case leaderboardSetReleases
        }

        public enum GameCenterEnabledVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case compatibleVersions
            case iconAsset
            case platform
            case versionString
        }

        public enum InAppPurchases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreReviewScreenshot
            case apps
            case content
            case contentHosting
            case familySharable
            case iapPriceSchedule
            case images
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

        public enum PreReleaseVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case builds
            case platform
            case version
        }

        public enum PromotedPurchases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case enabled
            case inAppPurchaseV2
            case state
            case subscription
            case visibleForAllUsers
        }

        public enum ReviewSubmissions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case app
            case appStoreVersionForReview
            case items
            case lastUpdatedByActor
            case platform
            case state
            case submittedByActor
            case submittedDate
        }

        public enum SubscriptionGracePeriods: String, Sendable, ParameterValue, Codable, CaseIterable {
            case duration
            case optIn
            case renewalType
            case sandboxOptIn
        }

        public enum SubscriptionGroups: String, Sendable, ParameterValue, Codable, CaseIterable {
            case referenceName
            case subscriptionGroupLocalizations
            case subscriptions
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case accessibilityDeclarations
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
        case ciProduct
        case customerReviewSummarizations
        case customerReviews
        case endUserLicenseAgreement
        case gameCenterDetail
        case gameCenterEnabledVersions
        case inAppPurchases
        case inAppPurchasesV2
        case marketplaceSearchDetail
        case perfPowerMetrics
        case preReleaseVersions
        case promotedPurchases
        case reviewSubmissions
        case subscriptionGracePeriod
        case subscriptionGroups
        case webhooks
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
        /// Maximum number of related preReleaseVersions returned (when they are included) - maximum 50
        case preReleaseVersions(Int)
        /// Maximum number of related promotedPurchases returned (when they are included) - maximum 50
        case promotedPurchases(Int)
        /// Maximum number of related reviewSubmissions returned (when they are included) - maximum 50
        case reviewSubmissions(Int)
        /// Maximum number of related subscriptionGroups returned (when they are included) - maximum 50
        case subscriptionGroups(Int)
    }
}
