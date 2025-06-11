import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List Game Center details for a group
     Read Game Center detail information for a specific group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterGroups-_id_-gameCenterDetails>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterDetailsForGameCenterGroupV1(id: String,
                                                          fields: [ListGameCenterDetailsForGameCenterGroupV1.Field]? = nil,
                                                          filters: [ListGameCenterDetailsForGameCenterGroupV1.Filter]? = nil,
                                                          includes: [ListGameCenterDetailsForGameCenterGroupV1.Include]? = nil,
                                                          limits: [ListGameCenterDetailsForGameCenterGroupV1.Limit]? = nil) -> Request<GameCenterDetailsResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterGroups/\(id)/gameCenterDetails",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limits: limits))
    }
}

public enum ListGameCenterDetailsForGameCenterGroupV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type appStoreVersions
        case appStoreVersions([AppStoreVersions])
        /// The fields to include for returned resources of type apps
        case apps([Apps])
        /// The fields to include for returned resources of type gameCenterAchievementReleases
        case gameCenterAchievementReleases([GameCenterAchievementReleases])
        /// The fields to include for returned resources of type gameCenterAchievements
        case gameCenterAchievements([GameCenterAchievements])
        /// The fields to include for returned resources of type gameCenterActivities
        case gameCenterActivities([GameCenterActivities])
        /// The fields to include for returned resources of type gameCenterActivityVersionReleases
        case gameCenterActivityVersionReleases([GameCenterActivityVersionReleases])
        /// The fields to include for returned resources of type gameCenterAppVersions
        case gameCenterAppVersions([GameCenterAppVersions])
        /// The fields to include for returned resources of type gameCenterChallengeVersionReleases
        case gameCenterChallengeVersionReleases([GameCenterChallengeVersionReleases])
        /// The fields to include for returned resources of type gameCenterChallenges
        case gameCenterChallenges([GameCenterChallenges])
        /// The fields to include for returned resources of type gameCenterDetails
        case gameCenterDetails([GameCenterDetails])
        /// The fields to include for returned resources of type gameCenterGroups
        case gameCenterGroups([GameCenterGroups])
        /// The fields to include for returned resources of type gameCenterLeaderboardReleases
        case gameCenterLeaderboardReleases([GameCenterLeaderboardReleases])
        /// The fields to include for returned resources of type gameCenterLeaderboardSetReleases
        case gameCenterLeaderboardSetReleases([GameCenterLeaderboardSetReleases])
        /// The fields to include for returned resources of type gameCenterLeaderboardSets
        case gameCenterLeaderboardSets([GameCenterLeaderboardSets])
        /// The fields to include for returned resources of type gameCenterLeaderboards
        case gameCenterLeaderboards([GameCenterLeaderboards])

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

        public enum GameCenterAchievementReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterAchievement
            case gameCenterDetail
            case live
        }

        public enum GameCenterAchievements: String, Sendable, ParameterValue, Codable, CaseIterable {
            case activity
            case activityProperties
            case archived
            case gameCenterDetail
            case gameCenterGroup
            case groupAchievement
            case localizations
            case points
            case referenceName
            case releases
            case repeatable
            case showBeforeEarned
            case vendorIdentifier
        }

        public enum GameCenterActivities: String, Sendable, ParameterValue, Codable, CaseIterable {
            case achievements
            case archived
            case gameCenterDetail
            case gameCenterGroup
            case leaderboards
            case maximumPlayersCount
            case minimumPlayersCount
            case playStyle
            case properties
            case referenceName
            case supportsPartyCode
            case vendorIdentifier
            case versions
        }

        public enum GameCenterActivityVersionReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case version
        }

        public enum GameCenterAppVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case appStoreVersion
            case compatibilityVersions
            case enabled
        }

        public enum GameCenterChallengeVersionReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case version
        }

        public enum GameCenterChallenges: String, Sendable, ParameterValue, Codable, CaseIterable {
            case allowedDurations
            case archived
            case challengeType
            case gameCenterDetail
            case gameCenterGroup
            case leaderboard
            case referenceName
            case repeatable
            case vendorIdentifier
            case versions
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

        public enum GameCenterGroups: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterAchievements
            case gameCenterActivities
            case gameCenterChallenges
            case gameCenterDetails
            case gameCenterLeaderboardSets
            case gameCenterLeaderboards
            case referenceName
        }

        public enum GameCenterLeaderboardReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterDetail
            case gameCenterLeaderboard
            case live
        }

        public enum GameCenterLeaderboardSetReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterDetail
            case gameCenterLeaderboardSet
            case live
        }

        public enum GameCenterLeaderboardSets: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterDetail
            case gameCenterGroup
            case gameCenterLeaderboards
            case groupLeaderboardSet
            case localizations
            case referenceName
            case releases
            case vendorIdentifier
        }

        public enum GameCenterLeaderboards: String, Sendable, ParameterValue, Codable, CaseIterable {
            case activity
            case activityProperties
            case archived
            case challenge
            case defaultFormatter
            case gameCenterDetail
            case gameCenterGroup
            case gameCenterLeaderboardSets
            case groupLeaderboard
            case localizations
            case recurrenceDuration
            case recurrenceRule
            case recurrenceStartDate
            case referenceName
            case releases
            case scoreRangeEnd
            case scoreRangeStart
            case scoreSortType
            case submissionType
            case vendorIdentifier
            case visibility
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'gameCenterAppVersions.enabled'
        case gameCenterAppVersions_enabled([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case achievementReleases
        case activityReleases
        case app
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

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related achievementReleases returned (when they are included) - maximum 50
        case achievementReleases(Int)
        /// Maximum number of related activityReleases returned (when they are included) - maximum 50
        case activityReleases(Int)
        /// Maximum number of related challengeReleases returned (when they are included) - maximum 50
        case challengeReleases(Int)
        /// Maximum number of related challengesMinimumPlatformVersions returned (when they are included) - maximum 50
        case challengesMinimumPlatformVersions(Int)
        /// Maximum number of related gameCenterAchievements returned (when they are included) - maximum 50
        case gameCenterAchievements(Int)
        /// Maximum number of related gameCenterActivities returned (when they are included) - maximum 50
        case gameCenterActivities(Int)
        /// Maximum number of related gameCenterAppVersions returned (when they are included) - maximum 50
        case gameCenterAppVersions(Int)
        /// Maximum number of related gameCenterChallenges returned (when they are included) - maximum 50
        case gameCenterChallenges(Int)
        /// Maximum number of related gameCenterLeaderboardSets returned (when they are included) - maximum 50
        case gameCenterLeaderboardSets(Int)
        /// Maximum number of related gameCenterLeaderboards returned (when they are included) - maximum 50
        case gameCenterLeaderboards(Int)
        /// Maximum number of related leaderboardReleases returned (when they are included) - maximum 50
        case leaderboardReleases(Int)
        /// Maximum number of related leaderboardSetReleases returned (when they are included) - maximum 50
        case leaderboardSetReleases(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
    }
}
