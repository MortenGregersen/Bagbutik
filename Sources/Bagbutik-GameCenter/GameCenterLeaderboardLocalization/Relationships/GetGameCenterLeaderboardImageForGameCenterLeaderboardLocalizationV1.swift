import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the image for a leaderboard localization
     Get information about the image associated with a leaderboard localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_the_image_for_a_leaderboard_localization>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterLeaderboardImageForGameCenterLeaderboardLocalizationV1(id: String,
                                                                                    fields: [GetGameCenterLeaderboardImageForGameCenterLeaderboardLocalizationV1.Field]? = nil,
                                                                                    includes: [GetGameCenterLeaderboardImageForGameCenterLeaderboardLocalizationV1.Include]? = nil) -> Request<GameCenterLeaderboardImageResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboardLocalizations/\(id)/gameCenterLeaderboardImage", method: .get, parameters: .init(fields: fields,
                                                                                                                               includes: includes))
    }
}

public enum GetGameCenterLeaderboardImageForGameCenterLeaderboardLocalizationV1 {
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
        case gameCenterLeaderboardLocalization
    }
}
