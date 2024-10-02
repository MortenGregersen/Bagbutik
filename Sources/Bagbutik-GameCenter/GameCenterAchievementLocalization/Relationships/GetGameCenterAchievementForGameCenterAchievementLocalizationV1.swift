import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the achievement localization information
     Read the achievement associated with specific localized information.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterAchievementLocalizations-_id_-gameCenterAchievement>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterAchievementForGameCenterAchievementLocalizationV1(id: String,
                                                                               fields: [GetGameCenterAchievementForGameCenterAchievementLocalizationV1.Field]? = nil,
                                                                               includes: [GetGameCenterAchievementForGameCenterAchievementLocalizationV1.Include]? = nil,
                                                                               limits: [GetGameCenterAchievementForGameCenterAchievementLocalizationV1.Limit]? = nil) -> Request<GameCenterAchievementResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterAchievementLocalizations/\(id)/gameCenterAchievement", method: .get, parameters: .init(fields: fields,
                                                                                                                          includes: includes,
                                                                                                                          limits: limits))
    }
}

public enum GetGameCenterAchievementForGameCenterAchievementLocalizationV1 {
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

        public enum GameCenterGroups: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterAchievements
            case gameCenterDetails
            case gameCenterLeaderboardSets
            case gameCenterLeaderboards
            case referenceName
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
