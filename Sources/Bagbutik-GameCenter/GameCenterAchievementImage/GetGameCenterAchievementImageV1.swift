import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read achievement image information
     Get information about an achievement image and its upload and processing status.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_achievement_image_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterAchievementImageV1(id: String,
                                                fields: [GetGameCenterAchievementImageV1.Field]? = nil,
                                                includes: [GetGameCenterAchievementImageV1.Include]? = nil) -> Request<GameCenterAchievementImageResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterAchievementImages/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                             includes: includes))
    }
}

public enum GetGameCenterAchievementImageV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterAchievementImages
        case gameCenterAchievementImages([GameCenterAchievementImages])

        public enum GameCenterAchievementImages: String, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case fileName
            case fileSize
            case gameCenterAchievementLocalization
            case imageAsset
            case uploadOperations
            case uploaded
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterAchievementLocalization
    }
}
