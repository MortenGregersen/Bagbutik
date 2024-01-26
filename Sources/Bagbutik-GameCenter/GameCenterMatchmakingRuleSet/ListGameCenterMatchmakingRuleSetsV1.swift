import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all rule sets
     Get information about all rule sets and their associated objects.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_rule_sets>

     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limits: Number of resources to return
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterMatchmakingRuleSetsV1(fields: [ListGameCenterMatchmakingRuleSetsV1.Field]? = nil,
                                                    includes: [ListGameCenterMatchmakingRuleSetsV1.Include]? = nil,
                                                    limits: [ListGameCenterMatchmakingRuleSetsV1.Limit]? = nil) -> Request<GameCenterMatchmakingRuleSetsResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterMatchmakingRuleSets", method: .get, parameters: .init(fields: fields,
                                                                                         includes: includes,
                                                                                         limits: limits))
    }
}

public enum ListGameCenterMatchmakingRuleSetsV1 {
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

        public enum GameCenterMatchmakingQueues: String, ParameterValue, Codable, CaseIterable {
            case classicMatchmakingBundleIds
            case experimentRuleSet
            case referenceName
            case ruleSet
        }

        public enum GameCenterMatchmakingRuleSets: String, ParameterValue, Codable, CaseIterable {
            case matchmakingQueues
            case maxPlayers
            case minPlayers
            case referenceName
            case ruleLanguageVersion
            case rules
            case teams
        }

        public enum GameCenterMatchmakingRules: String, ParameterValue, Codable, CaseIterable {
            case description
            case expression
            case referenceName
            case ruleSet
            case type
            case weight
        }

        public enum GameCenterMatchmakingTeams: String, ParameterValue, Codable, CaseIterable {
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
        /// Maximum resources per page - maximum 200
        case limit(Int)
        /// Maximum number of related matchmakingQueues returned (when they are included) - maximum 50
        case matchmakingQueues(Int)
        /// Maximum number of related rules returned (when they are included) - maximum 50
        case rules(Int)
        /// Maximum number of related teams returned (when they are included) - maximum 50
        case teams(Int)
    }
}
