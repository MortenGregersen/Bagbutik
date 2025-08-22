import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read leaderboard set image information
     Get information about a leaderboard set image and its upload and processing status.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterLeaderboardSetImages-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterLeaderboardSetImageV1(id: String,
                                                   fields: [GetGameCenterLeaderboardSetImageV1.Field]? = nil,
                                                   includes: [GetGameCenterLeaderboardSetImageV1.Include]? = nil) -> Request<GameCenterLeaderboardSetImageResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterLeaderboardSetImages/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetGameCenterLeaderboardSetImageV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardSetImages
        case gameCenterLeaderboardSetImages([GameCenterLeaderboardSetImages])

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
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case gameCenterLeaderboardSetLocalization
    }
}
