import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all versions for a Game Center leaderboard set
     Get a list of versions for a specific Game Center leaderboard set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v2-gameCenterLeaderboardSets-_id_-versions>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listVersionsForGameCenterLeaderboardSetsV2(id: String,
                                                           fields: [ListVersionsForGameCenterLeaderboardSetsV2.Field]? = nil,
                                                           includes: [ListVersionsForGameCenterLeaderboardSetsV2.Include]? = nil,
                                                           limits: [ListVersionsForGameCenterLeaderboardSetsV2.Limit]? = nil) -> Request<GameCenterLeaderboardSetVersionsV2Response, ErrorResponse> {
        .init(
            path: "/v2/gameCenterLeaderboardSets/\(id)/versions",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limits: limits))
    }
}

public enum ListVersionsForGameCenterLeaderboardSetsV2 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterLeaderboardSetLocalizations
        case gameCenterLeaderboardSetLocalizations([GameCenterLeaderboardSetLocalizations])
        /// The fields to include for returned resources of type gameCenterLeaderboardSetVersions
        case gameCenterLeaderboardSetVersions([GameCenterLeaderboardSetVersions])
        /// The fields to include for returned resources of type gameCenterLeaderboardSets
        case gameCenterLeaderboardSets([GameCenterLeaderboardSets])

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

        public enum GameCenterLeaderboardSets: String, Sendable, ParameterValue, Codable, CaseIterable {
            case gameCenterDetail
            case gameCenterGroup
            case gameCenterLeaderboards
            case referenceName
            case vendorIdentifier
            case versions

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
        case leaderboardSet
        case localizations
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related localizations returned (when they are included) - maximum 50
        case localizations(Int)
    }
}
