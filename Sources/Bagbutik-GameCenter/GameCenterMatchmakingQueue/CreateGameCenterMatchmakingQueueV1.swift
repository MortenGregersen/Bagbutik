import Bagbutik_Core
import Bagbutik_Models

public extension Request {
    /**
     # Create a queue
     Create a queue and add it to a rule set.

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/create_a_queue>

     - Parameter requestBody: GameCenterMatchmakingQueue representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func createGameCenterMatchmakingQueueV1(requestBody: GameCenterMatchmakingQueueCreateRequest) -> Request<GameCenterMatchmakingQueueResponse, ErrorResponse> {
        .init(path: "/v1/gameCenterMatchmakingQueues", method: .post, requestBody: requestBody)
    }
}
