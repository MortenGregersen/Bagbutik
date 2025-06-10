import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Read queue information
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

        public enum GameCenterMatchmakingQueues: String, Sendable, ParameterValue, Codable, CaseIterable {
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
