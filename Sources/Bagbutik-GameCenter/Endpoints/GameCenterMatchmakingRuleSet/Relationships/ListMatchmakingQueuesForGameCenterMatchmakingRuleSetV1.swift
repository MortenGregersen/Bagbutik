import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List queues in a rule set
     Get information about queues that belong to a rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterMatchmakingRuleSets-_id_-matchmakingQueues>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listMatchmakingQueuesForGameCenterMatchmakingRuleSetV1(id: String,
                                                                       fields: [ListMatchmakingQueuesForGameCenterMatchmakingRuleSetV1.Field]? = nil,
                                                                       includes: [ListMatchmakingQueuesForGameCenterMatchmakingRuleSetV1.Include]? = nil,
                                                                       limit: Int? = nil) -> Request<GameCenterMatchmakingQueuesResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterMatchmakingRuleSets/\(id)/matchmakingQueues",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes,
                limit: limit))
    }
}

public enum ListMatchmakingQueuesForGameCenterMatchmakingRuleSetV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterMatchmakingQueues
        case gameCenterMatchmakingQueues([GameCenterMatchmakingQueues])
        /// The fields to include for returned resources of type gameCenterMatchmakingRuleSets
        case gameCenterMatchmakingRuleSets([GameCenterMatchmakingRuleSets])

        public enum GameCenterMatchmakingQueues: String, Sendable, ParameterValue, Codable, CaseIterable {
            case classicMatchmakingBundleIds
            case experimentRuleSet
            case referenceName
            case ruleSet

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterMatchmakingQueues(rawValue: string) {
                    self = value
                } else if let value = GameCenterMatchmakingQueues(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterMatchmakingQueues value: \(string)"
                    )
                }
            }
        }

        public enum GameCenterMatchmakingRuleSets: String, Sendable, ParameterValue, Codable, CaseIterable {
            case matchmakingQueues
            case maxPlayers
            case minPlayers
            case referenceName
            case ruleLanguageVersion
            case rules
            case teams

            public init(from decoder: Decoder) throws {
                let container = try decoder.singleValueContainer()
                let string = try container.decode(String.self)
                if let value = GameCenterMatchmakingRuleSets(rawValue: string) {
                    self = value
                } else if let value = GameCenterMatchmakingRuleSets(rawValue: string.uppercased()) {
                    self = value
                } else {
                    throw DecodingError.dataCorruptedError(
                        in: container,
                        debugDescription: "Invalid GameCenterMatchmakingRuleSets value: \(string)"
                    )
                }
            }
        }
    }

    /**
     Relationship data to include in the response.
     */
    public enum Include: String, IncludeParameter, CaseIterable {
        case experimentRuleSet
        case ruleSet
    }
}
