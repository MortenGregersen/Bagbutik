import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all localizations for a challenge version
     Get details about the default localization for a specific Game Center challenge version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterChallengeVersions-_id_-localizations>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLocalizationsForGameCenterChallengeVersionV1(id: String,
                                                                 fields: [ListLocalizationsForGameCenterChallengeVersionV1.Field]? = nil,
                                                                 includes: [ListLocalizationsForGameCenterChallengeVersionV1.Include]? = nil,
                                                                 limit: Int? = nil) -> Request<GameCenterChallengeLocalizationsResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallengeVersions/\(id)/localizations",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limit: limit))
    }
}

public enum ListLocalizationsForGameCenterChallengeVersionV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterChallengeImages
        case gameCenterChallengeImages([GameCenterChallengeImages])
        /// The fields to include for returned resources of type gameCenterChallengeLocalizations
        case gameCenterChallengeLocalizations([GameCenterChallengeLocalizations])
        /// The fields to include for returned resources of type gameCenterChallengeVersions
        case gameCenterChallengeVersions([GameCenterChallengeVersions])

        public enum GameCenterChallengeImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case fileName
            case fileSize
            case imageAsset
            case uploadOperations
        }

        public enum GameCenterChallengeLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case description
            case image
            case locale
            case name
            case version
        }

        public enum GameCenterChallengeVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case challenge
            case defaultImage
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
