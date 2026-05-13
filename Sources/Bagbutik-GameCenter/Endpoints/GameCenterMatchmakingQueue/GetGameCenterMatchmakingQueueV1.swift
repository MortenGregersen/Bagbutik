import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read Queue Information
     Get information about a specific queue and its related objects.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/get-v1-gameCenterMatchmakingQueues-_id_>

     - Parameter id: The id of the requested resource
     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func getGameCenterMatchmakingQueueV1(id: String,
                                                fields: [GetGameCenterMatchmakingQueueV1.Field]? = nil,
                                                includes: [GetGameCenterMatchmakingQueueV1.Include]? = nil) -> Request<GameCenterMatchmakingQueueResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterMatchmakingQueues/\(id)",
            method: .get,
            parameters: .init(
                fields: fields,
                includes: includes))
    }
}

public enum GetGameCenterMatchmakingQueueV1 {
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
