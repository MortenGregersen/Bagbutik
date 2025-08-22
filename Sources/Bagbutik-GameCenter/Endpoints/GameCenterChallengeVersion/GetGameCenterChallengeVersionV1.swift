import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read challenge version information
     Get information for a specific Game Center challenge localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterChallengeVersions-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterChallengeVersionV1(id: String,
                                                fields: [GetGameCenterChallengeVersionV1.Field]? = nil,
                                                includes: [GetGameCenterChallengeVersionV1.Include]? = nil,
                                                limits: [GetGameCenterChallengeVersionV1.Limit]? = nil) -> Request<GameCenterChallengeVersionResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallengeVersions/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum GetGameCenterChallengeVersionV1 {
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

        public enum GameCenterChallengeVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case challenge
            case defaultImage
            case localizations
            case releases
            case state
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterChallengeVersions(rawValue: string) {
                    self = value
                } else if let value = GameCenterChallengeVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterChallengeVersions value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case challenge
        case defaultImage
        case localizations
        case releases
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related localizations returned (when they are included) - maximum 50
        case localizations(Int)
        /// Maximum number of related releases returned (when they are included) - maximum 50
        case releases(Int)
    }
}
