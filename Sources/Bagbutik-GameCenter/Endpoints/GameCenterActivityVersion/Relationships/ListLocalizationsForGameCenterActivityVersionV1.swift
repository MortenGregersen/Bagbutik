import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all localizations for an activity version
     Get details about the default localization for a specific Game Center activity version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterActivityVersions-_id_-localizations>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLocalizationsForGameCenterActivityVersionV1(id: String,
                                                                fields: [ListLocalizationsForGameCenterActivityVersionV1.Field]? = nil,
                                                                includes: [ListLocalizationsForGameCenterActivityVersionV1.Include]? = nil,
                                                                limit: Int? = nil) -> Request<GameCenterActivityLocalizationsResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivityVersions/\(id)/localizations",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limit: limit))
    }
}

public enum ListLocalizationsForGameCenterActivityVersionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterActivityImages
        case gameCenterActivityImages([GameCenterActivityImages])
        /// The fields to include for returned resources of type gameCenterActivityLocalizations
        case gameCenterActivityLocalizations([GameCenterActivityLocalizations])
        /// The fields to include for returned resources of type gameCenterActivityVersions
        case gameCenterActivityVersions([GameCenterActivityVersions])

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

        public enum GameCenterActivityVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case activity
            case defaultImage
            case fallbackUrl
            case localizations
            case releases
            case state
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
