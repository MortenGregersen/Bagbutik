import BagbutikCore
import BagbutikGameCenterModels

public extension Request {
    /**
     # Modify a Queue

     Update the properties of a specific queue.

     ---

     Copyright &copy; 2026 Apple Inc. All rights reserved. | [Terms of Use](https://www.apple.com/legal/internet-services/terms/site.html) | [Privacy Policy](https://www.apple.com/privacy/privacy-policy)

     Full documentation:
     <https://developer.apple.com/documentation/appstoreconnectapi/patch-v1-gameCenterMatchmakingQueues-_id_>

     - Parameter id: The id of the requested resource
     - Parameter requestBody: GameCenterMatchmakingQueue representation
     - Returns: A ``Request`` to send to an instance of ``BagbutikService``
     */
    static func updateGameCenterMatchmakingQueueV1(id: String,
                                                   requestBody: GameCenterMatchmakingQueueUpdateRequest) -> Request<GameCenterMatchmakingQueueResponse, ErrorResponse> {
        .init(
            path: "/v1/gameCenterMatchmakingQueues/\(id)",
            method: .patch,
            requestBody: requestBody)
    }
}
