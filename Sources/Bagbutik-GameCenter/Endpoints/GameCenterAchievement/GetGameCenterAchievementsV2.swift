import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Game Center achievement information
     Get information about a specific Game Center achievement.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterAchievements-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related versions returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterAchievementsV2(id: String,
                                            fields: [GetGameCenterAchievementsV2.Field]? = nil,
                                            includes: [GetGameCenterAchievementsV2.Include]? = nil,
                                            limit: GetGameCenterAchievementsV2.Limit? = nil) -> Request<GameCenterAchievementV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterAchievements/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetGameCenterAchievementsV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterAchievementVersions
        case gameCenterAchievementVersions([GameCenterAchievementVersions])
        /// The fields to include for returned resources of type gameCenterAchievements
        case gameCenterAchievements([GameCenterAchievements])

        public enum GameCenterAchievementVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case achievement
            case localizations
            case state
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterAchievementVersions(rawValue: string) {
                    self = value
                } else if let value = GameCenterAchievementVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterAchievementVersions value: \(string)"
                    )
                }
            }
        }

        public enum GameCenterAchievements: String, Sendable, ParameterValue, Codable, CaseIterable {
            case activity
            case activityProperties
            case archived
            case gameCenterDetail
            case gameCenterGroup
            case points
            case referenceName
            case repeatable
            case showBeforeEarned
            case vendorIdentifier
            case versions

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterAchievements(rawValue: string) {
                    self = value
                } else if let value = GameCenterAchievements(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterAchievements value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case activity
        case gameCenterDetail
        case gameCenterGroup
        case versions
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related versions returned (when they are included) - maximum 50
        case versions(Int)
    }
}
