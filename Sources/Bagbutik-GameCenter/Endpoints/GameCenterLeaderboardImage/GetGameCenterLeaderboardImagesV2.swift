import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Game Center leaderboard image information
     Get information about a specific Game Center leaderboard image.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterLeaderboardImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterLeaderboardImagesV2(id: String,
                                                 fields: [GetGameCenterLeaderboardImagesV2.Field]? = nil,
                                                 includes: [GetGameCenterLeaderboardImagesV2.Include]? = nil) -> Request<GameCenterLeaderboardImageV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardImages/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetGameCenterLeaderboardImagesV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardImages
        case gameCenterLeaderboardImages([GameCenterLeaderboardImages])

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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case localization
    }
}
