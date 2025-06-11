import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read challenge image information
     Get information for a specific Game Center challenge image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterChallengeImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterChallengeImageV1(id: String,
                                              fields: [GetGameCenterChallengeImageV1.Field]? = nil) -> Request<GameCenterChallengeImageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallengeImages/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetGameCenterChallengeImageV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterChallengeImages
        case gameCenterChallengeImages([GameCenterChallengeImages])

        public enum GameCenterChallengeImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case fileName
            case fileSize
            case imageAsset
            case uploadOperations
        }
    }
}
