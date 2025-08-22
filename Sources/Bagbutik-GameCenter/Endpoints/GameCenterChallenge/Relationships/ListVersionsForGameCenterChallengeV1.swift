import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read the versions for a challenge
     Get a list of versions for a specific Game Center challenge.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterChallenges-_id_-versions>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVersionsForGameCenterChallengeV1(id: String,
                                                     fields: [ListVersionsForGameCenterChallengeV1.Field]? = nil,
                                                     includes: [ListVersionsForGameCenterChallengeV1.Include]? = nil,
                                                     limits: [ListVersionsForGameCenterChallengeV1.Limit]? = nil) -> Request<GameCenterChallengeVersionsResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterChallenges/\(id)/versions",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum ListVersionsForGameCenterChallengeV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterChallengeImages
        case gameCenterChallengeImages([GameCenterChallengeImages])
        /// The fields to include for returned resources of type gameCenterChallengeLocalizations
        case gameCenterChallengeLocalizations([GameCenterChallengeLocalizations])
        /// The fields to include for returned resources of type gameCenterChallengeVersionReleases
        case gameCenterChallengeVersionReleases([GameCenterChallengeVersionReleases])
        /// The fields to include for returned resources of type gameCenterChallengeVersions
        case gameCenterChallengeVersions([GameCenterChallengeVersions])
        /// The fields to include for returned resources of type gameCenterChallenges
        case gameCenterChallenges([GameCenterChallenges])

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

        public enum GameCenterChallengeVersionReleases: String, Sendable, ParameterValue, Codable, CaseIterable {
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterChallengeVersionReleases(rawValue: string) {
                    self = value
                } else if let value = GameCenterChallengeVersionReleases(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterChallengeVersionReleases value: \(string)"
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

        public enum GameCenterChallenges: String, Sendable, ParameterValue, Codable, CaseIterable {
            case allowedDurations
            case archived
            case challengeType
            case gameCenterDetail
            case gameCenterGroup
            case leaderboard
            case referenceName
            case repeatable
            case vendorIdentifier
            case versions

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterChallenges(rawValue: string) {
                    self = value
                } else if let value = GameCenterChallenges(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterChallenges value: \(string)"
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
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related localizations returned (when they are included) - maximum 50
        case localizations(Int)
        /// Maximum number of related releases returned (when they are included) - maximum 50
        case releases(Int)
    }
}
