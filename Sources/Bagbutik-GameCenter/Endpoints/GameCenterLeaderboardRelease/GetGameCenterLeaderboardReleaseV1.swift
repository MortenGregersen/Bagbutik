import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read leaderboard release information
     Read the state of a specific leaderboard release.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterLeaderboardReleases-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterLeaderboardReleaseV1(id: String,
                                                  fields: [GetGameCenterLeaderboardReleaseV1.Field]? = nil,
                                                  includes: [GetGameCenterLeaderboardReleaseV1.Include]? = nil) -> Request<GameCenterLeaderboardReleaseResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardReleases/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetGameCenterLeaderboardReleaseV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardReleases
        case gameCenterLeaderboardReleases([GameCenterLeaderboardReleases])

        public enum GameCenterLeaderboardReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterDetail
            case gameCenterLeaderboard
            case live

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterLeaderboardReleases(rawValue: string) {
                    self = value
                } else if let value = GameCenterLeaderboardReleases(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterLeaderboardReleases value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterDetail
        case gameCenterLeaderboard
    }
}
