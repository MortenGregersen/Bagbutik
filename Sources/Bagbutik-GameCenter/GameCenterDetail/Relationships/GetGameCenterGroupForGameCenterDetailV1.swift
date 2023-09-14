import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the groups in a Game Center detail
     Get a list of groups in a Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_groups_in_a_game_center_detail>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterGroupForGameCenterDetailV1(id: String,
                                                        fields: [GetGameCenterGroupForGameCenterDetailV1.Field]? = nil,
                                                        includes: [GetGameCenterGroupForGameCenterDetailV1.Include]? = nil,
                                                        limits: [GetGameCenterGroupForGameCenterDetailV1.Limit]? = nil) -> Request<GameCenterGroupResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterDetails/\(id)/gameCenterGroup", method: .get, parameters: .init(fields: fields,
                                                                                                   includes: includes,
                                                                                                   limits: limits))
    }
}

public enum GetGameCenterGroupForGameCenterDetailV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterAchievements
        case gameCenterAchievements([GameCenterAchievements])
        /// The fields to include for returned resources of type gameCenterDetails
        case gameCenterDetails([GameCenterDetails])
        /// The fields to include for returned resources of type gameCenterGroups
        case gameCenterGroups([GameCenterGroups])
        /// The fields to include for returned resources of type gameCenterLeaderboardSets
        case gameCenterLeaderboardSets([GameCenterLeaderboardSets])
        /// The fields to include for returned resources of type gameCenterLeaderboards
        case gameCenterLeaderboards([GameCenterLeaderboards])

        public enum GameCenterAchievements: String, ParameterValue, Codable, CaseIterable {
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

        public enum GameCenterGroups: String, ParameterValue, Codable, CaseIterable {
            case gameCenterAchievements
            case gameCenterDetails
            case gameCenterLeaderboardSets
            case gameCenterLeaderboards
            case referenceName
        }

        public enum GameCenterLeaderboardSets: String, ParameterValue, Codable, CaseIterable {
            case gameCenterDetail
            case gameCenterGroup
            case gameCenterLeaderboards
            case groupLeaderboardSet
            case localizations
            case referenceName
            case releases
            case vendorIdentifier
        }

        public enum GameCenterLeaderboards: String, ParameterValue, Codable, CaseIterable {
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
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterAchievements
        case gameCenterDetails
        case gameCenterLeaderboardSets
        case gameCenterLeaderboards
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related gameCenterAchievements returned (when they are included) - maximum 50
        case gameCenterAchievements(Int)
        /// Maximum number of related gameCenterDetails returned (when they are included) - maximum 50
        case gameCenterDetails(Int)
        /// Maximum number of related gameCenterLeaderboardSets returned (when they are included) - maximum 50
        case gameCenterLeaderboardSets(Int)
        /// Maximum number of related gameCenterLeaderboards returned (when they are included) - maximum 50
        case gameCenterLeaderboards(Int)
    }
}
