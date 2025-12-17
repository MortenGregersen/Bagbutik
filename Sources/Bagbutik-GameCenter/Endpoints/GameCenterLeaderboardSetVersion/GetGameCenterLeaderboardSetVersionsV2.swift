import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Game Center leaderboard set version information
     Get information about a specific Game Center leaderboard set version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterLeaderboardSetVersions-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum number of related localizations returned (when they are included) - maximum 50
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterLeaderboardSetVersionsV2(id: String,
                                                      fields: [GetGameCenterLeaderboardSetVersionsV2.Field]? = nil,
                                                      includes: [GetGameCenterLeaderboardSetVersionsV2.Include]? = nil,
                                                      limit: GetGameCenterLeaderboardSetVersionsV2.Limit? = nil) -> Request<GameCenterLeaderboardSetVersionV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardSetVersions/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limit.map { [$0] }))
    }
}

public enum GetGameCenterLeaderboardSetVersionsV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardSetLocalizations
        case gameCenterLeaderboardSetLocalizations([GameCenterLeaderboardSetLocalizations])
        /// The fields to include for returned resources of type gameCenterLeaderboardSetVersions
        case gameCenterLeaderboardSetVersions([GameCenterLeaderboardSetVersions])

        public enum GameCenterLeaderboardSetLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case image
            case locale
            case name
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterLeaderboardSetLocalizations(rawValue: string) {
                    self = value
                } else if let value = GameCenterLeaderboardSetLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterLeaderboardSetLocalizations value: \(string)"
                    )
                }
            }
        }

        public enum GameCenterLeaderboardSetVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case leaderboardSet
            case localizations
            case state
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterLeaderboardSetVersions(rawValue: string) {
                    self = value
                } else if let value = GameCenterLeaderboardSetVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterLeaderboardSetVersions value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case leaderboardSet
        case localizations
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related localizations returned (when they are included) - maximum 50
        case localizations(Int)
    }
}
