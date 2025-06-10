import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read leaderboard set member localization information
     Get information about leaderboard member set localizations.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterLeaderboardSetMemberLocalizations>

     - Parameter fields: Fields to return for included related types
     - Parameter filters: Attributes, relationships, and IDs by which to filter
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterLeaderboardSetMemberLocalizationsV1(fields: [ListGameCenterLeaderboardSetMemberLocalizationsV1.Field]? = nil,
                                                                  filters: [ListGameCenterLeaderboardSetMemberLocalizationsV1.Filter]? = nil,
                                                                  includes: [ListGameCenterLeaderboardSetMemberLocalizationsV1.Include]? = nil,
                                                                  limit: Int? = nil) -> Request<GameCenterLeaderboardSetMemberLocalizationsResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardSetMemberLocalizations",
            method: .get,
            parameters: .init(
                fields: fields,
                filters: filters,
                includes: includes,
                limit: limit))
    }
}

public enum ListGameCenterLeaderboardSetMemberLocalizationsV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardSetMemberLocalizations
        case gameCenterLeaderboardSetMemberLocalizations([GameCenterLeaderboardSetMemberLocalizations])
        /// The fields to include for returned resources of type gameCenterLeaderboardSets
        case gameCenterLeaderboardSets([GameCenterLeaderboardSets])
        /// The fields to include for returned resources of type gameCenterLeaderboards
        case gameCenterLeaderboards([GameCenterLeaderboards])

        public enum GameCenterLeaderboardSetMemberLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterLeaderboard
            case gameCenterLeaderboardSet
            case locale
            case name
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
     Attributes, relationships, and IDs by which to filter.

     Required: `gameCenterLeaderboardSet`, `gameCenterLeaderboard`
     */
    public enum Filter: FilterParameter {
        /// Filter by id(s) of related 'gameCenterLeaderboard'
        case gameCenterLeaderboard([String])
        /// Filter by id(s) of related 'gameCenterLeaderboardSet'
        case gameCenterLeaderboardSet([String])
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterLeaderboard
        case gameCenterLeaderboardSet
    }
}
