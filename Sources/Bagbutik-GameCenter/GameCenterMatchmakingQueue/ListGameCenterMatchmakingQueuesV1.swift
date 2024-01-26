import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # List all queues
     Get information about all queues.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/list_all_queues>

     - Parameter fields: Fields to return for included related types
     - Parameter includes: Relationship data to include in the response
     - Parameter limit: Maximum resources per page - maximum 200
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func listGameCenterMatchmakingQueuesV1(fields: [ListGameCenterMatchmakingQueuesV1.Field]? = nil,
                                                  includes: [ListGameCenterMatchmakingQueuesV1.Include]? = nil,
                                                  limit: Int? = nil) -> Request<GameCenterMatchmakingQueuesResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterMatchmakingQueues", method: .get, parameters: .init(fields: fields,
                                                                                       includes: includes,
                                                                                       limit: limit))
    }
}

public enum ListGameCenterMatchmakingQueuesV1 {
    /**
     Fields to return for included related types.
     */
    public enum Field: FieldParameter {
        /// The fields to include for returned resources of type gameCenterMatchmakingQueues
        case gameCenterMatchmakingQueues([GameCenterMatchmakingQueues])

        public enum GameCenterMatchmakingQueues: String, ParameterValue, Codable, CaseIterable {
            case classicMatchmakingBundleIds
            case experimentRuleSet
            case referenceName
            case ruleSet
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
