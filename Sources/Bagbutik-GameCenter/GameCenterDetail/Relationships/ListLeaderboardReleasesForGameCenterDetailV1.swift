import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read leaderboard releases
     List all leaderboard releases for a Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_leaderboard_releases>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLeaderboardReleasesForGameCenterDetailV1(id: String,
                                                             fields: [ListLeaderboardReleasesForGameCenterDetailV1.Field]? = nil,
                                                             filters: [ListLeaderboardReleasesForGameCenterDetailV1.Filter]? = nil,
                                                             includes: [ListLeaderboardReleasesForGameCenterDetailV1.Include]? = nil,
                                                             limit: Int? = nil) -> Request<GameCenterLeaderboardReleasesResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterDetails/\(id)/leaderboardReleases", method: .get, parameters: .init(fields: fields,
                                                                                                       filters: filters,
                                                                                                       includes: includes,
                                                                                                       limit: limit))
    }
}

public enum ListLeaderboardReleasesForGameCenterDetailV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterDetails
        case gameCenterDetails([GameCenterDetails])
        /// The fields to include for returned resources of type gameCenterLeaderboardReleases
        case gameCenterLeaderboardReleases([GameCenterLeaderboardReleases])
        /// The fields to include for returned resources of type gameCenterLeaderboards
        case gameCenterLeaderboards([GameCenterLeaderboards])

        public enum GameCenterDetails: String, Sendable, ParameterValue, Codable, CaseIterable {
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

        public enum GameCenterLeaderboardReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterDetail
            case gameCenterLeaderboard
            case live
        }

        public enum GameCenterLeaderboards: String, Sendable, ParameterValue, Codable, CaseIterable {
            case archived
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
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'gameCenterLeaderboard'
        case gameCenterLeaderboard([String])
        /// Filter by attribute 'live'
        case live([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterDetail
        case gameCenterLeaderboard
    }
}
