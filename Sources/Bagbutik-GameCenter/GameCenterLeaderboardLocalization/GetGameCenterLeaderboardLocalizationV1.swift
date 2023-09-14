import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read leaderboard localization information
     Get information about a leaderboard localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_leaderboard_localization_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterLeaderboardLocalizationV1(id: String,
                                                       fields: [GetGameCenterLeaderboardLocalizationV1.Field]? = nil,
                                                       includes: [GetGameCenterLeaderboardLocalizationV1.Include]? = nil) -> Request<GameCenterLeaderboardLocalizationResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboardLocalizations/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                                    includes: includes))
    }
}

public enum GetGameCenterLeaderboardLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardImages
        case gameCenterLeaderboardImages([GameCenterLeaderboardImages])
        /// The fields to include for returned resources of type gameCenterLeaderboardLocalizations
        case gameCenterLeaderboardLocalizations([GameCenterLeaderboardLocalizations])

        public enum GameCenterLeaderboardImages: String, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case fileName
            case fileSize
            case gameCenterLeaderboardLocalization
            case imageAsset
            case uploadOperations
            case uploaded
        }

        public enum GameCenterLeaderboardLocalizations: String, ParameterValue, Codable, CaseIterable {
            case formatterOverride
            case formatterSuffix
            case formatterSuffixSingular
            case gameCenterLeaderboard
            case gameCenterLeaderboardImage
            case locale
            case name
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
