import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all localizations for a Game Center leaderboard version
     Get a list of localizations for a specific Game Center leaderboard version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterLeaderboardVersions-_id_-localizations>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLocalizationsForGameCenterLeaderboardVersionsV2(id: String,
                                                                    fields: [ListLocalizationsForGameCenterLeaderboardVersionsV2.Field]? = nil,
                                                                    includes: [ListLocalizationsForGameCenterLeaderboardVersionsV2.Include]? = nil,
                                                                    limit: Int? = nil) -> Request<GameCenterLeaderboardLocalizationsV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardVersions/\(id)/localizations",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limit: limit))
    }
}

public enum ListLocalizationsForGameCenterLeaderboardVersionsV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardImages
        case gameCenterLeaderboardImages([GameCenterLeaderboardImages])
        /// The fields to include for returned resources of type gameCenterLeaderboardLocalizations
        case gameCenterLeaderboardLocalizations([GameCenterLeaderboardLocalizations])
        /// The fields to include for returned resources of type gameCenterLeaderboardVersions
        case gameCenterLeaderboardVersions([GameCenterLeaderboardVersions])

        public enum GameCenterLeaderboardImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case fileName
            case fileSize
            case imageAsset
            case localization
            case uploadOperations

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterLeaderboardImages(rawValue: string) {
                    self = value
                } else if let value = GameCenterLeaderboardImages(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterLeaderboardImages value: \(string)"
                    )
                }
            }
        }

        public enum GameCenterLeaderboardLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case description
            case formatterOverride
            case formatterSuffix
            case formatterSuffixSingular
            case image
            case locale
            case name
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterLeaderboardLocalizations(rawValue: string) {
                    self = value
                } else if let value = GameCenterLeaderboardLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterLeaderboardLocalizations value: \(string)"
                    )
                }
            }
        }

        public enum GameCenterLeaderboardVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case leaderboard
            case localizations
            case state
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterLeaderboardVersions(rawValue: string) {
                    self = value
                } else if let value = GameCenterLeaderboardVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterLeaderboardVersions value: \(string)"
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
