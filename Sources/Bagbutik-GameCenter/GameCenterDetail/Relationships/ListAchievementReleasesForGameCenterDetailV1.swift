import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List achievement releases
     Read information about the achievement releases for specific Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_achievement_releases>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listAchievementReleasesForGameCenterDetailV1(id: String,
                                                             fields: [ListAchievementReleasesForGameCenterDetailV1.Field]? = nil,
                                                             filters: [ListAchievementReleasesForGameCenterDetailV1.Filter]? = nil,
                                                             includes: [ListAchievementReleasesForGameCenterDetailV1.Include]? = nil,
                                                             limit: Int? = nil) -> Request<GameCenterAchievementReleasesResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterDetails/\(id)/achievementReleases", method: .get, parameters: .init(fields: fields,
                                                                                                       filters: filters,
                                                                                                       includes: includes,
                                                                                                       limit: limit))
    }
}

public enum ListAchievementReleasesForGameCenterDetailV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterAchievementReleases
        case gameCenterAchievementReleases([GameCenterAchievementReleases])
        /// The fields to include for returned resources of type gameCenterAchievements
        case gameCenterAchievements([GameCenterAchievements])
        /// The fields to include for returned resources of type gameCenterDetails
        case gameCenterDetails([GameCenterDetails])

        public enum GameCenterAchievementReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterAchievement
            case gameCenterDetail
            case live
        }

        public enum GameCenterAchievements: String, Sendable, ParameterValue, Codable, CaseIterable {
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
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'gameCenterAchievement'
        case gameCenterAchievement([String])
        /// Filter by attribute 'live'
        case live([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterAchievement
        case gameCenterDetail
    }
}
