import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read leaderboard set release information
     List all leaderboard set releases for a Game Center detail.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterDetails-_id_-leaderboardSetReleases>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLeaderboardSetReleasesForGameCenterDetailV1(id: String,
                                                                fields: [ListLeaderboardSetReleasesForGameCenterDetailV1.Field]? = nil,
                                                                filters: [ListLeaderboardSetReleasesForGameCenterDetailV1.Filter]? = nil,
                                                                includes: [ListLeaderboardSetReleasesForGameCenterDetailV1.Include]? = nil,
                                                                limit: Int? = nil) -> Request<GameCenterLeaderboardSetReleasesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterDetails/\(id)/leaderboardSetReleases",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limit: limit))
    }
}

public enum ListLeaderboardSetReleasesForGameCenterDetailV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterDetails
        case gameCenterDetails([GameCenterDetails])
        /// The fields to include for returned resources of type gameCenterLeaderboardSetReleases
        case gameCenterLeaderboardSetReleases([GameCenterLeaderboardSetReleases])
        /// The fields to include for returned resources of type gameCenterLeaderboardSets
        case gameCenterLeaderboardSets([GameCenterLeaderboardSets])

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

        public enum GameCenterLeaderboardSetReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterDetail
            case gameCenterLeaderboardSet
            case live
        }

        public enum GameCenterLeaderboardSets: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterDetail
            case gameCenterGroup
            case gameCenterLeaderboards
            case groupLeaderboardSet
            case localizations
            case referenceName
            case releases
            case vendorIdentifier
        }
    }

    /**
     Attributes, relationships, and IDs by which to filter.
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'gameCenterLeaderboardSet'
        case gameCenterLeaderboardSet([String])
        /// Filter by attribute 'live'
        case live([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterDetail
        case gameCenterLeaderboardSet
    }
}
