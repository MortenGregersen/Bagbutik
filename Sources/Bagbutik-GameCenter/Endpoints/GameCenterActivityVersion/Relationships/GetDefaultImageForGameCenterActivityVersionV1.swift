import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read default image information for an activity version
     Get details about the default image for a specific Game Center activity version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterActivityVersions-_id_-defaultImage>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getDefaultImageForGameCenterActivityVersionV1(id: String,
                                                              fields: [GetDefaultImageForGameCenterActivityVersionV1.Field]? = nil) -> Request<GameCenterActivityImageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityVersions/\(id)/defaultImage",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetDefaultImageForGameCenterActivityVersionV1 {
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
