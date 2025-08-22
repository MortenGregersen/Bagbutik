import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read challenge localization information
     Get information for a specific Game Center challenge localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterChallengeLocalizations-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterChallengeLocalizationV1(id: String,
                                                     fields: [GetGameCenterChallengeLocalizationV1.Field]? = nil,
                                                     includes: [GetGameCenterChallengeLocalizationV1.Include]? = nil) -> Request<GameCenterChallengeLocalizationResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallengeLocalizations/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetGameCenterChallengeLocalizationV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterChallengeImages
        case gameCenterChallengeImages([GameCenterChallengeImages])
        /// The fields to include for returned resources of type gameCenterChallengeLocalizations
        case gameCenterChallengeLocalizations([GameCenterChallengeLocalizations])

        public enum GameCenterChallengeImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case fileName
            case fileSize
            case imageAsset
            case uploadOperations

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterChallengeImages(rawValue: string) {
                    self = value
                } else if let value = GameCenterChallengeImages(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterChallengeImages value: \(string)"
                    )
                }
            }
        }

        public enum GameCenterChallengeLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case description
            case image
            case locale
            case name
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterChallengeLocalizations(rawValue: string) {
                    self = value
                } else if let value = GameCenterChallengeLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterChallengeLocalizations value: \(string)"
                    )
                }
            }
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
