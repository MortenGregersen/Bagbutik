import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all localizations for a leaderboard set
     Get a list of localized metadata for a leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterLeaderboardSets-_id_-localizations>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listLocalizationsForGameCenterLeaderboardSetV1(id: String,
                                                               fields: [ListLocalizationsForGameCenterLeaderboardSetV1.Field]? = nil,
                                                               includes: [ListLocalizationsForGameCenterLeaderboardSetV1.Include]? = nil,
                                                               limit: Int? = nil) -> Request<GameCenterLeaderboardSetLocalizationsResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardSets/\(id)/localizations",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limit: limit))
    }
}

public enum ListLocalizationsForGameCenterLeaderboardSetV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardSetImages
        case gameCenterLeaderboardSetImages([GameCenterLeaderboardSetImages])
        /// The fields to include for returned resources of type gameCenterLeaderboardSetLocalizations
        case gameCenterLeaderboardSetLocalizations([GameCenterLeaderboardSetLocalizations])
        /// The fields to include for returned resources of type gameCenterLeaderboardSets
        case gameCenterLeaderboardSets([GameCenterLeaderboardSets])

        public enum GameCenterLeaderboardSetImages: String, Sendable, ParameterValue, Codable, CaseIterable {
            case assetDeliveryState
            case fileName
            case fileSize
            case gameCenterLeaderboardSetLocalization
            case imageAsset
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
            case gameCenterLeaderboardSet
            case gameCenterLeaderboardSetImage
            case locale
            case name

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

        public enum GameCenterLeaderboardSets: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterDetail
            case gameCenterGroup
            case gameCenterLeaderboards
            case groupLeaderboardSet
            case localizations
            case referenceName
            case releases
            case vendorIdentifier

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterLeaderboardSets(rawValue: string) {
                    self = value
                } else if let value = GameCenterLeaderboardSets(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterLeaderboardSets value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterLeaderboardSet
        case gameCenterLeaderboardSetImage
    }
}
