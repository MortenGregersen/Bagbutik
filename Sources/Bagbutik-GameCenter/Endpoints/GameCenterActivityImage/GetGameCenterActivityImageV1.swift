import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read activity image information 
     Get information for a specific Game Center activity image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterActivityImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterActivityImageV1(id: String,
                                             fields: [GetGameCenterActivityImageV1.Field]? = nil) -> Request<GameCenterActivityImageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityImages/\(id)",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetGameCenterActivityImageV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterActivityImages
        case gameCenterActivityImages([GameCenterActivityImages])

        public enum GameCenterActivityImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case fileName
            case fileSize
            case imageAsset
            case uploadOperations
        }
    }
}
