import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read leaderboard set localization information
     Get information about a leaderboard set localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_leaderboard_set_localization_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterLeaderboardSetLocalizationV1(id: String,
                                                          fields: [GetGameCenterLeaderboardSetLocalizationV1.Field]? = nil,
                                                          includes: [GetGameCenterLeaderboardSetLocalizationV1.Include]? = nil) -> Request<GameCenterLeaderboardSetLocalizationResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboardSetLocalizations/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                       includes: includes))
    }
}

public enum GetGameCenterLeaderboardSetLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardSetImages
        case gameCenterLeaderboardSetImages([GameCenterLeaderboardSetImages])
        /// The fields to include for returned resources of type gameCenterLeaderboardSetLocalizations
        case gameCenterLeaderboardSetLocalizations([GameCenterLeaderboardSetLocalizations])

        public enum GameCenterLeaderboardSetImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case fileName
            case fileSize
            case gameCenterLeaderboardSetLocalization
            case imageAsset
            case uploadOperations
            case uploaded
        }

        public enum GameCenterLeaderboardSetLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterLeaderboardSet
            case gameCenterLeaderboardSetImage
            case locale
            case name
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
