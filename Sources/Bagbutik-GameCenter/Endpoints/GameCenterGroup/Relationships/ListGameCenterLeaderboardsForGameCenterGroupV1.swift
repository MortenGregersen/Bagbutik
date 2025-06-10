import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List Game Center leaderboards for a group
     Read Game Center leaderboard information for a specific group.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterGroups-_id_-gameCenterLeaderboards>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterLeaderboardsForGameCenterGroupV1(id: String,
                                                               fields: [ListGameCenterLeaderboardsForGameCenterGroupV1.Field]? = nil,
                                                               filters: [ListGameCenterLeaderboardsForGameCenterGroupV1.Filter]? = nil,
                                                               includes: [ListGameCenterLeaderboardsForGameCenterGroupV1.Include]? = nil,
                                                               limits: [ListGameCenterLeaderboardsForGameCenterGroupV1.Limit]? = nil) -> Request<GameCenterLeaderboardsResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterGroups/\(id)/gameCenterLeaderboards",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limits: limits))
    }
}

public enum ListGameCenterLeaderboardsForGameCenterGroupV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterActivities
        case gameCenterActivities([GameCenterActivities])
        /// The fields to include for returned resources of type gameCenterChallenges
        case gameCenterChallenges([GameCenterChallenges])
        /// The fields to include for returned resources of type gameCenterDetails
        case gameCenterDetails([GameCenterDetails])
        /// The fields to include for returned resources of type gameCenterGroups
        case gameCenterGroups([GameCenterGroups])
        /// The fields to include for returned resources of type gameCenterLeaderboardLocalizations
        case gameCenterLeaderboardLocalizations([GameCenterLeaderboardLocalizations])
        /// The fields to include for returned resources of type gameCenterLeaderboardReleases
        case gameCenterLeaderboardReleases([GameCenterLeaderboardReleases])
        /// The fields to include for returned resources of type gameCenterLeaderboardSets
        case gameCenterLeaderboardSets([GameCenterLeaderboardSets])
        /// The fields to include for returned resources of type gameCenterLeaderboards
        case gameCenterLeaderboards([GameCenterLeaderboards])

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

        public enum GameCenterLeaderboardLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case formatterOverride
            case formatterSuffix
            case formatterSuffixSingular
            case gameCenterLeaderboard
            case gameCenterLeaderboardImage
            case locale
            case name
        }

        public enum GameCenterLeaderboardReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterDetail
            case gameCenterLeaderboard
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
        case challenge
        case gameCenterDetail
        case gameCenterGroup
        case gameCenterLeaderboardSets
        case groupLeaderboard
        case localizations
        case releases
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related gameCenterLeaderboardSets returned (when they are included) - maximum 50
        case gameCenterLeaderboardSets(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related localizations returned (when they are included) - maximum 50
        case localizations(Int)
        /// Maximum number of related releases returned (when they are included) - maximum 50
        case releases(Int)
    }
}
