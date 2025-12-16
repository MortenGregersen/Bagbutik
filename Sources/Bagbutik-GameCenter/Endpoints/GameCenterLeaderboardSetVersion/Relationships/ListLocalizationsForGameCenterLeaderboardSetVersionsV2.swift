import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all localizations for a Game Center leaderboard set version
     Get a list of localizations for a specific Game Center leaderboard set version.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterLeaderboardSetVersions-_id_-localizations>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLocalizationsForGameCenterLeaderboardSetVersionsV2(id: String,
                                                                       fields: [ListLocalizationsForGameCenterLeaderboardSetVersionsV2.Field]? = nil,
                                                                       includes: [ListLocalizationsForGameCenterLeaderboardSetVersionsV2.Include]? = nil,
                                                                       limit: Int? = nil) -> Request<GameCenterLeaderboardSetLocalizationsV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardSetVersions/\(id)/localizations",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limit: limit))
    }
}

public enum ListLocalizationsForGameCenterLeaderboardSetVersionsV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardSetImages
        case gameCenterLeaderboardSetImages([GameCenterLeaderboardSetImages])
        /// The fields to include for returned resources of type gameCenterLeaderboardSetLocalizations
        case gameCenterLeaderboardSetLocalizations([GameCenterLeaderboardSetLocalizations])
        /// The fields to include for returned resources of type gameCenterLeaderboardSetVersions
        case gameCenterLeaderboardSetVersions([GameCenterLeaderboardSetVersions])

        public enum GameCenterLeaderboardSetImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case fileName
            case fileSize
            case imageAsset
            case localization
            case uploadOperations

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterLeaderboardSetImages(rawValue: string) {
                    self = value
                } else if let value = GameCenterLeaderboardSetImages(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterLeaderboardSetImages value: \(string)"
                    )
                }
            }
        }

        public enum GameCenterLeaderboardSetLocalizations: String, Sendable, ParameterValue, Codable, CaseIterable {
            case image
            case locale
            case name
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterLeaderboardSetLocalizations(rawValue: string) {
                    self = value
                } else if let value = GameCenterLeaderboardSetLocalizations(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterLeaderboardSetLocalizations value: \(string)"
                    )
                }
            }
        }

        public enum GameCenterLeaderboardSetVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case leaderboardSet
            case localizations
            case state
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterLeaderboardSetVersions(rawValue: string) {
                    self = value
                } else if let value = GameCenterLeaderboardSetVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterLeaderboardSetVersions value: \(string)"
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
