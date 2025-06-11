import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read leaderboard set information
     Read information about a specific leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterLeaderboardSets-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterLeaderboardSetV1(id: String,
                                              fields: [GetGameCenterLeaderboardSetV1.Field]? = nil,
                                              includes: [GetGameCenterLeaderboardSetV1.Include]? = nil,
                                              limits: [GetGameCenterLeaderboardSetV1.Limit]? = nil) -> Request<GameCenterLeaderboardSetResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardSets/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum GetGameCenterLeaderboardSetV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardSetLocalizations
        case gameCenterLeaderboardSetLocalizations([GameCenterLeaderboardSetLocalizations])
        /// The fields to include for returned resources of type gameCenterLeaderboardSetReleases
        case gameCenterLeaderboardSetReleases([GameCenterLeaderboardSetReleases])
        /// The fields to include for returned resources of type gameCenterLeaderboardSets
        case gameCenterLeaderboardSets([GameCenterLeaderboardSets])
        /// The fields to include for returned resources of type gameCenterLeaderboards
        case gameCenterLeaderboards([GameCenterLeaderboards])

        public enum GameCenterLeaderboardSetLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterLeaderboardSet
            case gameCenterLeaderboardSetImage
            case locale
            case name
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

        public enum GameCenterLeaderboards: String, Sendable, ParameterValue, Codable, CaseIterable {
            case activity
            case activityProperties
            case archived
            case challenge
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
            case visibility
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterDetail
        case gameCenterGroup
        case gameCenterLeaderboards
        case groupLeaderboardSet
        case localizations
        case releases
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related gameCenterLeaderboards returned (when they are included) - maximum 50
        case gameCenterLeaderboards(Int)
        /// Maximum number of related localizations returned (when they are included) - maximum 50
        case localizations(Int)
        /// Maximum number of related releases returned (when they are included) - maximum 50
        case releases(Int)
    }
}
