import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Delete a queue
     Delete a specific queue in a rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/delete_a_queue>

     - Parameter id: The id of the requested resource
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func deleteGameCenterMatchmakingQueueV1(id: String) -> Request<EmptyResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterMatchmakingQueues/\(id)", method: .delete)
    }
}
