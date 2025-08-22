import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read image information for an activity localization
     Get details about the image for a specific Game Center activity localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterActivityLocalizations-_id_-image>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getImageForGameCenterActivityLocalizationV1(id: String,
                                                            fields: [GetImageForGameCenterActivityLocalizationV1.Field]? = nil) -> Request<GameCenterActivityImageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityLocalizations/\(id)/image",
            method: .get,
            parameters: .init(fields: fields))
    }
}

public enum GetImageForGameCenterActivityLocalizationV1 {
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

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterActivityImages(rawValue: string) {
                    self = value
                } else if let value = GameCenterActivityImages(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterActivityImages value: \(string)"
                    )
                }
            }
        }
    }
}
