import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read leaderboard image information
     Get information about a leaderboard image and its upload and processing status.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/read_leaderboard_image_information>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterLeaderboardImageV1(id: String,
                                                fields: [GetGameCenterLeaderboardImageV1.Field]? = nil,
                                                includes: [GetGameCenterLeaderboardImageV1.Include]? = nil) -> Request<GameCenterLeaderboardImageResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterLeaderboardImages/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                             includes: includes))
    }
}

public enum GetGameCenterLeaderboardImageV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardImages
        case gameCenterLeaderboardImages([GameCenterLeaderboardImages])

        public enum GameCenterLeaderboardImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case fileName
            case fileSize
            case gameCenterLeaderboardLocalization
            case imageAsset
            case uploadOperations
            case uploaded
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterLeaderboardLocalization
    }
}
