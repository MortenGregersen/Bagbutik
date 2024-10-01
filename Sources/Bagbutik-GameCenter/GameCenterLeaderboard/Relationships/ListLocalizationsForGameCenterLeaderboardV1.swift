import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all localizations for a leaderboard
     Get a list of localized metadata for a leaderboard.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_localizations_for_a_leaderboard>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLocalizationsForGameCenterLeaderboardV1(id: String,
                                                            fields: [ListLocalizationsForGameCenterLeaderboardV1.Field]? = nil,
                                                            includes: [ListLocalizationsForGameCenterLeaderboardV1.Include]? = nil,
                                                            limit: Int? = nil) -> Request<GameCenterLeaderboardLocalizationsResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboards/\(id)/localizations", method: .get, parameters: .init(fields: fields,
                                                                                                      includes: includes,
                                                                                                      limit: limit))
    }
}

public enum ListLocalizationsForGameCenterLeaderboardV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardImages
        case gameCenterLeaderboardImages([GameCenterLeaderboardImages])
        /// The fields to include for returned resources of type gameCenterLeaderboardLocalizations
        case gameCenterLeaderboardLocalizations([GameCenterLeaderboardLocalizations])
        /// The fields to include for returned resources of type gameCenterLeaderboards
        case gameCenterLeaderboards([GameCenterLeaderboards])

        public enum GameCenterLeaderboardImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case fileName
            case fileSize
            case gameCenterLeaderboardLocalization
            case imageAsset
            case uploadOperations
            case uploaded
        }

        public enum GameCenterLeaderboardLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case formatterOverride
            case formatterSuffix
            case formatterSuffixSingular
            case gameCenterLeaderboard
            case gameCenterLeaderboardImage
            case locale
            case name
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
        case gameCenterLeaderboard
        case gameCenterLeaderboardImage
    }
}
