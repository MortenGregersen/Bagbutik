import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read leaderboard set information
     Get all leaderboard sets and related information for a Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-gameCenterLeaderboardSets>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterLeaderboardSetsForGameCenterDetailV1(id: String,
                                                                   fields: [ListGameCenterLeaderboardSetsForGameCenterDetailV1.Field]? = nil,
                                                                   filters: [ListGameCenterLeaderboardSetsForGameCenterDetailV1.Filter]? = nil,
                                                                   includes: [ListGameCenterLeaderboardSetsForGameCenterDetailV1.Include]? = nil,
                                                                   limits: [ListGameCenterLeaderboardSetsForGameCenterDetailV1.Limit]? = nil) -> Request<GameCenterLeaderboardSetsResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/gameCenterLeaderboardSets",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limits: limits))
    }
}

public enum ListGameCenterLeaderboardSetsForGameCenterDetailV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterDetails
        case gameCenterDetails([GameCenterDetails])
        /// The fields to include for returned resources of type gameCenterGroups
        case gameCenterGroups([GameCenterGroups])
        /// The fields to include for returned resources of type gameCenterLeaderboardSetLocalizations
        case gameCenterLeaderboardSetLocalizations([GameCenterLeaderboardSetLocalizations])
        /// The fields to include for returned resources of type gameCenterLeaderboardSetReleases
        case gameCenterLeaderboardSetReleases([GameCenterLeaderboardSetReleases])
        /// The fields to include for returned resources of type gameCenterLeaderboardSets
        case gameCenterLeaderboardSets([GameCenterLeaderboardSets])
        /// The fields to include for returned resources of type gameCenterLeaderboards
        case gameCenterLeaderboards([GameCenterLeaderboards])

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

        public enum GameCenterLeaderboardSetLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterLeaderboardSet
            case gameCenterLeaderboardSetImage
            case locale
            case name
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
        /// Filter by id(s)
        case id([String])
        /// Filter by attribute 'referenceName'
        case referenceName([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterDetail
        case gameCenterGroup
        case gameCenterLeaderboards
        case groupLeaderboardSet
        case localizations
        case releases
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related gameCenterLeaderboards returned (when they are included) - maximum 50
        case gameCenterLeaderboards(Int)
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related localizations returned (when they are included) - maximum 50
        case localizations(Int)
        /// Maximum number of related releases returned (when they are included) - maximum 50
        case releases(Int)
    }
}
