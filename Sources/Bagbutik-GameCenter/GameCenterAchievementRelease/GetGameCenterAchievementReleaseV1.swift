import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Game Center achievement release information
     Read the state of a specific achievement release.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_game_center_achievement_release_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterAchievementReleaseV1(id: String,
                                                  fields: [GetGameCenterAchievementReleaseV1.Field]? = nil,
                                                  includes: [GetGameCenterAchievementReleaseV1.Include]? = nil) -> Request<GameCenterAchievementReleaseResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterAchievementReleases/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                               includes: includes))
    }
}

public enum GetGameCenterAchievementReleaseV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterAchievementReleases
        case gameCenterAchievementReleases([GameCenterAchievementReleases])

        public enum GameCenterAchievementReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterAchievement
            case gameCenterDetail
            case live
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterAchievement
        case gameCenterDetail
    }
}
