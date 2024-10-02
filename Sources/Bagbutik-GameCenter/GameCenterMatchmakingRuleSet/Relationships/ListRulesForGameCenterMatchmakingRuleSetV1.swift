import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List rules in a rule set
     Get information about the rules in a rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterMatchmakingRuleSets-_id_-rules>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listRulesForGameCenterMatchmakingRuleSetV1(id: String,
                                                           fields: [ListRulesForGameCenterMatchmakingRuleSetV1.Field]? = nil,
                                                           limit: Int? = nil) -> Request<GameCenterMatchmakingRulesResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterMatchmakingRuleSets/\(id)/rules", method: .get, parameters: .init(fields: fields,
                                                                                                     limit: limit))
    }
}

public enum ListRulesForGameCenterMatchmakingRuleSetV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterMatchmakingRules
        case gameCenterMatchmakingRules([GameCenterMatchmakingRules])

        public enum GameCenterMatchmakingRules: String, Sendable, ParameterValue, Codable, CaseIterable {
            case description
            case expression
            case referenceName
            case ruleSet
            case type
            case weight
        }
    }
}
