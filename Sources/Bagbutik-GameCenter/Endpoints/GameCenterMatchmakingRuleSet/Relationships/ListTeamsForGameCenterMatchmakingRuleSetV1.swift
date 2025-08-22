import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List teams in a rule set
     Get information about the teams in a rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterMatchmakingRuleSets-_id_-teams>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listTeamsForGameCenterMatchmakingRuleSetV1(id: String,
                                                           fields: [ListTeamsForGameCenterMatchmakingRuleSetV1.Field]? = nil,
                                                           limit: Int? = nil) -> Request<GameCenterMatchmakingTeamsResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterMatchmakingRuleSets/\(id)/teams",
            method: .get,
            parameters: .init(
                fields: fields,
                limit: limit))
    }
}

public enum ListTeamsForGameCenterMatchmakingRuleSetV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterMatchmakingTeams
        case gameCenterMatchmakingTeams([GameCenterMatchmakingTeams])

        public enum GameCenterMatchmakingTeams: String, Sendable, ParameterValue, Codable, CaseIterable {
            case maxPlayers
            case minPlayers
            case referenceName

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterMatchmakingTeams(rawValue: string) {
                    self = value
                } else if let value = GameCenterMatchmakingTeams(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterMatchmakingTeams value: \(string)"
                    )
                }
            }
        }
    }
}
