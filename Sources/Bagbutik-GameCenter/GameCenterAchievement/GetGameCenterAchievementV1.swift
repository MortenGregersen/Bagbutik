import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read achievement information
     Read information about a specific Game Center achievement.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_achievement_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterAchievementV1(id: String,
                                           fields: [GetGameCenterAchievementV1.Field]? = nil,
                                           includes: [GetGameCenterAchievementV1.Include]? = nil,
                                           limits: [GetGameCenterAchievementV1.Limit]? = nil) -> Request<GameCenterAchievementResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterAchievements/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                        includes: includes,
                                                                                        limits: limits))
    }
}

public enum GetGameCenterAchievementV1 {
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

        public enum GameCenterAchievementLocalizations: String, ParameterValue, Codable, CaseIterable {
            case afterEarnedDescription
            case beforeEarnedDescription
            case gameCenterAchievement
            case gameCenterAchievementImage
            case locale
            case name
        }

        public enum GameCenterAchievementReleases: String, ParameterValue, Codable, CaseIterable {
            case gameCenterAchievement
            case gameCenterDetail
            case live
        }

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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
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
        /// Maximum number of related localizations returned (when they are included) - maximum 50
        case localizations(Int)
        /// Maximum number of related releases returned (when they are included) - maximum 50
        case releases(Int)
    }
}
