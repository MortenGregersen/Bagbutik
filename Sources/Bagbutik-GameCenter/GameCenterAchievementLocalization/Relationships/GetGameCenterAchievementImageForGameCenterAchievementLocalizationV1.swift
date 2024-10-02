import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the image for a specific achievement localization
     Read the achievement image associated with specific localized information.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterAchievementLocalizations-_id_-gameCenterAchievementImage>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterAchievementImageForGameCenterAchievementLocalizationV1(id: String,
                                                                                    fields: [GetGameCenterAchievementImageForGameCenterAchievementLocalizationV1.Field]? = nil,
                                                                                    includes: [GetGameCenterAchievementImageForGameCenterAchievementLocalizationV1.Include]? = nil) -> Request<GameCenterAchievementImageResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterAchievementLocalizations/\(id)/gameCenterAchievementImage", method: .get, parameters: .init(fields: fields,
                                                                                                                               includes: includes))
    }
}

public enum GetGameCenterAchievementImageForGameCenterAchievementLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterAchievementImages
        case gameCenterAchievementImages([GameCenterAchievementImages])
        /// The fields to include for returned resources of type gameCenterAchievementLocalizations
        case gameCenterAchievementLocalizations([GameCenterAchievementLocalizations])

        public enum GameCenterAchievementImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case fileName
            case fileSize
            case gameCenterAchievementLocalization
            case imageAsset
            case uploadOperations
            case uploaded
        }

        public enum GameCenterAchievementLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case afterEarnedDescription
            case beforeEarnedDescription
            case gameCenterAchievement
            case gameCenterAchievementImage
            case locale
            case name
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterAchievementLocalization
    }
}
