import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read activity localization information
     Get information for a specific Game Center activity localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterActivityLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterActivityLocalizationV1(id: String,
                                                    fields: [GetGameCenterActivityLocalizationV1.Field]? = nil,
                                                    includes: [GetGameCenterActivityLocalizationV1.Include]? = nil) -> Request<GameCenterActivityLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityLocalizations/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetGameCenterActivityLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterActivityImages
        case gameCenterActivityImages([GameCenterActivityImages])
        /// The fields to include for returned resources of type gameCenterActivityLocalizations
        case gameCenterActivityLocalizations([GameCenterActivityLocalizations])

        public enum GameCenterActivityImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case fileName
            case fileSize
            case imageAsset
            case uploadOperations
        }

        public enum GameCenterActivityLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case description
            case image
            case locale
            case name
            case version
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case image
        case version
    }
}
