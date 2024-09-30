import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read leaderboard information
     Read information about a specific leaderboard.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_leaderboard_information-q4a>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterLeaderboardV1(id: String,
                                           fields: [GetGameCenterLeaderboardV1.Field]? = nil,
                                           includes: [GetGameCenterLeaderboardV1.Include]? = nil,
                                           limits: [GetGameCenterLeaderboardV1.Limit]? = nil) -> Request<GameCenterLeaderboardResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboards/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                        includes: includes,
                                                                                        limits: limits))
    }
}

public enum GetGameCenterLeaderboardV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardLocalizations
        case gameCenterLeaderboardLocalizations([GameCenterLeaderboardLocalizations])
        /// The fields to include for returned resources of type gameCenterLeaderboardReleases
        case gameCenterLeaderboardReleases([GameCenterLeaderboardReleases])
        /// The fields to include for returned resources of type gameCenterLeaderboards
        case gameCenterLeaderboards([GameCenterLeaderboards])

        public enum GameCenterLeaderboardLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case formatterOverride
            case formatterSuffix
            case formatterSuffixSingular
            case gameCenterLeaderboard
            case gameCenterLeaderboardImage
            case locale
            case name
        }

        public enum GameCenterLeaderboardReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterDetail
            case gameCenterLeaderboard
            case live
        }

        public enum GameCenterLeaderboards: String, Sendable, ParameterValue, Codable, CaseIterable {
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
        case gameCenterDetail
        case gameCenterGroup
        case gameCenterLeaderboardSets
        case groupLeaderboard
        case localizations
        case releases
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related gameCenterLeaderboardSets returned (when they are included) - maximum 50
        case gameCenterLeaderboardSets(Int)
        /// Maximum number of related localizations returned (when they are included) - maximum 50
        case localizations(Int)
        /// Maximum number of related releases returned (when they are included) - maximum 50
        case releases(Int)
    }
}
