import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read activity information
     Get information for a specific Game Center activity.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterActivities-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterActivityV1(id: String,
                                        fields: [GetGameCenterActivityV1.Field]? = nil,
                                        includes: [GetGameCenterActivityV1.Include]? = nil,
                                        limits: [GetGameCenterActivityV1.Limit]? = nil) -> Request<GameCenterActivityResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterActivities/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum GetGameCenterActivityV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterActivities
        case gameCenterActivities([GameCenterActivities])
        /// The fields to include for returned resources of type gameCenterActivityVersions
        case gameCenterActivityVersions([GameCenterActivityVersions])

        public enum GameCenterActivities: String, Sendable, ParameterValue, Codable, CaseIterable {
            case achievements
            case achievementsV2
            case archived
            case gameCenterDetail
            case gameCenterGroup
            case leaderboards
            case leaderboardsV2
            case maximumPlayersCount
            case minimumPlayersCount
            case playStyle
            case properties
            case referenceName
            case supportsPartyCode
            case vendorIdentifier
            case versions

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterActivities(rawValue: string) {
                    self = value
                } else if let value = GameCenterActivities(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterActivities value: \(string)"
                    )
                }
            }
        }

        public enum GameCenterActivityVersions: String, Sendable, ParameterValue, Codable, CaseIterable {
            case activity
            case defaultImage
            case fallbackUrl
            case localizations
            case releases
            case state
            case version

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterActivityVersions(rawValue: string) {
                    self = value
                } else if let value = GameCenterActivityVersions(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterActivityVersions value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case achievements
        case achievementsV2
        case gameCenterDetail
        case gameCenterGroup
        case leaderboards
        case leaderboardsV2
        case versions
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related achievements returned (when they are included) - maximum 50
        case achievements(Int)
        /// Maximum number of related achievementsV2 returned (when they are included) - maximum 50
        case achievementsV2(Int)
        /// Maximum number of related leaderboards returned (when they are included) - maximum 50
        case leaderboards(Int)
        /// Maximum number of related leaderboardsV2 returned (when they are included) - maximum 50
        case leaderboardsV2(Int)
        /// Maximum number of related versions returned (when they are included) - maximum 50
        case versions(Int)
    }
}
