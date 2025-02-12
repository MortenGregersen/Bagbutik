import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Modify a queue
     Update the properties of a specific queue.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterMatchmakingQueues-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterMatchmakingQueue representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterMatchmakingQueueV1(id: String,
                                                   requestBody: GameCenterMatchmakingQueueUpdateRequest) -> Request<GameCenterMatchmakingQueueResponse, ErrorResponse>
    {
        .init(path: "/v1/gameCenterMatchmakingQueues/\(id)", method: .patch, requestBody: requestBody)
    }
}
