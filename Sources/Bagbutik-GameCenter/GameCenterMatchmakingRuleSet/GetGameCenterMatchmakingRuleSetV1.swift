import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read rule set information
     Get information about a specific rule set and its related objects.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterMatchmakingRuleSets-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterMatchmakingRuleSetV1(id: String,
                                                  fields: [GetGameCenterMatchmakingRuleSetV1.Field]? = nil,
                                                  includes: [GetGameCenterMatchmakingRuleSetV1.Include]? = nil,
                                                  limits: [GetGameCenterMatchmakingRuleSetV1.Limit]? = nil) -> Request<GameCenterMatchmakingRuleSetResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterMatchmakingRuleSets/\(id)", method: .get, parameters: .init(fields: fields,
                                                                                               includes: includes,
                                                                                               limits: limits))
    }
}

public enum GetGameCenterMatchmakingRuleSetV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterMatchmakingQueues
        case gameCenterMatchmakingQueues([GameCenterMatchmakingQueues])
        /// The fields to include for returned resources of type gameCenterMatchmakingRuleSets
        case gameCenterMatchmakingRuleSets([GameCenterMatchmakingRuleSets])
        /// The fields to include for returned resources of type gameCenterMatchmakingRules
        case gameCenterMatchmakingRules([GameCenterMatchmakingRules])
        /// The fields to include for returned resources of type gameCenterMatchmakingTeams
        case gameCenterMatchmakingTeams([GameCenterMatchmakingTeams])

        public enum GameCenterMatchmakingQueues: String, Sendable, ParameterValue, Codable, CaseIterable {
            case classicMatchmakingBundleIds
            case experimentRuleSet
            case referenceName
            case ruleSet
        }

        public enum GameCenterMatchmakingRuleSets: String, Sendable, ParameterValue, Codable, CaseIterable {
            case matchmakingQueues
            case maxPlayers
            case minPlayers
            case referenceName
            case ruleLanguageVersion
            case rules
            case teams
        }

        public enum GameCenterMatchmakingRules: String, Sendable, ParameterValue, Codable, CaseIterable {
            case description
            case expression
            case referenceName
            case ruleSet
            case type
            case weight
        }

        public enum GameCenterMatchmakingTeams: String, Sendable, ParameterValue, Codable, CaseIterable {
            case maxPlayers
            case minPlayers
            case referenceName
            case ruleSet
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case matchmakingQueues
        case rules
        case teams
    }

    /**
     Number of included related resources to return.
     */
    public enum Limit: LimitParameter {
        /// Maximum number of related matchmakingQueues returned (when they are included) - maximum 50
        case matchmakingQueues(Int)
        /// Maximum number of related rules returned (when they are included) - maximum 50
        case rules(Int)
        /// Maximum number of related teams returned (when they are included) - maximum 50
        case teams(Int)
    }
}
