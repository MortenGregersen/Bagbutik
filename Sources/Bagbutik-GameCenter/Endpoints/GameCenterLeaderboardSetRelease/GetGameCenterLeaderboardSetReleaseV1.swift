import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read leaderboard set release information
     Get information about a leaderboard set release.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterLeaderboardSetReleases-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterLeaderboardSetReleaseV1(id: String,
                                                     fields: [GetGameCenterLeaderboardSetReleaseV1.Field]? = nil,
                                                     includes: [GetGameCenterLeaderboardSetReleaseV1.Include]? = nil) -> Request<GameCenterLeaderboardSetReleaseResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardSetReleases/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetGameCenterLeaderboardSetReleaseV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardSetReleases
        case gameCenterLeaderboardSetReleases([GameCenterLeaderboardSetReleases])

        public enum GameCenterLeaderboardSetReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterDetail
            case gameCenterLeaderboardSet
            case live
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterDetail
        case gameCenterLeaderboardSet
    }
}
