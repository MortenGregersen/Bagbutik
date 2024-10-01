import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the image associated with a leaderboard set localization
     Get information about a leaderboard set image associated with a leaderboard set localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_image_associated_with_a_leaderboard_set_localization>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterLeaderboardSetImageForGameCenterLeaderboardSetLocalizationV1(id: String,
                                                                                          fields: [GetGameCenterLeaderboardSetImageForGameCenterLeaderboardSetLocalizationV1.Field]? = nil,
                                                                                          includes: [GetGameCenterLeaderboardSetImageForGameCenterLeaderboardSetLocalizationV1.Include]? = nil) -> Request<GameCenterLeaderboardSetImageResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboardSetLocalizations/\(id)/gameCenterLeaderboardSetImage", method: .get, parameters: .init(fields: fields,
                                                                                                                                     includes: includes))
    }
}

public enum GetGameCenterLeaderboardSetImageForGameCenterLeaderboardSetLocalizationV1 {
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
        case gameCenterLeaderboardSetLocalization
    }
}
