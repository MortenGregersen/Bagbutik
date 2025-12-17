import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all images for a Game Center leaderboard localization
     Get a list of images for a specific Game Center leaderboard localization.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterLeaderboardLocalizations-_id_-image>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getImageForGameCenterLeaderboardLocalizationsV2(id: String,
                                                                fields: [GetImageForGameCenterLeaderboardLocalizationsV2.Field]? = nil,
                                                                includes: [GetImageForGameCenterLeaderboardLocalizationsV2.Include]? = nil) -> Request<GameCenterLeaderboardImageV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardLocalizations/\(id)/image",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetImageForGameCenterLeaderboardLocalizationsV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardImages
        case gameCenterLeaderboardImages([GameCenterLeaderboardImages])
        /// The fields to include for returned resources of type gameCenterLeaderboardLocalizations
        case gameCenterLeaderboardLocalizations([GameCenterLeaderboardLocalizations])

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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case localization
    }
}
