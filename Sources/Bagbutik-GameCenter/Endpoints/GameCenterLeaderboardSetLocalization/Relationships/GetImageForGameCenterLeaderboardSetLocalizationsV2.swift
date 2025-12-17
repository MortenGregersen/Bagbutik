import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all images for a Game Center leaderboard set localization
     Get a list of images for a specific Game Center leaderboard set localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterLeaderboardSetLocalizations-_id_-image>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getImageForGameCenterLeaderboardSetLocalizationsV2(id: String,
                                                                   fields: [GetImageForGameCenterLeaderboardSetLocalizationsV2.Field]? = nil,
                                                                   includes: [GetImageForGameCenterLeaderboardSetLocalizationsV2.Include]? = nil) -> Request<GameCenterLeaderboardSetImageV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardSetLocalizations/\(id)/image",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetImageForGameCenterLeaderboardSetLocalizationsV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardSetImages
        case gameCenterLeaderboardSetImages([GameCenterLeaderboardSetImages])
        /// The fields to include for returned resources of type gameCenterLeaderboardSetLocalizations
        case gameCenterLeaderboardSetLocalizations([GameCenterLeaderboardSetLocalizations])

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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case localization
    }
}
