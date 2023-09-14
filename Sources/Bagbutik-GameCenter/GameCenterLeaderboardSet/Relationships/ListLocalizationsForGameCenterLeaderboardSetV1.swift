import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all localizations for a leaderboard set
     Get a list of localized metadata for a leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_localizations_for_a_leaderboard_set>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLocalizationsForGameCenterLeaderboardSetV1(id: String,
                                                               fields: [ListLocalizationsForGameCenterLeaderboardSetV1.Field]? = nil,
                                                               includes: [ListLocalizationsForGameCenterLeaderboardSetV1.Include]? = nil,
                                                               limit: Int? = nil) -> Request<GameCenterLeaderboardSetLocalizationsResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboardSets/\(id)/localizations", method: .get, parameters: .init(fields: fields,
                                                                                                         includes: includes,
                                                                                                         limit: limit))
    }
}

public enum ListLocalizationsForGameCenterLeaderboardSetV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardSetImages
        case gameCenterLeaderboardSetImages([GameCenterLeaderboardSetImages])
        /// The fields to include for returned resources of type gameCenterLeaderboardSetLocalizations
        case gameCenterLeaderboardSetLocalizations([GameCenterLeaderboardSetLocalizations])
        /// The fields to include for returned resources of type gameCenterLeaderboardSets
        case gameCenterLeaderboardSets([GameCenterLeaderboardSets])

        public enum GameCenterLeaderboardSetImages: String, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case fileName
            case fileSize
            case gameCenterLeaderboardSetLocalization
            case imageAsset
            case uploadOperations
            case uploaded
        }

        public enum GameCenterLeaderboardSetLocalizations: String, ParameterValue, Codable, CaseIterable {
            case gameCenterLeaderboardSet
            case gameCenterLeaderboardSetImage
            case locale
            case name
        }

        public enum GameCenterLeaderboardSets: String, ParameterValue, Codable, CaseIterable {
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
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterLeaderboardSet
        case gameCenterLeaderboardSetImage
    }
}
