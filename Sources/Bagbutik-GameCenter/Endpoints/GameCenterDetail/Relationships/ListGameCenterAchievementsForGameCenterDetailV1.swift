import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all achievements
     List all achievement information for a Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-gameCenterAchievements>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterAchievementsForGameCenterDetailV1(id: String,
                                                                fields: [ListGameCenterAchievementsForGameCenterDetailV1.Field]? = nil,
                                                                filters: [ListGameCenterAchievementsForGameCenterDetailV1.Filter]? = nil,
                                                                includes: [ListGameCenterAchievementsForGameCenterDetailV1.Include]? = nil,
                                                                limits: [ListGameCenterAchievementsForGameCenterDetailV1.Limit]? = nil) -> Request<GameCenterAchievementsResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/gameCenterAchievements",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limits: limits))
    }
}

public enum ListGameCenterAchievementsForGameCenterDetailV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterAchievementLocalizations
        case gameCenterAchievementLocalizations([GameCenterAchievementLocalizations])
        /// The fields to include for returned resources of type gameCenterAchievementReleases
        case gameCenterAchievementReleases([GameCenterAchievementReleases])
        /// The fields to include for returned resources of type gameCenterAchievements
        case gameCenterAchievements([GameCenterAchievements])
        /// The fields to include for returned resources of type gameCenterActivities
        case gameCenterActivities([GameCenterActivities])
        /// The fields to include for returned resources of type gameCenterDetails
        case gameCenterDetails([GameCenterDetails])
        /// The fields to include for returned resources of type gameCenterGroups
        case gameCenterGroups([GameCenterGroups])

        public enum GameCenterAchievementLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case afterEarnedDescription
            case beforeEarnedDescription
            case gameCenterAchievement
            case gameCenterAchievementImage
            case locale
            case name
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
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by attribute 'archived'
        case archived([String])
        /// Filter by id(s)
        case id([String])
        /// Filter by attribute 'referenceName'
        case referenceName([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case activity
        case gameCenterDetail
        case gameCenterGroup
        case groupAchievement
        case localizations
        case releases
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related localizations returned (when they are included) - maximum 50
        case localizations(Int)
        /// Maximum number of related releases returned (when they are included) - maximum 50
        case releases(Int)
    }
}
