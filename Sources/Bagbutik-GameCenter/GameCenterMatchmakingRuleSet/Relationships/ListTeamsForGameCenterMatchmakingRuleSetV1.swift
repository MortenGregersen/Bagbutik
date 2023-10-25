import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List teams in a rule set
     Get information about the teams in a rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_teams_in_a_rule_set>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listTeamsForGameCenterMatchmakingRuleSetV1(id: String,
                                                           fields: [ListTeamsForGameCenterMatchmakingRuleSetV1.Field]? = nil,
                                                           limit: Int? = nil) -> Request<GameCenterMatchmakingTeamsResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterMatchmakingRuleSets/\(id)/teams", method: .get, parameters: .init(fields: fields,
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

        public enum GameCenterMatchmakingTeams: String, ParameterValue, Codable, CaseIterable {
            case maxPlayers
            case minPlayers
            case referenceName
            case ruleSet
        }
    }
}
